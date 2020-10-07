#!/bin/bash
SESSION=pku-pane4

tmux new-session -d -s $SESSION "tt++ init.tin"
tmux select-pane -t $SESSION -t 0
tmux split-window -t $SESSION -h -p 10 "tail -Fs .1 log/look.log"
tmux select-pane -t $SESSION -t 1
tmux split-window -t $SESSION -v -p 80 "tail -Fs .1 log/chars.log"
tmux select-pane -t $SESSION -t 0
tmux split-window -t $SESSION -v -p 10 "tail -Fs .1 log/channel.log"
tmux select-pane -t $SESSION -t 0
tmux attach -t $SESSION
