set_property SRC_FILE_INFO {cfile:c:/ZynqBerry/te0726-zynqberrydemo1-vivado_2017.1-build_03_20170705132546/zynqberrydemo1/vivado/zynqberrydemo1.srcs/sources_1/bd/zsys/ip/zsys_clk_wiz_1_0/zsys_clk_wiz_1_0.xdc rfile:../../../zynqberrydemo1.srcs/sources_1/bd/zsys/ip/zsys_clk_wiz_1_0/zsys_clk_wiz_1_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.05
