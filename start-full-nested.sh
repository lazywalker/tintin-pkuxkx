#!/bin/bash
# 
# +----------------------+--------------+
# |                      |              |
# |   Communication      |   Look       |
# |   Channels           |              |
# |                      |              |
# +-------------------------------------+
# |                      |              |
# |                      |  (N)PCs from |
# |                      |  location    |
# |                      |  output      |
# |                      |              |
# |  Main window         |              |
# |  Nested tmux session |              |
# |  (pku-pane2)         |              |
# |                      |              |
# +----------------------+              |
# | Command bar          |              |
# +----------------------+--------------+
# 

SESSION=pku-full

tmux new-session -d -s $SESSION bash
tmux select-pane -t $SESSION -t 0
tmux split-window -t $SESSION -h -p 10 "tail -Fs .1 log/look.log"
tmux select-pane -t $SESSION -t 1
tmux split-window -t $SESSION -v -p 80 "tail -Fs .1 log/chars.log"
tmux select-pane -t $SESSION -t 0
tmux split-window -t $SESSION -v -p 10 "tail -Fs .1 log/channel.log"
tmux select-pane -t $SESSION -t 0
tmux attach -t $SESSION

unset TMUX
./start-pane2
tmux set status off
# :link-window -s single:0 -t 1


