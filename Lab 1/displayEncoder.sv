module displayEncoder(
	input [19:0] result,
	output [7:0] displayBits [0:5]
);
	// TODO: create signals for the six 4-bit digits
	logic [3:0] digits [0:5];
	logic [19:0] temp;
	// TODO: Instantiate six copies of sevenSegDigit, one for each digit (calculated below) 
	
	// The following block contains the logic of your combinational circuit
	always_comb begin
		// TODO: Convert a 20-bit input result to six individual digits (4 bits each) 
		temp = result;
		
		for (integer i = 0; i < 6; i = i + 1) begin
		    digits[i] = temp % 10;
			 temp = temp / 10;
		end
	end
	
	// Six copies of sevenSegDigit, one for each 4-bit digit
	genvar i;
	generate
	    for (i = 0; i < 6; i = i + 1) begin: displayAll
		     sevenSegDigit results(digits[i], displayBits[i]);
	    end
   endgenerate

endmodule