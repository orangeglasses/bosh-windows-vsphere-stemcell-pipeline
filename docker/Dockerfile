FROM ruby:2.3.4

MAINTAINER Ruurd Keizer

RUN apt-get update && apt-get install -y curl git-core sshpass unzip

# Cache some computationally intensive gems.
RUN gem install nokogiri -v "=1.7.0.1"
RUN gem install ffi -v "=1.9.18"
