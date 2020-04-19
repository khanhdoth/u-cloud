FROM codercom/code-server

USER root

# install extentions
RUN code-server --install-extension mjmcloug.vscode-elixir && \
    code-server --install-extension donjayamanne.githistory

# configure git
RUN whoami
RUN git config --global user.email "khanh.doth@gmail.com" && \
    git config --global user.name "khanhdoth" && \
    git config --global credential.helper store
