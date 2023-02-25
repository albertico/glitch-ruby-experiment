#!/usr/bin/env bash

echo "Downloading ruby-build package..."
wget -O "/tmp/ruby-build.tar.gz" "https://github.com/rbenv/ruby-build/archive/refs/tags/v20230222.tar.gz"

pushd /tmp
echo "Extracting ruby-build package..."
tar -xzf ruby-build.tar.gz
echo "Installing ruby-build..."
PREFIX=$HOME/.local ./ruby-build-*/install.sh
popd

echo "Creating directory '/usr/local/rubies'..."
mkdir -p $HOME/.local/rubies/ruby-3.0.5
echo "Installing Ruby v3.0.5 to '/usr/local/rubies/ruby-3.0.5'..."
ruby-build 3.0.5 $HOME/.local/rubies/ruby-3.0.5
echo "Linking Ruby binaries..."
ln -s $HOME/.local/rubies/ruby-3.0.5/bin/ruby $HOME/.local/bin/ruby
ln -s $HOME/.local/rubies/ruby-3.0.5/bin/gem $HOME/.local/bin/gem

echo "Updating RubyGems..."
gem update --system
echo "Updating default gems..."
gem update

pushd ../
echo "Running 'bundle install'..."
bundle install
popd

echo "Done!"
