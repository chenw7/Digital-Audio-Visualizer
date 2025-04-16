module miniALU_top (
    input logic [3:0] op1,
	 input logic [3:0] op2,
	 input logic operation,
	 input logic sign,
	 output logic [7:0] outputBits [0:5]
);

    logic [19:0] result;
	 
    // The following block contains the logic of your combinational circuit
    always_comb begin
	     case ({operation, sign})
		      2'b00: result = op1 + op2;
				2'b01: result = op1 - op2;
				2'b10: result = op1 <<< op2;
				2'b11: result = op1 >>> op2;
		      default: result = 20'b0;
        endcase		  		
 
    end
	 
	 displayEncoder(result, outputBits);
	 
endmodule