# Files and directory compression 


## compress/decompress directory 
### compress

```tar -zcvf archive-name.tar.gz directory-name```

Where,

* -z: Compress archive using gzip program
* -c: Create archive
* -v: Verbose i.e display progress while creating archive
* -f: Archive File name

### decompress

```tar -zxvf archive-name.tar.gz directory-name```

Where,

* -x: Extract files

## compress files in a directory 
```
$ tree dir1/
dir1/
|-- dir11
|   |-- file11
|   |-- file12
|   `-- file13
|-- file1
|-- file2
`-- file3
```

now run the gzip command

`$ gzip -r dir1`

after

```
$ tree dir1/
dir1/
|-- dir11
|   |-- file11.gz
|   |-- file12.gz
|   `-- file13.gz
|-- file1.gz
|-- file2.gz
`-- file3.gz
```