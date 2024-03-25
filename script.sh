#!/bin/zsh

set -uo pipefail

# Retrieve all files in the current directory.
files=($(find . -type f -maxdepth 1 | grep -v "\.swp$" | sort))
for ((i=1; i<=${#files[@]}; i++)); do
    files[$i]=$(echo ${files[$i]} | cut -d "/" -f 2)
done

# Write all such files to a temporary file.
tmp=$(mktemp)
for file in ${files[@]}; do
    echo $file >> $tmp
done

# Files present in .ignore should be ignored.
ignore_file=$(mktemp)

# Delete comments in .ignore.
sed -E '/^#/d' .ignore > ${ignore_file}

# Delete empty lines.
sed -E -i '' '/^$/d' ${ignore_file}

# Sort ignored filenames, as required by `comm'.
sort ${ignore_file} -o ${ignore_file}

# The files I intend to copy from the home directory.
# These are the ones that are not ignored.
intended_files=($(comm -23 ${tmp} ${ignore_file}))

# Paths of the source files in the home directory.
source_file_paths=()
for file in ${intended_files[@]}; do
    source_file_paths+=$HOME/${file}
done

# For each source file path,
for ((i=1; i<=${#source_file_paths[@]}; i++)); do
    # See if the last copy of the intended file differs from the source.
    diff ${source_file_paths[$i]} ${intended_files[$i]} > /dev/null

    # If the file has changed,
    if [[ $? -ne 0 ]]; then
        # Copy it.
        cp ${source_file_paths[$i]} ${intended_files[$i]}
    fi
done

# Remove temporary files.
rm ${tmp}
rm ${ignore_file}

# Delete all lines containing 'bw' in .zshrc.
sed -E -i '' '/bw/d' .zshrc 

exit 0
