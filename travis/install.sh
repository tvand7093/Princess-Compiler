#!/bin/bash

if [[ $TRAVIS_OS_NAME == 'linux' ]]; then
	if [ "$CXX" = "g++" ]; then
		# Install g++ C++ 11 support
		sudo apt-get install -qq g++-4.8

		# Use new g++ C++ Version
		export CXX="g++-4.8"
	fi
	
	if [ "$CXX" == "clang++" ]; then
		# Install clang++ C++ 11 support
		sudo apt-get install --allow-unauthenticated -qq clang-3.4
		
		# Use new clang++ C++ Version
		export CXX="clang++-3.4"
	fi
fi