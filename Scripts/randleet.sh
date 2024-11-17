#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROBLEMS_FILE="$SCRIPT_DIR/problems.txt"

# Function to get available topics
get_available_topics() {
    awk '/^!/ { print substr($0, 2) }' "$PROBLEMS_FILE"
}

# Function to get links under a specific topic
get_links_under_topic() {
    local topic="$1"
    awk -v topic="$topic" '
    BEGIN { found = 0 }
    $0 ~ "^!" {
        if ($0 == topic) {
            found = 1
            next
        }
        if (found && $0 ~ "^!") {
            found = 0
        }
    }
    found { print }
    ' "$PROBLEMS_FILE"
}

# Function to get all links
get_all_links() {
    awk '!/^!/' "$PROBLEMS_FILE"
}

# Check if a topic is provided
if [ "$1" == "--topic" ] && [ -n "$2" ]; then
    topic="!$2"
    available_topics=$(get_available_topics)

    # Check if the provided topic is valid
    if ! echo "$available_topics" | grep -qx "$2"; then
        echo "Error: Invalid topic '$2'. Available topics are:"
        echo "$available_topics"
        exit 1
    fi

    links=$(get_links_under_topic "$topic")
else
    links=$(get_all_links)
fi

# Convert links to an array
links_array=($links)

# Check if there are any links to open
if [ ${#links_array[@]} -eq 0 ]; then
    echo "No links found for the topic '$2'."
    exit 1
fi

# Get a random link from the array
random_link=${links_array[RANDOM % ${#links_array[@]}]}

# Open the random link in the default web browser
xdg-open "$random_link"
