# Process wav files 

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

## increase the volume of sound files 
```for i in *; do lame --scale 3 "$i" ../out/"$i"; done```
