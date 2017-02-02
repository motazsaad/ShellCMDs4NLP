#!/bin/bash
sqlite /users/parole/mosaad/anlp/pypackages/qalsadi-0.1/qalsadi/data/arabicdictionary.sqlite <<!
.headers on
.mode csv
.output out.csv
select * from nouns;
!
