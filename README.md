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
module test(input_1, output_1);
    StudentCircuitName test(input_1, output_1);

    assert property(output_1 == something);
endmodule
```

in order to not have to retype their assertions all the time.

Afterwards you can simply build the docker container (maybe I will even publish it on dockerhub) with
`sudo docker build . -t solvingverse` and then launch it with `sudo docker-compose up`. And here you go,
the verification toolchain should be running. Note that if you are building the container from scratch
for the first time it is going to take a while since it has to build yosys and a few theorem solvers first.



## Modifying
Basically the container just runs `sby` against the `theorem/solver.sby` file, if you need any other kind of verication
just change it.


## Future plans
I am planning on adding something that should be able to print out counterexamples a theorem solver might come up with
so the user doesn't have to manually search the trace files.
