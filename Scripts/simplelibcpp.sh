#!/usr/bin/zsh

# --------------------------
# Storing Arguments...
# --------------------------
echo "Parsing project name and executable name ..."

# Default to C++20 standard if not specified.
CXX_STANDARD=20

while getopts "n:h:s:" arg; do
  case $arg in
    n) PROJECT_NAME=$OPTARG;;
    h) HEADER_CPP_FILE=$OPTARG;;
    s) CXX_STANDARD=$OPTARG;;
  esac
done
EXECUTABLE_NAME="${PROJECT_NAME}_exe"

# --------------------------
# Creating project folder...
# --------------------------
echo "Creating project folder and other files..."
echo "Project name: $PROJECT_NAME | Executable name: $EXECUTABLE_NAME"

mkdir $PROJECT_NAME
cd $PROJECT_NAME
mkdir build
touch "${HEADER_CPP_FILE}.h"
touch "${HEADER_CPP_FILE}.cpp"
touch main.cpp
echo "
#include <iostream>
#include <string>

int main() {
    std::cout << std::endl;
    std::cout << \"All done!\" << std::endl;
    std::cout << \"NOTE: Please change minimum required CMake version (if you want) in CMakeLists.txt\" << std::endl;
    return 0;
}
" >> main.cpp
sed -i '1d' main.cpp # Delete first skipped line

# --------------------------
# Creating CMakeLists.txt...
# --------------------------
echo "Configuring CMake with C++$CXX_STANDARD standard..."

touch CMakeLists.txt
echo "cmake_minimum_required(VERSION 3.12)" >> CMakeLists.txt
echo "project($PROJECT_NAME)" >> CMakeLists.txt
echo "set(CMAKE_EXPORT_COMPILE_COMMANDS ON)" >> CMakeLists.txt
echo "set(CMAKE_CXX_STANDARD $CXX_STANDARD)" >> CMakeLists.txt
echo "set(CMAKE_CXX_STANDARD_REQUIRED ON)" >> CMakeLists.txt
echo "set(CMAKE_CXX_EXTENSIONS OFF)" >> CMakeLists.txt
echo "add_executable($EXECUTABLE_NAME main.cpp $HEADER_CPP_FILE.cpp)" >> CMakeLists.txt
echo "target_include_directories($EXECUTABLE_NAME PUBLIC $CMAKE_CURRENT_SOURCE_DIR)" >> CMakeLists.txt

# --------------------------
# Creating .clangd...
# --------------------------
echo "Creating .clangd file..."
touch .clangd
echo "CompileFlags:" >> .clangd
echo "  CompilationDatabase: \"build\"" >> .clangd
