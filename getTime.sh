#!/bin/bash

RUNNING_TOTAL=0

find * -type f -exec ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 {} \; > times.txt

readarray -t FILE_TIMES < ./times.txt

for i in "${FILE_TIMES[@]}"
do
    RUNNING_TOTAL=$(perl -e "print $RUNNING_TOTAL+$i")
done

echo $RUNNING_TOTAL Seconds
echo $(perl -e "print $RUNNING_TOTAL/60") Minutes
echo $(perl -e "print $RUNNING_TOTAL/3600") Hours
echo $(perl -e "print $RUNNING_TOTAL/31556952") Years

#original https://www.reddit.com/r/DataHoarder/comments/mtqade/i_wrote_a_script_to_check_the_run_time_for/
