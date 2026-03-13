module instr_mem(
input [31:0] addr,
output [31:0] instr
);

reg [31:0] memory [0:255];

integer i;

initial begin

    for(i=0;i<256;i=i+1)
        memory[i] = 32'h00000013;   // NOP

    $readmemh("program/program.hex", memory);

end

assign instr = memory[addr[9:2]];

endmodule