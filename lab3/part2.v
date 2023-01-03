
module part2(a, b, c_in, s, c_out);
	input [3:0]a;
	input [3:0]b;
	input c_in;
	
	output [3:0]s;
	output [3:0]c_out;
	
	//wire w1,w2,w3;
	
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