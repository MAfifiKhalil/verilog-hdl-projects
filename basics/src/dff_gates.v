module dff_gates (
    input x,clk,rst,
    output z
);
    reg a,b,c ;

    always @ (posedge clk,negedge rst )begin
        if (rst==0) begin
        a <= 0;
        end
        else begin
            a <= x ^ a ;
        end 
    end

    always @ (posedge clk, negedge rst)begin
        if (rst==0)begin
            b <= 0;
        end
        else begin
            b <= x & ~b;
        end
    end

    always @ (posedge clk, negedge rst)begin
        if (rst==0)begin
            c <= 0;
        end
        else begin
            c <= x | ~c;
        end
    end

    assign z = ~(a | b | c);

endmodule
