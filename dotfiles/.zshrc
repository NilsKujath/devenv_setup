# ===== ALIASES =====
alias vim="nvim"
alias tree="tree -a -I .git -L 2"
alias mysqls="mysql -u root -p"
alias mysqlstart="mysql.server start"
alias mysqlstop="mysql.server stop"

# ===== CONDA PACKAGE MANAGER =====
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nilskujath/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "Users/nilskujath/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "Users/nilskujath/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="Users/nilskujath/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
