#!/bin/zsh

# Function to capitalize first letter of each word
function capitalize() {
  echo "$1" | awk '{ for (i=1; i<=NF; ++i) { $i = toupper(substr($i, 1, 1)) tolower(substr($i, 2)) } print }'
}

# Function to convert title to lowercase with dashes
function to_lower_dash() {
  echo "$1" | awk '{ print tolower($0) }' | sed 's/ /-/g'
}

# Get current date in the required format
CURRENT_DATE=$(date +"%Y-%m-%dT%H:%M:%S%:z")

# Get arguments
QUESTION_NUMBER=$1
QUESTION_TITLE=$(capitalize "$2")
QUESTION_DIFFICULTY=$(echo "$3" | tr '[:lower:]' '[:upper:]')
QUESTION_TITLE_MOD=$(to_lower_dash "$2")

# Create the .md file and populate it
FILENAME="LC${QUESTION_NUMBER}.md"
cat <<EOF > $FILENAME
+++
title = "LC${QUESTION_NUMBER}: ${QUESTION_TITLE} (${QUESTION_DIFFICULTY})"
date = ${CURRENT_DATE}
draft = false
tags = ['Leetcode ${QUESTION_DIFFICULTY}', 'Dynamic Programming']
[editPost]
    URL = "https://github.com/fadli0029/fadeWrites/edit/main/content/posts/LC${QUESTION_NUMBER}.md"
    Text = "Suggest Changes"
    appendFilePath = false
[params]
    comments = true
    ShowToc = true
    TocOpen = false
+++

<!-- admonition types: note, abstract, info, tip, success, question, warning, failure, danger, bug, example, quote  -->
<!-- Example: -->
<!-- {{< admonition type=failure title="❌ Failure" open=false >}} -->
<!-- This is a failure admonition -->
<!-- {{< /admonition >}} -->

## Problem statement
TODO

*[Source: Leetcode, ${QUESTION_NUMBER}. ${QUESTION_TITLE}](https://leetcode.com/problems/${QUESTION_TITLE_MOD}/)*

## Understanding the problem
TODO

## Thought process
TODO

## Implementation
TODO

## Analysis of time and space complexity
TODO
EOF

echo "File $FILENAME created successfully."
