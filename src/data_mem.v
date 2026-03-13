module data_mem(
input clk,
input memread,
input memwrite,
input [31:0] addr,
input [31:0] wd,
output reg [31:0] rd
);

reg [31:0] memory [0:255];

integer i;

initial begin
    for(i=0;i<256;i=i+1)
        memory[i] = 0;
end

always @(posedge clk)
begin
    if(memwrite)
        memory[addr[9:2]] <= wd;
end

always @(*)
begin
    if(memread)
        rd = memory[addr[9:2]];
    else
        rd = 0;
end

endmodule