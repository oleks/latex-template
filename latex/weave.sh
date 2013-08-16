#!/bin/sh
#
# This script allows you to quickly run pdflatex to build your sources. You can
# run the script without arguments, in which case the script assumes that a
# file named root.tex exists and is the root tex file. The script creates (if
# it doesn't already exist) a subdirectory ./output/ and directs all output
# from pdflatex there. The name of the produced file is left at "root", unless
# otherwise specified in this script.
#
# You can try it out:
# ./weave.sh
# ./weave.sh root.tex
# ./weave.sh standalone.tex math.tex

# Optional, the name of the root tex file.
# BASENAME="root"

# Optional, the name of the output file.
JOBNAME="template"

if [ -z $BASENAME ]; then BASENAME="${1%.*}"; fi
if [ -z $BASENAME ]; then BASENAME="root"; fi
if [ -z $JOBNAME ]; then JOBNAME=$BASENAME; fi

OUTDIR="./output/"

mkdir -p $OUTDIR

if [ "$BASENAME" = "standalone" ]
then
  COMMAND="\\newcommand\\content[0]{\\input{$2}}\\input{$BASENAME}"
  JOBNAME="${2%.*}"
# Optional, other else-ifs.
else
  COMMAND="\\input{$BASENAME}"
fi

pdflatex -output-directory=$OUTDIR -file-line-error \
  -jobname $JOBNAME \
  $COMMAND

