
#!/usr/bin/zsh

path=$(pwd)
session=$(basename $path)
echo "Creating tmux session in folder $1"

if tmux attach-session -d -t $session; then
	echo "Attached to existing session"
else
	
tmux new -s $session -d

window=0
echo "Creating Nvim window in position $window"
tmux rename-window -t $session:$window 'nvim'
echo "Entering nvim..."
tmux send-keys -t $session:$window 'nvim .' Enter Space 'fb'

window=1
echo "Creating git window in position $window"
tmux new-window -t $session:$window -n 'git'
tmux send-keys -t $session:$window 'lazygit' Enter

window=2
echo "Creating server window in position $window"
tmux new-window -t $session:$window -n 'server'

window=3
echo "Creating scratch window in position $window"
tmux new-window -t $session:$window -n 'scratch'

tmux select-window -t 'nvim'

tmux attach-session -t $session
fi
