#!/usr/bin/env bash

# This is a script that will autoconfig. our local linux machine with necessary tools:
# curl, wget, telnet, netstat, nslookup 

tools=("curl" "wget" "telnet" "net-tools" "bind-utils") #basic tools array, net-tools for netstat, bind-utils for nslookup
for tool in "${tools[@]}"; do
	yum install -y $tool
done