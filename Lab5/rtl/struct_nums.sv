module struct_nums(
    input logic [3:0] nums,
    output logic a, b, c, d, e, f, g
);
    
    wire n4 = nums[0];
    wire n3 = nums[1];
    wire n2 = nums[2];
    wire n1 = nums[3];

    // segment a
    assign a = (~n1 & n2 & ~n3 & ~n4) | (~n1 & ~n2 & ~n3 & n4) | (n1 & n2 & ~n3 & n4) | (n1 & ~n2 & n3 & n4);

    // segment b
    assign b = (n1 & n2 & ~n4) | (n1 & n2 & n3) | (n2 & n3 & ~n4) | (~n1 & n2 & ~n3 & n4) | (n1 & ~n2 & n3 & n4);

    // segment c
    assign c = (n1 & n2 & ~n4) | (n1 & n2 & n3) | (~n1 & ~n2 & n3 & ~n4);

    // segment d
    assign d = (n2 & n3 & n4) | (~n1 & ~n2 & ~n3 & n4) | (~n1 & n2 & ~n3 & ~n4) | (n1 & ~n2 & n3 & ~n4);
    
    // segment e
    assign e = (~n1 & n4) | (~n1 & n2 & ~n3) | (~n2 & ~n3 & n4);
    
    // segment f
    assign f = (~n1 & ~n2 & n4) | (~n1 & ~n2 & n3) | (~n1 & n3 & n4) | (n1 & n2 & ~n3 & n4);
    
    // segment g
    assign g = (~n1 & ~n2 & ~n3) | (~n1 & n2 & n3 & n4) | (n1 & n2 & ~n3 & ~n4);
    
endmodule
