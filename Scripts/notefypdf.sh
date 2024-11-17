#!/bin/bash

# ---------------------------------------------------------------------------------------------------------------------------
# Description:

#   This script takes a PDF file as input and generates a new PDF file with the pages interleaved with blank pages.
#   The output PDF file will have two pages per sheet, with the original pages on the left and blank pages on the right.
#   This can be useful for taking notes or annotations on the blank pages while keeping the original content intact.
#   The script uses the 'pdfinfo', 'pdftk', 'convert', and 'pdfjam' commands, so make sure they are installed on your system.
#   The script takes two arguments: the path to the original PDF file and the path to the output PDF file.
#   Example usage: ./notefypdf.sh original.pdf output.pdf
# ---------------------------------------------------------------------------------------------------------------------------

# Check if the correct number of arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <original_pdf> <output_pdf>"
    exit 1
fi

# Assign command line arguments to variables
original_pdf="$1"
output_pdf="$2"

# Use pdfinfo to get the size of the first page of the original PDF in points
size=$(pdfinfo "$original_pdf" | grep 'Page size' | awk '{print $3 "x" $5}')

# Check if size was found
if [ -z "$size" ]; then
    echo "Failed to get page size from $original_pdf"
    exit 1
fi

# Create a blank PDF with the detected size
convert -size "$size" xc:none blank.pdf

# Get the number of pages in the original PDF
num_pages=$(pdftk "$original_pdf" dump_data | grep NumberOfPages | awk '{print $2}')

# Generate a sequence of page numbers interleaved with 'B1' representing the blank page
page_sequence=''
for ((i=1; i<=num_pages; i++)); do
    page_sequence+="A$i B1 "
done

# Shuffle the pages using pdftk
pdftk A="$original_pdf" B="blank.pdf" shuffle $page_sequence output "temp.pdf"

# Remove the blank pdf
rm blank.pdf

pdfjam --nup 2x1 --landscape --a4paper --delta "0.5cm 0.5cm" --offset "0cm 0cm" temp.pdf -o $output_pdf > /dev/null 2>&1

rm temp.pdf
