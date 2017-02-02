#!/bin/sh
# process shamela extracts
# shamela.ws

while [ -n "$1" ]
	do
		echo "Current Parameter: $1 , Remaining $#"
		echo 'remove url'
		sed -i 's/﻿http:\/\/www.shamela.ws/ /g'  $1 
		sed -i 's/[A-Za-z0-9]\+/ /g'  $1 
		sed -i 's/[:punct:]\+/ /g' $1 
		sed -i 's/تم إعداد هذا الملف آليا بواسطة المكتبة الشاملة/ /g' $1 
		#sed -i 's/\W//g' $1 remove non-word chars 

		echo 'remove punct and diacrtics (arabic)'
		sed -i 's/`/ /g' $1 
		sed -i 's/÷/ /g' $1 
		sed -i 's/×/ /g' $1 
		sed -i 's/؛/ /g' $1 
		sed -i 's/</ /g' $1 
		sed -i 's/>/ /g' $1 
		sed -i 's/_/ /g' $1 
		sed -i 's/(/ /g' $1 
		sed -i 's/)/ /g' $1 
		sed -i 's/*/ /g' $1 
		sed -i 's/&/ /g' $1 
		sed -i 's/^/ /g' $1 
		sed -i 's/%/ /g' $1 
		sed -i 's/]/ /g' $1 
		sed -i 's/\[/ /g' $1 
		sed -i 's/ـ/ /g' $1 
		sed -i 's/،/ /g' $1 
		sed -i 's/\// /g' $1 
		sed -i 's/:/ /g' $1 
		sed -i 's/"/ /g' $1
		sed -i 's/؟/ /g' $1 
		sed -i 's/\./ /g' $1 
		sed -i 's/,/ /g' $1 
		sed -i 's/{/ /g' $1 
		sed -i 's/}/ /g' $1 
		sed -i 's/~/ /g' $1 
		sed -i 's/¦/ /g' $1 
		sed -i 's/+/ /g' $1 
		sed -i 's/|/ /g' $1 
		sed -i 's/!/ /g' $1 
		sed -i 's/”/ /g' $1 
		sed -i 's/…/ /g' $1 
		sed -i 's/“/ /g' $1 
		sed -i 's/–/ /g' $1 
		sed -i 's/-/ /g' $1
		sed -i 's/=/ /g' $1
		sed -i 's/َ//g' $1 
		sed -i 's/ُ//g' $1 
		sed -i 's/ِ//g' $1 
		sed -i 's/ّ//g' $1 
		sed -i 's/ً//g' $1 
		sed -i 's/ٌ//g' $1 
		sed -i 's/ٍ//g' $1 
		sed -i 's/ْ//g' $1
		sed -i 's/\x27/ /g' $1 

		echo 'remove empty lines and newlines from files'
		sed -i '/^\s*$/d' $1 
		sed -i 's/  */ /g' $1 
	shift
done

echo 'done'
