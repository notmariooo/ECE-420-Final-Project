// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:ip:axi_perf_mon:5.0
// IP Revision: 31

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
axi_perf_mon_0 your_instance_name (
  .s_axi_aclk(s_axi_aclk),                  // input wire s_axi_aclk
  .s_axi_aresetn(s_axi_aresetn),            // input wire s_axi_aresetn
  .s_axi_awaddr(s_axi_awaddr),              // input wire [15 : 0] s_axi_awaddr
  .s_axi_awvalid(s_axi_awvalid),            // input wire s_axi_awvalid
  .s_axi_awready(s_axi_awready),            // output wire s_axi_awready
  .s_axi_wdata(s_axi_wdata),                // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb(s_axi_wstrb),                // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid(s_axi_wvalid),              // input wire s_axi_wvalid
  .s_axi_wready(s_axi_wready),              // output wire s_axi_wready
  .s_axi_bresp(s_axi_bresp),                // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(s_axi_bvalid),              // output wire s_axi_bvalid
  .s_axi_bready(s_axi_bready),              // input wire s_axi_bready
  .s_axi_araddr(s_axi_araddr),              // input wire [15 : 0] s_axi_araddr
  .s_axi_arvalid(s_axi_arvalid),            // input wire s_axi_arvalid
  .s_axi_arready(s_axi_arready),            // output wire s_axi_arready
  .s_axi_rdata(s_axi_rdata),                // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(s_axi_rresp),                // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(s_axi_rvalid),              // output wire s_axi_rvalid
  .s_axi_rready(s_axi_rready),              // input wire s_axi_rready
  .slot_0_axi_aclk(slot_0_axi_aclk),        // input wire slot_0_axi_aclk
  .slot_0_axi_aresetn(slot_0_axi_aresetn),  // input wire slot_0_axi_aresetn
  .slot_0_axi_awid(slot_0_axi_awid),        // input wire [0 : 0] slot_0_axi_awid
  .slot_0_axi_awaddr(slot_0_axi_awaddr),    // input wire [31 : 0] slot_0_axi_awaddr
  .slot_0_axi_awprot(slot_0_axi_awprot),    // input wire [2 : 0] slot_0_axi_awprot
  .slot_0_axi_awlen(slot_0_axi_awlen),      // input wire [7 : 0] slot_0_axi_awlen
  .slot_0_axi_awsize(slot_0_axi_awsize),    // input wire [2 : 0] slot_0_axi_awsize
  .slot_0_axi_awburst(slot_0_axi_awburst),  // input wire [1 : 0] slot_0_axi_awburst
  .slot_0_axi_awcache(slot_0_axi_awcache),  // input wire [3 : 0] slot_0_axi_awcache
  .slot_0_axi_awlock(slot_0_axi_awlock),    // input wire [0 : 0] slot_0_axi_awlock
  .slot_0_axi_awvalid(slot_0_axi_awvalid),  // input wire slot_0_axi_awvalid
  .slot_0_axi_awready(slot_0_axi_awready),  // input wire slot_0_axi_awready
  .slot_0_axi_wdata(slot_0_axi_wdata),      // input wire [31 : 0] slot_0_axi_wdata
  .slot_0_axi_wstrb(slot_0_axi_wstrb),      // input wire [3 : 0] slot_0_axi_wstrb
  .slot_0_axi_wlast(slot_0_axi_wlast),      // input wire slot_0_axi_wlast
  .slot_0_axi_wvalid(slot_0_axi_wvalid),    // input wire slot_0_axi_wvalid
  .slot_0_axi_wready(slot_0_axi_wready),    // input wire slot_0_axi_wready
  .slot_0_axi_bid(slot_0_axi_bid),          // input wire [0 : 0] slot_0_axi_bid
  .slot_0_axi_bresp(slot_0_axi_bresp),      // input wire [1 : 0] slot_0_axi_bresp
  .slot_0_axi_bvalid(slot_0_axi_bvalid),    // input wire slot_0_axi_bvalid
  .slot_0_axi_bready(slot_0_axi_bready),    // input wire slot_0_axi_bready
  .slot_0_axi_arid(slot_0_axi_arid),        // input wire [0 : 0] slot_0_axi_arid
  .slot_0_axi_araddr(slot_0_axi_araddr),    // input wire [31 : 0] slot_0_axi_araddr
  .slot_0_axi_arlen(slot_0_axi_arlen),      // input wire [7 : 0] slot_0_axi_arlen
  .slot_0_axi_arsize(slot_0_axi_arsize),    // input wire [2 : 0] slot_0_axi_arsize
  .slot_0_axi_arburst(slot_0_axi_arburst),  // input wire [1 : 0] slot_0_axi_arburst
  .slot_0_axi_arcache(slot_0_axi_arcache),  // input wire [3 : 0] slot_0_axi_arcache
  .slot_0_axi_arprot(slot_0_axi_arprot),    // input wire [2 : 0] slot_0_axi_arprot
  .slot_0_axi_arlock(slot_0_axi_arlock),    // input wire [0 : 0] slot_0_axi_arlock
  .slot_0_axi_arvalid(slot_0_axi_arvalid),  // input wire slot_0_axi_arvalid
  .slot_0_axi_arready(slot_0_axi_arready),  // input wire slot_0_axi_arready
  .slot_0_axi_rid(slot_0_axi_rid),          // input wire [0 : 0] slot_0_axi_rid
  .slot_0_axi_rdata(slot_0_axi_rdata),      // input wire [31 : 0] slot_0_axi_rdata
  .slot_0_axi_rresp(slot_0_axi_rresp),      // input wire [1 : 0] slot_0_axi_rresp
  .slot_0_axi_rlast(slot_0_axi_rlast),      // input wire slot_0_axi_rlast
  .slot_0_axi_rvalid(slot_0_axi_rvalid),    // input wire slot_0_axi_rvalid
  .slot_0_axi_rready(slot_0_axi_rready),    // input wire slot_0_axi_rready
  .capture_event(capture_event),            // input wire capture_event
  .reset_event(reset_event),                // input wire reset_event
  .core_aclk(core_aclk),                    // input wire core_aclk
  .core_aresetn(core_aresetn),              // input wire core_aresetn
  .interrupt(interrupt)                    // output wire interrupt
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file axi_perf_mon_0.v when simulating
// the core, axi_perf_mon_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

