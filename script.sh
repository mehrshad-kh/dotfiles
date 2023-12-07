#!/bin/zsh

files=($(find . -type f -maxdepth 1 | grep -v "\.swp$" | sort))
for ((i=1; i<=${#files[@]}; i++)); do
    files[$i]=$(echo ${files[$i]} | cut -d "/" -f 2)
done

tmp=$(mktemp)
for file in ${files[@]}
do
    echo $file >> $tmp
done

good_files=($(comm -23 ${tmp} .ignore))
good_file_paths=()
for file in ${good_files[@]}; do
    good_file_paths+=$HOME/${file}
done

for ((i=1; i<=${#good_file_paths[@]}; i++))
do
    diff ${good_file_paths[$i]} ${good_files[$i]} > /dev/null

    # If the file has been changed, then
    if [ $? -ne 0 ]
    then
        # copy it.
        cp ${good_file_paths[$i]} ${good_files[$i]}
    fi
done

rm ${tmp}

exit 0
