# Fast Half Float (fhf)

![status](https://github.com/yowidin/fast-half-float/actions/workflows/unit.yml/badge.svg)

A small library for quickly packing and unpacking half-precision floating point values.

The implementation is based on
the [Fast Half Float Conversions](http://www.fox-toolkit.org/ftp/fasthalffloatconversion.pdf) paper
by `Jeroen van der Zijp`, referenced by the
Wikipedia [article](https://en.wikipedia.org/wiki/Half-precision_floating-point_format) on
half-precision floating point.

The only distinguishing feature of this implementation is that it uses the compile-time lookup table feature
of `C++20`. There are no classical unit tests, just some `static_assert's` sprinkled around.

## Usage

### CMake

The easiest way to include this library in your project is to use the CMake's `FetchContent` functionality, for example:

```cmake
cmake_minimum_required(VERSION 3.16)
project(integration_test)

set(CMAKE_CXX_STANDARD 11)

include(FetchContent)
FetchContent_Declare(
    fhf
    GIT_REPOSITORY https://github.com/yowidin/fast-half-float
    GIT_TAG master
)
FetchContent_MakeAvailable(fhf)

add_executable(test main.cpp)
target_link_libraries(test PRIVATE FastHalfFloat::library)
```

### C++

You can now be able to pack and unpack the half-precision float values:

```c++
#include <fhf/fhf.hh>

#include <iostream>
#include <limits>

void foo() {
   auto h = fhf::pack(std::numeric_limits<float>::infinity());
   std::cout << "Infinity:" << std::hex << h << std::endl;

   h = fhf::pack(-std::numeric_limits<float>::infinity());
   std::cout << "-Infinity:" << std::hex << h << std::endl;

   auto f = unpack(0x3C00);
   std::cout << "0x3C00:" << f << std::endl;
}
```