/**
 * @file   fhf.h
 * @author Dennis Sitelew 
 * @date   Mar 20, 2024
 *
 * Header to include when using in a C project.
 */

#ifndef FHF_FHF_H
#define FHF_FHF_H

#include <fhf/export.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

extern uint16_t FHF_EXPORT fhf_pack(float f);
extern float FHF_EXPORT fhf_unpack(uint16_t h);

#ifdef __cplusplus
} // extern "C"
#endif

#endif //FHF_FHF_H
