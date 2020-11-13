#!/bin/bash
cd grammar
bnfc -m -haskell LambdaNat4.cf
cp *.hs ../src
cd src
stack build
cd ..