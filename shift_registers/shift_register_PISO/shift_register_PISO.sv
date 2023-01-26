`timescale 1ns / 1ps

//--------------------------------------------------------------------------
//  Simple PISO shift register with load
//      Author: Manuel Blanco Valentin
//      Creation Date: Jan/25/2023
//--------------------------------------------------------------------------
module shift_register_PISO #(N=2) (
    input logic [N-1:0] PI,
    input logic clk,
    input logic load,
    output logic SO
);

    // Create registers to store temp values
    reg [N-1:0] tmp;

    // At every clock posedge, shift input value to registers
    always @(posedge clk) begin 
        if (load) begin 
            tmp <= PI;
        end else begin 
            SO <= tmp[N-1];
            tmp[N-1:0] <= {tmp[N-2:0], 1'b0};
        end
    end
endmodule

