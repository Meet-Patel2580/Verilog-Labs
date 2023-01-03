module mux2to1(x, y, s, m);
		
		input x, y, s;
		output m;
		wire not_s;
		wire not_s_and_x;
		wire y_and_s;
		

		v7404 not_chip(.pin2(not_s),.pin1(s));
		v7408 and_chip1(.pin1(x),.pin2(not_s),.pin3(not_s_and_x));
		v7408 and_chip2(.pin1(y),.pin2(s),.pin3(y_and_s));
		v7432 or_chip(.pin1(not_s_and_x),.pin2(y_and_s),.pin3(m));
		
endmodule 



module v7404 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
		
		input pin1, pin3, pin5, pin9, pin11, pin13;
		output pin2, pin4, pin6, pin8, pin10, pin12;
		
		
		assign pin2 = (~pin1);
		assign pin4 = (~pin3);
		assign pin6 = (~pin5);
		assign pin8 = (~pin9);
		assign pin10 = (~pin11);
		assign pin12 = (~pin13);
		
		
endmodule
		
//7408 Chip
module v7408 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8,pin10, pin12);
		
		input pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13;
		output pin3, pin6, pin8, pin11;
		
		
		
		assign pin3 = (pin1&pin2);
		assign pin6 = (pin4&pin5);
		assign pin8 = (pin9&pin10);
		assign pin11 = (pin12&pin13);

		
endmodule

//7432 Chip
module v7432 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
		
		input pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13;
		output pin3, pin6, pin8, pin11;
		
		
		assign pin3 = (pin1|pin2);
		assign pin6 = (pin4|pin5);
		assign pin8 = (pin9|pin10);
		assign pin11 = (pin12|pin13);
		
endmodule 