-- =============================================================================
-- Authors:
--   Parham Soltani
--
-- Package:
--   Common types, constants, and enums for PCI Express interfaces
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

package PCIeCommon is
  -- Link speeds
  constant PCIE_GEN1_SPEED : natural := 2_500; -- Mbps per lane
  constant PCIE_GEN2_SPEED : natural := 5_000; -- Mbps per lane
  constant PCIE_GEN3_SPEED : natural := 8_000; -- Mbps per lane
  constant PCIE_GEN4_SPEED : natural := 16_000; -- Mbps per lane

  -- Link widths
  type t_PCIe_LinkWidth is (x1, x2, x4, x8, x16);
  
  function to_lanes(width : t_PCIe_LinkWidth) return positive;

  -- TLP Packet Types
  type t_PCIe_TLP_Type is (
    MRd,      -- Memory Read Request
    MRdLk,    -- Memory Read Request - Locked
    MWr,      -- Memory Write Request
    IORd,     -- I/O Read Request
    IOWr,     -- I/O Write Request
    CfgRd0,   -- Configuration Read Type 0
    CfgWr0,   -- Configuration Write Type 0
    CfgRd1,   -- Configuration Read Type 1
    CfgWr1,   -- Configuration Write Type 1
    Msg,      -- Message Request
    MsgD,     -- Message Request with Data
    Cpl,      -- Completion without Data
    CplD,     -- Completion with Data
    CplLk,    -- Completion for Locked Memory Read
    CplDLk    -- Completion for Locked Memory Read with Data
  );

  -- Transaction Layer Packet Header (32-bit aligned)
  type t_PCIe_TLP_Header is record
    fmt         : std_logic_vector(1 downto 0);  -- Format
    pkt_type    : std_logic_vector(4 downto 0);  -- Type
    tc          : std_logic_vector(2 downto 0);  -- Traffic Class
    attr        : std_logic_vector(2 downto 0);  -- Attributes
    th          : std_logic;                      -- TLP Processing Hints
    td          : std_logic;                      -- TLP Digest Present
    ep          : std_logic;                      -- Poisoned Data
    length      : std_logic_vector(9 downto 0);  -- Length in DW
    requester_id: std_logic_vector(15 downto 0); -- Bus:Dev:Func
    tag         : std_logic_vector(7 downto 0);  -- Transaction tag
    be_last     : std_logic_vector(3 downto 0);  -- Last DW Byte Enable
    be_first    : std_logic_vector(3 downto 0);  -- First DW Byte Enable
    address     : std_logic_vector(63 downto 2); -- 64-bit address (DW aligned)
  end record;

  -- DLLP (Data Link Layer Packet) Types
  type t_PCIe_DLLP_Type is (
    Ack,
    Nak,
    PM_Enter_L1,
    PM_Enter_L23,
    PM_Active_State_Request_L1,
    PM_Request_Ack,
    Vendor_Specific,
    NOP,
    FC_Init1,
    FC_Init2,
    FC_Update_P,
    FC_Update_NP,
    FC_Update_Cpl
  );

  -- Flow Control Credit Types
  type t_PCIe_FC_Type is (Posted, NonPosted, Completion);

  -- Flow Control Credits
  type t_PCIe_FlowControl is record
    fc_type     : t_PCIe_FC_Type;
    hdr_credits : std_logic_vector(7 downto 0);
    data_credits: std_logic_vector(11 downto 0);
  end record;

  -- Link Training and Status State Machine (LTSSM) States
  type t_PCIe_LTSSM_State is (
    Detect_Quiet,
    Detect_Active,
    Polling_Active,
    Polling_Compliance,
    Polling_Configuration,
    Configuration_Linkwidth_Start,
    Configuration_Linkwidth_Accept,
    Configuration_Lanenum_Wait,
    Configuration_Lanenum_Accept,
    Configuration_Complete,
    Configuration_Idle,
    Recovery_RcvrLock,
    Recovery_RcvrCfg,
    Recovery_Idle,
    L0,
    L0s,
    L1_Idle,
    L1_Substate,
    L2_Idle,
    L2_TransmitWake,
    Disabled_Idle,
    Disabled_LinkWidth_Start,
    Loopback_Entry,
    Loopback_Active,
    Loopback_Exit,
    Hot_Reset
  );

  -- Power Management States
  type t_PCIe_PowerState is (L0, L0s, L1, L2, L3);

end package;

package body PCIeCommon is
  
  function to_lanes(width : t_PCIe_LinkWidth) return positive is
  begin
    case width is
      when x1  => return 1;
      when x2  => return 2;
      when x4  => return 4;
      when x8  => return 8;
      when x16 => return 16;
    end case;
  end function;

end package body;
