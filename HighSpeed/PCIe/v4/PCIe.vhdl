-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   PCI Express Transaction Layer interface types
--
-- Description:
--   Following the PCIe 4.0 specification.
--
-- License:
-- ==================================================================================================================== --
-- Copyright 2016-2025 Open Source VHDL Group                                                                           --
--                                                                                                                      --
-- Licensed under the Apache License, Version 2.0 (the "License");                                                      --
-- you may not use this file except in compliance with the License.                                                     --
-- You may obtain a copy of the License at                                                                              --
--                                                                                                                      --
--    http://www.apache.org/licenses/LICENSE-2.0                                                                        --
--                                                                                                                      --
-- Unless required by applicable law or agreed to in writing, software                                                  --
-- distributed under the License is distributed on an "AS IS" BASIS,                                                    --
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                                             --
-- See the License for the specific language governing permissions and                                                  --
-- limitations under the License.                                                                                       --
-- ==================================================================================================================== --


library IEEE;
use     IEEE.std_logic_1164.all;
use     IEEE.numeric_std.all;

library Interfaces;
use     Interfaces.PCIe.v4.PCIeCommon.all;

package PCIe is

  -- ============================================================================================================
  -- Transaction Layer - Transmit Interface (TLP TX)
  -- ============================================================================================================
  
  type t_PCIe_TLP_TX is record
    -- Control
    valid       : std_logic;                      -- Data valid
    ready       : std_logic;                      -- Ready to accept data (backpressure)
    sop         : std_logic;                      -- Start of Packet
    eop         : std_logic;                      -- End of Packet
    
    -- TLP Header
    header      : t_PCIe_TLP_Header;
    
    -- Payload Data (256-bit for Gen3/Gen4)
    data        : std_logic_vector(255 downto 0);
    keep        : std_logic_vector(31 downto 0);  -- Byte valid indicators
    
    -- Error Signaling
    err         : std_logic;                      -- Error in TLP
    poisoned    : std_logic;                      -- Poisoned TLP
  end record;

  -- View from Master (endpoint transmitting TLP)
  subtype t_PCIe_TLP_TX_m2s is t_PCIe_TLP_TX;
  alias   t_PCIe_TLP_TX_Master is t_PCIe_TLP_TX_m2s;

  -- View from Slave (endpoint receiving TLP)
  subtype t_PCIe_TLP_TX_s2m is t_PCIe_TLP_TX;
  alias   t_PCIe_TLP_TX_Slave is t_PCIe_TLP_TX_s2m;

  -- ============================================================================================================
  -- Transaction Layer - Receive Interface (TLP RX)
  -- ============================================================================================================
  
  type t_PCIe_TLP_RX is record
    -- Control
    valid       : std_logic;
    ready       : std_logic;
    sop         : std_logic;
    eop         : std_logic;
    
    -- TLP Header
    header      : t_PCIe_TLP_Header;
    
    -- Payload Data
    data        : std_logic_vector(255 downto 0);
    keep        : std_logic_vector(31 downto 0);
    
    -- Status
    bar_hit     : std_logic_vector(6 downto 0);  -- Which BAR was hit
    err         : std_logic;
    poisoned    : std_logic;
  end record;

  subtype t_PCIe_TLP_RX_m2s is t_PCIe_TLP_RX;
  alias   t_PCIe_TLP_RX_Master is t_PCIe_TLP_RX_m2s;

  subtype t_PCIe_TLP_RX_s2m is t_PCIe_TLP_RX;
  alias   t_PCIe_TLP_RX_Slave is t_PCIe_TLP_RX_s2m;

  -- ============================================================================================================
  -- Configuration Space Interface
  -- ============================================================================================================
  
  type t_PCIe_Config is record
    -- Device Identification
    vendor_id       : std_logic_vector(15 downto 0);
    device_id       : std_logic_vector(15 downto 0);
    revision_id     : std_logic_vector(7 downto 0);
    class_code      : std_logic_vector(23 downto 0);
    
    -- BAR Configuration
    bar_enabled     : std_logic_vector(5 downto 0);
    bar_type        : std_logic_vector(5 downto 0); -- 0=32-bit, 1=64-bit
    
    -- Link Status
    link_up         : std_logic;
    link_width      : t_PCIe_LinkWidth;
    link_speed      : std_logic_vector(3 downto 0); -- Gen1/2/3/4
    
    -- Power Management
    power_state     : t_PCIe_PowerState;
    
    -- Interrupts
    msi_enabled     : std_logic;
    msix_enabled    : std_logic;
    max_payload_size: std_logic_vector(2 downto 0); -- 128/256/512/1024/2048/4096
    max_read_req    : std_logic_vector(2 downto 0);
  end record;

  -- ============================================================================================================
  -- Physical Layer Interface (for reference - typically handled by PHY IP)
  -- ============================================================================================================
  
  type t_PCIe_Physical_Lane is record
    tx_p        : std_logic;                      -- Differential TX positive
    tx_n        : std_logic;                      -- Differential TX negative
    rx_p        : std_logic;                      -- Differential RX positive
    rx_n        : std_logic;                      -- Differential RX negative
  end record;

  type t_PCIe_Physical_Lane_Vector is array(natural range <>) of t_PCIe_Physical_Lane;

  -- ============================================================================================================
  -- Helper Functions
  -- ============================================================================================================
  
  function create_tlp_header(
    tlp_type    : t_PCIe_TLP_Type;
    address     : std_logic_vector(63 downto 2);
    length      : natural;
    requester_id: std_logic_vector(15 downto 0);
    tag         : std_logic_vector(7 downto 0);
    be_first    : std_logic_vector(3 downto 0) := "1111";
    be_last     : std_logic_vector(3 downto 0) := "1111"
  ) return t_PCIe_TLP_Header;

end package;

package body PCIe is

  function create_tlp_header(
    tlp_type    : t_PCIe_TLP_Type;
    address     : std_logic_vector(63 downto 2);
    length      : natural;
    requester_id: std_logic_vector(15 downto 0);
    tag         : std_logic_vector(7 downto 0);
    be_first    : std_logic_vector(3 downto 0) := "1111";
    be_last     : std_logic_vector(3 downto 0) := "1111"
  ) return t_PCIe_TLP_Header is
    variable header : t_PCIe_TLP_Header;
  begin
    -- Set format and type based on TLP type
    case tlp_type is
      when MRd =>
        if address(63 downto 32) = x"00000000" then
          header.fmt := "00";  -- 3DW header, no data
        else
          header.fmt := "01";  -- 4DW header, no data
        end if;
        header.pkt_type := "00000";
        
      when MWr =>
        if address(63 downto 32) = x"00000000" then
          header.fmt := "10";  -- 3DW header, with data
        else
          header.fmt := "11";  -- 4DW header, with data
        end if;
        header.pkt_type := "00000";
        
      when CplD =>
        header.fmt := "10";
        header.pkt_type := "01010";
        
      when others =>
        header.fmt := "00";
        header.pkt_type := "00000";
    end case;

    header.tc          := "000";  -- Traffic Class 0
    header.attr        := "000";
    header.th          := '0';
    header.td          := '0';
    header.ep          := '0';
    header.length      := std_logic_vector(to_unsigned(length, 10));
    header.requester_id:= requester_id;
    header.tag         := tag;
    header.be_first    := be_first;
    header.be_last     := be_last;
    header.address     := address;

    return header;
  end function;

end package body;
