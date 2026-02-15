alias lua=lua5.4
alias py=python3
alias gpp=g++
alias update='pkg update && pkg upgrade'
alias lg=lazygit

mkcd() {
     mkdir -p "$1" && cd "$1"
}

set_prompt() {
    local branch
    branch=$(git branch --show-current 2>/dev/null)
                
    local git_status=""
    if [ -n "$branch" ]; then
        local status_output
        status_output=$(git status --short 2>/dev/null)
        local has_unstaged=false
        local has_staged=false
        while IFS= read -r line; do
            case "${line:0:2}" in
                "??")
                    has_unstaged=true;;
                " M"|" D"|" A"|" R"|" C"|" U")
                    has_unstaged=true;;
                "M "|"D "|"A "|"R "|"C ")
                    has_staged=true;;
                "MM"|"MD"|"AM"|"AD"|"RM"|"RD")
                    has_unstaged=true
                    has_staged=true;;
            esac
        done <<< "${status_output}"
        if [ "${has_unstaged}" == true ]; then
            git_status="●"
        fi

        if [ "${has_staged}" == true ]; then
            git_status="${git_status}○"
        fi

        # 远程状态
        local ahead behind
        ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null)
        behind=$(git rev-list --count HEAD..@{u} 2>/dev/null)

        if [ "$ahead" -gt 0 ] 2>/dev/null && [ "$behind" -gt 0 ] 2>/dev/null; then
            git_status="${git_status}⬍"  # 粗的双向箭头
        elif [ "$ahead" -gt 0 ] 2>/dev/null; then
            git_status="${git_status}⬆"  # 粗的上箭头
        elif [ "$behind" -gt 0 ] 2>/dev/null; then
            git_status="${git_status}⬇"  # 粗的下箭头
        fi

        PS1="(bash) \[\033[01;32m\]\w \[\033[01;33m\]└ $branch\[\033[38;5;214m\]${git_status:+" (${git_status})"}\[\033[00m\] \$ "
    else
        PS1="(bash) \[\033[01;32m\]\w\[\033[00m\] \$ "
    fi
}

PROMPT_COMMAND=set_prompt
