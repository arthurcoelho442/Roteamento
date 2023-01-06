#!/bin/bash

tmux new-session -d -s rare 'java -jar rtr.jar routersc r1-hw.txt r1-sw.txt'

tmux split-window -v -t 0 -p 50
tmux send 'java -jar rtr.jar routersc r2-hw.txt r2-sw.txt' ENTER;

tmux split-window -v -t 0 -p 50
tmux send 'java -jar rtr.jar routersc r3-hw.txt r3-sw.txt' ENTER;

tmux split-window -h -t 0 -p 50
tmux send 'java -jar rtr.jar routersc r4-hw.txt r4-sw.txt' ENTER;

tmux split-window -h -t 0 -p 50
tmux send 'java -jar rtr.jar routersc r5-hw.txt r5-sw.txt' ENTER;
tmux a
