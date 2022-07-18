#!/usr/bin/env bash
#set -x

# Create a file structure of 20 directories and each directory to have 3 files inside
# i.e folder1/file1, file2, folder2/file1,file2,file3, etc.
# BONUS POINTS for one liners (but mine are ugly)
for i in {1..20};do mkdir folder$i; for j in {1..3};do touch folder$i/file$j;done; done

# Delete all of the file2 files, except for odd numbered folders.
# OBS: Seems this {2..20..2} works on Mac only if you upgrade bash from 3 --> 5 ;) 
for i in {2..20..2};do rm folder$i/file2;done

# Add a counter in the file1 files of each folder. i.e. echo 2 > folder2/file1
for i in {1..20};do echo $i > folder$i/file1;done

# Get the number of lines containing the buzzword Error in /var/log/messages
echo 'Number of lines containing "Error" in /var/log/messages: '
grep "Error" /var/log/messages | wc -l