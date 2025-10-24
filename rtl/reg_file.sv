`timescale 1ns/100ps
`ifndef DISABLE_DEFAULT_NET
`default_nettype none
`endif


module reg_file (
	input logic CLK;
	input logic reg_wr_en;
	
	input logic [4:0] read_reg1;
	input logic [4:0] read_reg2;
	input logic [4:0] write_reg1;
	input logic [31:0] write_data;
	
	output logic [31:0] read_data1; 
	output logic [31:0] read_data2; 
);