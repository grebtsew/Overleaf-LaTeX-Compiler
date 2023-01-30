#!/bin/bash
#
# A bash script for: 
# 1. unziping .zip files
# 2. compile LaTeX projects
# 3. move .pdf files to target folder
#
# Copyright (c) 2023 Grebtsew

echo "Running Compile Script"
echo "Current folder:"
echo "$PWD"

# Start by unzipping any .zip file from overleaf
for i in documents/*.zip; do
    [ -f "$i" ] || continue

    echo "Unziping file $i"

    filename=$(basename -- "$i")
    extension="${filename##*.}"
    filename="${filename%.*}"

    unzip $i -d ./documents/$filename
done


# Compile each .tex file
while read p; do
  [[ -f "$p" ]] || continue
  echo "Compiling file $p"
  dirname="$(dirname "${p}")"
  filename="$(basename "${p}")"
  
  cd ./$dirname
  start=$SECONDS
  latexmk $filename
  duration=$(( SECONDS - start ))
  echo "Elapsed Compile Time : $duration seconds"
  cd ../..
done <compilelist.txt

# Move .pdf files to volume folder
while read p; do
  [ -f "$p" ] || continue
    
  echo "Finding compiled project, $p"

  filename=$(basename -- "$p")
  extension="${filename##*.}"
  filename="${filename%.*}"
  dirname="$(dirname "${p}")" ; 
  
  echo "Moving file to volume ./$dirname/$filename.pdf -> ./target/$filename.pdf"

  mv ./$dirname/$filename.pdf ./target/$filename.pdf
done <compilelist.txt
