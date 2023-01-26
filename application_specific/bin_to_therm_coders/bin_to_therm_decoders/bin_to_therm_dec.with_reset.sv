// ------------------------------------------------------------------------------------
// BIN TO THERM DEC module 
//
//  Original Author: Hongzhi Sun
//  Adapted by: Manuel Blanco Valentin
//  Corrected by: Suyash Pati Tripathi
//  Revised by: Manuel Blanco Valentin 
//  Revision date: 23/Dec/2022
// ------------------------------------------------------------------------------------
module bin_to_therm_dec #(parameter N=8) ( bin_in_high, therm_out_high, enable);
	
    // [@manuelbv]: Added by Manu B Valentin
    localparam M = 2**N-2;

    // Inputs 
    input [N-1:0] bin_in_high;
    input logic enable;

    // Outputs 
    output wire [M:0] therm_out_high;
    
    assign therm_out_high = enable? (({M{1'b1}})<<bin_in_high): {M{1'b1}};

endmodule