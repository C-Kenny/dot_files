# Path to your oh-my-zsh installation.
export ZSH=/home/carl/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# While going randomly through oh-my-zsh's theme's, I've created a file
# of those I like, located at /home/carl/liked_themes.txt

# get line count of liked_themes
LIKED_THEMES_FILE_LENGTH=$(wc -l < /home/carl/liked_themes.txt)

random_index=$[ RANDOM % LIKED_THEMES_FILE_LENGTH ]
let random_index+=1

# get n'th line to be used for ZSH theme
sed_arg='p'
ZSH_THEME=$(sed -n "$random_index$sed_arg" < /home/carl/liked_themes.txt)

alias reload='source ~/.zshrc'
alias notes="vim ~/Documents/work/notes.txt"
alias g='git'
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'

alias weather="curl -4 wttr.in/Christchurch"

# Jump to directory given its name $ 'cd <dir>' -> <dir>
setopt AUTO_CD

# Trigger IDE users
setopt NO_BEEP
setopt VI
export EDITOR="vi"

# Alt-S inserts "sudo " at the start of line:
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
source $ZSH/oh-my-zsh.sh

# Share aliases with bash
source $HOME/.aliases

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Colourize man
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

xclip="xclip -selection c"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
