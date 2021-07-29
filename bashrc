# vi mode utils
set -o vi
bind '"jk":"\e"'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "/Users/qxie21/Library/Python/3.7/bin" ] ; then 
    PATH="/Users/qxie21/Library/Python/3.7/bin:$PATH"
fi

# bbproxy
alias ext_proxy='HTTP_PROXY=http://proxy.bloomberg.com:81 HTTPS_PROXY=http://proxy.bloomberg.com:81 NO_PROXY=blp-dpkg.dev.bloomberg.com,artprod.dev.bloomberg.com'
alias dev_proxy='http_proxy=http://bproxy.tdmz1.bloomberg.com:80 https_proxy=http://bproxy.tdmz1.bloomberg.com:80'
alias java_proxy='JAVA_OPTS="-Dhttps.proxyHost=proxy.bloomberg.com -Dhttps.proxyPort=81"'
alias ext_docer="docker run -e HTTP_PROXY=http://proxy.bloomberg.com:81 -e HTTPS_PROXY=http://proxy.bloomberg.com:81"

# dockerbuild c++
alias dockerbuild='docker run -m 5g -v `pwd`:`pwd` -v "$HOME"/bval/build:"$HOME"/bval/build -e APP_DIR=`pwd` -e BUILD_DIR="$HOME"/bval/build --rm -it cmakebuild /bin/sh'
alias dockerrobo='docker run -m 5g -v `pwd`:`pwd` -e APP_DIR=`pwd` --rm -it qxie21:robobuild /bin/sh'

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


# llvm
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# tmux
export EDITOR="vim"


# data_lake
export M2_HOME="/usr/local/Cellar/maven/3.8.1/libexec"
export ARTIFACTORY_USER="qxie21"
export ARTIFACTORY_PASSWORD="AKCp8jQJGrtL8eELv5ZWHJSn8tWXMopyUesuCnYZu88sbHi53F8TXcXrLpeuAMgpjRgxL6FXu"
export GITHUB_TOKEN="9a77d570712f0e5fd221fb4ede75e6611d652db9"
export CODEGEN_JAR="${HOME}/data/condegen.jar"



export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/Cellar/apache-flink/1.13.0/libexec/bin:$PATH"
export PATH="/usr/local/Cellar/maven/3.8.1/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
