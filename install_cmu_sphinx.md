# CMU sphinx Installation steps

Inspired from [https://bangladroid.wordpress.com/2017/02/16/installing-cmu-sphinx-on-ubuntu/] 

## install dependencies 
```
sudo apt-get install gcc automake autoconf libtool bison swig python-dev libpulse-dev
```
```
# for  BLAS & LAPACK libs, which is needed by lda & mllt feature transforms 
# see https://cmusphinx.github.io/wiki/ldamllt/ for more information 
sudo apt-get install libblas-dev liblapack-dev
```

## sphinxbase
```
git clone https://github.com/cmusphinx/sphinxbase.git
./autogen.sh
make 
sudo make install
```

# add sphinx libs to system libs 
```sudo nano /etc/ld.so.conf```

add new line /usr/local/lib
```
sudo ldconfig
sudo ldconfig -p | grep local
```

# pocketsphinx
```
git clone https://github.com/cmusphinx/pocketsphinx.git
./autogen.sh
make 
sudo make install
```

# sphinxtrain
```
git clone https://github.com/cmusphinx/sphinxtrain.git
./autogen.sh
make 
sudo make install
```

## cmuclmtk
```
svn checkout svn://svn.code.sf.net/p/cmusphinx/code/trunk/cmuclmtk cmuclmtk-code
./autogen.sh
make 
sudo make install
```


