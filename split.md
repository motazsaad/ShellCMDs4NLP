## Split Files 


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

## split xml file nodes (one node in each file)
```xml_split -l 1 dir/*```
