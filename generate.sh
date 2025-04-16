#!/bin/bash

# Create web directory if it doesn't exist
mkdir -p web

# Process all .tex files in the resumes directory
for tex_file in resumes/*.tex; do
    # Skip if no .tex files found
    [ -e "$tex_file" ] || continue

    # Get the filename without path and extension
    filename=$(basename "$tex_file" .tex)

    # Handle special case for main.tex
    if [ "$filename" = "main" ]; then
        output_file="web/index.html"
    else
        output_file="web/${filename}.html"
    fi

    echo "Converting $tex_file to $output_file"
    pandoc -s "$tex_file" \
        --template template.html \
        -V "pdf_name=$filename" \
        -o "$output_file"
done
