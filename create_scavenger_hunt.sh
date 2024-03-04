#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2006-2024 Knut Reinert & Freie Universität Berlin
# SPDX-FileCopyrightText: 2016-2024 Knut Reinert & MPI für molekulare Genetik
# SPDX-License-Identifier: BSD-3-Clause

set -euo pipefail

SCRIPT_ROOT=$(dirname $(readlink -f $0))
source ${SCRIPT_ROOT}/paths.sh

mkdir -p ${PATH_END_BOSS}

# level 1
PASSWORD1=kittycat
echo ${PASSWORD1} >> ${PATH_LEVEL_0}/password.txt
# Solution: cat password.txt or less password.txt

# level 2
PASSWORD2="tail"
for ((i=1; i<=1000; i++)); do echo "This is not it" >> ${PATH_LEVEL_1}/password_is_on_last_line.txt; done
echo ${PASSWORD2} >> ${PATH_LEVEL_1}/password_is_on_last_line.txt
# Solution: tail password_is_on_last_line.txt

# level 3
PASSWORD3="hide_and_seek"
echo ${PASSWORD3} >> ${PATH_LEVEL_2}/.password.txt
echo "Something is hidden here!" > ${PATH_LEVEL_2}/README.txt
# Solution: ls -a

# Level 4
PASSWORD4="midi"
for ((i=1; i<=12344; i++)); do echo "$i The password is not on this line" >> ${PATH_LEVEL_3}/password.txt; done
echo ${PASSWORD4} >> ${PATH_LEVEL_3}/password.txt
for ((i=1; i<=12344; i++)); do echo "$i The password is not on this line" >> ${PATH_LEVEL_3}/password.txt; done

echo "The password is on line 12345 in file password.txt (start counting on 1)." > ${PATH_LEVEL_3}/README.txt
echo "" >> ${PATH_LEVEL_3}/README.txt
echo "You could make use of the following tools (all, none or some of them):" >> ${PATH_LEVEL_3}/README.txt
echo "" >> ${PATH_LEVEL_3}/README.txt
echo "less, head, tail" >> ${PATH_LEVEL_3}/README.txt
# Solution: head -n 12345 password.txt | tail

# Level 5
PASSWORD5="needle"
curl -sS --fail https://lipsum.com/feed/json -d "amount=150" -d "what=paras" -d "start=true" \
    | jq --raw-output .feed.lipsum \
    | fold -s -w80 \
    | awk -v new_word=" password:${PASSWORD5} " 'NR==512 {gsub(substr($0, 10, 16), new_word)} {print}' \
    > ${PATH_LEVEL_4}/password.txt
echo "The password is somewhere in the file. It is prefixed 'password:'" > ${PATH_LEVEL_4}/README.txt
echo "" >> ${PATH_LEVEL_4}/README.txt
echo "You may use one, some or all of these tools:" >> ${PATH_LEVEL_4}/README.txt
echo "" >> ${PATH_LEVEL_4}/README.txt
echo "less, grep" >> ${PATH_LEVEL_4}/README.txt

# Level 6
cp ${PATH_LEVEL_4}/password.txt ${PATH_LEVEL_5}/how_many_lines_do_I_have.txt
PASSWORD6="$(wc -l ${PATH_LEVEL_5}/how_many_lines_do_I_have.txt | awk '{print $1}' )"

# Level 7
for ((i = 1; i <= 1000; i++)); do
    line=""
    for ((j = 1; j <= 1000; j++)); do
        # Generate a random number between 1 and 10000 and append to the line
        random_number=$((RANDOM % 10000 + 1))
        line+="$random_number"
        # Add a tab separator unless it's the last number in the line
        if [ "$j" -lt 10000 ]; then
            line+="\t"
        fi
    done
    # Append the line to the output file
    echo -e "$line" >> ${PATH_LEVEL_6}/password.tsv
done
ROW=123
COLUMN=567
echo "The password is a number. It is found in line ${ROW} and in column ${COLUMN}." > ${PATH_LEVEL_6}/README.txt
echo "" >> ${PATH_LEVEL_6}/README.txt
echo "You may use one, some or all of these tools:" >> ${PATH_LEVEL_6}/README.txt
echo "" >> ${PATH_LEVEL_6}/README.txt
echo "head, tail, cut" >> ${PATH_LEVEL_6}/README.txt
PASSWORD7=$(head -n ${ROW} ${PATH_LEVEL_6}/password.tsv | tail -n 1 | cut -f ${COLUMN})

