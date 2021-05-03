#!/bin/bash
TIMEOUT=$1
IODIR=`pwd`/$2
INDIR=$IODIR/in
OUTDIR=$IODIR/out
SEEDDIR=$3
BINPATH=$4

if [ ! -d "$SEEDDIR" ]; then exit 1; fi
if [ ! -f "$BINPATH" ]; then exit 1; fi

mkdir -p $IODIR
if [ ! -d "$INDIR" ]; then mkdir -p $INDIR; fi
if [ ! -d "$OUTDIR" ]; then mkdir -p $OUTDIR; fi

BINNAME=$(basename $BINPATH)
cp $BINPATH $IODIR/
cp $SEEDDIR/* $IODIR/in/
chmod +x $IODIR/$BINNAME

docker run --rm \
	   -v $IODIR:/home/afl/io \
	   -e AFL_NO_AFFINITY=1 \
	   afl-aarch64 $TIMEOUT -m none -Q \
           -i /home/afl/io/in \
           -o /home/afl/io/out -- "/home/afl/io/$BINNAME" "${@:5}"

