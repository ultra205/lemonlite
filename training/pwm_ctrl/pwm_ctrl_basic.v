module pwm_ctrl (
	RST_N,
	CLK,
	LED0
);
// input definition
	input CLK;
	input RST_N;
	
// output definition	
	output LED0;
	
// signal definition
	reg [27:0] counter0;
	

	
	always @(negedge RST_N or posedge CLK) begin
		if (RST_N == 1'b0)
			counter0 <= 0;
		else
			counter0 <= counter0 + 1;
	end
	assign LED0 = counter0[27];
endmodule
	
			
		