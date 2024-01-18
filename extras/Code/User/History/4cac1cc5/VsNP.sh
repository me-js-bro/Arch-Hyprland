#!/bin/bash

mkdir Install-Logs
log="Install-Logs/install-$(date +%d-%m-%Y_%I:%M-

printf "Hello, logging to the $log file..\n" 2>&1 | tee -a "$log"