module reg8 #(
    N = 8
) (
    input rst, clk, en, 
    input [N-1: 0] d, 
    output reg [N-1: 0] q 
); 

    always @(posedge clk, posedge rst) begin
        if (rst) begin 
            q <= 0; 
        end
        else if (en) begin 
            q <= d; 
        end
    end
endmodule