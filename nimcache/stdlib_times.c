/* Generated by Nim Compiler v0.17.0 */
/*   (c) 2017 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Windows, amd64, vcc */
/* Command for C compiler:
   vccexe.exe /c --platform:amd64 /nologo -DWIN32_LEAN_AND_MEAN /openmp /O2  /IC:\nim\lib /FoC:\Users\jaina18\Documents\simtest\nimcache\stdlib_times.obj C:\Users\jaina18\Documents\simtest\nimcache\stdlib_times.c */
#define NIM_NEW_MANGLING_RULES
#define NIM_INTBITS 64

#include "nimbase.h"
#include <string.h>
#undef linux
#undef near
typedef struct FILETIME_bs4NMleDDVF7xsEK0SGLBw FILETIME_bs4NMleDDVF7xsEK0SGLBw;

struct FILETIME_bs4NMleDDVF7xsEK0SGLBw {
NI32 dwLowDateTime;
NI32 dwHighDateTime;
};
typedef N_STDCALL_PTR(void, TY_9bc9cLDdaqTE6n5J78feKRYg) (FILETIME_bs4NMleDDVF7xsEK0SGLBw* lpSystemTimeAsFileTime);
N_NIMCALL(NI64, rdFileTime_8xfVp1z4bc5fRCRgoEFhIQ)(FILETIME_bs4NMleDDVF7xsEK0SGLBw f);
extern TY_9bc9cLDdaqTE6n5J78feKRYg Dl_125825_;

N_NIMCALL(NF, ntepochTime)(void) {
	NF result;
	FILETIME_bs4NMleDDVF7xsEK0SGLBw f;
	NI64 i64;
	NI64 T1_;
	NI64 secs;
	NI64 subsecs;
	result = (NF)0;
	memset((void*)(&f), 0, sizeof(f));
	Dl_125825_((&f));
	T1_ = (NI64)0;
	T1_ = rdFileTime_8xfVp1z4bc5fRCRgoEFhIQ(f);
	i64 = (NI64)(T1_ - IL64(116444736000000000));
	secs = (NI64)(i64 / IL64(10000000));
	subsecs = (NI64)(i64 % IL64(10000000));
	result = ((NF)(((double) (((NI) (secs))))) + (NF)(((NF)(((double) (((NI) (subsecs))))) * (NF)(9.9999999999999995e-008))));
	return result;
}
NIM_EXTERNC N_NOINLINE(void, stdlib_timesInit000)(void) {
}

NIM_EXTERNC N_NOINLINE(void, stdlib_timesDatInit000)(void) {
}

