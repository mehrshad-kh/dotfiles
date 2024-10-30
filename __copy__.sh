#!/bin/zsh

set -uo pipefail

function differ ()
{
  file1=$1
  file2=$2

  ! diff $file1 $file2 > /dev/null
  rc=$?

  return $rc
}

valid=config/valid
ignore=config/ignore

# Sort valid filenames, as required by `comm'.
sort ${valid} -o ${valid}

# Sort ignored filenames, as required by `comm'.
sort ${ignore} -o ${ignore}

# The files I intend to copy from the home directory.
# These are the ones that are not ignored.
intended_files=($(comm -23 ${valid} ${ignore}))

# Paths of the source files in the home directory.
source_file_paths=()
for file in ${intended_files[@]}; do
  source_file_paths+=$HOME/${file}
done

# Append src/ to the beginning of each
# intended file.
for ((i = 1; i <= ${#intended_files[@]}; i++)); do
  intended_files[$i]=src/${intended_files[i]}
done

# For each source file path,
for ((i=1; i<=${#source_file_paths[@]}; i++)); do
  source_file_path=${source_file_paths[$i]}
  intended_file=${intended_files[$i]}

    # If the last copy of the intended file differs from the source,
    if differ ${source_file_path} ${intended_file}; then
      # Copy it.
      rsync ${source_file_path} ${intended_file}
    fi
  done

exit 0
