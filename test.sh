#!/bin/bash
set -euo pipefail

SCRIPT_ROOT=$(dirname $(readlink -f $0))
source ${SCRIPT_ROOT}/paths.sh

PASSWORD0="go"
echo "The password for start.zip is \"${PASSWORD0}\""
unzip -q -P "${PASSWORD0}" start.zip
cd ${PATH_LEVEL_0}

PASSWORD1=$(cat password.txt)
echo "The password for level1.zip is \"${PASSWORD1}\""
unzip -q -P "${PASSWORD1}" level1.zip
cd ${PATH_LEVEL_1}

PASSWORD2=$(tail -n 1 password_is_on_last_line.txt)
echo "The password for level2.zip is \"${PASSWORD2}\""
unzip -q -P "${PASSWORD2}" level2.zip
cd ${PATH_LEVEL_2}

PASSWORD3=$(cat .password.txt)
echo "The password for level3.zip is \"${PASSWORD3}\""
unzip -q -P "${PASSWORD3}" level3.zip
cd ${PATH_LEVEL_3}

PASSWORD4=$(head -n12345 password.txt | tail -n1)
echo "The password for level4.zip is \"${PASSWORD4}\""
unzip -q -P "${PASSWORD4}" level4.zip
cd ${PATH_LEVEL_4}

PASSWORD5=$(awk '/password:/{for(i=1;i<=NF;i++){if($i ~ /password:/){sub("password:", "", $i); print $i; exit}}}' password.txt)
echo "The password for level5.zip is \"${PASSWORD5}\""
unzip -q -P "${PASSWORD5}" level5.zip
cd ${PATH_LEVEL_5}

PASSWORD6=$(wc -l how_many_lines_do_I_have.txt | cut -f1 -d' ')
echo "The password for level6.zip is \"${PASSWORD6}\""
unzip -q -P "${PASSWORD6}" level6.zip
cd ${PATH_LEVEL_6}

PASSWORD7=$(head -n123 password.tsv | tail -n1 | cut -f567)
echo "The password for level7.zip is \"${PASSWORD7}\""
unzip -q -P "${PASSWORD7}" level7.zip
cd ${PATH_LEVEL_7}

PASSWORD8=$(zcat password.txt.gz)
echo "The password for level8.zip is \"${PASSWORD8}\""
unzip -q -P "${PASSWORD8}" level8.zip
cd ${PATH_LEVEL_8}

PASSWORD9=$(grep -c "turpis" password.txt)
echo "The password for level9.zip is \"${PASSWORD9}\""
unzip -q -P "${PASSWORD9}" level9.zip
cd ${PATH_LEVEL_9}

PASSWORD10=$(basename $(dirname $(find . -name "password.txt")))
echo "The password for level10.zip is \"${PASSWORD10}\""
unzip -q -P "${PASSWORD10}" level10.zip
cd ${PATH_LEVEL_10}

PASSWORD11=$(sort password.txt | uniq -u)
echo "The password for level11.zip is \"${PASSWORD11}\""
unzip -q -P "${PASSWORD11}" level11.zip
cd ${PATH_LEVEL_11}

PASSWORD12=$(comm -23 <(sort password_B.txt) <(sort password_A.txt))
echo "The password for level12.zip is \"${PASSWORD12}\""
unzip -q -P "${PASSWORD12}" level12.zip
cd ${PATH_LEVEL_12}

PASSWORD13=$(head -n3 password.txt | tail -n1 | sed 's/xsbhjlasbdghasl//g')
echo "The password for level13.zip is \"${PASSWORD13}\""
unzip -q -P "${PASSWORD13}" level13.zip
cd ${PATH_LEVEL_13}

wget --quiet https://ftp.ncbi.nlm.nih.gov/ReferenceSamples/giab/current.tree
PASSWORD14=$(grep "AshkenazimTrio.*vcf.gz\s" current.tree | grep "HG002" | grep "VariationHunter" | cut -f4 | cut -d' ' -f4)
echo "The password for level14.zip is \"${PASSWORD14}\""
unzip -q -P "${PASSWORD14}" level14.zip
cd ${PATH_LEVEL_14}

PASSWORD15=$(awk '{ sum += $8 } END { print sum }' password.tsv)
echo "The password for level15.zip is \"${PASSWORD15}\""
unzip -q -P "${PASSWORD15}" level15.zip
cd ${PATH_LEVEL_15}

PASSWORD_END_BOSS=$(zcat .password.txt.gz | tr -c '[:alnum:]' '[\n*]' | grep . | sort | uniq -c | sort -nr | awk 'NR==1 {print $2}')
echo "The password for end_boss.zip is \"${PASSWORD_END_BOSS}\""
unzip -q -P "${PASSWORD_END_BOSS}" end_boss.zip
cd ${PATH_END_BOSS}

test -f congrats.txt
