#!/bin/bash

trap "rm failedattempts.txt" exit 

clear
journalctl -fu ssh | grep "Failed password for" | tee -a failedattempts.txt




# grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' failedattemts.txt
 



