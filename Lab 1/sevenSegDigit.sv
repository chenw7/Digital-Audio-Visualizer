module sevenSegDigit(
    input logic [3:0] digit,
	 output logic [7:0] displayBits
);

	// The following block contains the logic of your combinational circuit
	always_comb begin
		case (digit)
			4'd0: displayBits = 8'b11000000;
			4'd1: displayBits = 8'b11111001;
			4'd2: displayBits = 8'b10100100;
			4'd3: displayBits = 8'b10110000;
			4'd4: displayBits = 8'b10011001;
			4'd5: displayBits = 8'b10010010;
			4'd6: displayBits = 8'b10000010;
			4'd7: displayBits = 8'b11111000;
			4'd8: displayBits = 8'b10000000;
			4'd9: displayBits = 8'b10010000;
			default: displayBits = 8'b11111111;
		endcase
	end

endmodule
