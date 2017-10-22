module  FivebitXor_Testbench ();

reg [4:0]A;
reg [4:0]B;
wire [4:0]R;


FivebitXor test(R, A, B);


initial begin
A[4:0] =5'b00100 ;
B[4:0] =5'b00100 ;  

#20;
A[4:0] =5'b10101 ;
B[4:0] =5'b00100 ;  

#20;
A[4:0] =5'b00100 ;
B[4:0] =5'b10101 ;  

#20;
A[4:0] =5'b01100 ;
B[4:0] =5'b00101 ;  


#20;
end

initial begin

$monitor("time  = %2d , A = %5b ,B = %5b , R = %5b",$time, A,B,R);

end

endmodule
