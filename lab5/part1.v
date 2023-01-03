module part1(Clock, Enable, Clear_b, CounterValue);
  input Clock, Enable, Clear_b;
  output [7:0] CounterValue;
  
  wire[6:0] connect;
  
  assign connect[0] = Enable & CounterValue[0];
  assign connect[1] = connect[0] & CounterValue[1];
  assign connect[2] = connect[1] & CounterValue[2];
  assign connect[3] = connect[2] & CounterValue[3];
  assign connect[4] = connect[3] & CounterValue[4];
  assign connect[5] = connect[4] & CounterValue[5];
  assign connect[6] = connect[5] & CounterValue[6];
  
  T_FlipFlop u1(Clock, Enable, Clear_b, CounterValue[0]);
  T_FlipFlop u2(Clock, connect[0], Clear_b, CounterValue[1]);
  T_FlipFlop u3(Clock, connect[1], Clear_b, CounterValue[2]);
  T_FlipFlop u4(Clock, connect[2], Clear_b, CounterValue[3]);
  T_FlipFlop u5(Clock, connect[3], Clear_b, CounterValue[4]);
  T_FlipFlop u6(Clock, connect[4], Clear_b, CounterValue[5]);
  T_FlipFlop u7(Clock, connect[5], Clear_b, CounterValue[6]);
  T_FlipFlop u8(Clock, connect[6], Clear_b, CounterValue[7]);

   
  
endmodule
module T_FlipFlop(Clock, Toggle, clear_n, Q);
    input Clock, Toggle, clear_n;
    output reg Q;
    
    always@(posedge Clock, negedge clear_n)
      if(clear_n == 0)
        Q <= 0;
      else if(Toggle == 1)
        Q = ~Q;
  	  else
        Q <= Q;
  endmodule
  