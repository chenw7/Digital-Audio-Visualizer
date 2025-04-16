module clock_divider #(
    int base_speed = 50000000
)
(
    input logic clk,
	 input logic [19:0] speed,
	 input logic rst,
	 output logic outClk
);

    logic [25:0] counter, counter_d;
	 logic outClk_d;
	 
	 logic [25:0] div_ratio, half_div;
	 assign div_ratio = base_speed / speed;
	 assign half_div = div_ratio >> 1;
	 
	 // Combinational Block
	 always_comb begin
	     counter_d = counter;
		  outClk_d = outClk;
		  
		  // Clock output for next cycle
		  if (rst)
		      outClk_d = 1'b0;
		  else if (counter < half_div)
		      outClk_d = 1'b0;
		  else
		      outClk_d = 1'b1;
		  
		  // Next Counter Value
		  if (rst)
		      counter_d = '0;
		  else if (counter == div_ratio - 1)
		      counter_d = '0;
		  else
		      counter_d = counter + 1;
    end
	 
	 // Sequential Block
	 always_ff @(posedge clk) begin
	     counter <= counter_d;
		  outClk <= outClk_d;
	 end
	 
endmodule