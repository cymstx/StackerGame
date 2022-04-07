/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module comp_15 (
    input z,
    input v,
    input n,
    input [5:0] op,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    out = 16'h0000;
    
    case (op)
      default: begin
        out[0+0-:1] = 1'h0;
      end
      6'h33: begin
        out[0+0-:1] = z;
      end
      6'h35: begin
        out[0+0-:1] = n ^ v;
      end
      6'h37: begin
        out[0+0-:1] = z | (n ^ v);
      end
    endcase
  end
endmodule
