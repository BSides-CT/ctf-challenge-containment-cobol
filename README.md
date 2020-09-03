# Capture The Flag COBOL Challenge: Release COVID-2020 

BSides 2020 COBOL challenge - "Release COVID-2020 from containment"

## Introduction

The following is a COBOL based CTF challenge. Post-BSIDES CT 2020 the source code will be released under an MIT license
for anyone who wants to experiement with it and improve it.

The recommended way of running the source code is to use GNUCobol.


## Obtaining GNUCobol

The binaries for GNUCobol can be downloaded from sourceforge:

https://sourceforge.net/projects/gnucobol/files/latest/download

Instructions for installation are located in the INSTALL file once downloaded.

In short though the quickest way to install this is:

```
./configure && make && make install
```

You may need to add missing libraries, for example on MacOSX if `gmp` is missing 
use brew to install it

```
brew install gmp

```

### MacOSX help

If you see the error:

```
configure: error: Unable to extract Berkeley DB version information from db.h
```

When installing GNUCobol make sure you have installed Berkeley DB from brew:

```
brew install berkeley-db4
```

Then run the brew link command:

```
brew link --force berkeley-db4
```

## Programming Guide

If you ae interested in writing code in COBOL using GNUCobol then check out the following site:

https://gnucobol.sourceforge.io/

The programming guide can be found here in PDF format.



## Compile and Run

To compile the code run:

```
cobc -x -o containment_unit containment_unit.cbl
```

To run the CTF challenge execute:

```
./containment_unit
```


