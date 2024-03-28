cmake_minimum_required(VERSION 3.27)

set(FHF_SOVERSION 1)
mark_as_advanced(FHF_SOVERSION)

# https://semver.org/
set(FHF_VERSION 0.0.1)
mark_as_advanced(FHF_VERSION)

project(FastHalfFloat VERSION ${FHF_VERSION})

# --- Some CMake boilerplate --- #
set(FHF_GENERATED_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")
set(FHF_GENERATED_INCLUDE_DIR "${FHF_GENERATED_DIR}/include")
set(FHF_GENERATED_CMAKE_DIR "${FHF_GENERATED_DIR}/cmake")

set(FHF_GENERATED_EXPORT_HEADER "${FHF_GENERATED_INCLUDE_DIR}/fhf/export.h")
file(MAKE_DIRECTORY ${FHF_GENERATED_INCLUDE_DIR})

# --- Actual library --- #
add_library(fhf_lib src/fhf.cpp)

set_target_properties(fhf_lib PROPERTIES
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO

    VERSION ${FHF_VERSION}
    SOVERSION ${FHF_SOVERSION}

    OUTPUT_NAME FastHalfFloat

    C_VISIBILITY_PRESET hidden
    CXX_VISIBILITY_PRESET hidden
)

target_include_directories(fhf_lib
    PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/>
    PUBLIC $<BUILD_INTERFACE:${FHF_GENERATED_INCLUDE_DIR}>

    PUBLIC $<INSTALL_INTERFACE:include>
)

# --- Testing --- #
include(CTest)
if(BUILD_TESTING)
    add_subdirectory(test)
endif()

# --- Installation settings --- #
include(GenerateExportHeader)
generate_export_header(fhf_lib
    BASE_NAME FHF
    EXPORT_FILE_NAME ${FHF_GENERATED_EXPORT_HEADER}
)

include(cmake/install_helper.cmake)
include(cmake/package_helper.cmake)