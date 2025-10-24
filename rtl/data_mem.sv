`timescale 1ns/100ps
`ifndef DISABLE_DEFAULT_NET
`default_nettype none
`endif

module data_mem (
	input logic CLK;
	input logic wr_en;
	input logic read_en;
	
	input logic [31:0] address;
	input logic [31:0] write_data;
	
	output logic [31:0] read_data; 
);