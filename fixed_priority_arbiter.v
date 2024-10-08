/////////////////////////////////////////////////////////
//                    Biplab Das S                     //
//               Fixed Priority Arbiter                //
/////////////////////////////////////////////////////////

// Fixed Priority arbiter
// port[0] - highest priority 

module fixed_priority_arbiter #(
    parameter NUM_PORTS = 4             //parameter to be driven
)(
    input   wire[NUM_PORTS-1:0] req_i,  //Request input
    output   reg[NUM_PORTS-1:0] gnt_o   // One-hot grant signal
);

  generate
    genvar i;
    always@(*) gnt_o[0] = req_i[0];
    for(i=1; i<NUM_PORTS; i=i+1) begin
      always@(*) gnt_o[i] = req_i[i] & ~(|req_i[i-1:0]);  //linting error solved here
    end
  endgenerate

endmodule
