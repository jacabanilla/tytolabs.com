#! /bin/bash

# This script will copy the Title metadata from the image to the ImageDescription metadata
# for all jpg and jpeg files in the current directory.
for f in $(find *.jp*)
do
  TITLE=$(exiftool -S -Title "$f" | cut -c 8-)
  exiftool -overwrite_original -ImageDescription="$TITLE" "$f"
  exiftool -overwrite_original -Copyright="Photo by Alexander Cabanilla" "$f"
done
