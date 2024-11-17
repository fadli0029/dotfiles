#!/usr/bin/zsh

# --------------------------
# Storing Arguments...
# --------------------------
echo "Parsing project name and executable name ..."

# Default to C++20 standard if not specified.
CXX_STANDARD=20
EXECUTABLE_NAME=""

# Parse options
while getopts "s:e:" arg; do
  case $arg in
    s) CXX_STANDARD=$OPTARG;;
    e) EXECUTABLE_NAME=$OPTARG;;
  esac
done

# Shift to remove parsed options and leave the remaining arguments
shift $((OPTIND-1))

# Check if the project name is provided
if [ -z "$1" ]; then
  echo "Error: Project name is required."
  echo "Usage: $0 <project_name> [-s <cxx_standard>] [-e <executable_name>]"
  exit 1
fi

# Set project name and executable name
PROJECT_NAME=$1

# Set default executable name if not provided
if [ -z "$EXECUTABLE_NAME" ]; then
  EXECUTABLE_NAME="${PROJECT_NAME}_exe"
fi

# --------------------------
# Creating project folder...
# --------------------------
echo "Creating project folder and other files..."
echo "Project name: $PROJECT_NAME | Executable name: $EXECUTABLE_NAME"

mkdir $PROJECT_NAME
cd $PROJECT_NAME
touch main.cpp
echo "
#include \"bits/stdc++.h\"
using namespace std;
int main() {
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
echo "add_executable($EXECUTABLE_NAME main.cpp)" >> CMakeLists.txt

# --------------------------
# Creating .clangd...
# --------------------------
echo "Creating .clangd file..."
touch .clangd
echo "CompileFlags:" >> .clangd
echo "  CompilationDatabase: \"build\"" >> .clangd
echo ""

echo "===> DONE!"
