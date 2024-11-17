#!/usr/bin/zsh

# This script assumes the following:
# 1. The project name is the same as the directory name.
#    Ex: if your project is in /home/username/Desktop/MyProject,
#    then the directory name is MyProject.
# 2. The executable name is the same as the directory name
#    with "_exe" appended.
# 3. The build directory is in the root of the project directory.
# 4. The CMakelists.txt file is in the root of the project directory.
# 5. main.cpp is in the root of the project directory.

DIRNAME=${PWD##*/}
EXENAME=$DIRNAME"_exe"

# Set the compiler to GCC
export CC=gcc
export CXX=g++

# Set the compiler to Clang
# export CC=clang
# export CXX=clang++

# If build directory does not exist, create it.
if [ ! -d "build" ]; then
    mkdir build
fi

cd build && cmake .. && make && ./$EXENAME
cd ..
