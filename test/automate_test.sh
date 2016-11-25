#!/bin/bash

PROG_PATH="/home/tockos/bme/onlab/fmcw"
INPUT_FILE="input_data"
OUT_DIR="$PROG_PATH/results/testfiles"
TMP_DIR="$PROG_PATH/temp"

c=0;


while read LINE; do
    r_max=$(echo $LINE | awk '{print $1}')
    r_res=$(echo $LINE | awk '{print $2}')
    v_max=$(echo $LINE | awk '{print $3}')
    v_res=$(echo $LINE | awk '{print $4}')

    FILE_NAME="${r_max}_${r_res}_${v_max}_${v_res}.log"

    $PROG_PATH/test_radar.m $r_max $r_res $v_max $v_res

    #paste $TMP_DIR/r.txt $TMP_DIR/v.txt | expand -t 45 > $OUT_DIR/$FILE_NAME
    cat $TMP_DIR/r.txt $TMP_DIR/v.txt > $OUT_DIR/$FILE_NAME

    echo "Line: $c"
    (( c = c+1 ))
done <$INPUT_FILE

