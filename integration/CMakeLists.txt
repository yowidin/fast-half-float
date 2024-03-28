cmake_minimum_required(VERSION 3.16)
project(integration_test)

set(CMAKE_CXX_STANDARD 11)

include(FetchContent)
FetchContent_Declare(
    fhf
    SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/../
)
FetchContent_MakeAvailable(fhf)

add_executable(test_c ../test/test.c)
target_link_libraries(test_c PRIVATE FastHalfFloat::library)

add_executable(test_cpp ../test/test.cpp)
target_link_libraries(test_cpp PRIVATE FastHalfFloat::library)
