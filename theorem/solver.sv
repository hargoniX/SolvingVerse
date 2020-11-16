module solver(i, o);
input i;
output o;
assign o = 1;

assert property ({o} == {!i});
endmodule
