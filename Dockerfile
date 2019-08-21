FROM golang:latest

RUN apt-get update && \
  apt-get install neovim -y && \
  apt-get install tmux -y && \
  apt-get install nodejs -y && \
  apt-get install npm -y && \
  apt-get install zsh -y && \
  apt-get install fonts-powerline -y && \
  npm install -g yarn && \
  mkdir -p /workspace && \
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
  mkdir -p /root/.config/nvim && \
  cd /root && \
  git clone https://github.com/gpakosz/.tmux.git && \
  ln -s -f .tmux/.tmux.conf && \
  cp .tmux/.tmux.conf.local .

COPY ./nvim/ /root/.config/nvim

RUN vim +PlugInstall +qall!

WORKDIR /root/workspace

CMD ["zsh"]
