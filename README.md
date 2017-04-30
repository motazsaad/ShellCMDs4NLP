# Useful Linux Shell Commands for NLP people


## count vocabulary in a corpus.
```cat files | tr ' ' '\n' | sort | uniq  | wc -w```

## split a file:
```split -l 8 -a 4 -d file.ext```

## split by 1 line and a prefix for files names: 
```split -l 1 -a 4 -d file.ext a```

## split 90% based on lines:
```split -l $[ $(wc -l filename|cut -d" " -f1) * 90 / 100 ] filename``` 

## configure language on linux:
```dpkg-reconfigure locales```


## display first range of chars from file:
```cut -c 4-10 file```

## Search inside text files:
```find -name "*" | xargs grep 'search keyword'```


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
```sed -i '/^\s*$/d' *```

```sed -i '/^[[:space:]]*$/d' *```

```perl -i -p -e 's/\n/ /' *```


## replace match with something: replace string1 with string2 
```sed -i 's/string1/string2/g' file```


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

1) Prepare a reference text that will be used to generate the language model. The language model toolkit expects its input to be in the form of normalized text files, with utterances delimited by <s> and </s> tags.

2) Generate the vocabulary file. This is a list of all the words in the file: 
 
 ```text2wfreq < speech.txt | wfreq2vocab > corpus.vocab```
 
 
3) You may want to edit the vocabulary file to remove words (numbers, misspellings, names). If you find misspellings, it is a good idea to fix them in the input transcript.

4) If you want a closed vocabulary language model (a language model that has no provisions for unknown words), then you should remove sentences from your input transcript that contain words that are not in your vocabulary file.

5) Generate the arpa format language model with the commands:

```text2idngram -vocab corpus.vocab -idngram corpus.idngram < corpus.closed.txt```

```idngram2lm -vocab_type 0 -idngram corpus.idngram -vocab corpus.vocab -arpa corpus.lm```

 6) Generate the CMU binary form (BIN) 
 
```sphinx_lm_convert -i corpus.lm -o corpus.lm.bin```