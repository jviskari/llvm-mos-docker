#/bin/bash
docker run -t -i --rm -v ${PWD}/example:/example -w /example llvm-mos:v1 