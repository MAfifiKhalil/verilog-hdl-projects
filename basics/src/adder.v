module adder (
input [3:0] a,b ,
input cin ,
output cout, 
output [4:0] result
);

    assign {cout, result} = a + b + cin ;

endmodule 