# Level 8
PASSWORD8="compression"
echo ${PASSWORD8} > ${PATH_LEVEL_7}/password.txt
gzip ${PATH_LEVEL_7}/password.txt
echo "The password is in the file password.txt.gz" > ${PATH_LEVEL_7}/README.txt
echo "" >> ${PATH_LEVEL_7}/README.txt
echo "You may use one, some or all of these tools:" >> ${PATH_LEVEL_7}/README.txt
echo "" >> ${PATH_LEVEL_7}/README.txt
echo "zcat, zless, gzip, gunzip" >> ${PATH_LEVEL_7}/README.txt

# Level 9
cp ${PATH_LEVEL_4}/password.txt ${PATH_LEVEL_8}/password.txt
WORD="turpis"
echo "On how many lines does the word '${WORD}' appear in the file password.txt? The number is the password." > ${PATH_LEVEL_8}/README.txt
echo "" >> ${PATH_LEVEL_8}/README.txt
echo "Hint: You can solve this only by using unix tools (or their combination) that you have already used in prior levels." >> ${PATH_LEVEL_8}/README.txt
PASSWORD9=$(grep ${WORD} ${PATH_LEVEL_8}/password.txt | wc -l)

# Level 10
PASSWORD10="subdir42"
mkdir ${PATH_LEVEL_9}/search
for ((i=1; i<=100; i++)); do mkdir ${PATH_LEVEL_9}/search/dir$i; done
for ((i=1; i<=100; i++)); do for ((j=1; j<=100; j++)); do mkdir ${PATH_LEVEL_9}/search/dir$i/subdir$j; done; done
touch ${PATH_LEVEL_9}/search/dir42/${PASSWORD10}/password.txt
echo "The password is a directory name. It is the name of the one directory that contains the file password.txt" > ${PATH_LEVEL_9}/README.txt
echo "" >> ${PATH_LEVEL_9}/README.txt
echo "E.g. if the file can be found in dir1/subdir1/password.txt the password is "subdir1"." >> ${PATH_LEVEL_9}/README.txt
echo "" >> ${PATH_LEVEL_9}/README.txt
echo "You may use one, some or all of these tools:" >> ${PATH_LEVEL_9}/README.txt
echo "" >> ${PATH_LEVEL_9}/README.txt
echo "find" >> ${PATH_LEVEL_9}/README.txt

# Level 11
PASSWORD11="baguette"
for ((i=1; i<=100; i++)); do echo "sudo" >> ${PATH_LEVEL_10}/password_raw.txt; done
for ((i=1; i<=100; i++)); do echo "make" >> ${PATH_LEVEL_10}/password_raw.txt; done
for ((i=1; i<=100; i++)); do echo "me" >> ${PATH_LEVEL_10}/password_raw.txt; done
for ((i=1; i<=100; i++)); do echo "a" >> ${PATH_LEVEL_10}/password_raw.txt; done
for ((i=1; i<=100; i++)); do echo "sandwhich" >> ${PATH_LEVEL_10}/password_raw.txt; done
for ((i=1; i<=100; i++)); do echo "with" >> ${PATH_LEVEL_10}/password_raw.txt; done
for ((i=1; i<=100; i++)); do echo "tomatoes" >> ${PATH_LEVEL_10}/password_raw.txt; done
for ((i=1; i<=100; i++)); do echo "and" >> ${PATH_LEVEL_10}/password_raw.txt; done
for ((i=1; i<=100; i++)); do echo "cheese" >> ${PATH_LEVEL_10}/password_raw.txt; done
echo "${PASSWORD11}" >> ${PATH_LEVEL_10}/password_raw.txt
shuf ${PATH_LEVEL_10}/password_raw.txt > ${PATH_LEVEL_10}/password.txt
rm ${PATH_LEVEL_10}/password_raw.txt

echo "Which word in the file password.txt appears only ONCE." > ${PATH_LEVEL_10}/README.txt
echo "" >> ${PATH_LEVEL_10}/README.txt
echo "E.g. in the file" >> ${PATH_LEVEL_10}/README.txt
echo "" >> ${PATH_LEVEL_10}/README.txt
echo "AA" >> ${PATH_LEVEL_10}/README.txt
echo "BB" >> ${PATH_LEVEL_10}/README.txt
echo "AA" >> ${PATH_LEVEL_10}/README.txt
echo "BB" >> ${PATH_LEVEL_10}/README.txt
echo "cc" >> ${PATH_LEVEL_10}/README.txt
echo "AA" >> ${PATH_LEVEL_10}/README.txt
echo "" >> ${PATH_LEVEL_10}/README.txt
echo "The word cc appears only once but AA and BB appear multiple times. Here, "cc" would be the password." >> ${PATH_LEVEL_10}/README.txt
echo "" >> ${PATH_LEVEL_10}/README.txt
echo "You may use one, some or all of these tools:" >> ${PATH_LEVEL_10}/README.txt
echo "" >> ${PATH_LEVEL_10}/README.txt
echo "sort, uniq" >> ${PATH_LEVEL_10}/README.txt

