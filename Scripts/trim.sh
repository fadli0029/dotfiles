#!/bin/bash

# Description: Trims an MP3 file using ffmpeg with specified start time and duration.

# Check if the required number of arguments is provided
if [ $# -lt 3 ]; then
  echo "Usage: $0 <input_file> <start_time> <duration> [output_file]"
  echo "Example: $0 input.mp3 00:00:30 00:05:00 output_trimmed.mp3"
  exit 1
fi

# Assign arguments to variables
input_file="$1"
start_time="$2"
duration="$3"
output_file="${4:-${input_file%.*}_trimmed.mp3}" # Default output name with '_trimmed' suffix

# Check if input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' not found."
  exit 1
fi

# Run the ffmpeg command to trim the MP3
ffmpeg -ss "$start_time" -t "$duration" -i "$input_file" -acodec copy "$output_file"

# Check if ffmpeg was successful
if [ $? -eq 0 ]; then
  echo "Trimmed file created successfully: $output_file"
else
  echo "Error: Failed to create trimmed file."
  exit 1
fi
