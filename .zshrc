# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/oh-my-zsh


# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Path variables
export XDG_CONFIG_HOME=$HOME/.config

# clima API key
export OPEN_WEATHER_API_KEY="d0ca126c9eef5a8bd0b0fdb46ac4a416"

# Neovim
export EDITOR='nvim'

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
		# git
    zsh-syntax-highlighting
    zsh-autosuggestions
    web-search
		# common-aliases
    zoxide
		colored-man-pages
	)


source $ZSH/oh-my-zsh.sh

# p10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ghcup environment
[ -f "/Users/paultalma/.ghcup/env" ] && source "/Users/paultalma/.ghcup/env"

# opam configuration
[[ ! -r /Users/paultalma/.opam/opam-init/init.zsh ]] || source /Users/paultalma/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/paultalma/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/paultalma/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/paultalma/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/paultalma/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

