#!/bin/bash

wget https://pjreddie.com/media/files/mnist_train.csv -O mnist_train.csv
head -n 100 mnist_train.csv >mnist_train_100.csv

wget https://pjreddie.com/media/files/mnist_test.csv -O mnist_test.csv
head -n 10 mnist_test.csv >mnist_test_10.csv
