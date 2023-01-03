
module part2(Clock, Reset_b, Data, Function, ALUout);
	
	input Clock, Reset_b;
	input [2:0] Function;
	input [3:0] Data;

	output [7:0] ALUout;
	
	reg [7:0] out;
	

 // 	Arithmetic_Logic_Unit A1(Data, ALUout[3:0], out, Func, ALUout);
 
 	Register_8bit R1(Clock, out, ALUout, Reset_b);
 
	wire [3:0] sum;
	wire [3:0]carryOut;

	
	a_4bit A1(Data, ALUout[3:0], 0, sum, carryOut);
	
	always @(*)
	begin
		case (Function)
			3'b000: out = {3'b000, carryOut[3],sum};
			3'b001: out <= Data + ALUout[3:0];
			3'b010: out = {{4{ALUout[3]}},ALUout[3:0]};
			3'b011: out = {{7{1'b0}}, |{Data,ALUout[3:0]}};
			3'b100: out = {{7{1'b0}}, &{Data,ALUout[3:0]}};
			3'b101: out = ALUout[3:0]<<Data;
			3'b110: out <= Data * ALUout[3:0];
			3'b111: out = ALUout;
			default: out = 8'b0;
		endcase
	end

	
endmodule

/*module Arithmetic_Logic_Unit(Data, B, out, Func, CurrentValue);
	
  	input [3:0] Data;
  	input [3:0] B;
  	input [2:0]Func;
  	input [7:0] CurrentValue;
	
	output reg [7:0]out;
	
	
	wire [3:0] sum;
	wire [3:0]carryOut;

	a_4bit A1(Data, B, 0, sum, carryOut);
	
	always @(*)
	begin
		case (Func)
			3'b000: out = {3'b000, carryOut[3],sum};
			3'b001: out <= Data + B;
			3'b010: out = {{4{B[3]}},B};
			3'b011: out = {{7{1'b0}}, |{Data,B}};
			3'b100: out = {{7{1'b0}}, &{Data,B}};
			3'b101: out = B<<Data;
			3'b110: out <= Data * B;
			3'b111: out = CurrentValue;
			default: out = 8'b0;
		endcase
	end
endmodule */

module Register_8bit(Clock, D, Q, Rb);

	input Clock, Rb;
	input [7:0] D;
	
  output reg [7:0] Q;
	
	
	always @(posedge Clock)
	begin
		if (Rb == 1'b0)
			Q <= 0;
		else
			Q <= D;
	end
endmodule

module a_4bit(a, b, c_in, s, c_out);
	input [3:0]a;
	input [3:0]b;
	input c_in;
	
	output [3:0]s;
	output [3:0]c_out;
	
	wire c1,c2,c3;
	
	full_adder A1(a[0],b[0],c_in,s[0],c_out[0]);
	full_adder A2(a[1],b[1],c_out[0],s[1],c_out[1]);
	full_adder A3(a[2],b[2],c_out[1],s[2],c_out[2]);
	full_adder A4(a[3],b[3],c_out[2],s[3],c_out[3]);
	
endmodule

module full_adder(x,y,in,s,out);
	input x,y,in;
	output s,out;
		
	assign s = x^y^in;
	assign out = (x&y)|(x&in)|(y&in); 
endmodule 

