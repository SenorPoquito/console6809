module console_top(
		   input logic [15:0] address_in,
		   input logic bus_available,
		   input logic bus_status,
		   input logic r_nw,
		   input logic e, // Data latched on falling edge
		   input logic q, //Address Valid on Leading Edge
		   output logic n_nmi,
		   output logic n_irq,
		   output logic n_fir,
		   output logic n_reset,
		   output logic n_halt,
		   output logic mrdy,
		   output logic n_breq,
		   inout logic[7:0] data_bus
		   );

   logic 			    sram_select_wire;
   logic 			    io_select_wire;
   logic 			    eeprom_select_wire;
   
   //Process to determine whether data_bus is reading or writing
   always_comb
     begin:data_bus_assign
	if (r_nw)
	  data_bus_l=data_bus;
	else
	  data_bus=data_bus_l;
     end
   
   //Address Decode

   console_address_decode inst_address_decode(
					      .address_in(address_in),
					      .sram_select(sram_select_wire),
					      .io_select(io_select_wire),
					      .eeprom_select(eeprom_select_wire)
					      );
   //Instantiate SRAM Block

   //Instantiate EEPROM Cell

   
   

endmodule 
