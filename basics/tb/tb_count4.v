`timescale 10ns/1ns
module tb_count4 ();
    reg clk,ld,rst;
    wire [3:0] q;
    count4 dut (.clk(clk),.ld(ld),.rst(rst),.q(q));
    
    always #5 clk = ~clk; 
    initial begin
        #0 clk=0; rst=0; ld=0;
        #20     rst=1; ld=0;
        #20     rst=1; ld=0;
        #20     rst=1; ld=1;
        #20     rst=1; ld=0;
        #20     rst=0; ld=0;    
    end
    endmodule