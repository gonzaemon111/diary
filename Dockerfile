FROM ruby:2.6.1

ARG USER="diary"
ARG UID="3500"
ARG GROUP="diary"
ARG GID="3500"
ARG WORKSPACE=/home/diary

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y vim less

RUN apt-get install -y build-essential libpq-dev nodejs && \
    gem install bundler

RUN mkdir -p $WORKSPACE
WORKDIR $WORKSPACE
COPY / ./
RUN bundle install 


RUN groupadd -r --gid $GID $GROUP && \
    useradd -r --uid $UID --gid $GID $USER && \
    chown -R $USER:$GROUP $WORKSPACE

USER $USER
EXPOSE  3000
