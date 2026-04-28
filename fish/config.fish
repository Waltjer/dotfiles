if status is-interactive
    # Starship custom prompt
    starship init fish | source

    # Direnv + Zoxide
    command -v direnv &>/dev/null && direnv hook fish | source
    command -v zoxide &>/dev/null && zoxide init fish --cmd cd | source

    # Better ls
    alias ls='eza --icons --group-directories-first -1'

    # Abbrs
    abbr lg lazygit
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gc 'git commit -am'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gst 'git stash'
    abbr gsp 'git stash pop'
    abbr gp 'git push'
    abbr gpl 'git pull'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gbd 'git branch -d'
    abbr gco 'git checkout'
    abbr gsh 'git show'

    abbr l ls
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'

    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2>/dev/null

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end

    # Custom fish config
    source ~/.config/caelestia/user-config.fish 2>/dev/null
end

# Alias to mount partitions
alias work 'udisksctl mount -b /dev/nvme0n1p5'
alias ent 'udisksctl mount -b /dev/nvme0n1p9'

# ALias to update dotfiles
alias dots='cd ~/dotfiles && make packages-save && git add . && git status'
alias dots-push='cd ~/dotfiles && make packages-save && git add . && git commit -m "chore: update dotfiles $(date +%Y-%m-%d)" && git push'

# Ollama
export ANTHROPIC_AUTH_TOKEN=ollama
export ANTHROPIC_BASE_URL=http://localhost:11434
# export ANTHROPIC_API_KEY=""
export ANTHROPIC_DEFAULT_HAIKU_MODEL="gemma4:e4b"
export ANTHROPIC_DEFAULT_SONNET_MODEL="gemma4:31b-cloud"
# export ANTHROPIC_DEFAULT_OPUS_MODEL="qwen3:72b-q4_K_M"
