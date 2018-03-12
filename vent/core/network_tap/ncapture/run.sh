#!/bin/bash

NIC="$1"
INTERVAL="$2"
ID="$3"
ITERS="$4"
FILTER="$5"

# if ITERS is non-negative then do the capture ITERS times
if [ $ITERS -gt "0" ]; then
    COUNTER=0
    while [ $COUNTER -lt $ITERS ]; do
        tcpdump -ni $NIC -s65535 -w 'trace_'"$ID"'_%Y-%m-%d_%H_%M_%S.pcap' $FILTER &
        pid=$!
        sleep $INTERVAL
        kill $pid
        mv *.pcap /files/;
        let COUNTER=COUNTER+1;
    done
else  # else do the capture until killed
    while true
    do
        tcpdump -ni $NIC -s65535 -w 'trace_'"$ID"'_%Y-%m-%d_%H_%M_%S.pcap' $FILTER &
        pid=$!
        sleep $INTERVAL
        kill $pid
        mv *.pcap /files/;
    done
fi
