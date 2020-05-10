FROM debian

USER root

# install build dependencies
RUN apt update && \
    apt --assume-yes install wget gnupg gnupg1 gnupg2 && \
    wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && \
    dpkg -i erlang-solutions_2.0_all.deb && \
    apt update && \
    apt --assume-yes install esl-erlang elixir npm inotify-tools && \
    npm install -g @angular/cli && \    
    mix local.hex --force && \
    mix local.rebar --force

RUN yes Y | mix archive.install hex phx_new