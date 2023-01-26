
// scanChain module definition
module configReg #( parameter NWEIGHTS=5775) (
    input configClk, 
    input configIn, 
    input configRst, 
    output [NWEIGHTS-1:0] parallelOut,
    output configOut
);

    reg [NWEIGHTS-1:0] configReg;

    always @(posedge configClk, negedge configRst)
        begin
        if(!configRst) configReg[NWEIGHTS-1:0] <= {NWEIGHTS{1'b0}};
        else configReg[NWEIGHTS-1:0] <= {configReg[NWEIGHTS-2:0],configIn};
        end
        
    assign configOut = configReg[NWEIGHTS-1];
    assign parallelOut[NWEIGHTS-1:0] = configReg[NWEIGHTS-1:0];

endmodule