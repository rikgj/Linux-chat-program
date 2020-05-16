#!/bin/bash
# a chat program

# make random name
NAME="RANDOM"

# make a message file
touch "$NAME"

# program loop
while [[ true ]]; do
  # record message
  read -p "Write your message: " MESSAGE
  echo "$MESSAGE" > message/"$NAME"

  # check for quit statement
  if [[ "$MESSAGE" -eq "--QUIT" ]]; then
    break
  fi
done

# delete message file
rm message/"$NAME"
