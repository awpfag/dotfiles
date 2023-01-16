#!/bin/sh

title="$(echo "$(whoami)@$(cat /etc/hostname)")"
os="$(cat /etc/os-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' | sed 's/"//g')"
kernel="$(uname -r)"

echo "$title"
echo "os: $os"
echo "kernel: $kernel"
echo "shell: $SHELL"
