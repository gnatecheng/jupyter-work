#!/bin/bash

for url in \
    http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz \
    http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz \
    http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz \
    http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz
do
    echo $url
    wget -c $url
done
