module cpu_tb;

reg clk;
reg reset;

cpu_pipeline DUT(
    clk,
    reset
);

initial begin

    $dumpfile("cpu.vcd");
    $dumpvars;

    clk = 0;
    reset = 1;

    #20 reset = 0;    

    #80 $finish;

end

always #5 clk = ~clk;

endmodule