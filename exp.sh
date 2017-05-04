#!/bin/bash
# SCRIPT: bubblesort.sh
# LOGIC:
# Bubble sort is a simple sorting, it works by repeatedly stepping
# through the list to be sorted, comparing two items at a time and
# swapping them if they are in the wrong order. If you are sorting
# the data in Ascending order, at the end of the first pass, the
# "heaviest" element has move to bottom. In the second pass, the
# comparisons are made till the last but one position and now second
# largest element is placed at the last but one position. And so
# forth.
#
#####################################################################
#                      Define Functions Here                        #
#####################################################################

printnumbers()
{
echo ${ARRAY[*]}

#You can also use bellow code
#for ((i=0;i<count;i++))
#do
#echo -n " ${ARRAY[i]} "
#done
}

exchange()
{
temp=${ARRAY[$1]}

ARRAY[$1]=${ARRAY[$2]}

ARRAY[$2]=$temp

}

sortnumbers()
{
for (( last=count-1;last>0;last--))
do
    for((i=0;i<last;i++))
    do
      j=$((i+1))
      if [ ${ARRAY[i]} -gt ${ARRAY[j]} ]
      then

       exchange $i $j

      fi
    done
done
}

#####################################################################
#                       Variable Initialization                     #
#####################################################################

echo "Enter Numbers to be Sorted"

read -a ARRAY

count=${#ARRAY[@]}

#####################################################################
#                       Main Script Starts Here                     #
#####################################################################

echo "--------------------------------------------------------------"

echo "Numbers Before Sort:"

printnumbers

echo

sortnumbers

echo "Numbers After Sort: "

printnumbers

echo "--------------------------------------------------------------"
