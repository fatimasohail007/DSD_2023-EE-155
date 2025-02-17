`timescale 10ns / 1ns

module lab4_tb;
    // Testbench signals
    logic a0, a1, b0, b1;
    logic r, g, b;

    // Instantiate the DUT
    lab4 dut (
        .a0(a0), .a1(a1),
        .b0(b0), .b1(b1),
        .r(r), .g(g), .b(b)
    );

    // Driver: Apply input and wait for DUT response
    task driver(input int i);
        {a0, a1, b0, b1} = i;  // Apply input vector
        #10;                   // Wait for DUT response
    endtask

    // Monitor: Observes and prints output
    task monitor;
        $display("%b  %b  %b  %b  |  %b    %b    %b", a0, a1, b0, b1, r, g, b);
    endtask

    // Testbench process
    initial begin
        $display("a0 a1 b0 b1 | r g b");

        // Apply all combinations of inputs (0 to 15)
        for (int i = 0; i < 16; i++) begin
            driver(i);  // Apply input
            monitor();  // Display output
        end

        $finish;
    end
endmodule