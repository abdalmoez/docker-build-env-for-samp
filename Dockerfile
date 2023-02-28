FROM i386/debian:10

LABEL AUTHOR="BOURAOUI Al-Moez L.A"
LABEL EMAIL="bouraoui.almoez.la@gmail.com"
LABEL VERSION="0.1"

RUN groupadd -r samp -g 433 && \
    useradd -m -u 431 -r -g samp -s /sbin/nologin -c "Docker image user" samp

USER root

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y build-essential cmake systemd-coredump gdb vim locate git curl wget zip tree

USER samp
WORKDIR /home/samp/

# .bashrc
RUN curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh
RUN echo "export HISTIGNORE=\$'[ \t]*:&:[fb]g:exit'" >> ~/.bashrc
RUN echo "alias grep='grep --color=always'" >> ~/.bashrc
RUN echo "alias ls='ls -h --color=tty'" >> ~/.bashrc
RUN echo "alias ll='ls -l'" >> ~/.bashrc
RUN echo "alias la='ls -A'" >> ~/.bashrc
RUN echo "alias l='ls -CF'" >> ~/.bashrc
RUN echo "source ~/.git-prompt.sh" >> ~/.bashrc
RUN echo "export PS1='\\\[\\\033[01;34m\\\]\$(date +%Y.%m.%d) \\\[\\\033[35m\\\]\\\t\\\[\\\033]0; \$TITLEPREFIX:\$PWD\\\007\\\] \\\[\\\033[32m\\\]\\\u@\\\h:\\\[\\\033[33m\\\]\\\w\\\[\\\033[36m\\\]\`__git_ps1\`\\\[\\\033[40;0m\\\] \\\n\$ '" >> ~/.bashrc
