# Suppress fish's intro message
set fish_greeting

fish_add_path -g /usr/sbin ~/.local/bin ~/bin ~/Zotero_linux-x86_64 ~/zig/zig-0.11.0-dev ~/zig/zls/zig-out/bin ~/.node/bin ~/go/bin ~/odin/Odin ~/odin/ols ~/sources/gempress /home/moena/.config/composer/vendor/bin /home/moena/.pyenv/bin /home/moena/.cargo/bin /home/moena/.nimble/bin /home/moena/.choosenim/toolchains/nim-2.2.4/bin/ /home/moena/odin/ /home/moena/odin/ols

set -gx PROJECT_PATHS ~/projects
set -gx GOPATH ~/go

set -gx PYENV_ROOT /home/moena/.pyenv

pyenv init - | source

zoxide init fish --cmd cd | source

set -Ux PAGER less
set -gx EDITOR emacsclient -c -nw
set -gx VISUAL emacsclient -c -nw
set -Ux NNN_PLUG 'f:finder;v:imgview'
set -Ux NNN_OPENER '/home/moena/.local/bin/nnnopen'
set -Ux NNN_BMS "d:$HOME/Documents;p:$HOME/projects/moena-dwm;D:$HOME/Downloads/;b:$HOME/builds/dwm/finaldwm;c:$HOME/.config;l:$HOME/.local/share"
set -Ux FZF_DEFAULT_OPTS "--layout=reverse --height 40%"
set -Ux NNN_USE_EDITOR 1

abbr -a cp cp -i
alias cp="cp -i"
#abbr -a sudo doas
abbr -a ls eza --icons=always
abbr -a l lsd -tF
abbr gl lsd -ltr
abbr -a c clear
abbr -a q exit
abbr -a weather wego
abbr -a nemacs emacsclient -c -nw
abbr -a qui quilt
abbr -a nimr nim c -r src/
abbr -a jj_point jj bookmark set --revision @- main
abbr -a jj_push jj git push -r @-

abbr -a tt tt --theme gruvbox

abbr -a fedoraup sudo dnf upgrade --refresh
abbr -a feinst sudo dnf install 
abbr -a fefind sudo dnf search 

abbr -a lg lazygit
abbr -a gal nsxiv -f .


abbr -a build ./build.sh
abbr -a serve ./serve.sh

abbr -a dotdir cd ~/.dotfiles
abbr -a conf cd ~/.config
abbr -a downl cd ~/Downloads
abbr -a docs cd ~/Documents
abbr -a doomdir cd ~/.doom.d
abbr -a progdir cd ~/.p.doom.d
abbr -a skriv cd ~/Dropbox/skriv
abbr -a nvconf cd ~/.config/nvim
abbr -a ngdir cd /usr/share/nginx/html
abbr -a ngconf cd /etc/nginx/
abbr -a maindoom source ~/main_doom.sh
abbr -a progdoom source ~/prog_doom.sh
abbr -a dwmdir cd ~/sources/moena-dwm/dwm
abbr -a dwldir cd ~/sources/moena-dwl/dwl

abbr -a mi --position anywhere micro
abbr -a n n -Rd -G
abbr -a nano msedit

abbr -a mifish --position anywhere micro ~/.config/fish/config.fish
abbr -a mibook --position anywhere micro ~/.config/rofi/bookmarks/.bookmarks

abbr -a mefish --position anywhere msedit ~/.config/fish/config.fish
abbr -a mebook --position anywhere msedit ~/.config/rofi/bookmarks/.bookmarks

abbr -a nefish --position anywhere ne ~/.config/fish/config.fish

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

# ZVM
set -gx ZVM_INSTALL "$HOME/.zvm/self"
set -gx PATH $PATH "$HOME/.zvm/bin"
set -gx PATH $PATH "$ZVM_INSTALL/"
