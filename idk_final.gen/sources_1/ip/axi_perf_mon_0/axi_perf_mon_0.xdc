# file: axi_perf_mon_0.xdc
# (c) Copyright 2009 - 2011 Advanced Micro Devices, Inc. All rights reserved.
# 
# This file contains confidential and proprietary information
# of Advanced Micro Devices, Inc. and is protected under U.S. and
# international copyright and other intellectual property
# laws.
# 
# DISCLAIMER
# This disclaimer is not a license and does not grant any
# rights to the materials distributed herewith. Except as
# otherwise provided in a valid license issued to you by
# AMD, and to the maximum extent permitted by applicable
# law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
# WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
# AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
# BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
# INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
# (2) AMD shall not be liable (whether in contract or tort,
# including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature
# related to, arising under or in connection with these
# materials, including for any direct, or any indirect,
# special, incidental, or consequential loss or damage
# (including loss of data, profits, goodwill, or any type of
# loss or damage suffered as a result of any action brought
# by a third party) even if such damage or loss was
# reasonably foreseeable or AMD had been advised of the
# possibility of the same.
# 
# CRITICAL APPLICATIONS
# AMD products are not designed or intended to be fail-
# safe, or for use in any application requiring fail-safe
# performance, such as life-support or safety devices or
# systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any
# other applications that could lead to death, personal
# injury, or severe property or environmental damage
# (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and
# liability of any use of AMD products in Critical
# Applications, subject only to applicable laws and
# regulations governing limitations on product liability.
# 
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
# PART OF THIS FILE AT ALL TIMES.
###################################################







  #set_false_path -to [get_pins -hier *cdc_to*/D]
  set_false_path -to [get_pins -of [get_cells -hier -filter {NAME =~*cdc_to*}] -filter {REF_PIN_NAME =~D}]

set_property MAX_FANOUT 300 [get_cells -hier -filter {NAME =~*rst_int_n_reg}]



create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/*_Lat_Start_CDC_reg}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*_PROFILE.metric_calc_inst*/No_*_Ready_reg}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/Rd_Lat_Start_CDC_reg}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*_PROFILE.metric_calc_inst*/Rd_Add_Issue_reg}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/Rd_Lat_Start_CDC_reg}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*_PROFILE.metric_calc_inst*/Rd_Add_Issue_reg}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/Rd_Lat_Start_CDC_reg}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*_PROFILE.metric_calc_inst*/Rd_Latency_Fifo_*_En_reg}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/Rd_Lat_Start_CDC_reg}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*CE -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*_PROFILE.metric_calc_inst*/Rd_Latency_Fifo_*_Data_reg[*]}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/*_Lat_Start_CDC_reg}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*CE -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*_PROFILE.metric_calc_inst*/*_latency_cnt_inst/Count_Out_i_reg[*]}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/Wr_Lat_End_CDC_reg}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*_PROFILE.metric_calc_inst0/wr_latency_*_d*_reg}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/Trace_ctrl_reg_reg[*]}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*_TRACE.flags_generator_inst_*/EXT_EVENT_FLAGS.Ext_Event_Flags_int_reg[*]}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/Trace_ctrl_reg_reg[*]}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*_TRACE.flags_generator_inst_*/Flags_reg[*]}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/*_Lat_Start_CDC_reg}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*.metric_calc_inst1/No_*_Ready_reg}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/Rd_Lat_Start_CDC_reg}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*.metric_calc_inst*/*_Add_Issue_reg}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/Rd_Lat_Start_CDC_reg}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*.metric_calc_inst*/Rd_Latency_Fifo_*_En_reg}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*CE -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*.metric_calc_inst*/Rd_Latency_Fifo_Wr_Data_reg[*]}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*CE -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*.metric_calc_inst1/*_latency_cnt_inst/Count_Out_i_reg[*]}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_TRACE_LOG.streaming_fifo_write_logic_inst/Fifo_Wr_Data_reg[*]}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/IP2Bus_Data_reg[*]}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/IP2Bus_Data_reg[*]_bret}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/IP2Bus_Data_reg[*]_bret__*}]]

create_waiver -type CDC -id {CDC-13} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/Lat_Addr_11downto2_CDC_reg[*]}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*ADDRARDADDR* -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/GEN_METRIC_RAM.Metric_ram_CDCR_reg_bram_0}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*_PROFILE.metric_calc_inst*/Read_Latency_One_reg}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*CE -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*.metric_calc_inst*/*_latency_cnt_inst/Count_Out_i_reg[*]}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*CE -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/GEN_SLOT*.metric_calc_inst*/wr_latency_*_d*_reg}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/*_Lat_End_CDC_reg}]]

create_waiver -type CDC -id {CDC-1} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/*_Lat_Start_CDC_reg}]]

create_waiver -type CDC -id {CDC-13} -user "axi_perf_mon" -desc "Timing uncritical paths" -tags "1165540" -scope -internal \
    -from [get_pins -quiet -filter REF_PIN_NAME=~*C -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/Lat_Addr_11downto2_CDC_reg[*]}]] \
    -to [get_pins -quiet -filter REF_PIN_NAME=~*DINADIN* -of_objects [get_cells -hierarchical -filter {NAME =~ */*/GEN_PROFILE_Trace_Mode.profile_trace_mode_inst/register_module_inst/GEN_METRIC_RAM.Metric_ram_CDCR_reg_bram_*}]]





