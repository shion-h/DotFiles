# (d) is default on

# ------------------------------
# General Settings
# ------------------------------
export EDITOR=vim        # $B%(%G%#%?$r(Bvim$B$K@_Dj(B
export LANG=ja_JP.UTF-8  # $BJ8;z%3!<%I$r(BUTF-8$B$K@_Dj(B
export KCODE=u           # KCODE$B$K(BUTF-8$B$r@_Dj(B
export AUTOFEATURE=true  # autotest$B$G(Bfeature$B$rF0$+$9(B

bindkey -v              # $B%-!<%P%$%s%I$r(Bvi$B%b!<%I$K@_Dj(B

# cd -$B$N$"$H%?%V$GMzNr(B
setopt auto_pushd        # cd$B;~$K%G%#%l%/%H%j%9%?%C%/$K(Bpushd$B$9$k(B
#setopt correct           # $B%3%^%s%I$N%9%Z%k$rD{@5$9$k(B
setopt prompt_subst      # $B%W%m%s%W%HDj5AFb$GJQ?tCV49$d%3%^%s%ICV49$r07$&(B
setopt notify            # $B%P%C%/%0%i%&%s%I%8%g%V$N>uBVJQ2=$rB(;~Js9p$9$k(B
#setopt equals            # =command$B$r(B`which command`$B$HF1$8=hM}$K$9$k(B

### Complement ###
autoload -U compinit; compinit # $BJd405!G=$rM-8z$K$9$k(B
setopt auto_list               # $BJd408uJd$r0lMw$GI=<($9$k(B(d)
setopt auto_menu               # $BJd40%-!<O"BG$GJd408uJd$r=g$KI=<($9$k(B(d)
setopt list_packed             # $BJd408uJd$r$G$-$k$@$15M$a$FI=<($9$k(B
setopt list_types              # $BJd408uJd$K%U%!%$%k$N<oN`$bI=<($9$k(B
bindkey "^[[Z" reverse-menu-complete  # Shift-Tab$B$GJd408uJd$r5U=g$9$k(B("\e[Z"$B$G$bF0:n$9$k(B)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # $BJd40;~$KBgJ8;z>.J8;z$r6hJL$7$J$$(B

### History ###
HISTFILE=~/Dropbox/Study/Memo/.zsh_history   # $B%R%9%H%j$rJ]B8$9$k%U%!%$%k(B
HISTSIZE=10000            # $B%a%b%j$KJ]B8$5$l$k%R%9%H%j$N7o?t(B
SAVEHIST=1000000            # $BJ]B8$5$l$k%R%9%H%j$N7o?t(B
setopt bang_hist          # !$B$r;H$C$?%R%9%H%jE83+$r9T$&(B(d)
setopt extended_history   # $B%R%9%H%j$K<B9T;~4V$bJ]B8$9$k(B
setopt hist_ignore_dups   # $BD>A0$HF1$8%3%^%s%I$O%R%9%H%j$KDI2C$7$J$$(B
setopt share_history      # $BB>$N%7%'%k$N%R%9%H%j$r%j%"%k%?%$%`$G6&M-$9$k(B
setopt hist_reduce_blanks # $BM>J,$J%9%Z!<%9$r:o=|$7$F%R%9%H%j$KJ]B8$9$k(B

# $B%^%C%A$7$?%3%^%s%I$N%R%9%H%j$rI=<($G$-$k$h$&$K$9$k(B
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# $B$9$Y$F$N%R%9%H%j$rI=<($9$k(B
function history-all { history -E 1 }

# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# $B?'$N@_Dj(B
export LSCOLORS=Exfxcxdxbxegedabagacad
# $BJd40;~$N?'$N@_Dj(B
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORS$B$H$O!)(B
export ZLS_COLORS=$LS_COLORS
# ls$B%3%^%s%I;~!"<+F0$G?'$,$D$/(B(ls -G$B$N$h$&$J$b$N!)(B)
export CLICOLOR=true
# $BJd408uJd$K?'$rIU$1$k(B
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ls $B$N?'!)(B
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=45;34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -F --color"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

### Prompt ###
# $B%W%m%s%W%H$K?'$rIU$1$k(B
autoload -U colors; colors
# $B0lHL%f!<%6;~(B
tmp_prompt="%F{cyan}[%n@%D{%m/%d %T}]%~$%f "
#tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt=""
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# root$B%f!<%6;~(B($BB@;z$K$7!"%"%s%@!<%P!<$r$D$1$k(B)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # $BDL>o$N%W%m%s%W%H(B
PROMPT2=$tmp_prompt2  # $B%;%+%s%@%j$N%W%m%s%W%H(B($B%3%^%s%I$,(B2$B9T0J>e$N;~$KI=<($5$l$k(B)
RPROMPT=$tmp_rprompt  # $B1&B&$N%W%m%s%W%H(B
SPROMPT=$tmp_sprompt  # $B%9%Z%kD{@5MQ%W%m%s%W%H(B
# SSH$B%m%0%$%s;~$N%W%m%s%W%H(B
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

#Title
precmd() {
    [[ -t 1 ]] || return
    case $TERM in
        *xterm*|rxvt|(dt|k|E)term)
        print -Pn "\e]2;[%~]\a"    
	;;
        # screen)
        #      #print -Pn "\e]0;[%n@%m %~] [%l]\a"
        #      print -Pn "\e]0;[%n@%m %~]\a"
        #      ;;
    esac
}


# ------------------------------
# Other Settings
# ------------------------------

### Aliases ###
#$B;~9o$rI=<($5$;$k(B
alias history='history -E'

# cd$B%3%^%s%I<B9T8e!"(Bls$B$r<B9T$9$k(B
function cd() {
  builtin cd $@ && ls;
}

#$B>!<j$K%U%!%$%kL>$@$HG'<1$7$J$$(B
setopt nonomatch

#vim$B;EMM(B
bindkey -v
#$B0dEA8&(B
alias idenken='ssh -Y shion-h@gw.ddbj.nig.ac.jp'
alias idenken2='ssh -Y shion-h@gw2.ddbj.nig.ac.jp'
# $B$"$C$A$N%7%'%k$,(Bbash$B$G$J$$$H$$$1$J$$(B
function idenken-scp-up(){
	scp $@ shion-h@gw.ddbj.nig.ac.jp:/home/shion-h/data
}
alias idenken-scp-up=idenken-scp-up

function idenken-scp-down(){
	scp shion-h@gw.ddbj.nig.ac.jp:/home/shion-h/$1 ./
}
alias idenken-scp-down=idenken-scp-down

#git
function gitup(){
	git add $1
	git commit -m $2
	git push origin master
}
alias gitup=gitup

# git remote add origin git@gitlab.com:little1buffer/home.git

# added by Miniconda3 4.1.11 installer
export PATH="/home/shion/miniconda3/bin:$PATH"
#dictionary
function dict() {
    grep $1 /home/shion/Downloads/gene-utf8.txt -A 1 -wi --color
}
alias dict=dict
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'

# make vim warning unvisible
export NO_AT_BRIDGE=1

# boost
export LD_LIBRARY_PATH=/usr/local/lib/

# zotero
export PATH="$PATH:/home/shion/.local/bin/Zotero_linux-x86_64"

# tmux$B$G5/F0$r%G%U%)$K(B
# [[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

MDIR="/home/shion/metaphlan"
export PATH=$MDIR:$MDIR/utils/:$PATH
