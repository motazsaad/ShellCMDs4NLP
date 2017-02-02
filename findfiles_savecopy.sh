#!/bin/bash
# this script find files save a copy
#echo $1
#echo $2
#echo "$2"/"$(date "+%s")"_"$1"


#cp -vn "$1" "$2"/ || cp -vn "$1" "$2"/"$(date "+%s")"_"$1"
cp -v "$1" "$2""$(date "+%s.%N")"_"$(basename $1)"




#to run:
#find ./2014/* -name \*.html -exec ./savecopy {} ./htmls2014/ \;
