FROM ubuntu

MAINTAINER Ruurd Keizer

RUN apt-get update

#INSTALL curl
RUN apt-get install -y curl

#INSTALL git
RUN apt-get install -y git-core

#INSTALL RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable
# AND RUBY v 2.3.3
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3.4"
# AND bundler gem
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
