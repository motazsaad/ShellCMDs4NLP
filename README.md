# Useful Shell Commands foe NLP people


## count vocabulary in a corpus.
```cat files | tr ' ' '\n' | sort | uniq  | wc -l```

##split a file:
```split -l 8 -a 4 -d file.ext```

##split by 1 line and a prefix for files names: 
```split -l 1 -a 4 -d file.ext a```

##split 90% based on lines:
```split -l $[ $(wc -l filename|cut -d" " -f1) * 90 / 100 ] filename``` 

##configure language on linux:
```dpkg-reconfigure locales```


##display first range of chars from file:
```cut -c 4-10 file```

##Search inside text files:
```find -name "*" | xargs grep 'search keyword'```


##Extract sentences from sgm tag:
```perl -ne 'print $1."\n" if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;' < input > output```

```perl -ne '$string = $1."\n" if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;$string =~ s/^\s+//; $string =~ tr{\n}{ };print $string;' < input > output```

```perl -ne '$string = $1 if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;$string =~ s/^\s+//; $string =~ tr{\n}{ };print $string."\n";' < input > output```


##List only the unique lines in a file:
```sort myfile.txt | uniq -u```

##merge 2 files (line by line with ":" separator):
```paste -d : f1.txt f2.txt```

##copy or move files from list:
```xargs -a file_list.txt mv -t /path/to/dest```
```xargs -a ls.txt mv -t dir/```

##copy files in specific date: 
```ls -l dir/* | grep 'Oct' | awk '{print $9}' | xargs cp -t dir/```


##split xml file nodes (one node in each file)
```xml_split -l 1 dir/*```


##count xml nodes 
```grep '</node_name>' yourfile.xml -o | wc -l```

##get the 2nd line from multiple files. 
```for i in *; do sed -n 2p "$i"; done```


##display lines from 10 to 20 from a file: 
```sed -n '10,20p' <filename>```


## append line separator and combine files in one file 
```for i in dir/*; do cat $i ; printf 'SEPARATOR'; done > myfile.ext```


##remove space from file name
```rename "s/\s+//g" *```


##remove empty lines and \n from files 
```sed -i '/^\s*$/d' *```

```sed -i '/^[[:space:]]*$/d' *```

```perl -i -p -e 's/\n/ /' *```


##replace match with something: replace string1 with string2 
```sed -i 's/string1/string2/g' file```


##clean linux swap:
```sudo swapoff -a```

```sudo swapon -a```