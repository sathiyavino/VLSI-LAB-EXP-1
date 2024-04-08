 module halfadder( a, b, s, c) ;
     input a, b;
     output s, c;
     xor gl (s, a,b);
     and g2 (c, a,b);
     endmodule
