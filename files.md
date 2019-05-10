# Process file names, convert, merge, copy and move files  

## File names 
### rename files (add prefix)
```for f in * ; do mv "$f" "PRE_$f" ; done```

### list files with path 
ls -d dir/* > file.list 

## list files with path 
```ls -d dir/* ```

## list files with file but without files extension 
```
ls -d dir/* | sed -n 's/\.ext//p'
```



### remove spaces from file names 
```
for f in *.ext; do mv "$f" "${f// /_}"; done
``` 

or 

```
rename 's/ /_/' *.ext 
```


### remove space from file name
```rename "s/\s+//g" *```



## File conversion 
### convert file to unicode 
1. determine file encoding 

```file -i file.ext```

2. convert encoding  

```iconv -f from-encoding -t to-encoding inputfile(s) -o outputfile```

## Merge files 
### merge 2 files (line by line with ":" separator):
```paste -d : f1.txt f2.txt```

### cat too much files 
```find dir/ -name "*" -exec cat "{}" >> outfile \;```


## append line separator and combine files in one file 
```for i in dir/*; do cat $i ; printf 'SEPARATOR'; done > myfile.ext```

## Copy / Move 
### copy or move files from list:
```xargs -a file_list.txt mv -t /path/to/dest```
```xargs -a ls.txt mv -t dir/```

### copy files in specific date: 
```ls -l dir/* | grep 'Oct' | awk '{print $9}' | xargs cp -t dir/```
