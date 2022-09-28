#!/bin/bash
docker build -t llvm-mos-builder:v1 -f Dockerfile.builder .
docker build -t llvm-mos:v1 .
