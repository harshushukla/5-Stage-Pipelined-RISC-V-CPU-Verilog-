#!/bin/bash

echo "Compiling..."

iverilog -o cpu_sim \
src/*.v \
pipeline/*.v \
tb/cpu_tb.v

echo "Running..."

vvp cpu_sim

echo "Opening GTKWave..."

gtkwave cpu.vcd