# Capture The Flag COBOL Challenge: Release COVID-2020 

BSides 2020 COBOL challenge - "Release COVID-2020 from containment"

![Containment Unit](COBOL.png "Cobol containment Unit")


## Introduction

The following is a COBOL based CTF challenge. Post-BSIDES CT 2020 the source code will be released under an MIT license
for anyone who wants to experiement with it and improve it.

The recommended way of running the source code is to use GNUCobol.


## Obtaining GNUCobol and running this project

There are several ways of running and developing against this project.

The first is to simply start the development container. This will install GNUCobol and you can edit 
directly from inside Debian.

The second is to manually install it on your systems. GNUCobol is available on Mac, Windows and Linux.

If you wish to run the challenge use the Dockerfile in the root of the repository.

This will create a container from the image with Ubuntu running, the demo private key installed, the environment configured as
a shell and SSH enabled. 


### Docker (for development and the challenge)

Included in this repository is a Dockerfile for building out the project for development and running the challenge.

You can pass in an environment flag `DEV` or `CTF` to build the relevant image.

```
docker build --tag containmentunit:1.0 . --build-arg ENV=DEV
```


#### DEV environment 

If you create a DEV environment, to then connect to the container via the commandline run:

```
docker run --privileged -it containmentunit:1.0
```

The `--privileged` will allow you to change the date in the container for testing. 

A copy of the code is located in the container along with a compiled version. However you can git clone your own fork into here too
and work in it, in the container. 


#### CTF environment 

If you pass in the CTF flag, then the image will be built out and a container created in CTF mode.

This simulates the production CTF deployment and includes the following:

1. An test SSH public and private key

2. SSH running on the container

3. The environment set up so you SSH in and the application is running 


### Manual Installation 
The binaries for GNUCobol can be downloaded from sourceforge:

https://sourceforge.net/projects/gnucobol/files/latest/download

Instructions for installation are located in the INSTALL file once downloaded.

In short though the quickest way to install this is:

```
./configure && make && make install
```


#### MacOSX help

You may need to add missing libraries, for example on MacOSX if `gmp` is missing 
use brew to install it

```
brew install gmp

```

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

### Compile and Run (manual or in container)

To compile the code run:

```
cobc -x -o containment_unit containment_unit.cbl
```

To run the CTF challenge execute:

```
./containment_unit
```

## Programming Guide

If you ae interested in writing code in COBOL using GNUCobol then check out the following site:

https://gnucobol.sourceforge.io/

The programming guide can be found here in PDF format.


## Backstory

In the year 2120 a group of engineers have figued out how to manipulate time. The dystopian world they
inhabit was all a result of the COVID-19 outbreak. The team decide in order to change their present
they must manipulate the past. Knowing that changing time can have unintended consequnces, they 
decide to hide a bio-engineered virus in the past. Once the time is right, some smart 
hacker (like you!) will figure out how to open the vault.

But how can they disguise the virus containment unit and prevent unwanted intruders opening it
too early? The team settle upon an idea. Disguise the containment unit as old software from 
the 1980's. It was known that COBOL had a date problem and many an individual feared that on Y2K when 
the clock ticked over, systems would crash and meltdown.

The team set off for 1986 and quietly integrated themselves in the world of mainframe pogrammers.
Few at this time knew that the 6 digit date format would provide to be such a problem. Only
on the earliest bulletin boards was the subject under discussion.

Having coded the containment unit they palaced COVID-20 in it. However they had a problem,
what would happen when 1999 ticked over to 2000? Wouldn't the virus escape?

One of the engineers had an idea. He would add a hidden trigger. Only when this trigger was 
tripped and the date set to December 31st 1999 would the containment unit open.

The team settled on the account expiration date. They set the account to expire 
beyond 2020, this way when the clock ticked over to 1999, Y2K the unit wouldn't open early.
Dummy accounts were added to the users file to mask the real account, and the Admin unit was destroyed.

Having coded in the hidden switch, they now had to hope, in 2020 somebody would stumble across
the containment unit, somebody like you! Seeing it was written in the 1980's and following the other clues left 
across puzzles such as it being witten in COBOL and the references to 1999, perhaps some 
skillful hacker would see that the two dates had to align and ithus set the vault to trigger a 
Y2K meltdown.


## How the challenge works

The player must find out how to unlock the containment unit and release COVID-2020.
COVID-2020 is a bioengineered virus designed to kill of COVID-19. Its engineers traveled
back to 1986 and wrote the COBOL containment unit. The player once completing the sub tasks
unlocks the unit, frees the virus and gets the CTF flag.

### Login

The first step is the figure out how to login. There are multiple users in the 
user.txt file, but only one works!

### Change account expiration

Next they need to set the account expiration to 
12/31/99 by figuring out the substitution cipher.
The final chars of the correct account contain the encrypted expiration date.

### Set the clock

Finally they need to set the date to 12/31/99 on the OS.
This then locks in the Y2K date. Once the account expiration 
and the system date are aligned and have set the Y2K lock in date,
the contianment unit date is set to Y2K and the vault opens 
revealing the key.

To set the clock/date in EC2 use the following guide:

https://www.msystechnologies.com/blog/how-to-change-the-date-and-time-on-amazons-ec2-instance/


