module pwm_ctrl (
	RST_N,
	CLK,
	LED0,
	PUSH0
);
// input definition
	input CLK;
	input RST_N;
	input PUSH0;
	
// output definition	
	output LED0;
	
// signal definition
	reg [27:0] counter0;
	
	wire counter0_clr, counter0_dec;
	wire [27:0] Decode0;
	wire [27:0] Period0;
	
	always @(negedge RST_N or posedge CLK) begin
		if (RST_N == 1'b0)
			counter0 <= 0;
		else begin
			if (counter0_clr == 1'b1)
				counter0 <= 0;
			else
				counter0 <= counter0 + 1;
			
		end
	end

	assign counter0_clr = (counter0 >= Period0 - 1) ? 1'b1 : 1'b0;
	assign counter0_dec = (counter0 < Decode0) ? 1'b1 : 1'b0;
	assign LED0 = counter0_dec;
	
// module instantiation	
	nios2e my_nios2e (
	.clk_clk	(CLK),
	.reset_reset_n	(RST_N),
	.period0_external_connection_export(Period0),
	.decode0_external_connection_export(Decode0),
	.push_external_connection_export(PUSH0)
	);
endmodule
	
			
		