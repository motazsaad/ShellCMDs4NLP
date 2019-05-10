# Commands for extracting and cleaning texts


## extract or display a specific range of lines from a file 
```sed -n '16224,16482p' filename > newfile```

## delete a specific range of lines from a file 
```
sed -i <file> -re '<start>,<end>d'
```
```
sed -i filename -re '16224,16482d'
```

## delete only the whitespaces at the beginning of one single line
```sed -i 's/^ *//' your_file```

## replace A with B in a file 
```sed -i -e 's/A/B/g' file```

-i option is used to edit in place on the file

-e option indicates the expression/command to run, in this case s/. 

## delete all whitespaces in a file 
```tr -d ' ' < input.txt > output.txt```

## replace whitespaces with one space 
```
sed -i 's/  */ /g' file
```

## remove Arabic diacritics from a file 
```
sed -e 's/َ//g' -e 's/ُ//g' -e 's/ِ//g' -e 's/ّ//g' -e 's/ً//g' -e 's/ٌ//g' -e 's/ٍ//g' -e 's/ْ//g' file 
```

## remove punctuation from a file 
```
sed -i -e "s/[[:punct:]]\+//g" file
```

## remove arabic punctuation  from a file 
```
sed -i -e 's/؟//g' -e 's/،//g' -e 's/؛//g' file 
```


## extract text between ```<s>``` and ```</s>```
```sed -n 's:.*<s>\(.*\)</s>.*:\1:p' file > outfile```

## remove all leading and trailing whitespace from end of each line:
```cat file | sed 's/^[ \t]*//;s/[ \t]*$//' > outfile```

## extract text between ```<s>``` and ```</s>``` tag and remove all leading and trailing whitespaces (in one step)

```sed -n 's:.*<s>\(.*\)</s>.*:\1:p' file | sed 's/^[ \t]*//;s/[ \t]*$//' > outfile```


## remove text between parenthesis (including parenthesis) 
```
sed -e 's/[(][^)]*[)]//g' file
```
##  Remove or Replace the Last Word of Each Line
sed 's/\w*$//' file 


## add suffix for each line
```awk '{print $0 " suffix"}' infile```


## Extract sentences from sgm tag:
```perl -ne 'print $1."\n" if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;' < input > output```

```perl -ne '$string = $1."\n" if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;$string =~ s/^\s+//; $string =~ tr{\n}{ };print $string;' < input > output```

```perl -ne '$string = $1 if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;$string =~ s/^\s+//; $string =~ tr{\n}{ };print $string."\n";' < input > output```


## remove empty lines and \n from files 
```sed -i '/^\s*$/d' file```

```sed -i '/^[[:space:]]*$/d' file```

```perl -i -p -e 's/\n/ /' file```

## remove all digits from a text file:
```sed 's/[0-9]*//g' file```


## replace match with something: replace string1 with string2 
```sed -i 's/string1/string2/g' file```


## display first range of chars from file:
```cut -c 4-10 file```

## List only the unique lines in a file:
```sort myfile.txt | uniq -u```

## get the 2nd line from multiple files. 
```for i in *; do sed -n 2p "$i"; done```


## display lines from 10 to 20 from a file: 
```sed -n '10,20p' <filename>```
