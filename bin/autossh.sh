#!/bin/sh

while true
do
  ssh -R 19999:localhost:22 arthur@lisnake.dyndns.org
  sleep 10
done
