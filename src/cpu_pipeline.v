module cpu_pipeline(
input clk,
input reset
);

wire [31:0] pc_val;
wire [31:0] next_pc;
wire [31:0] instr;


wire [31:0] IF_ID_pc;
wire [31:0] IF_ID_instr;

wire [31:0] ID_EX_pc;
wire [31:0] EX_MEM_alu;
wire [31:0] MEM_WB_data;


assign next_pc = pc_val + 4;

pc PC(
    clk,
    reset,
    next_pc,
    pc_val
);

instr_mem IM(
    pc_val,
    instr
);


IF_ID IFID(
    clk,
    reset,
    pc_val,
    instr,
    IF_ID_pc,
    IF_ID_instr
);


ID_EX IDEX(
    clk,
    reset,
    IF_ID_pc,
    ID_EX_pc
);


wire [31:0] alu_result;

assign alu_result = ID_EX_pc + 4;


EX_MEM EXMEM(
    clk,
    reset,
    alu_result,
    EX_MEM_alu
);

MEM_WB MEMWB(
    clk,
    reset,
    EX_MEM_alu,
    MEM_WB_data
);

endmodule