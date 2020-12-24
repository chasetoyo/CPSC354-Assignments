# Using Docker With Haskell

## Preface
Although the usage of Docker is not ideal for all of the assignmnents in this class, it is still possible to use Docker to automate some of the processes, as well as simplify installations mentioned in the previous blog post [`Installing Haskell`](install.md).

## Shell Scripts
Save the following scripts with the extension '.sh', and ensure you have executable permissions by doing `chmod <filename.sh> +x`. You can then run the files using `./<filename>.sh` to automatically build.


***Building grammar for the first assignment***
```sh
#!/bin/bash
bnfc -m -haskell numbers.cf
make
```
***LambdaNat***
```sh
#!/bin/bash
cd grammar
bnfc -m -haskell LambdaNat.cf
make
cp *.hs ../src
cd ../src
stack build
```

## Dockerfiles
Assuming that you have Docker installed already, you can create a Dockerfile such as the one below in a text editor.
```Dockerfile
FROM haskell:8

COPY . /app
WORKDIR /app

COPY LambdaNat.cabal ./
RUN cabal install BNFC

RUN cd grammar && bnfc -m -haskell LambdaNat.cf && make && cp *.hs ../src && cd ../src

CMD ["./grammar/TestLambdaNat"] # CMD only for testing parser

RUN cabal new-build
```

Once you save this, you can create an image with `docker build -t lambdanat .`, and run this image with `docker run lambdanat`. This will automate the build process for lambdanat, without having to go through the trouble of manually installing haskell, stack, and bnfc on your computer. This Dockerfile would be saved the root directory containing all the files necessary for the cabal project (where the README is located).

Additionally, once this image is created, it will pull the base 'haskell:8' image, which you can interact with on its own.

`docker run -it --rm haskell:8`

This command will allow you to interact with GHCI, or an active Haskell interpreter session, similar to Python's IDLE.