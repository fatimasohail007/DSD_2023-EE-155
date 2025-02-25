module lab5(
    input  logic [3:0] nums,     
    input  logic [2:0] sel,      
    output logic a, b, c, d, e, f, g,  
    output logic AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7 
);

    
    struct_nums seven_seg_decoder (
        .nums(nums),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g)
    );

    
    sel display_selector (
        .sel(sel),
        .AN0(AN0),
        .AN1(AN1),
        .AN2(AN2),
        .AN3(AN3),
        .AN4(AN4),
        .AN5(AN5),
        .AN6(AN6),
        .AN7(AN7)
    );

endmodule