# Level 12
PASSWORD12="moly"
cat ${PATH_LEVEL_4}/password.txt | tr '\s' '\n' | awk 'NR==300 {$0="holy"} {print}' > ${PATH_LEVEL_11}/password_A.txt
cat ${PATH_LEVEL_4}/password.txt | tr '\s' '\n' | awk -v word="${PASSWORD12}" 'NR==300{$0=word}1' > ${PATH_LEVEL_11}/password_B.txt

echo "The password is the one word that is ONLY present in file password_B.txt but not in password_A.txt." > ${PATH_LEVEL_11}/README.txt
echo "" >> ${PATH_LEVEL_11}/README.txt
echo "You may use one, some or all of these tools:" >> ${PATH_LEVEL_11}/README.txt
echo "" >> ${PATH_LEVEL_11}/README.txt
echo "diff" >> ${PATH_LEVEL_11}/README.txt

# Level 13
echo "sxsbhjlasbdghaslexsbhjlasbdghaslaxsbhjlasbdghaslrxsbhjlasbdghaslcxsbhjlasbdghaslhxsbhjlasbdghasl" >> ${PATH_LEVEL_12}/password.txt
echo "axsbhjlasbdghaslnxsbhjlasbdghasldxsbhjlasbdghasl" >> ${PATH_LEVEL_12}/password.txt
echo "rxsbhjlasbdghaslexsbhjlasbdghaslpxsbhjlasbdghasllxsbhjlasbdghaslaxsbhjlasbdghaslcxsbhjlasbdghaslexsbhjlasbdghasl" >> ${PATH_LEVEL_12}/password.txt
echo "The password can be found in the file password.txt on the 3rd line by replacing the string 'xsbhjlasbdghasl' everywhere with nothing (i.e. removing it)." > ${PATH_LEVEL_12}/README.txt
echo "" >> ${PATH_LEVEL_12}/README.txt
echo "You may use one, some or all of these tools:" >> ${PATH_LEVEL_12}/README.txt
echo "" >> ${PATH_LEVEL_12}/README.txt
echo "sed" >> ${PATH_LEVEL_12}/README.txt
PASSWORD13=$(sed 's/xsbhjlasbdghasl//g' ${PATH_LEVEL_12}/password.txt | tail -n 1)

