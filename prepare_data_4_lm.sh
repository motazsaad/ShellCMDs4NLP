#!/usr/bin/env bash

echo "prepare ${1}"

echo "remove punctuation"
sed -i -e "s/[[:punct:]]\+//g" ${1}

echo "remove arabic punctuation"
sed -i -e 's/؟/ /g' -e 's/،/ /g' -e 's/؛/ /g' ${1}

echo "remove Arabic diacritics"
sed -i -e 's/َ//g' -e 's/ُ//g' -e 's/ِ//g' -e 's/ّ//g' -e 's/ً//g' -e 's/ٌ//g' -e 's/ٍ//g' -e 's/ْ//g' ${1}

echo "remove empty lines"
sed -i '/^\s*$/d' ${1}

echo "remove all digits from a text file"
sed -i 's/[0-9]*//g' ${1}

echo "remove all latin letters"
sed -i 's/[a-z]*//g' ${1}
sed -i 's/[A-Z]*//g' ${1}

echo "replace whitespaces with one space"
sed -i 's/  */ /g' ${1}

echo "remove all leading and trailing whitespace from end of each line"
sed -i 's/^[ \t]*//;s/[ \t]*$//' ${1}

echo "remove empty lines again"
sed -i '/^\s*$/d' ${1}