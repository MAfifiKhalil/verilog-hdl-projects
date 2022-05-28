module fsm1(
    input clk,rst,go,kill,
    output done,
    output [1:0] state
);
    parameter idle= 0;
    parameter active= 1;
    parameter finish= 2;
    parameter abort= 3;

    reg [1:0] current_state,next_state;
    reg [6:0] count;

    always @(*)begin
        case (current_state)
        idle: begin
            if(go)begin
                next_state =active;
                else begin
                    next_state=current_state;
                end
            end
        end
        active:begin
            if(kill) begin
                next_state = abort;
            end
            else if (dcount==100) begin
                next_state = finish;
            end
            else begin
                next_state = current_state;
            end
        end
        finish:begin
            next_state = idle;
            end
        abort:begin
            if(!kill)begin
                next_state = idle;
            end
            else begin
                next_state = current_state;
            end
        end    
        endcase
    end
    always @(posedge clk , posedge rst) begin
        if(rst)begin
            current_state <= idle;
            
        end
        else begin
            current_state <= next_state;
            
        end
        
    end
    always @(posedge clk, posedge rst ) begin
        if(rst)begin
            done <= 0;
        end
        else begin
            done <= current_state == finish;
        end
    end
    always @(posedge clk, posedge rst) begin
        if (rst)begin
            count <= 0;
        end
        else if ( current_state==finish || current_state== abort) begin
            count <= 0;
        end
        else if (current_state== active)begin
            count <= count + 1 ;
        end
    end

endmodule