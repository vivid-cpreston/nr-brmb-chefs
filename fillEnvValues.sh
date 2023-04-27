#!/usr/bin/env bash

#this takes as an argument the name of the file to be processed

#get list of env variables
for env_var in $(env);
do
  if [[ "$env_var" == CHEFS* ]];
  then
    #split each line into a key (array[0]) and a value (array[1])
    IFS='=' read -r -a array <<< $env_var
    #replace key name in file with value
    sed -i "s/\$${array[0]}/${array[1]}/g" $1
  fi
done