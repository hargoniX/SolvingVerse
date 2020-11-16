module StudentCircuit(i, o);
input i;
output o;
assign o = 1;

endmodule

module solver(input_1, output_1);
    input input_1;
    output output_1;

    StudentCircuit test(input_1, output_1);
    assert property ({output_1} == {!input_1});
endmodule

