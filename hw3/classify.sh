#!/bin/bash
#================================================================================
# classify.sh
#
# This script is the main executable for the assignment
# Usage
# ./classify.sh <testfile>
CLASSPATH=~/Downloads/weka/weka.jar
convert_csv_to_arff()
{
    java weka.core.converters.CSVLoader -N 'last' $1 > test_data.arff
}

train_model()
{
    java weka.classifiers.bayes.NaiveBayes -K -t classifier_unordered_train.arff -d naive.model  > /dev/null
}

test_model()
{
    java weka.classifiers.bayes.NaiveBayes -v -o -l naive.model -T test_data.arff -classifications "weka.classifiers.evaluation.output.prediction.PlainText" > results.txt 
}
get_statistics()
{
    java weka.classifiers.bayes.NaiveBayes -v -o -l naive.model -T test_data.arff > stats.txt 
}
# If CLASSPATH variable is not set , we export it 
if [ -z $CLASSPATH ]; then
    echo "Setting CLASSPATH for weka.jar"
    export CLASSPATH
fi
if [ $1 ]; then
    convert_csv_to_arff $1
    train_model
    test_model $1
    get_statistics
    awk 'NR >= 6 { print $3 }' results.txt | cut -c 3 > output.txt
    echo "See output.txt for class labels"
else
    echo "Usage: "
    echo "./classify.sh <testfile>"
fi
