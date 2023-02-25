#!/usr/bin/env bash

wget -O "/tmp/ruby-build.tar.gz" "https://github.com/rbenv/ruby-build/archive/refs/tags/v20230222.tar.gz"
pushd /tmp
tar -xzf ruby-build.tar.gz
PREFIX=/usr/local ./ruby-build-*/install.sh
popd
mkdir /usr/local/rubies/ruby-3.0.5
ruby-build 3.0.5 /usr/local/rubies/ruby-3.0.5

ln -s /usr/local/rubies/ruby-3.0.5/bin/ruby /usr/local/bin/ruby
ln -s /usr/local/rubies/ruby-3.0.5/bin/gem /usr/local/bin/gem

gem update --system
gem update

pushd ../
bundle install
popd
