`timescale 1ns / 1ps

//--------------------------------------------------------------------------
//  Simple SIPO shift register with reset
//      Author: Manuel Blanco Valentin
//      Creation Date: Jan/25/2023
//--------------------------------------------------------------------------
module shift_register_SIPO #(N=2) (
    input logic SI,
    input logic clk,
    input logic reset,
    output logic [N-1:0] PO
);
    // At every clock posedge, shift input value to registers
    always @(posedge clk) begin 
        if (reset) begin 
            PO <= 0;
        end else begin 
            PO[N-1:0] <= {PO[N-2:0], SI};
        end
    end
endmodule

