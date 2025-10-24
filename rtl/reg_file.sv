`timescale 1ns/100ps
`ifndef DISABLE_DEFAULT_NET
`default_nettype none
`endif


module reg_file (
	input logic clock,
	input logic resetn,
	input logic reg_wr_en, //register file write enable
	
	input logic [4:0] read_reg1, //register file read register 1
	input logic [4:0] read_reg2, //register file read register 2
	input logic [4:0] write_reg1, //register file write register
	input logic [31:0] write_data, //register file write data
	
	output logic [31:0] read_data1, //register file read data 1
	output logic [31:0] read_data2 //register file read data 2
);

endmodule