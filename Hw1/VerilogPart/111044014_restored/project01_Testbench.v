module  project01_Testbench ();

reg [4:0]A;
reg [4:0]B;
reg [1:0]S;
wire [4:0]R;


project01 test(R, A, B,S);


initial begin
A[4:0] =5'b00100 ;
B[4:0] =5'b00100 ;  
S[1:0] =2'b00 ;  

#20;
A[4:0] =5'b10100 ;
B[4:0] =5'b00100 ; 
S[1:0] =2'b10 ;  

#20
A[4:0] =5'b00100 ;
B[4:0] =5'b10100 ;
S[1:0] =2'b01 ;   

#20;
A[4:0] =5'b10010 ;
B[4:0] =5'b01000 ; 
S[1:0] =2'b11 ;  

#20;
end

initial begin

$monitor("time  = %2d , A = %5b ,B = %5b , S = %2b , R = %5b",$time, A,B,S,R);

end

endmodule
