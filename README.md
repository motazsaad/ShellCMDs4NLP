# Useful Linux Shell Commands for NLP people



## count vocabulary in a corpus.
```cat files | tr ' ' '\n' | sort | uniq  | wc -w```

## word frequency of a corpus 
```cat corpus_file | tr ' ' '\n' | sort | uniq -c > outfile.freq```


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

## delete all whitespaces
```tr -d ' ' < input.txt > output.txt```

## replace whitespaces with one space 
```
sed -i 's/  */ /g'file
```

## remove Arabic diacritics 
```
sed -e 's/َ//g' -e 's/ُ//g' -e 's/ِ//g' -e 's/ّ//g' -e 's/ً//g' -e 's/ٌ//g' -e 's/ٍ//g' -e 's/ْ//g' file 
```

## remove punctuation
```
sed -i -e "s/[[:punct:]]\+//g" file
```

## remove arabic punctuation 
```
sed -i -e 's/؟//g' -e 's/،//g' -e 's/؛//g' file 
```


## extract text between ```<s>``` and ```</s>```
```sed -n 's:.*<s>\(.*\)</s>.*:\1:p' file > outfile```

## remove all leading and trailing whitespace from end of each line:
```cat file | sed 's/^[ \t]*//;s/[ \t]*$//' > outfile```

## extract text between ```<s>``` and ```</s>``` tag and remove all leading and trailing whitespaces (in one step)

```sed -n 's:.*<s>\(.*\)</s>.*:\1:p' file | sed 's/^[ \t]*//;s/[ \t]*$//' > outfile```


## remove text between parenthesis (includeing parenthesis) 
```
sed -e 's/[(][^)]*[)]//g' file
```
##  Remove or Replace the Last Word of Each Line
sed 's/\w*$//' file 

## add suffix for each line
```awk '{print $0 " suffix"}' infile```

## split a file (based on number of lines for each split):
```split -l 8 -a 4 -d file.ext```

Here each file contains 8 lines  

## split by 1 line and a prefix for files names: 
```split -l 1 -a 4 -d file.ext a```

## split 90% based on lines:
```split -l $[ $(wc -l filename|cut -d" " -f1) * 90 / 100 ] filename``` 

## split 90% based on shuffled lines with shuf command:
```shuf filename | split -l $[ $(wc -l filename|cut -d" " -f1) * 90 / 100 ]``` 

## split 90% based on shuffled lines with sort command:
```sort -R filename | split -l $[ $(wc -l filename|cut -d" " -f1) * 90 / 100 ]``` 

## rename files (add prefix)
```for f in * ; do mv "$f" "PRE_$f" ; done```

## list files with path 
ls -d dir/* > file.list 

## remove spaces from file names 
```
for f in *.ext; do mv "$f" "${f// /_}"; done
``` 

or 

```
rename 's/ /_/' *.ext 
```

## configure language on linux:
```dpkg-reconfigure locales```


## display first range of chars from file:
```cut -c 4-10 file```

## Search inside text files:
```find -name "*" | xargs grep 'search keyword'```

## Find files with a specific extension 
```find -name "*.ext"```


## Extract sentences from sgm tag:
```perl -ne 'print $1."\n" if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;' < input > output```

```perl -ne '$string = $1."\n" if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;$string =~ s/^\s+//; $string =~ tr{\n}{ };print $string;' < input > output```

```perl -ne '$string = $1 if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;$string =~ s/^\s+//; $string =~ tr{\n}{ };print $string."\n";' < input > output```


## List only the unique lines in a file:
```sort myfile.txt | uniq -u```

## merge 2 files (line by line with ":" separator):
```paste -d : f1.txt f2.txt```

## copy or move files from list:
```xargs -a file_list.txt mv -t /path/to/dest```
```xargs -a ls.txt mv -t dir/```

## copy files in specific date: 
```ls -l dir/* | grep 'Oct' | awk '{print $9}' | xargs cp -t dir/```


## cat too much files 
```find dir/ -name "*" -exec cat "{}" >> outfile \;```

## split xml file nodes (one node in each file)
```xml_split -l 1 dir/*```


## count xml nodes 
```grep '</node_name>' yourfile.xml -o | wc -l```

## get the 2nd line from multiple files. 
```for i in *; do sed -n 2p "$i"; done```


## display lines from 10 to 20 from a file: 
```sed -n '10,20p' <filename>```


## append line separator and combine files in one file 
```for i in dir/*; do cat $i ; printf 'SEPARATOR'; done > myfile.ext```


## remove space from file name
```rename "s/\s+//g" *```


## remove empty lines and \n from files 
```sed -i '/^\s*$/d' file```

```sed -i '/^[[:space:]]*$/d' file```

```perl -i -p -e 's/\n/ /' file```

## remove all digits from a text file:
```sed 's/[0-9]*//g' file```


## replace match with something: replace string1 with string2 
```sed -i 's/string1/string2/g' file```


