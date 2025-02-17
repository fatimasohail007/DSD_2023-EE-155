module task2_tb();
 logic a1;
 logic b1;
 logic c1;
 logic sum1;
 logic carry1;

 task2 UUT (
 .a(a1),
 .b(b1),
 .c(c1),
 .sum(sum1),
 .carry(carry1)
 );

 initial
 begin
 // Provide different combinations of the inputs to check validity of code
 a1 = 0; b1 = 0; c1 = 0;
 #10;
 a1 = 0; b1 = 0; c1 = 1;
 #10;
 a1 = 0; b1 = 1; c1 = 0;
 #10;
 a1 = 0; b1 = 1; c1 = 1;
 #10;
 a1 = 1; b1 = 0; c1 = 0;
 #10;
 a1 = 1; b1 = 0; c1 = 1;
 #10;
 a1 = 1; b1 = 1; c1 = 0;
 #10;
 a1 = 1; b1 = 1; c1 = 1;
 #10;
 $stop;

 end
initial
begin
$monitor("sum=%b,carry=%b, a=%b, b=%b, c=%b", sum1,carry1,a1,b1,c1);
end
endmodule