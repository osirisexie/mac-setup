# vi mode utils
set -o vi
bind '"jk":"\e"'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# bbproxy
alias ext_proxy='http_proxy=http://proxy.bloomberg.com:81 https_proxy=http://proxy.bloomberg.com:81'
alias dev_proxy='http_proxy=http://bproxy.tdmz1.bloomberg.com:80 https_proxy=http://bproxy.tdmz1.bloomberg.com:80'

# dockerbuild c++
alias dockerbuild='docker run -m 5g -v `pwd`:/workarea/app -v "$HOME"/bval/build:/workarea/build --rm -it cmakebuild /bin/sh'

# ls utils
alias ls='ls -G'
alias ll='ls -lG'


# ps1
function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
 }
PS1='
\[\033[1;33m\][\D{%Y-%m-%d %H:%M.%S}]\[\033[0m\]  \[\033[1;35m\]\w\[\033[0m\]$(parse_git_branch)
\[\033[1;36m\][\u.\h]\[\033[0m\]$ '