## list files with path 
```ls -d dir/* ```

## list files with file but without files extension 
```
ls -d dir/* | sed -n 's/\.ext//p'
```

## resembling wav file to 16k Hz
```
sox infile.wav -r 16000 outfile.wav
```

## resembling wav files to 16k Hz
```
cd wavdir
for i in *.wav; do sox $i -r 16000 ../outdir/$i ; done
```

## convert mp3 to wav 
```
for f in *.mp3; do wav_name="${f%.*}"; ffmpeg -i $f -ar 16000 -ac 1 ${wav_name}.wav; done
```

## wav files info 
```
total_duration=0.0
for file in *.wav
do
    duration=$(sox --i -D "$file")
    total_duration=$(python -c "print($total_duration+$duration)")
    s_rate=$(sox --i -r "$file")
    channels=$(sox --i -c "$file")
    filename=$(basename "$file")
    #printf "duration: %s sample rate: %s channels: %d file:%s\n" "$duration" "$s_rate" "$channels" "$filename"
done
printf "total duration: in minutes: %.2f minutes \t in hours: %.2f hours\n" \
$(python -c "print($total_duration/60)") $(python -c "print($total_duration/60/60)")


```
## extract text between parenthesis
```
cat file | cut -d "[" -f2 | cut -d "]" -f1 > outfile 
```

## convert file to unicode 
1. determine file encoding 

```file -i file.ext```

2. convert encoding  

```iconv -f from-encoding -t to-encoding inputfile(s) -o outputfile```


### show duplicate lines 
```sort filename | uniq -c | sort -nr```

## compress/decompress directory 
### compress

```tar -zcvf archive-name.tar.gz directory-name```

Where,

* -z: Compress archive using gzip program
* -c: Create archive
* -v: Verbose i.e display progress while creating archive
* -f: Archive File name

### decompress

```tar -zxvf archive-name.tar.gz directory-name```

Where,

* -x: Extract files


## clean linux swap:
```sudo swapoff -a```

```sudo swapon -a```

## increase the volume of sound files 
```for i in *; do lame --scale 3 "$i" ../out/"$i"; done```


## Build and test language models using [SRILM](http://www.speech.sri.com/projects/srilm/) tool

### Build language model 

-unk
    Build an ``open vocabulary'' LM, i.e., one that contains the unknown-word token as a regular word. The default is to remove the unknown word. 
    
-kndiscountn
    where n is 1, 2, 3, 4, 5, 6, 7, 8, or 9. Use Chen and Goodman's modified Kneser-Ney discounting for N-grams of order n.
    
```
ngram-count -order 3 -vocab corpus.vocab -text corpus.txt -lm corpus.lm -unk -kndiscount2 -kndiscount3
```

### Testing language model 
 
```
ngram -lm corpus.lm -ppl test.txt -unk
```

### ARPA model training with SRILM
 Training with SRILM is easy. Morever, SRILM is the most advanced toolkit up to date. To train the model you can use the following command: 
 
```
ngram-count -kndiscount -interpolate -text train-text.txt -lm your.lm
```

-interpolaten option 
    where n is 1, 2, 3, 4, 5, 6, 7, 8, or 9. Causes the discounted N-gram probability estimates at the specified order n to be interpolated with lower-order estimates. 
    

You can prune the model afterwards to reduce the size of the model 

```
ngram -lm your.lm -prune 1e-8 -write-lm your-pruned.lm
```

After training it is worth to test the perplexity of the model on the test data
```
ngram -lm your.lm -ppl test-text.txt
```

***

## ARPA model training with CMUCLMTK

1) Prepare a reference text that will be used to generate the language model. The language model toolkit expects its input to be in the form of normalized text files, with utterances delimited by ```<s>``` and ```</s>``` tags.

2) Generate the vocabulary file. This is a list of all the words in the file: 
 
 ```text2wfreq < speech.txt | wfreq2vocab > corpus.vocab```
 
 
3) You may want to edit the vocabulary file to remove words (numbers, misspellings, names). If you find misspellings, it is a good idea to fix them in the input transcript.

4) If you want a closed vocabulary language model (a language model that has no provisions for unknown words), then you should remove sentences from your input transcript that contain words that are not in your vocabulary file.

5) Generate the arpa format language model with the commands:

```text2idngram -vocab corpus.vocab -idngram corpus.idngram < corpus.closed.txt```

```idngram2lm -vocab_type 0 -idngram corpus.idngram -vocab corpus.vocab -arpa corpus.lm```

 6) Generate the CMU binary form (BIN) 
 
```sphinx_lm_convert -i corpus.lm -o corpus.lm.bin```



# How to contribute
Your contributions to improve the code are welcomed. Please follow the steps below.
1. Fork the project.
2. Modify the code, test it, make sure that it works fine. 
3. Make a pull request.

Please consult [github help](https://help.github.com/) to get help.
