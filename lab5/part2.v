module part2(ClockIn, Reset, Speed, CounterValue);
	input [1:0] Speed;
	input ClockIn;
	output [3:0] CounterValue;
	input Reset;
	
	wire [3:0] Q;
	wire enable;
	wire [11:0] upperLimit, count;
	
	select s1(Speed, upperLimit);
	RateDivider r(Speed, ClockIn, enable, Reset, upperLimit);
	Displaycount c(enable, ClockIn, Reset, CounterValue);
	
	
endmodule

module Displaycount(EnableDC, ClockIn, reset, Q);
	input EnableDC;
	input ClockIn; 
	input reset; 
	output reg [3:0] Q;
	
	always@(posedge ClockIn)
		begin
			if(reset == 1)
				Q <= 0;
			else if(EnableDC == 1)
				if(Q == 4'b1111)
					Q <= 0;
				else 
					Q <= Q+1;
		end
endmodule

module select(SW, upperLimit);
		input [1:0]SW;
		output reg [11:0]upperLimit;
		
		always@(SW)
		case(SW[1:0])
	
			2'b00: upperLimit = 11'b0;
			2'b01: upperLimit = 11'd499;
			2'b10: upperLimit = 11'd999;
			2'b11: upperLimit = 11'd1999;
			default: upperLimit = 11'd500;
		endcase
endmodule
		
module RateDivider(SW, ClockIn,enable, reset, upper);
	input ClockIn;
	input [1:0]SW;
	input reset;
	input [11:0]upper;
	reg[11:0] count = 0;
	output enable;
	//wire [28:0] w2;
	//assign w2 = count;
	//output reg w1;
	//assign w1 = w2;

	
	always@(posedge ClockIn)
		begin
		if(reset == 1)
			count <= upper;
		else if(count == 11'b0)
			count <= upper;
		else
			count<= count - 1;
		end
		
	assign enable = (count == 11'b0)?1:0;
		
	endmodule
	
	