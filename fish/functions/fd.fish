function fd --description 'alias fd=fd --type f --hidden --exclude .git --exclude node_modules | fzf-tmux -p | xargs -r nvim'
    command fd --type f --hidden --exclude .git --exclude node_modules | fzf-tmux -p | xargs -r nvim $argv
end
