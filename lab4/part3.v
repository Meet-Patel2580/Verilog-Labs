module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);


input[7:0] Data_IN;

input clock, ParallelLoadn, RotateRight, reset, ASRight;

output [7:0] Q;


wire w1;


subc C1(.l(Q[1]), .r(Q[7]),.D(Data_IN[0]), .loadn(ParallelLoadn), .LoadLeft(RotateRight),  .clk(clock), .reset(reset), .Q(Q[0]));
subc C2(.l(Q[2]), .r(Q[0]),.D(Data_IN[1]), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .clk(clock), .reset(reset), .Q(Q[1]));
subc C3(.l(Q[3]), .r(Q[1]),.D(Data_IN[2]), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .clk(clock), .reset(reset), .Q(Q[2]));
subc C4(.l(Q[4]), .r(Q[2]),.D(Data_IN[3]), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .clk(clock), .reset(reset), .Q(Q[3]));
subc C5(.l(Q[5]), .r(Q[3]),.D(Data_IN[4]), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .clk(clock), .reset(reset), .Q(Q[4]));
subc C6(.l(Q[6]), .r(Q[4]),.D(Data_IN[5]), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .clk(clock), .reset(reset), .Q(Q[5]));
subc C7(.l(Q[7]), .r(Q[5]),.D(Data_IN[6]), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .clk(clock),.reset(reset), .Q(Q[6]));
subc C8(.l(w1), .r(Q[6]), .LoadLeft(RotateRight), .D(Data_IN[7]), .loadn(ParallelLoadn), .clk(clock), .reset(reset), .Q(Q[7]));


mux2_1 M3(Q[0],Q[7], ASRight, w1);



endmodule




module ff(Clk, R, q, d);
input Clk;
input R;
input d;
output reg q;

always @(posedge Clk)
	begin 
		if(R == 1)
		q <= 0;
		else
		q <= d; 
	end
endmodule


module subc(r, l, LoadLeft,clk, reset, Q , D, loadn);

input r, l, LoadLeft, D, loadn, clk, reset;
output Q;
wire x;
wire y;

mux2_1 m1(.x(r), .y(l), .s(LoadLeft), .m(x));
mux2_1 m2(.x(D), .y(x), .s(loadn), .m(y));

  ff ff1(.Clk(clk), .R(reset), .q(Q), .d(y));

endmodule



module mux2_1(x, y, s, m);

output m;
input x;
input y;
input s;

assign m = s ? y:x;

endmodule





