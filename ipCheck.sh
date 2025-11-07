#!/bin/bash

# if the output of:
# curl -L ipconfig.me (returns one's external IP address)
# is NOT    
# 73.110.199.169%
# do something notificationy
# THIS VERSION just prints to STDOUT - while the notification 
# version is on a middle burner
#PATH=$PATH:/Users/tonyadams/.rvm/gems/ruby-2.6.3/bin

lastKnownIP="73.110.199.169x"
# output
#output=$(curl -Ls ipconfig.me)
# message="iPCheck finds a new external IP: ${output}"
# just want to test echo when run from a launchAgent
message="this is a message, like the message you might see"
echo ${message}
echo $(date)
# notifications version
# message="iPCheck finds a new external IP: ${output}"
# title="NEW EXTERNAL IP ADDRESS!"
# if  [ "$lastKnownIP" != "$output" ]; then
#     (/Users/tonyadams/.rvm/gems/ruby-2.6.3/bin/terminal-notifier -message "$message" -title "$title")
#    # echo "iPCheck finds a new external IP: ${output}."
# fi


