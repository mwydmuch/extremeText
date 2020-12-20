#!/usr/bin/env bash

DATASET_NAME="AmazonCat-13K"
FILES_PREFIX="amazonCat"
PARAMS="-lr 0.2 -epoch 10 -arity 2 -dim 500 -l2 0.002 -wordsWeights -treeType kmeans -ensemble 3"

bash run_xml.sh $DATASET_NAME $FILES_PREFIX "$PARAMS"