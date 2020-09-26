#!bin/bash

username = $1
token = $2
UserAgent =$3
miclientid =$4
miclientsecret=$5
curl -u $username:$token "https://api.github.com/user"
curl -i $UserAgent " https://api.github.com/meta"
curl -u $miclientid:$miclientsecret "https://api.github.com/user/repos"
