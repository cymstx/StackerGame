/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_7 (
    input [15:0] x,
    input [15:0] y,
    input [5:0] op,
    output reg [15:0] s,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [16-1:0] M_adder_s;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  reg [16-1:0] M_adder_x;
  reg [16-1:0] M_adder_y;
  reg [6-1:0] M_adder_op;
  sixteen_bit_full_adder_12 adder (
    .x(M_adder_x),
    .y(M_adder_y),
    .op(M_adder_op),
    .s(M_adder_s),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  
  wire [16-1:0] M_shifter_s;
  reg [16-1:0] M_shifter_x;
  reg [16-1:0] M_shifter_y;
  reg [6-1:0] M_shifter_op;
  shifter16_13 shifter (
    .x(M_shifter_x),
    .y(M_shifter_y),
    .op(M_shifter_op),
    .s(M_shifter_s)
  );
  
  wire [16-1:0] M_boolean_s;
  reg [16-1:0] M_boolean_a;
  reg [16-1:0] M_boolean_b;
  reg [6-1:0] M_boolean_op;
  boolean_14 boolean (
    .a(M_boolean_a),
    .b(M_boolean_b),
    .op(M_boolean_op),
    .s(M_boolean_s)
  );
  
  wire [16-1:0] M_compare_out;
  reg [1-1:0] M_compare_z;
  reg [1-1:0] M_compare_v;
  reg [1-1:0] M_compare_n;
  reg [6-1:0] M_compare_op;
  comp_15 compare (
    .z(M_compare_z),
    .v(M_compare_v),
    .n(M_compare_n),
    .op(M_compare_op),
    .out(M_compare_out)
  );
  
  wire [16-1:0] M_multiplier_p;
  reg [16-1:0] M_multiplier_x;
  reg [16-1:0] M_multiplier_y;
  sixteen_bit_multiplier_16 multiplier (
    .x(M_multiplier_x),
    .y(M_multiplier_y),
    .p(M_multiplier_p)
  );
  
  always @* begin
    M_adder_op = op;
    M_adder_x = x;
    M_adder_y = y;
    z = M_adder_z;
    v = M_adder_v;
    n = M_adder_n;
    M_compare_op = op;
    M_compare_z = M_adder_z;
    M_compare_v = M_adder_v;
    M_compare_n = M_adder_n;
    M_boolean_op = op;
    M_boolean_a = x;
    M_boolean_b = y;
    M_shifter_op = op;
    M_shifter_x = x;
    M_shifter_y = y;
    M_multiplier_x = x;
    M_multiplier_y = y;
    
    case (op)
      6'h00: begin
        s = M_adder_s;
      end
      6'h01: begin
        s = M_adder_s;
      end
      6'h08: begin
        s = M_boolean_s;
      end
      6'h0e: begin
        s = M_boolean_s;
      end
      6'h06: begin
        s = M_boolean_s;
      end
      6'h0a: begin
        s = M_boolean_s;
      end
      6'h20: begin
        s = M_shifter_s;
      end
      6'h21: begin
        s = M_shifter_s;
      end
      6'h23: begin
        s = M_shifter_s;
      end
      6'h02: begin
        s = M_multiplier_p;
      end
      6'h33: begin
        s = M_compare_out;
      end
      6'h35: begin
        s = M_compare_out;
      end
      6'h37: begin
        s = M_compare_out;
      end
      default: begin
        s = 16'hdead;
      end
    endcase
  end
endmodule
