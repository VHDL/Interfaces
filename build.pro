# ==================================================================================================================== #
# Copyright 2016-2026 Open Source VHDL Group                                                                           #
#                                                                                                                      #
# Licensed under the Apache License, Version 2.0 (the "License");                                                      #
# you may not use this file except in compliance with the License.                                                     #
# You may obtain a copy of the License at                                                                              #
#                                                                                                                      #
#    http://www.apache.org/licenses/LICENSE-2.0                                                                        #
#                                                                                                                      #
# Unless required by applicable law or agreed to in writing, software                                                  #
# distributed under the License is distributed on an "AS IS" BASIS,                                                    #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                                             #
# See the License for the specific language governing permissions and                                                  #
# limitations under the License.                                                                                       #
# ==================================================================================================================== #
# VHDLRevision: VHDL-2019
# VHDLLibrary:  Interfaces

library Interfaces

# Common definitions
analyze IO/Common.vhdl

# Internal bus structures
analyze AMBA/AXI/v4/AXI4Common.vhdl
analyze AMBA/AXI/v4/AXI4.vhdl
analyze AMBA/AXI/v4/AXI4_Generic.vhdl

analyze AMBA/AXI/v4/AXI4Lite.vhdl
analyze AMBA/AXI/v4/AXI4Lite_Generic.vhdl
analyze AMBA/AXI/v4/AXI4Lite.presized.vhdl

analyze AMBA/AXI/v4/AXI4Stream.vhdl
analyze AMBA/AXI/v4/AXI4Stream_Generic.vhdl

# Avalon interfaces
analyze Avalon/v1/AvalonCommon.vhdl
analyze Avalon/v1/AvalonMM.vhdl
analyze Avalon/v1/AvalonMM_Generic.vhdl
analyze Avalon/v1/AvalonMM_Minimal.vhdl
analyze Avalon/v1/AvalonMM_Minimal_Generic.vhdl
analyze Avalon/v1/AvalonST.vhdl
analyze Avalon/v1/AvalonST_Generic.vhdl
analyze Avalon/v1/AvalonST_Minimal.vhdl
analyze Avalon/v1/AvalonST_Minimal_Generic.vhdl

# Wishbone interfaces
analyze Wishbone/vB3/WishboneCommon.vhdl
analyze Wishbone/vB3/Wishbone.vhdl
analyze Wishbone/vB3/Wishbone_Generic.vhdl

# Low-speed interfaces
analyze IO/BiSS.vhdl
analyze IO/I2C.vhdl
analyze IO/SPI.vhdl
analyze IO/I2S.vhdl
analyze IO/JTAG.vhdl
analyze IO/UART.vhdl

# Ethernet
analyze Network/Ethernet.vhdl
analyze Network/Cages.vhdl

# Miscellaneous interfaces
analyze PoC/CSE.vhdl

# High-speed serial interfaces - PCI Express
analyze HighSpeed/PCIe/v4/PCIeCommon.vhdl
analyze HighSpeed/PCIe/v4/PCIe.vhdl

# Video interfaces
analyze Video/VGA.vhdl
analyze Video/C-PHY.vhdl
analyze Video/D-PHY.vhdl
analyze Video/M-PHY.vhdl