# Level 14
echo "To get the next passowrd you first need to download the file 'current.tree' from the NCBI ftp site. It can be downloaded here:" >> ${PATH_LEVEL_13}/README.txt
echo "" >> ${PATH_LEVEL_13}/README.txt
echo "https://ftp.ncbi.nlm.nih.gov/ReferenceSamples/giab/current.tree" >> ${PATH_LEVEL_13}/README.txt
echo "" >> ${PATH_LEVEL_13}/README.txt
echo "You are interested at which time the 'vcf' file created by 'VariationHunter' on the 'HG002' sample from the 'AshkenazimTrio' data set was uploaded to the NCBI ftp site. Your are interested because the time stamp is the password next password." >> ${PATH_LEVEL_13}/README.txt
echo "" >> ${PATH_LEVEL_13}/README.txt
echo "Hint: A vcf file is identified by the file extension '.vcf' or '.vcf.gz' if it zipped, e.g. 'sample.vcf.gz'" >> ${PATH_LEVEL_13}/README.txt
echo "" >> ${PATH_LEVEL_13}/README.txt
echo "Hint: The timestamp may look like this '11:11:11', then the password is full string, including ':'" >> ${PATH_LEVEL_13}/README.txt
echo "" >> ${PATH_LEVEL_13}/README.txt
echo "You may use one, some or all of these tools:" >> ${PATH_LEVEL_13}/README.txt
echo "" >> ${PATH_LEVEL_13}/README.txt
echo "wget, curl, grep, less" >> ${PATH_LEVEL_13}/README.txt
PASSWORD14=$(wget --quiet -O- https://ftp.ncbi.nlm.nih.gov/ReferenceSamples/giab/current.tree | grep "AshkenazimTrio.*vcf.gz\s" | grep "HG002" | grep "VariationHunter" | cut -f4 | cut -d' ' -f4)
if [ -z "${PASSWORD14}" ]; then
    echo "Error: PASSWORD14 is empty. It should be in the format hh:mm:ss. Something went wrong."
    exit 1
fi

# Level 15
cp ${PATH_LEVEL_6}/password.tsv ${PATH_LEVEL_14}/password.tsv
echo "The password is a number. You can get the number by summing up column 8 in the file numbers.tsv " > ${PATH_LEVEL_14}/README.txt
echo "" >> ${PATH_LEVEL_14}/README.txt
echo "Use the following tool: awk" >> ${PATH_LEVEL_14}/README.txt
PASSWORD15=$(awk '{ sum += $8 } END { print sum }' ${PATH_LEVEL_14}/password.tsv)

# End boss
cp ${PATH_LEVEL_4}/password.txt ${PATH_LEVEL_15}/.password.txt
gzip ${PATH_LEVEL_15}/.password.txt
echo "The final password the most occuring word in the only file in this directory besides directory 'end_boss' and 'README.txt." > ${PATH_LEVEL_15}/README.txt
echo "" >> ${PATH_LEVEL_15}/README.txt
echo "Hint: Most occuring word means all words (not lines) need to be counted and the word that has the highest count is the password. Ignore puncutation marks, spaces or newlines within the ranking (if any)." >> ${PATH_LEVEL_15}/README.txt
echo "" >> ${PATH_LEVEL_15}/README.txt
echo "You may use a combination of tools you have already used in the levels before." >> ${PATH_LEVEL_15}/README.txt
PASSWORD_END_BOSS=$(zcat ${PATH_LEVEL_15}/.password.txt.gz | tr -c '[:alnum:]' '[\n*]' | grep . | sort | uniq -c | sort -nr | awk 'NR==1 {print $2}')

# END BOSS
cat > ${PATH_END_BOSS}/congrats.txt <<-OTTER
                            ################
                      ############################
                  ########                   #########
               #######                             ######
            ######                                    #####
          #####                                         #####
         ####                                             #####
       ####                                                 #######
    ######                                                    ######
 ########         ####                           ########     #######
 #######       #########                        ###  #####      #####
 ######        #####  ###                       ##########      ####
 #####         ##########      ###########      ##########       ###
  ####         #########     ###############     ########         ##
  ###           #######      ###############                      ###
  ###                            ######                           ###
  ##                    ###        ###        ###                 ###
  ##                     ###       ####      ###                  ####
  ##                      ####    ######    ####                  ###
  ###                     ######################                  ###
  ###                       ###           #####                  ###
  ####                      ####         ####                  ####
   ####                       ##############                   ####
   #####                         ########                     ####
   #######                                                 ########
   ### ######                                            ######  #####
   ###   ######                                       ##################
   ####    #########                             ##########################
   ####        ##################################################       ######
    ###               #########################       #####                #####
    ###                         #####  ##########     #########              ####
    ###                      ######    ##   ######    ###                     ###
     ###                  ######           ###  ##     ########                ####          ##########
     ###                 #####           ##    ###     #####                  #########    ###############
     ####                 ##                 #####       ########################   ######### ###  ##  ####
      ###                                   ######          #####################       ####   ##  ##  ####
      ####                                  #####                             #####    ###     ##  ##  #####                                      ############
       ####                              #######                                ####   ###               ###                                ####################
       ####   ####                    #################         ###########      #### ###                ###                            ########     ########
         ###  ####                ##########################  ###############      ######                ####                         ######      ######
         ####  ####            ##############           ############  ##  ####     ######                ###                        #####        #####
          ####  #####      ##############                  ####  ###  ##  #####    ######                ###                     ######       #####
           ####   ##############  #####                    ###   ###  ##  #####     #####                ###                   #####        #####
            ###    #########       ##                     ###                ##     #####                ###                 #####         #####
             ####                                        ####                ###    #####               ###                #####         #####
              ####                                       ####                ###    ######             ####             ######          ####
               #####                                     ###                 ###    #####              ####           #####           #####
                #####                                    ###                 ##    ####              ####         #######            #####
                  ####                                   ###                ###   ####             #####      ########              ####
                   #####                                 ###                ###  ##########     #######  #########                #####
                     #####                               ####              ####  ##############################                  ####
                      ######                             ####              ########         ############                       #####
                        ######                                            ###  ##                                            #####
                          #####                                         #####                                               #####
                             ######                                   #####                                               #####
                               #######                     #####  ########                                             ######
                                  #######                ###############                                             ######
                                     ########################  ####                                               #######
                                          #################                                                   ########
                                                       #######                                            #########
                                                          #############                          #############
                                                                 ########################################
                                                                          ########################
OTTER

PASSWORD0="go"

# Now zip everything
cd ${PATH_LEVEL_15}
zip --quiet --encrypt --password ${PASSWORD_END_BOSS} -r end_boss.zip end_boss
rm -r end_boss
cd ../

for i in $(seq 15 -1 1); do
    eval zip --quiet --encrypt --password \${PASSWORD${i}} -r level${i}.zip level${i}
    rm -r level${i}
    cd ..
done

zip --quiet --encrypt --password ${PASSWORD0} -r start.zip start
rm -r start

