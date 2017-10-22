module  HalfAdder_Testbench ();

reg A;
reg B;
wire cOut;
wire sum;


HalfAdder test(A, B,cOut,sum);

initial begin
A =1'b0 ;
B =1'b0 ;  

#20;
A =1'b1 ;
B =1'b1 ;  

#20;
A =1'b0 ;
B =1'b1 ;  

#20;

end

initial begin

$monitor("time  = %2d , A = %1b ,B = %1b , cOut = %1b , sum = %1b",$time, A, B,cOut,sum);

end

endmodule
