module shiftLreg8 #(
    parameter N = 8
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
                q <= {q[N-2:0], SI};
        end
    end

    assign SO = q[N-1]; 
    
endmodule