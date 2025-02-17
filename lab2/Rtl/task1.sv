
////////////////////////////////////////////////////////////////////////////////// 
// Engineer:Fatima Irfan Sohail
// 
// Module Name: Lab3
// Target Devices:Nexys-A7-100T 
//////////////////////////////////////////////////////////////////////////////////


module task1(output logic x , y ,
input logic a,b,c
 );
 wire w1, w2, w3, w4, w5;
 or   a1(w1, a, b);
 not a2(w2, c);
 xor a3(x, w1, w2);

 and a4(w3, a, b);
 not a5(w4, w3);
 xor a6(w5, w4, w1);
 and a7(y, w1, w5);


endmodule


