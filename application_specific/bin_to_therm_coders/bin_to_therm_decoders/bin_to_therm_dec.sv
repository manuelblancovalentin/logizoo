// BIN TO THERM DEC module 
// Author: Hongzhi Sun
// Revised by: Manuel Blanco Valentin
module bin_to_therm_dec #(parameter N=10) 
    ( 
    input [(N/2)-1:0] bin_in_high,
    input [(N/2)-1:0] bin_in_low,
    input clk,
    output [2**(N/2)-2:0] therm_out_high_sync,
    //[@manuelbv]: There was a double redefinition of therm_out_high_sync here
    output [2**(N/2)-2:0] therm_out_low_sync 
    );

    reg [2**(N/2)-2:0] therm_out_high_sync;
    reg [2**(N/2)-2:0] therm_out_low_sync;

    wire [2**(N/2)-2:0] therm_out_high;
    wire [2**(N/2)-2:0] therm_out_low;

    //[@manuelbv]: Initializing this to zero is ignored during synthesis.
    reg [2**(N/2)-2:0] a_int;

    assign therm_out_high = ~((~a_int)<<bin_in_high);
    assign therm_out_low  = ~((~a_int)<<bin_in_low);

    always @(negedge clk) begin
        therm_out_high_sync <= therm_out_high;
        therm_out_low_sync <= therm_out_low;
    end

endmodule