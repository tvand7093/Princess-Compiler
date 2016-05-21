#!/bin/bash

if [[ $TRAVIS_OS_NAME == 'linux' ]]; then
	if [ "$CXX" == "g++" ]; then 
		# Add package url for g++ with c++11 support
		sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
	fi
	
	if [ "$CXX" == "clang++" ]; then 
		# Add package url for clang++ with c++11 support
		sudo add-apt-repository -y ppa:h-rayflood/llvm; 
	fi
	
	# Update the available packages list
	sudo apt-get update -qq
fi