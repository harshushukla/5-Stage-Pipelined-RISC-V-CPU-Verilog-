module cpu_top(
input clk,
input reset
);

wire [31:0] pc_val;
wire [31:0] next_pc;
wire [31:0] instr;

wire regwrite;
wire memread;
wire memwrite;
wire alusrc;
wire memtoreg;
wire branch;

wire [1:0] aluop;

wire [31:0] rs1_data;
wire [31:0] rs2_data;

wire [31:0] alu_in2;
wire [31:0] alu_result;

wire [31:0] imm;

wire zero;

wire [31:0] mem_data;
wire [31:0] writeback_data;

wire [3:0] alu_ctrl;


assign next_pc = branch && zero ? pc_val + imm : pc_val + 4;

pc PC(clk, reset, next_pc, pc_val);

instr_mem IM(pc_val, instr);


control CTRL(
    instr[6:0],
    regwrite,
    memread,
    memwrite,
    alusrc,
    memtoreg,
    branch,
    aluop
);


regfile RF(
    clk,
    regwrite,
    instr[19:15],
    instr[24:20],
    instr[11:7],
    writeback_data,
    rs1_data,
    rs2_data
);


imm_gen IMM(instr, imm);


alu_control ALUCTRL(
    aluop,
    instr[14:12],
    instr[30],
    alu_ctrl
);


assign alu_in2 = alusrc ? imm : rs2_data;

alu ALU(
    rs1_data,
    alu_in2,
    alu_ctrl,
    alu_result,
    zero
);

data_mem DM(
    clk,
    memread,
    memwrite,
    alu_result,
    rs2_data,
    mem_data
);


assign writeback_data = memtoreg ? mem_data : alu_result;

endmodule