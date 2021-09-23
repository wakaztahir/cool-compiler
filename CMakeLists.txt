cmake_minimum_required(VERSION 3.19)
project(CoolCompiler)

set(CMAKE_CXX_STANDARD 14)

find_package(FLEX REQUIRED)

flex_target(MyLexer main.l ${CMAKE_CURRENT_BINARY_DIR}/lexer.cpp)

add_executable(CoolCompiler main.cpp)