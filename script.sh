#!/bin/zsh
# Not part of my personal dotfiles.

files=($(ls -a | grep -v "\.swp$"))
ignored_files=(. .. .git .gitignore script.sh README.md)

for ignored_file in ${ignored_files[@]}; do
    # Find the index of first occurrence of ignored_file in files. Then,
    # set it to nothing (remove the item).
    files[${files[(i)$ignored_file]}]=()
done

file_paths=()
for file in ${files[@]}; do
    file_paths+=$HOME/$file
done

for ((i=1; i<=${#file_paths[@]}; i++)); do
    diff ${file_paths[$i]} ${files[$i]} >/dev/null

    # If the file has changed,
    if [ $? -ne 0 ]; then
        # copy it.
        cp ${file_paths[$i]} ${files[$i]}
    fi
done

exit 0
