FROM codercom/code-server

# configure git
RUN git config --global user.email "khanh.doth@gmail.com"
RUN git config --global user.name "khanhdoth"
RUN git config --global credential.helper store