# ====================
# Powerlevel10k Instant Prompt (保持在最顶部)
# ====================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ====================
# Oh My Zsh 配置
# ====================
export ZSH=~/.oh-my-zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"

# ====================
# 插件配置
# ====================
plugins=(
    z
    git
    python
    pip
    node
    npm
    nvm 
    zsh-autosuggestions
    fast-syntax-highlighting
    fzf-tab
    zsh-completions
    you-should-use
)

# ====================
# 加载 Oh My Zsh
# ====================
source $ZSH/oh-my-zsh.sh

# ====================
# Powerlevel10k 配置
# ====================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ====================
# 别名配置 (从备份移植)
# ====================
alias lua=lua5.4
alias py=python3
alias gpp=g++
alias todo=task
alias update='apt update && apt upgrade'
alias lg=lazygit
alias activate='eval $(poetry env activate)'

# ====================
# 自定义函数 (从备份移植)
# ====================
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# ====================
# 插件增强配置 (从备份移植)
# ====================

# zsh-autosuggestions 配置
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)

# fzf-tab 完整配置
zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' prefix ''
zstyle ':fzf-tab:*' switch-group ',' '.'

# 文件补全预览
zstyle ':fzf-tab:complete:*:*' fzf-preview '
  if [[ -d $realpath ]]; then
    ls --color=always $realpath
  elif [[ -f $realpath ]]; then
    bat --color=always $realpath 2>/dev/null || cat $realpath
  fi'

# 命令补全预览
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'

# 进程补全预览
zstyle ':fzf-tab:complete:kill:*' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'

# 环境变量补全预览
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

# 加载 fzf 键绑定
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ====================
# Zsh 选项设置 (从备份移植)
# ====================
setopt AUTO_CD           # 直接输入目录名即可进入
setopt CORRECT           # 拼写纠正
setopt INTERACTIVE_COMMENTS  # 在交互模式中允许注释

# ====================
# 历史配置 (从备份移植)
# ====================
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY     # 在不同终端间共享历史
setopt APPEND_HISTORY    # 追加而不是覆盖历史文件

# ====================
# 导入自定义PATH (从备份移植)
# ====================
export PATH="$HOME/.local/bin:$PATH"


# ====================
# 设置默认
# ====================
export EDITOR=nvim
export VISUAL=nvim


# pnpm
export PNPM_HOME="/data/data/com.termux/files/home"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# qlty
export QLTY_INSTALL="$HOME/.qlty"
export PATH="$QLTY_INSTALL/bin:$PATH"
