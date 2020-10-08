#!/bin/bash

# 
# +----------------------+
# |                      |
# |   Communication      |
# |   Channels           |
# |                      |
# +----------------------+
# |                      |
# |                      |
# |                      |
# |                      |
# |                      |
# |  Main window         |
# |                      |
# +----------------------+
# | Command bar          |
# +----------------------+
# 

SESSION=pku-pane2

tmux new-session -d -s $SESSION "tt++ init.tin"
tmux select-pane -t $SESSION -t 0
tmux split-window -t $SESSION -vb -p 10 "tail -Fs .1 log/channel.log"
tmux select-pane -t $SESSION -t 0
tmux attach -t $SESSION
