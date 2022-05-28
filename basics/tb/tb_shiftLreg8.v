`timescale 10ns/1ns
module tb_shiftreg8 (); 

    parameter N = 8; 

    reg clk, rst, en, ldsh, SI; 
    reg [N-1: 0] d; 
    wire SO; 
    wire [N-1: 0] q;

    // dut 
    shiftLreg8 dut (
        .clk(clk), .rst(rst), .en(en), .ldsh(ldsh), .SI(SI), 
        .d(d), .SO(SO), 
        .q(q)
    );

    // clock generator
    always #5 clk = ~clk; 

    initial begin
        clk = 0; 
        rst = 1; 
        en = 0; 
        ldsh = 0; 
        SI = 0; 

        d = $random; 
        #10 rst = 0; 
        #10;
        ldsh = 1; 
        en = 1; 
        SI = 1; 

        #15 ldsh = 0; 
        #15 en = 0; 
        #10 SI = 0; 
        #10 en = 1;

        #30 rst = 1; 
        
        
    end
endmodule