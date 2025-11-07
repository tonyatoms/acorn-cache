#!/bin/bash

# if the output of:
# curl -L ipconfig.me (returns one's external IP address)
# is NOT    
# 73.110.199.169%
# do something notificationy

PATH=$PATH:/Users/tonyadams/.rvm/gems/ruby-2.6.3/bin

lastKnownIP="73.110.199.169x"
output=$(curl -Ls ipconfig.me)

message="iPCheck finds a new external IP: ${output}"
title="NEW EXTERNAL IP ADDRESS!"
if  [ "$lastKnownIP" != "$output" ]; then
    (/Users/tonyadams/.rvm/gems/ruby-2.6.3/bin/terminal-notifier -message "$message" -title "$title")
   # echo "iPCheck finds a new external IP: ${output}."
fi


