#!/bin/bash

# ------------------------------------------------------------------------------------------------------------------------------------------------
# Description:

#   This script takes a directory containing PDF files as input and generates new PDF files with the pages interleaved with blank pages.
#   The output PDF files will have two pages per sheet, with the original pages on the left and blank pages on the right.
#   This can be useful for taking notes or annotations on the blank pages while keeping the original content intact.
#   The script uses the 'notefypdf.sh' script to process each PDF file in the source directory.
#   The script takes two arguments: the source directory containing the original PDF files and the destination directory for the output PDF files.
#   Example usage: ./notefypdfs.sh source_directory destination_directory
#   Note: The 'notefypdf.sh' script must be in the same directory as this script.
# ------------------------------------------------------------------------------------------------------------------------------------------------

# Check if the correct number of arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory_with_pdfs> <destination_directory>"
    exit 1
fi

# Assign command line arguments to variables
source_directory="$1"
destination_directory="$2"

# Check if the source directory exists
if [ ! -d "$source_directory" ]; then
    echo "Source directory not found: $source_directory"
    exit 1
fi

# Check if the destination directory exists, if not, create it
if [ ! -d "$destination_directory" ]; then
    echo "Destination directory not found, creating: $destination_directory"
    mkdir -p "$destination_directory"
fi

# Loop through all the pdf files in the source directory
for original_pdf in "$source_directory"/*.pdf; do
    # Continue if it's not a file
    if [ ! -f "$original_pdf" ]; then
        continue
    fi

    # Extract filename without extension
    filename=$(basename -- "$original_pdf")
    filename="${filename%.pdf}"

    # Construct the output filename with path
    output_pdf="$destination_directory/${filename}_mod.pdf"

    # Call script.sh with the original and output file names
    notefypdf.sh "$original_pdf" "$output_pdf"
done
