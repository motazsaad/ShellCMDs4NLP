# Search in files 


## Search inside text files:
```find -name "*" | xargs grep 'search keyword'```

## Find files with a specific extension 
```find -name "*.ext"```

## show duplicate lines 
```sort filename | uniq -c | sort -nr```
