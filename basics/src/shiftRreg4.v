module shiftRreg4 #(
    parameter N = 4
) (
    input clk, rst, en, ldsh, SI, 
    input [N-1: 0] d, 
    output SO, 
    output reg [N-1: 0] q
);

    always @(posedge clk, posedge rst) begin 
        if (rst) 
            q <= 0; 
        else if (en) begin 
            if (ldsh) 
                q <= d;
            else 
                q <= {SI, q[N-1: 1]};
        end
    end

    assign SO = q[0]; 
    
endmodule