`timescale 1ns/100ps
`ifndef DISABLE_DEFAULT_NET
`default_nettype none
`endif




module topmodule (
	input logic clock,
	input logic resetn
);



// Internal signal declarations
logic wr_en, read_en; //data memory write and read enable
logic [31:0] data_address, data_write, data_read;
logic reg_wr_en; //register file write enable
logic [4:0] read_reg1, read_reg2, write_reg1;
logic [31:0] reg_write, reg_out1, reg_out2;
logic [31:0] inst_address, inst_data;
logic [6:0] opcode;
logic [3:0] alu_control;
logic [63:0] immediate;
logic ALU_src, Branch, Mem_to_reg, ALU_op, Mem_write, Reg_write;
logic [31:0] sum_result;


imm_gen immediate_unit (
	.instruction(inst_data),
	.immediate(immediate)
);

data_mem datamemory_unit (
	.resetn(resetn),
	.clock(clock),
	
	.wr_en(wr_en),
	.read_en(read_en),
	
	.address(data_address),
	.write_data(data_write),
	.read_data(data_read)
);

inst_mem instruct_unit (
	.resetn(resetn),
	.clock(clock),
	
	.inst_address(inst_address),
	.inst_data(inst_data)
);

reg_file register_unit (
	.resetn(resetn),
	.CLK(clock),
	
	.reg_wr_en(reg_wr_en),
	
	.read_reg1(read_reg1),
	.read_reg2(read_reg2),
	.write_reg1(write_reg1),
	.write_data(reg_write),
	
	.read_data1(reg_out1),
	.read_data2(reg_out2)
);


always_comb begin
	immediate = immediate_unit.immediate;
	sum_result = immediate + inst_address;
end

always_ff @(posedge clock or negedge resetn ) begin
	if (!resetn) begin
		inst_address <= 32'h00000000;
		data_address <= 32'h00000000;
		read_reg1 <= 5'b00000;
		read_reg2 <= 5'b00000;
		write_reg1 <= 5'b00000;
		reg_write <= 32'h00000000;
		data_write <= 32'h00000000;
	end else begin
		read_reg1 <= inst_data[19:15];
		read_reg2 <= inst_data[24:20];
		write_reg1 <= inst_data[11:7];
		alu_control <= {inst_data[30], inst_data[14:12]};
end















endmodule