-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.
-- IP VLNV: xilinx.com:ip:axi_perf_mon:5.0
-- IP Revision: 31

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT axi_perf_mon_0
  PORT (
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC;
    s_axi_awaddr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axi_awvalid : IN STD_LOGIC;
    s_axi_awready : OUT STD_LOGIC;
    s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_wvalid : IN STD_LOGIC;
    s_axi_wready : OUT STD_LOGIC;
    s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_bvalid : OUT STD_LOGIC;
    s_axi_bready : IN STD_LOGIC;
    s_axi_araddr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axi_arvalid : IN STD_LOGIC;
    s_axi_arready : OUT STD_LOGIC;
    s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_rvalid : OUT STD_LOGIC;
    s_axi_rready : IN STD_LOGIC;
    slot_0_axi_aclk : IN STD_LOGIC;
    slot_0_axi_aresetn : IN STD_LOGIC;
    slot_0_axi_awid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    slot_0_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    slot_0_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    slot_0_axi_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    slot_0_axi_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    slot_0_axi_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    slot_0_axi_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    slot_0_axi_awlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    slot_0_axi_awvalid : IN STD_LOGIC;
    slot_0_axi_awready : IN STD_LOGIC;
    slot_0_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    slot_0_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    slot_0_axi_wlast : IN STD_LOGIC;
    slot_0_axi_wvalid : IN STD_LOGIC;
    slot_0_axi_wready : IN STD_LOGIC;
    slot_0_axi_bid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    slot_0_axi_bresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    slot_0_axi_bvalid : IN STD_LOGIC;
    slot_0_axi_bready : IN STD_LOGIC;
    slot_0_axi_arid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    slot_0_axi_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    slot_0_axi_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    slot_0_axi_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    slot_0_axi_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    slot_0_axi_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    slot_0_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    slot_0_axi_arlock : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    slot_0_axi_arvalid : IN STD_LOGIC;
    slot_0_axi_arready : IN STD_LOGIC;
    slot_0_axi_rid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    slot_0_axi_rdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    slot_0_axi_rresp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    slot_0_axi_rlast : IN STD_LOGIC;
    slot_0_axi_rvalid : IN STD_LOGIC;
    slot_0_axi_rready : IN STD_LOGIC;
    capture_event : IN STD_LOGIC;
    reset_event : IN STD_LOGIC;
    core_aclk : IN STD_LOGIC;
    core_aresetn : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC 
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : axi_perf_mon_0
  PORT MAP (
    s_axi_aclk => s_axi_aclk,
    s_axi_aresetn => s_axi_aresetn,
    s_axi_awaddr => s_axi_awaddr,
    s_axi_awvalid => s_axi_awvalid,
    s_axi_awready => s_axi_awready,
    s_axi_wdata => s_axi_wdata,
    s_axi_wstrb => s_axi_wstrb,
    s_axi_wvalid => s_axi_wvalid,
    s_axi_wready => s_axi_wready,
    s_axi_bresp => s_axi_bresp,
    s_axi_bvalid => s_axi_bvalid,
    s_axi_bready => s_axi_bready,
    s_axi_araddr => s_axi_araddr,
    s_axi_arvalid => s_axi_arvalid,
    s_axi_arready => s_axi_arready,
    s_axi_rdata => s_axi_rdata,
    s_axi_rresp => s_axi_rresp,
    s_axi_rvalid => s_axi_rvalid,
    s_axi_rready => s_axi_rready,
    slot_0_axi_aclk => slot_0_axi_aclk,
    slot_0_axi_aresetn => slot_0_axi_aresetn,
    slot_0_axi_awid => slot_0_axi_awid,
    slot_0_axi_awaddr => slot_0_axi_awaddr,
    slot_0_axi_awprot => slot_0_axi_awprot,
    slot_0_axi_awlen => slot_0_axi_awlen,
    slot_0_axi_awsize => slot_0_axi_awsize,
    slot_0_axi_awburst => slot_0_axi_awburst,
    slot_0_axi_awcache => slot_0_axi_awcache,
    slot_0_axi_awlock => slot_0_axi_awlock,
    slot_0_axi_awvalid => slot_0_axi_awvalid,
    slot_0_axi_awready => slot_0_axi_awready,
    slot_0_axi_wdata => slot_0_axi_wdata,
    slot_0_axi_wstrb => slot_0_axi_wstrb,
    slot_0_axi_wlast => slot_0_axi_wlast,
    slot_0_axi_wvalid => slot_0_axi_wvalid,
    slot_0_axi_wready => slot_0_axi_wready,
    slot_0_axi_bid => slot_0_axi_bid,
    slot_0_axi_bresp => slot_0_axi_bresp,
    slot_0_axi_bvalid => slot_0_axi_bvalid,
    slot_0_axi_bready => slot_0_axi_bready,
    slot_0_axi_arid => slot_0_axi_arid,
    slot_0_axi_araddr => slot_0_axi_araddr,
    slot_0_axi_arlen => slot_0_axi_arlen,
    slot_0_axi_arsize => slot_0_axi_arsize,
    slot_0_axi_arburst => slot_0_axi_arburst,
    slot_0_axi_arcache => slot_0_axi_arcache,
    slot_0_axi_arprot => slot_0_axi_arprot,
    slot_0_axi_arlock => slot_0_axi_arlock,
    slot_0_axi_arvalid => slot_0_axi_arvalid,
    slot_0_axi_arready => slot_0_axi_arready,
    slot_0_axi_rid => slot_0_axi_rid,
    slot_0_axi_rdata => slot_0_axi_rdata,
    slot_0_axi_rresp => slot_0_axi_rresp,
    slot_0_axi_rlast => slot_0_axi_rlast,
    slot_0_axi_rvalid => slot_0_axi_rvalid,
    slot_0_axi_rready => slot_0_axi_rready,
    capture_event => capture_event,
    reset_event => reset_event,
    core_aclk => core_aclk,
    core_aresetn => core_aresetn,
    interrupt => interrupt
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file axi_perf_mon_0.vhd when simulating
-- the core, axi_perf_mon_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.



