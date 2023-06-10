
#!/bin/bash

session=$1
echo "Creating tmux session called $1"

tmux new -s $session -d

window=0
echo "Creating Nvim window in position $window"
tmux rename-window -t $session:$window 'nvim'
echo "Entering nvim..."
tmux send-keys -t $session:$window 'vim .' C-m

window=1
echo "Creating git window in position $window"
tmux new-window -t $session:$window -n 'git'

window=2
echo "Creating server window in position $window"
tmux new-window -t $session:$window -n 'server'

window=3
echo "Creating scratch window in position $window"
tmux new-window -t $session:$window -n 'scratch'

tmux attach-session -t $session
