[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
c(){
	clear
}
c

DISABLE_AUTO_TITLE="true"
#autocomplete
autoload -U compinit promptinit
compinit
promptinit
setopt COMPLETE_ALIASES
fpath=(/usr/local/share/zsh-completions $fpath)

#history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

#theme
zstyle ':completion:*' menu select
PROMPT=" %B%~ $ "

#keybinds
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
        autoload -Uz add-zle-hook-widget
        function zle_application_mode_start { echoti smkx }
        function zle_application_mode_stop { echoti rmkx }
        add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
        add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

#aliases
alias ytdlmp3='yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s"'
alias ytdl='yt-dlp -ciw -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s"'
alias novid='mpv --no-video'
alias sx='startx'
alias btop='btop --utf-force'
alias ls='ls --color=auto'
alias cvd='civ-v-drafter'
alias wgetdir='wget -r -np -R "index.html*"'
alias git-key='xclip ~/documents/git-key -selection clipboard'

#functions
zero(){
	drive="$1"
	sudo dd if=/dev/random of=$drive bs=16M status=progress && sync
}

up(){
	yay -Syyu
}

temp(){
	all="$(sensors)"
	cpu="$(echo $all | grep 'Package id 0' | awk '{printf $4"\n"}' | sed 's/+//g')"
	
	echo "cpu: $cpu"
}

export PATH=$HOME"/platform-tools:$PATH"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
c
