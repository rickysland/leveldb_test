cmake_minimum_required(VERSION 3.5)

add_definitions(-DLEVELDB_PLATFORM_POSIX)
add_definitions("-g")

project(test_leveldb)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/output/")

include_directories (./leveldb/include)
add_subdirectory(leveldb)
add_executable(test_leveldb test_level.cpp)
find_package (Threads)
target_link_libraries(test_leveldb leveldb)
target_link_libraries(test_leveldb ${CMAKE_THREAD_LIBS_INIT})
