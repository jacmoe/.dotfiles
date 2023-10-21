# Suppress fish's intro message
set fish_greeting

fish_add_path -g /usr/sbin ~/.local/bin ~/bin ~/Zotero_linux-x86_64 ~/zig/zig-0.11.0-dev ~/zig/zls/zig-out/bin ~/.node/bin ~/go/bin ~/odin/Odin ~/odin/ols ~/sources/gempress
set -gx PROJECT_PATHS ~/projects
set -gx GOPATH ~/go

set -Ux PAGER less
set -Ux EDITOR micro
set -Ux VISUAL micro
set -Ux NNN_PLUG 'f:finder;v:imgview'
set -Ux NNN_OPENER '/home/moena/.local/bin/nnnopen'
set -Ux NNN_BMS "d:$HOME/Documents;p:$HOME/projects/moena-dwm;D:$HOME/Downloads/;b:$HOME/builds/dwm/finaldwm;c:$HOME/.config;l:$HOME/.local/share"
set -Ux FZF_DEFAULT_OPTS "--layout=reverse --height 40%"
set -Ux NNN_USE_EDITOR 1

abbr -a cp cp -i
alias cp="cp -i"
#abbr -a sudo doas
abbr -a ls lsd -tF
abbr -a l lsd -tF
abbr gl lsd -ltr
abbr -a c clear
abbr -a q exit
abbr -a weather wego
abbr -a nemacs emacsclient -c -nw

abbr -a tt tt --theme gruvbox

abbr -a fedoraup sudo dnf upgrade --refresh
abbr -a feinst sudo dnf install 
abbr -a fefind sudo dnf search 

abbr -a lg lazygit
abbr gal sxiv -f .

abbr -a build ./build.sh
abbr -a serve ./serve.sh

abbr -a dotdir cd ~/.dotfiles
abbr -a conf cd ~/.config
abbr -a downl cd ~/Downloads
abbr -a docs cd ~/Documents
abbr -a doomdir cd ~/.doom.d
abbr -a skriv cd ~/Dropbox/skriv
abbr -a nvconf cd ~/.config/nvim
abbr -a ngdir cd /usr/share/nginx/html
abbr -a ngconf cd /etc/nginx/
abbr -a maindoom source ~/main_doom.sh
abbr -a progdoom source ~/prog_doom.sh

abbr -a mi --position anywhere micro
abbr -a n n -Rd

abbr -a mimo --position anywhere micro ~/.config/xmonad/xmonad.hs
abbr -a mibar --position anywhere micro ~/.config/xmobar/xmobarrc
abbr -a miterm --position anywhere micro ~/.config/wezterm/wezterm.lua
abbr -a mifish --position anywhere micro ~/.config/fish/config.fish
abbr -a mimi --position anywhere micro ~/.config/micro/settings.json
abbr -a mimib --position anywhere micro ~/.config/micro/bindings.json
abbr -a mibook --position anywhere micro ~/.config/rofi/bookmarks/.bookmarks

abbr -a nifish --position anywhere nvim ~/.config/fish/config.fish
abbr -a nimi --position anywhere nvim ~/.config/micro/settings.json
abbr -a nimib --position anywhere nvim ~/.config/micro/bindings.json
abbr -a nnvim nvim ~/.config/nvim/init.lua

abbr -a fishreload --position anywhere source ~/.config/fish/config.fish

function se
    du -a ~/projects/* | awk '{print $2}' | fzf | xargs -I {} emacs {}
end
function sm
    du -a ~/projects/* | awk '{print $2}' | fzf | xargs -r ~/bin/micro
end

# List of installed plugins:
# https://github.com/oh-my-fish/theme-bobthefish
# https://github.com/PatrickF1/fzf.fish
# https://github.com/jethrokuan/z
# https://github.com/danhper/fish-ssh-agent
# https://github.com/oh-my-fish/plugin-pj
# https://github.com/oh-my-fish/plugin-license
# https://github.com/oh-my-fish/plugin-grc

# Bobthefish theme options
set -g theme_date_format "+%a %I:%M"
set -g theme_date_timezone Europe/Copenhagen
set -g theme_nerd_fonts yes
set -g theme_color_scheme solarized


# Fzf options
# Ctrl+Alt+F (File)
fzf_configure_bindings --directory
# Ctrl+Alt+L (Log)
fzf_configure_bindings --git_log
# Ctrl+Alt+S (Status)
fzf_configure_bindings --git_status
# Ctrl+R (Reverse)
fzf_configure_bindings --history
# Ctrl+Alt+P (Process)
fzf_configure_bindings --processes
# Ctrl+V (Variable)
fzf_configure_bindings --variables
