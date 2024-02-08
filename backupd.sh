#!/bin/bash

if [ $# -ne 4 ];
then
 echo "Arguments should be exactly 4"
 exit 0
fi

dir="$1"
backupdir="$2"
interval="$3"
maximum="$4"

function is_modified
{
 ls -lR "$1" > directory-info.new
 diff -q directory-info.new directory-info.last >/dev/null 2>&1
}

ls -lR "$dir" > directory-info.last
mkdir -p "$backupdir"
current_date=$(date +"%Y-%m-%d-%H-%M-%S")
cp -r "$dir" "$backupdir/$current_date"

#sleep "$interval"
#is_modified "$dir"
#x=$?
#echo "The result is $x"

while true;
do
 sleep "$interval"
 is_modified "$dir"
 x=$?
# echo $x
 if [ $x == 1 ];
 then
  current_date=$(date +"%Y-%m-%d-%H-%M-%S")
  cp -r "$dir" "$backupdir/$current_date"
  ls -lR "$dir" > directory-info.last
  current_number=$(ls -l "$backupdir" | grep -c '^d')
  if [ $current_number -gt $maximum ];
   then
    oldest=$(ls -lt "$backupdir" | grep '^d' | tail -1 | awk '{print $9}')
    rm -rf "$backupdir/$oldest"
  fi
 fi
done
