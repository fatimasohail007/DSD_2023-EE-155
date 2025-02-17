`timescale 10ns / 1ns

module lab4(
    input logic a0, a1, b0, b1,
    output logic r, g, b
    );

    logic [1:0] a_signal, b_signal;

    assign a_signal = {a0, a1};  
    assign b_signal = {b0, b1};  

    // Red LED logic
    assign r = (~b0 & (~b1 | a1)) | (a0 & (a1 | ~b0 | ~b1));

    // Green LED logic
    assign g = (~a0 & (b1 | b0 | ~a1)) | (b0 & (b1 | ~a1));

    // Blue LED logic
    assign b = (a0 ^ b0) | (a1 ^ b1);

endmodule
