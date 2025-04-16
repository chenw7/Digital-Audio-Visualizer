`timescale 1ns/1ns

module clock_divider_tb(
    output tb_outClk
);

logic tb_clk;
logic tb_rst;
logic [19:0] tb_speed;

clock_divider dut(
    .clk(tb_clk), .rst(tb_rst), .speed(tb_speed), .outClk(tb_outClk)
);

    // 50 MHz clock
    initial tb_clk = 1'b0; // Initialize clock value
    always #10 tb_clk = ~tb_clk; // 10ns low + 10ns high = 20ns period = 50 MHz
	 
	 initial begin
	     // Expect to see flat output
	     tb_rst = 1'b1;
		  tb_speed = 20'd500000;
		  #100;
		  
		  tb_rst = 1'b0;
		  
		  // 500 kHz (1000ns high + 1000 ns low)
		  repeat (3) @(posedge tb_outClk);
		  
		  // 200 kHz 
		  tb_speed = 20'd200000;
		  repeat (3) @(posedge tb_outClk);
		  
		  // 100 kHz (5000ns high + 5000ns low)
		  tb_speed = 20'd100000;
		  repeat (3) @(posedge tb_outClk);
	 end

endmodule
		  