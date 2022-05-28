`timescale 10ns/1ns
module tb_comp();
    reg [3:0] A,B ;
    wire Lt,Eq,Gt;
    comp ut (.A(A),.B(B),.Lt(Lt),.Eq(Eq),.Gt(Gt));
    
initial begin
    #0       A=15; B=6; 
    #20      A=6; B=6; 
    #20      A=3; B=6; 
    #20      A=8; B=6; 
    #20      A=10; B=6; 
    #20      A=15; B=6;      
end


endmodule