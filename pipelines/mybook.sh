#!/usr/bin/env bash
# ---- MY AMAZING BOOK ----
cd ./../resources/data/myBook/ || exit

# -- Q1 --
echo "-- Q1 --"
# Write a pipeline that for the current directory prints the 10 most common words in all text files.
# Your pipeline should be case insensitive and ignore punctuation.
# Example output:
# 14 book
# 10 cover
mostCommonWords=$(find . -type f -name "*.txt" | xargs cat | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | grep -oE '[[:alpha:]]+' | sort | uniq -c | sort -nr | head -10)
# Prints the mostCommonWords
echo "Most common words in my book:"
echo "$mostCommonWords"

echo "--------"
# -- Q2 --
echo "-- Q2 --"
# Write a pipeline that places each sentence of the book on a new line.
# Make sure that they are in the correct order.
# so first the sentences from the intro followed by the sentences from chapter1 and so on.
# store only the first 7 sentences
# You don't have to remove leading or trailing spaces; however, we do encourage you to try.
# So the output should look like:
#
# Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts
# Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean
linesFromTheBook=$(find . -type f -name "*.txt" |  sort -n | xargs cat | tr -d '\n' | tr '.' '\n' | head -n 7)
echo "Listing of lines from the book:"
echo "$linesFromTheBook"

echo "--------"

# -- Q3 --
echo "-- Q3 --"
# It seems that the writer of the book mistyped the word "I" and used a lower case "i" instead.
# Write a pipeline that finds all the text files and replaces all the words "i" with its upper case variant.
# Make sure that it is NOT in line and that the output book is in its original ordered.
fixedBook=$(find . -type f -name "*.txt" | xargs cat | sed -e 's/i /I /')
echo "The corrected book:"
echo "$fixedBook"
echo "--------"

#end on start path
cd ../../pipelines/ || exit