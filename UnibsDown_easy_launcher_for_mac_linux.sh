#!/bin/bash

# Put your settings in place of the dots
# Remember! Assignment is space-sensitive!
 
unibsdown_folder_path=...
codice_persona=...
urls_file_path="..."
output_folder_path="..."
quality_number=...

cd $unibsdown_folder_path
node unibs.js -u $codice_persona -f $urls_file_path -o $output_folder_path -q $quality_number
echo
read -n 1 -s -r -p "Press any key to terminate . . ."
