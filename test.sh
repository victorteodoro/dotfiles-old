#!/bin/bash

for file in $(ls); do
    echo $(pwd)/.$file;
done
