cmake_minimum_required(VERSION 3.22)
project(mcl C)
add_library(mcl SHARED jre_launcher.c)
target_link_libraries(mcl log android)
