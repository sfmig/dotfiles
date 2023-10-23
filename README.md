### direnv
Changing `conda` env based on the directory

1. Install direnv 
    ```
    brew install direnv
    ```

3. Create a `.direnv` file in the home dir (`~/.direnvrc`) with [this](https://github.com/paddyroddy/dotfiles/blob/main/.direnvrc) content

4. Add the following to `.zshrc` (refs: [here](https://github.com/paddyroddy/dotfiles/blob/40b0cf91b814b67a0ac63e1b41991f3275f3d7a2/.zsh_variables#L81), [here](https://humanscode.com/better-python-environment-management-for-anaconda)  and [here](https://github.com/direnv/direnv/wiki/Python#zsh))
    ```
    setopt PROMPT_SUBST 
    show_conda_env() {
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        echo "($(basename $CONDA_DEFAULT_ENV)) "
    fi
    }
    
    PS1='$(show_conda_env)'$PS1
    [[ -f ~/.direnvrc ]] && eval "$(direnv hook zsh)"
    ```

5. To link a specific directory to a `conda` environment, create a file at the directory with the name `.envrc` and with the following content:
		`layout anaconda <name of the environment>`
   If not specified, the name of the environment is assumed to be the same as the parent folder name.

6. For extra fanciness ✨: 
    `pip install lolcat` for nice colouring
