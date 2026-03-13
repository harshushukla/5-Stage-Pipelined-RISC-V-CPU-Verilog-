module EX_MEM(
input clk,
input reset,

input [31:0] alu_in,
output reg [31:0] alu_out
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        alu_out <= 0;
    else
        alu_out <= alu_in;
end

endmodule