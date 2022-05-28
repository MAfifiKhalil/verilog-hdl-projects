module count4 (
    input clk,ld,rst,
    input [3:0] value,
    output reg [3:0] q
);
always @ (posedge clk, negedge rst)begin
    if (rst==0) begin
        q <=0;
    end
    else if (value) begin
        q <= value;
    end
    else begin
    q <= q + 1 ;    
    end
    
end
endmodule