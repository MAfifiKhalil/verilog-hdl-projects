`timescale 10ns/1ns
module testbench();
    reg [3:0] a,b;
    reg cin;
    wire [4:0] result;

    adder dut (.a(a),.b(b),.cin(cin),.result(result));

    initial begin
        #0      a=0;  b=0; cin=0;
        #20     a=10; b=3; cin=1;
        #20     a=6;  b=9; cin=1;
        #20     a=9;  b=3; cin=0;
        #20     a=15; b=15; cin=1;     
    end
endmodule
