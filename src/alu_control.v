module alu_control(
input [1:0] aluop,
input [2:0] funct3,
input funct7,
output reg [3:0] alu_ctrl
);

always @(*) begin

case(aluop)

2'b00: alu_ctrl = 4'b0000;   

2'b01: alu_ctrl = 4'b0001;   

2'b10:
    case({funct7,funct3})

        4'b0000: alu_ctrl = 4'b0000; 
        4'b1000: alu_ctrl = 4'b0001; 
        4'b0111: alu_ctrl = 4'b0010; 
        4'b0110: alu_ctrl = 4'b0011; 

        default: alu_ctrl = 4'b0000;

    endcase

default:
    alu_ctrl = 4'b0000;

endcase

end

endmodule