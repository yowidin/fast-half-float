/**
 * @file   test.cpp
 * @author Dennis Sitelew 
 * @date   Mar 27, 2024
 */

#include <fhf/fhf.hh>

#include <iostream>
#include <limits>

using namespace fhf;

int main() {
   auto h = pack(std::numeric_limits<float>::infinity());
   if (h != 0x7C00) {
      std::cerr << "Infinity mismatch:" << std::hex << h << std::endl;
      return -1;
   }

   h = pack(-std::numeric_limits<float>::infinity());
   if (h != 0xFC00) {
      std::cerr << "-Infinity mismatch:" << std::hex << h << std::endl;
      return -1;
   }

   auto f = unpack(0x3C00);
   if (f != 1.0f) {
      std::cerr << "1.0 mismatch:" << f << std::endl;
      return -1;
   }
   return 0;
}