
#!/usr/bin/zsh

path=$(pwd)
session=$(basename $path)
echo "Creating tmux session named $session in folder $1"

if tmux attach-session -d -t="$session"; then
	echo "Attached to existing session"
else
	
tmux new -s $session -d

# If opening the urbancompass monorepo, activate its Go environment in all windows
go_activate=""
go_activate_cmd=""
if [[ "$path" == *"/dev/urbancompass"* ]]; then
  go_activate_cmd='eval "$(~/dev/urbancompass/scripts/go activate)"'
  go_activate="${go_activate_cmd} && "
fi

window=0
echo "Creating Nvim window in position $window"
tmux rename-window -t $session:$window 'nvim'
echo "Entering nvim..."
tmux send-keys -t $session:$window "${go_activate}nvim ." Enter Space 'fb'

window=1
echo "Creating git window in position $window"
tmux new-window -t $session:$window -n 'git'
tmux send-keys -t $session:$window 'lazygit' Enter

window=2
echo "Creating server window in position $window"
tmux new-window -t $session:$window -n 'server'
if [[ -n "$go_activate_cmd" ]]; then
  tmux send-keys -t $session:$window "$go_activate_cmd" Enter
fi

window=3
echo "Creating scratch window in position $window"
tmux new-window -t $session:$window -n 'scratch'
if [[ -n "$go_activate_cmd" ]]; then
  tmux send-keys -t $session:$window "$go_activate_cmd" Enter
fi

tmux select-window -t 'nvim'

tmux attach-session -t $session
fi
