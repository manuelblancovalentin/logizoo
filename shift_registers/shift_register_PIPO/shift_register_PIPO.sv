`timescale 1ns / 1ps

//--------------------------------------------------------------------------
//  Simple PISO shift register 
//      Author: Manuel Blanco Valentin
//      Creation Date: Jan/25/2023
//--------------------------------------------------------------------------
module shift_register_PIPO #(N=2) (
    input logic [N-1:0] PI,
    input logic clk,
    output logic [N-1:0] PO
);

    // At every clock posedge, shift input value to registers
    always @(posedge clk) begin 
        PO <= PI;
    end
endmodule

