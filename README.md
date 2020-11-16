# SolvingVerse

A small docker container system I made for verifying designs from CircuitVerse.

## Usage

When inside the CircuitVerse editor of a certain project you can open a browser console
and type `verilog.exportVerilog()`. This should output Verilog code corresponding to your
current circuit (and all of its subcircuits).

You can then proceed to copy the Verilog code into `theorem/solver.sv`. Now you can start adding
a few assertions into the modules you'd like to know stuff about. A teacher/tutor who wants to automatically
correct a design of a pupil of their's might consider to write a module

```verilog
module solver(input_1, output_1);
    input input_1;
    output output_1;

    StudentCircuit test(input_1, output_1);
    assert property (some_thing == another_thing);
endmodule
```

in order to not have to retype their assertions all the time.

Afterwards you can simply build the docker container (maybe I will even publish it on dockerhub) with
`sudo docker build . -t solvingverse` and then launch it with `sudo docker-compose up`. And here you go,
the verification toolchain should be running. Note that if you are building the container from scratch
for the first time it is going to take a while since it has to build yosys and a few theorem solvers first.

## The example
The example that's in the respository right now is expected to error for the input `1`. So a `sudo docker-compose up`
should give you a verification error, pointing to a file that contain a counterexample.

## Reading out counterexamples
The output of `sby` will indicate where you can find the files that contain the counterexample for your circuit (should
one be found), you can view them with a program like `gtkwave`.


## Modifying
Basically the container just runs `sby` against the `theorem/solver.sby` file, if you need any other kind of verication
just change it.


