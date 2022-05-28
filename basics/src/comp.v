module comp(
    input [3:0] A,B ,
    output reg Lt,Eq,Gt

);
    assign Lt = A < B; 
    assign Eq = A == B; 
    assign Gt = A > B; 
endmodule