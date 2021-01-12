#!/bin/bash
IODIR=`pwd`/$1
INDIR=$IODIR/in
OUTDIR=$IODIR/out
SEEDDIR=$2
BINPATH=$3

if [ ! -d "$SEEDDIR" ]; then exit 1; fi
if [ ! -f "$BINPATH" ]; then exit 1; fi

mkdir -p $IODIR
if [ ! -d "$INDIR" ]; then mkdir -p $INDIR; fi
if [ ! -d "$OUTDIR" ]; then mkdir -p $OUTDIR; fi

BINNAME=$(basename $BINPATH)
cp $BINPATH $IODIR/
cp $SEEDDIR/* $IODIR/in/

docker run --rm -v $IODIR:/home/afl/io afl-aarch64 -m none -Q \
    -i /home/afl/io/in \
    -o /home/afl/io/out -- "/home/afl/io/$BINNAME" "${@:4}"
