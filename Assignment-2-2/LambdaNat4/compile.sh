#!/bin/bash
cd grammar
bnfc -m -haskell LambdaNat4.cf
make
cp *.hs ../src
cd ../src
stack build