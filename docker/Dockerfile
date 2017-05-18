FROM ruby:2.3.4

MAINTAINER Ruurd Keizer

RUN apt-get update && apt-get install -y curl git-core apt-transport-https ca-certificates

# Powershell key & repo. Note: because these are https repos, the apt-get install lines cant be combined.
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list
RUN apt-get update && apt-get install -y powershell

# Cache some computationally intensive gems.
RUN gem install nokogiri -v "=1.7.0.1"
RUN gem install ffi -v "=1.9.18"
