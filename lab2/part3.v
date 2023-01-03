

module hex_decoder(c,display);
		
		input [3:0] c;
		output [6:0] display;
		
		wire M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15;
		
		assign M0 = c[3]|c[2]|c[1]|c[0];
		assign M1 = c[3]|c[2]|c[1]|~c[0];
		assign M2 = c[3]|c[2]|~c[1]|c[0];
		assign M3 = c[3]|c[2]|~c[1]|~c[0];
		assign M4 = c[3]|~c[2]|c[1]|c[0];
		assign M5 = c[3]|~c[2]|c[1]|~c[0];
		assign M6 = c[3]|~c[2]|~c[1]|c[0];
		assign M7 = c[3]|~c[2]|~c[1]|~c[0];
		assign M8 = ~c[3]|c[2]|c[1]|c[0];
		assign M9 = ~c[3]|c[2]|c[1]|~c[0];
		assign M10 = ~c[3]|c[2]|~c[1]|c[0];
		assign M11 = ~c[3]|c[2]|~c[1]|~c[0];
		assign M12 = ~c[3]|~c[2]|c[1]|c[0];
		assign M13 = ~c[3]|~c[2]|c[1]|~c[0];
		assign M14 = ~c[3]|~c[2]|~c[1]|c[0];
		assign M15 = ~c[3]|~c[2]|~c[1]|~c[0];
		
		assign display[0] = ~(M1 & M4 & M11 & M13);
		assign display[1] = ~(M5 & M6 & M11 & M12 & M14 & M15);
		assign display[2] = ~(M2 & M12 & M14 & M15);
		assign display[3] = ~(M1 & M4 & M7 & M9 & M10 & M15);
		assign display[4] = ~(M1 & M3 & M4 & M5 & M7 & M9);
		assign display[5] = ~(M1 & M2 & M3 & M7 & M13);
		assign display[6] = ~(M0 & M1 & M7 & M12);
		
endmodule 