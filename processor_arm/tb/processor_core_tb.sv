module processor_core_tb #(parameter bit PIPELINE = 0) ();
	localparam  N = 64;
	logic        	CLOCK_50, reset;
	logic        	DM_writeEnable;
	logic [N-1:0] 	DM_writeData, DM_addr;
	logic 			dump;

  processor_core #(.PIPELINE(PIPELINE)) dut (CLOCK_50, reset, DM_writeData, DM_addr, DM_writeEnable, dump);

  always
    begin
      #5 CLOCK_50 = ~CLOCK_50;
    end


  initial
    begin
      CLOCK_50 = 0; reset = 1; dump = 0;
      #20 reset = 0;
    #400 dump = 1;
	   #20 $stop;
	end
endmodule

