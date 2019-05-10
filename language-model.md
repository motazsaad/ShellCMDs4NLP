# Language modelling 

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
 Training with SRILM is easy. Moreover, SRILM is the most advanced toolkit up to date. To train the model you can use the following command: 
 
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



