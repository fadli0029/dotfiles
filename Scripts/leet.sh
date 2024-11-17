#!/usr/bin/zsh

# --------------------------
# Storing Arguments...
# --------------------------
echo "Parsing project name and executable name ..."

LEETCODE_QUESTION=$1
shift
PROJECT_NAME="${LEETCODE_QUESTION}"
EXECUTABLE_NAME="${LEETCODE_QUESTION}_exe"

CXX_STANDARD=20

while getopts "s:" arg; do
  case $arg in
    s) CXX_STANDARD=$OPTARG;;
  esac
done

# --------------------------
# Creating project folder...
# --------------------------
echo "Creating project folder and other files..."
if [ -d "$PROJECT_NAME" ]; then
  echo "Error: Project folder '$PROJECT_NAME' already exists."
  exit 1
fi
echo "Project name: $PROJECT_NAME | Executable name: $EXECUTABLE_NAME"
mkdir $PROJECT_NAME

# --------------------------
# Generating $LEETCODE_QUESTION.cpp file...
# --------------------------
cd $PROJECT_NAME
leetscrape --number $LEETCODE_QUESTION sol --lang C++
GENERATED_FILE="${LEETCODE_QUESTION}.cpp"

# --------------------------
# Generating helpers.cpp
# --------------------------
# Copy and paster the file helpers.cpp with templated print functions,
# we can use these functions when debugging.
HELPERS_FILE="helpers.cpp"
HELPERS_FILE_PATH="/home/magomed_fadliov/Projects/leetcode/helpers.cpp"
cp $HELPERS_FILE_PATH .

# --------------------------
# Generating main.cpp file...
# --------------------------
# Paste the contents of the generated file into main.cpp
# then, delete the generated file
touch main.cpp
echo "
#include \"bits/stdc++.h\"
#include \"$HELPERS_FILE\"
using namespace std;

PASTE


int main() {
    Solution sol;
    return 0;
}
" >> main.cpp
sed -i '1d' main.cpp # Delete first skipped line

# Insert the generated file into main.cpp after the placeholder line
sed -i "/PASTE/r ${GENERATED_FILE}" main.cpp

# Delete the placeholder line
sed -i '/PASTE/d' main.cpp

# Delete the generated file
rm ${LEETCODE_QUESTION}.cpp


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
echo "add_executable($EXECUTABLE_NAME main.cpp $HELPERS_FILE)" >> CMakeLists.txt

# --------------------------
# Creating .clangd...
# --------------------------
echo "Creating .clangd file..."
touch .clangd
echo "CompileFlags:" >> .clangd
echo "  CompilationDatabase: \"build\"" >> .clangd

# --------------------------
# Finishing up setup...
# --------------------------
mkdir build
cd build
cmake ..
cmake --build .
./$EXECUTABLE_NAME
echo ""
echo "Launching Vim (Neovim) ..."
cd ..
vim main.cpp
