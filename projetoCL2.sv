module projetoCL2 (input [5:0] A, input [5:0] B, input reset, input selModo, input [2:0] selOp, output reg [6:0] otULA, output reg Co, output reg zero);

	always_comb begin 
	
	
		if(reset == 1) begin 
				otULA = 7'b0000000;
				Co = 0;
				zero = 0;
			end else begin
			
			Co = 0;
			zero = 0;
	
		case (selModo)
			
			0: case(selOp) 
					3'b000: otULA = A + B;
					3'b001: otULA = A - B;
					3'b010: otULA = A + ~(B);
					3'b011: otULA = A - ~(B);
					3'b100: otULA = A + 1;
					3'b101: otULA = A - 1;
					3'b110: otULA = B + 1;
					3'b111: otULA = B - 1;
					default: otULA = 7'b0000000;					
					endcase
			
			1: case (selOp)
					3'b000: otULA = A & B;
					3'b001: otULA = ~A;
					3'b010: otULA = ~B;
					3'b011: otULA = A | B;
					3'b100: otULA = A ^ B;
					3'b101: otULA = ~(A & B);
					3'b110: otULA = A;
					3'b111: otULA = B;
					default: otULA = 7'b0000000;
			endcase
		
		endcase
			
			
			if (otULA > 6'b111111) begin
				Co = 1;
			end
			
			if (otULA == 7'b0000000) begin 
				zero = 1;
			end
		 end
	end

endmodule