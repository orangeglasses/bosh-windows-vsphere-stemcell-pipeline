FROM ruby:2.3.4

MAINTAINER Ruurd Keizer

RUN apt-get update && apt-get install -y curl git-core sshpass unzip jq

ADD assets assets/
#RUN assets/VMware-ovftool-4.2.0-4586971-lin.x86_64.bundle 

# Cache some computationally intensive gems.
RUN gem install nokogiri -v "=1.7.0.1"
RUN gem install ffi -v "=1.9.18"

# Install go.
RUN wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz && tar -xvf go1.8.1.linux-amd64.tar.gz && rm go1.8.1.linux-amd64.tar.gz && mv go /usr/local
# Setup go env.
ENV GOROOT=/usr/local/go GOPATH=/ 
ENV PATH "$GOPATH/bin:$GOROOT/bin:$PATH"
