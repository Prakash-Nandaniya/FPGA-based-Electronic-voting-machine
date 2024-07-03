`timescale 1ns / 1ps
module voting_machine #(
    parameter vote = 2'b01,
    parameter finish = 2'b11
)(
    input clk,
    input rst,
    input i_candidate_1, 
    input i_candidate_2,  
    input i_voting_over, 
    output reg [3:0] r_counter_1, 
    output reg [3:0] r_counter_2,
    output reg green, //vote
    output reg blue //finish
    
);  

//declaring reg and intialising them
reg [1:0] machine_state;
reg can_vote;
reg stop;
reg [3:0] r_counter_1_str; 
reg [3:0] r_counter_2_str;
initial begin
    machine_state<=vote;
    r_counter_1_str<=4'b0000;
    r_counter_2_str<=4'b0000;
    can_vote<=1;
    stop=0;
end

////setting 3sec counter for 120MHZ
//parameter COUNT_MAX = 3000000; // Number of clock cycles for 3 seconds
//reg [21:0] count;   // 22-bit counter for counting clock cycles
//initial begin
//    count <= 0;    // Initialize counter
//    can_vote <= 1'b0;  // Initialize can_vote signal low
//end
//always @(posedge clk) begin
//    if(can_vote_prev == 1'b1 && can_vote == 1'b0)begin
//        count<=0;
//    end
//    if (count == COUNT_MAX) // Check if the count reaches 3 seconds
//        can_vote <= 1'b1; 
//        count<=0;       // Set done signal high
//    else
//        count <= count + 1;  // Increment counter
//end

always @(posedge clk)begin
    if((i_candidate_1 || i_candidate_2)==0)begin
        stop<=0;
    end
    else if(i_candidate_1==1 && stop==0 && can_vote==1)begin
        r_counter_1_str<=r_counter_1_str+1;
        stop<=1;
    end
    else if(i_candidate_2==1 && stop==0 && can_vote==1)begin
        r_counter_2_str<=r_counter_2_str+1;
        stop<=1;
    end
    if(i_voting_over==1)begin
        can_vote<=0;
        machine_state<=finish;
        r_counter_1<=r_counter_1_str;
        r_counter_2<=r_counter_2_str;
    end
    if(rst)begin
        can_vote<=1;
        r_counter_1<=4'b0000;
        r_counter_2<=4'b0000;
        r_counter_1_str<=4'b0000;
        r_counter_2_str<=4'b0000;
        machine_state<=vote;
    end

end

always @(posedge clk)begin
    case(machine_state)
        vote   : {green,blue}=2'b10;
        finish : {green,blue}=2'b01;
    endcase
end
endmodule
