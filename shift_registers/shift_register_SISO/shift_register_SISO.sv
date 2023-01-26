`timescale 1ns / 1ps

//--------------------------------------------------------------------------
//  Simple SISO shift register with reset
//      Author: Manuel Blanco Valentin
//      Creation Date: Jan/25/2023
//--------------------------------------------------------------------------
module shift_register_SISO #(N=2) (
    input logic SI,
    input logic clk,
    input logic reset,
    output logic SO
);
    // Create registers to store intermediate values 
    reg [N-1:0] tmp;

    // At every clock posedge, pass input value to registers
    always @(posedge clk) begin 
        if (reset) begin 
            tmp <= 0;
        end else begin 
            tmp[N-1:0] <= {tmp[N-2:0], SI};
        end
    end

    // Assign serial output
    assign SO = tmp[N-1];

endmodule
