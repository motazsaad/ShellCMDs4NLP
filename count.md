# Counting 

## count words in a corpus 

`cat file | wc -l`

## count vocabulary in a corpus.
```cat files | tr ' ' '\n' | sort | uniq  | wc -w```

## word frequency of a corpus 
```cat corpus_file | tr ' ' '\n' | sort | uniq -c > outfile.freq```

## count xml nodes 
```grep '</node_name>' yourfile.xml -o | wc -l```
