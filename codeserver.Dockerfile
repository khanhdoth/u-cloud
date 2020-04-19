FROM codercom/code-server

# configure git
USER root
RUN whoami
RUN git config --global user.email "khanh.doth@gmail.com"
RUN git config --global user.name "khanhdoth"
RUN git config --global credential.helper store
