set_property SRC_FILE_INFO {cfile:c:/ZynqBerry/te0726-zynqberrydemo1-vivado_2017.1-build_03_20170705132546/zynqberrydemo1/vivado/zynqberrydemo1.srcs/sources_1/bd/zsys/ip/zsys_v_axi4s_vid_out_0_0/zsys_v_axi4s_vid_out_0_0_clocks.xdc rfile:../../../zynqberrydemo1.srcs/sources_1/bd/zsys/ip/zsys_v_axi4s_vid_out_0_0/zsys_v_axi4s_vid_out_0_0_clocks.xdc id:1 order:LATE scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells COUPLER_INST/FIFO_INST/FIFO_INST/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*rd_pntr_gc_reg[*]] -to [get_cells COUPLER_INST/FIFO_INST/FIFO_INST/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[*].wr_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_ports vid_io_out_clk]]]
set_property src_info {type:SCOPED_XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells COUPLER_INST/FIFO_INST/FIFO_INST/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*wr_pntr_gc_reg[*]] -to [get_cells COUPLER_INST/FIFO_INST/FIFO_INST/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/*gsync_stage[*].rd_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_ports aclk]]]
