add_executable(test_c_usage test.c)
target_link_libraries(test_c_usage PRIVATE fhf_lib)
set_target_properties(test_c_usage PROPERTIES C_STANDARD 99 C_STANDARD_REQUIRED YES C_EXTENSIONS NO)
add_test(NAME "TestC" COMMAND test_c_usage WORKING_DIRECTORY "${CMAKE_BINARY_DIR}")

add_executable(test_cpp_usage test.cpp)
target_link_libraries(test_cpp_usage PRIVATE fhf_lib)
set_target_properties(test_cpp_usage PROPERTIES CXX_STANDARD 11 CXX_STANDARD_REQUIRED YES CXX_EXTENSIONS NO)
add_test(NAME "TestCPP" COMMAND test_cpp_usage WORKING_DIRECTORY "${CMAKE_BINARY_DIR}")
