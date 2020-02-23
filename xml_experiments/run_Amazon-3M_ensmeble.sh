#!/usr/bin/env bash

DATASET_NAME="Amazon-3M"
FILES_PREFIX="amazon-3M"
PARAMS="-lr 0.5 -epoch 25 -arity 2 -dim 500 -l2 0.001 -wordsWeights -treeType kmeans --ensemble 3"

bash run_xml.sh $DATASET_NAME $FILES_PREFIX "$PARAMS"
