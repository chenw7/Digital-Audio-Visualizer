`timescale 1ns/1ns

module miniALU_tb(
	output [19:0] tb_result
);

logic [3:0] tb_op1;
logic [3:0] tb_op2;
logic tb_operation;
logic tb_sign;

miniALU_top dut(
    .op1(tb_op1), .op2(tb_op2), .operation(tb_operation), .sign(tb_sign), .result(tb_result)
);


	initial begin
		 // Should yield b0010
		 tb_op1 = 4'b0001;
		 tb_op2 = 4'b0001;
		 tb_operation = 1'b0;
		 tb_sign = 1'b0;
		 #100;

		 // Should yield b0001
		 tb_op1 = 4'b0010;
		 tb_op2 = 4'b0001;
		 tb_operation = 1'b0;
		 tb_sign = 1'b1;
		 #100;

		 // Should yield b100000
		 tb_op1 = 4'b1000;
		 tb_op2 = 4'b0010;
		 tb_operation = 1'b1;
		 tb_sign = 1'b0;
		 #100;
		 
		 // Should yield b0010 
       tb_op1 = 4'b1000;
		 tb_op2 = 4'b0010;
		 tb_operation = 1'b1;
		 tb_sign = 1'b1;
		 #100;
		 
		 // Stop simulation
		 $stop;
	end

endmodule
