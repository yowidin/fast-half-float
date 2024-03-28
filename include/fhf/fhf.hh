/**
 * @file   fhf.hh
 * @author Dennis Sitelew 
 * @date   Mar 19, 2024
 *
 * Header to include when using in a C++ project.
 */

#ifndef FHF_FHF_HH
#define FHF_FHF_HH

#include <fhf/export.h>

#include <cstdint>

namespace fhf {

std::uint16_t FHF_EXPORT pack(float f);
float FHF_EXPORT unpack(std::uint16_t h);

} // namespace fhf

#endif //FHF_FHF_HH
