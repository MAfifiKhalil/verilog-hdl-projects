`timescale 10ns/1ns
module tb_reg8 ();
    parameter n = 8;
    reg rst, clk, en;
    reg [n-1: 0] d;
    wire [n-1: 0] q;

    // dut 
    reg8 dut (
        .clk(clk), .rst(rst), .en(en), 
        .d(d), .q(q)
    ); 

    // clock generator
    always #5 clk = ~clk; 

    // drive the inputs
    initial begin 
        clk = 0; 
        en = 0; 
        rst = 1; 
        #10 rst = 0; 
        d = $random; 
        #30 en = 1;
        #10 d = $random; 
        #10 d = $random; 
        #30 en = 0; 
        #10 d = $random; 

    end
endmodule