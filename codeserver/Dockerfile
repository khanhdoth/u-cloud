FROM codercom/code-server

USER root

# install build dependencies
RUN apt update && \
    apt --assume-yes install wget gnupg gnupg1 gnupg2

# ADD install_kubernetes.sh /
# RUN chmod +x /install_kubernetes.sh

# install extentions
RUN code-server --install-extension mjmcloug.vscode-elixir && \
    code-server --install-extension donjayamanne.githistory && \
    code-server --install-extension ms-vscode.go && \
    code-server --install-extension msjsdiag.vscode-react-native && \
    code-server --install-extension shaharkazaz.git-merger && \
    code-server --install-extension boukichi.git-exclude && \
    code-server --install-extension ms-azuretools.vscode-docker && \
    code-server --install-extension ms-python.python && \
    code-server --install-extension ms-vscode.cpptools && \
    code-server --install-extension msjsdiag.debugger-for-chrome && \
    code-server --install-extension vscode-icons-team.vscode-icons && \
    code-server --install-extension ms-dotnettools.csharp && \
    code-server --install-extension eamodio.gitlens && \
    code-server --install-extension esbenp.prettier-vscode && \
    code-server --install-extension redhat.java && \
    code-server --install-extension formulahendry.code-runner && \
    code-server --install-extension johnpapa.angular2 && \
    code-server --install-extension mikael.angular-beastcode && \
    code-server --install-extension pkief.material-icon-theme && \
    code-server --install-extension ckolkman.vscode-postgres && \
    code-server --install-extension yzane.markdown-pdf && \
    code-server --install-extension telesoho.vscode-markdown-paste-image && \
    code-server --install-extension rebornix.ruby && \
    code-server --install-extension bajdzis.vscode-database && \
    code-server --install-extension ecmel.vscode-html-css && \
    code-server --install-extension davidanson.vscode-markdownlint && \
    code-server --install-extension ritwickdey.liveserver && \
    code-server --install-extension dart-code.dart-code && \
    code-server --install-extension yzhang.markdown-all-in-one && \
    code-server --install-extension ms-kubernetes-tools.vscode-kubernetes-tools && \
    wget https://raw.githubusercontent.com/khanhdoth/vs-extensions/master/msaraiva.surface-0.4.0.vsix && \
    code-server --install-extension msaraiva.surface-0.4.0.vsix

# configure git
RUN git config --global user.email "khanh.doth@gmail.com" && \
    git config --global user.name "khanhdoth" && \
    git config --global credential.helper store
