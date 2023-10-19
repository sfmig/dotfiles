PROMPT="%F{cyan}%n@%m:%1~ %# %f"
export CLICOLOR=1

preexec() { 
    tput setaf 225
    :
}

# conda zsh autocompletion
fpath+=/Users/sofia/Applications/conda-zsh-completion
autoload -Uz compinit && compinit
autoload -Uz compinit && compinit


# conda init
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/sofia/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/sofia/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/sofia/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/sofia/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# path exports
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$PATH:/Applications/VLC.app/Contents/MacOS/"

# <<< direnv <<<
# Ref Url: https://github.com/direnv/direnv/wiki/Python
setopt PROMPT_SUBST # evaluate when you see a fn call (subs fn call with its output)
show_conda_env() {
if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    echo "($(basename $CONDA_DEFAULT_ENV)) "
fi
}

# TURN OFF CONDA PROMPT CHANGE IF USING BELOW PROMPT
# USE THE FOLLOWING COMMAND TO TURN OFF CONDA PROMPT: conda config — set changeps1 False
PS1='$(show_conda_env)'$PS1 # single quotes keep ref to fn (rather than returning val of first time eval)
[[ -f ~/.direnvrc ]] && eval "$(direnv hook zsh)"
# <<< direnv <<<
