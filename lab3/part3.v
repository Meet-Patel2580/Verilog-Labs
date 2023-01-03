
module part3(A,B, Function, ALUout);
	
	input [3:0]A;
	input [3:0]B;
	input [2:0]Function;
	output reg [7:0]ALUout;
	
	wire [3:0]f1;
	wire [3:0]f2;
	part2 u1(.a(A),.b(B),.c_in(0),.s(f1), .c_out(f2));

	always @(*) // declare always block
	begin
		case (Function) // start case statement
		3'b000: ALUout = {f2[3],f1};  // A + B using the adder from Part II of this Lab
		3'b001: ALUout = A + B; // using the Verilog ‘+’ operator
		3'b010: ALUout = {{4{B[3]}},B}; //Sign extension of B to 8 bits // textbook page 167
		3'b011: ALUout = {7'b0000000,(A||B)};//Output 8’b00000001 if at least 1 of the 8 bits in the two inputs is 1 using a single OR operation
		3'b100: ALUout = {7'b0000000,((&A)&(&B))}; //Output 8’b00000001 if all of the 8 bits in the two inputs are 1 using a single AND operation
		3'b101: ALUout = {A,B}; // Display A in the most significant four bits and B in the lower four bits
		default: ALUout = 0; // default case
	endcase
	end
endmodule


module part2(a, b, c_in, s, c_out);
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