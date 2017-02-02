# UsefulShellCommands4NLP
Useful shell commands for NLP people 


## count vocabulary in a corpus.
```cat files | tr ' ' '\n' | sort | uniq  | wc -l```

##split afile:
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
```perl -ne 'print $1."\n" if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;' < input > output

perl -ne '$string = $1."\n" if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;$string =~ s/^\s+//; $string =~ tr{\n}{ };print $string;' < input > output

perl -ne '$string = $1 if /<seg[^>]+>\s*(.*\S)\s*<.seg>/i;$string =~ s/^\s+//; $string =~ tr{\n}{ };print $string."\n";' < input > output```

