if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias s='startx'
alias ls='exa --icons'
alias g='git'
alias lf='lfrun'
alias s='startx'
alias po="podman"
# alias docker='podmon'
alias his='history|peco --layout=bottom-up'
export GOBIN=/home/rishavmngo/go/bin/
export GO111MODULE="on"

# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export ANDROID_HOME=$HOME/Android/Sdk
export SDK=$HOME/Android/Sdk
zoxide init fish | source
