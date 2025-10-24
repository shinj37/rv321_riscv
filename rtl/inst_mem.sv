//`timescale 1ns/100ps
`ifndef DISABLE_DEFAULT_NET
`default_nettype none
`endif

module inst_mem (
	input logic clock,
	input logic resetn,
	
	input logic [31:0] inst_address,
	
	output logic [31:0] inst_data
);

endmodule