module MEM_WB(
input clk,
input reset,

input [31:0] mem_in,
output reg [31:0] mem_out
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        mem_out <= 0;
    else
        mem_out <= mem_in;
end

endmodule