#!/bin/bash 

cwd=$(pwd)
cwd2=$(pwd)
argNum=1
addNum=2

if [[ "$#" > "2" && $1 == "-t"  ]]; then

#check if directory valid here 
if [ ! -d $2 ]; then
echo "Error: $2 is not a valid directory name."
exit 
fi

targetD=$2
cwd=$targetD
argNum=$((argNum + addNum))
fi

if [[ $1 == -d ]]; then

#check if directory valid here 
if [ ! -d $2 ]; then
echo "Error: $2 is not a valid directory name."
exit 
fi

destD=$2
cwd2=$destD
argNum=$((argNum + addNum))

elif [[ $3 == -d ]]; then

#check if directory valid here 
if [ ! -d $4 ]; then
echo "Error: $4 is not a valid directory name."
exit 
fi

destD=$4
cwd2=$destD
argNum=$((argNum + addNum))
fi








#the zipping loop begins here 

for ext in "${@:$argNum}" ; do
 for i in `ls *$ext` ; do 
 ( cd $cwd && gzip -c $i > $cwd2/$i.gz )

 
 done
echo "compressed $ext files" 

done 

if [[ $cwd2 != $(pwd) ]]; then
echo "saved in $cwd2"
fi



