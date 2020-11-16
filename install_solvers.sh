#!/bin/sh
git clone https://github.com/YosysHQ/yosys.git yosys
cd yosys
make -j$(nproc)
make install
cd ..

git clone https://github.com/YosysHQ/SymbiYosys.git SymbiYosys
cd SymbiYosys
make install
cd ..

git clone https://github.com/SRI-CSL/yices2.git yices2
cd yices2
autoconf
./configure
make -j$(nproc)
make install
cd ..

git clone https://github.com/Z3Prover/z3.git z3
cd z3
python scripts/mk_make.py
cd build
make -j$(nproc)
make install
cd ../..

git clone https://bitbucket.org/arieg/extavy.git
cd extavy
git submodule update --init
mkdir build; cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)
cp avy/src/{avy,avybmc} /usr/local/bin/
cd ..

git clone https://github.com/boolector/boolector
cd boolector
./contrib/setup-btor2tools.sh
./contrib/setup-lingeling.sh
./configure.sh
make -C build -j$(nproc)
cp build/bin/{boolector,btor*} /usr/local/bin/
cp deps/btor2tools/bin/btorsim /usr/local/bin/
cd ..
