/**
 * @file   test.c
 * @author Dennis Sitelew 
 * @date   Mar 27, 2024
 */

#include <fhf/fhf.h>

#include <math.h>
#include <stdio.h>

int main(void) {
   uint16_t h = fhf_pack(INFINITY);
   if (h != 0x7C00) {
      printf("Infinity mismatch: %x\n", h);
      return -1;
   }

   h = fhf_pack(-INFINITY);
   if (h != 0xFC00) {
      printf("-Infinity mismatch: %x\n", h);
      return -1;
   }

   float f = fhf_unpack(0x3C00);
   if (f != 1.0f) {
      printf("1.0f mismatch: %f\n", f);
      return -1;
   }
   return 0;
}