/* Generated by Nim Compiler v0.17.0 */
/*   (c) 2017 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Windows, amd64, vcc */
/* Command for C compiler:
   vccexe.exe /c --platform:amd64 /nologo -DWIN32_LEAN_AND_MEAN /openmp /O2  /IC:\nim\lib /FoC:\Users\Arham\Documents\Projects\simtest\nimcache\stdlib_winlean.obj C:\Users\Arham\Documents\Projects\simtest\nimcache\stdlib_winlean.c */
#define NIM_NEW_MANGLING_RULES
#define NIM_INTBITS 64

#include "nimbase.h"
#include <string.h>
#undef linux
#undef near
typedef struct GUID_J2WQBMgezjwf6Trblkflgg GUID_J2WQBMgezjwf6Trblkflgg;
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct FILETIME_bs4NMleDDVF7xsEK0SGLBw FILETIME_bs4NMleDDVF7xsEK0SGLBw;
typedef NI8 TY_9cWG514ToTTjfTPLhXXV0IQ[8];

struct GUID_J2WQBMgezjwf6Trblkflgg {
NI32 D1;
NI16 D2;
NI16 D3;
TY_9cWG514ToTTjfTPLhXXV0IQ D4;
};
typedef N_STDCALL_PTR(NCSTRING, TY_5ctyytqoGFQ0BA1imFGbVw) (int family, void* paddr, NCSTRING pStringBuffer, NI32 stringBufSize);

struct TGenericSeq {
NI len;
NI reserved;
};

struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
typedef N_STDCALL_PTR(void, TY_9bc9cLDdaqTE6n5J78feKRYg) (FILETIME_bs4NMleDDVF7xsEK0SGLBw* lpSystemTimeAsFileTime);

struct FILETIME_bs4NMleDDVF7xsEK0SGLBw {
NI32 dwLowDateTime;
NI32 dwHighDateTime;
};
N_NIMCALL(void*, loadLib_lSvQvOASnMsmHZsCRL59ctQ)(NimStringDesc* path, NIM_BOOL global_symbols);
N_NIMCALL(void*, symAddr_NHfjIU1Uh0ju9azgMjiSkQA)(void* lib, NCSTRING name);
N_NIMCALL(void*, nimLoadLibrary)(NimStringDesc* path);
N_NOINLINE(void, nimLoadLibraryError)(NimStringDesc* path);
N_NIMCALL(void*, nimGetProcAddr)(void* lib, NCSTRING name);
GUID_J2WQBMgezjwf6Trblkflgg WSAID_CONNECTEX_YmR9c9crObjjK9ckt1ygsPQKg;
GUID_J2WQBMgezjwf6Trblkflgg WSAID_ACCEPTEX_pwoOiDuyZgHBOLaI2GSBpg;
GUID_J2WQBMgezjwf6Trblkflgg WSAID_GETACCEPTEXSOCKADDRS_rSjtFMq7pCHQR2EQvcKbDg;
TY_5ctyytqoGFQ0BA1imFGbVw inet_ntop_real_FVXn9aJ5AOo23ScDsZUc9aZw;
void* ws2_hGspZUrVrEMpO9aP9c3dJQPQ;
static void* TM_k6kyf4Co79a84IkK9blFuQVA_5;
TY_9bc9cLDdaqTE6n5J78feKRYg Dl_125825_;
NIM_CONST TY_9cWG514ToTTjfTPLhXXV0IQ TM_k6kyf4Co79a84IkK9blFuQVA_2 = {((NI8) -114),
((NI8) -23),
((NI8) 118),
((NI8) -27),
((NI8) -116),
((NI8) 116),
((NI8) 6),
((NI8) 62)}
;
NIM_CONST TY_9cWG514ToTTjfTPLhXXV0IQ TM_k6kyf4Co79a84IkK9blFuQVA_3 = {((NI8) -107),
((NI8) -54),
((NI8) 0),
((NI8) -128),
((NI8) 95),
((NI8) 72),
((NI8) -95),
((NI8) -110)}
;
STRING_LITERAL(TM_k6kyf4Co79a84IkK9blFuQVA_4, "Ws2_32.dll", 10);
STRING_LITERAL(TM_k6kyf4Co79a84IkK9blFuQVA_7, "kernel32", 8);
STRING_LITERAL(TM_k6kyf4Co79a84IkK9blFuQVA_8, "kernel32", 8);

N_NIMCALL(NI64, rdFileTime_8xfVp1z4bc5fRCRgoEFhIQ)(FILETIME_bs4NMleDDVF7xsEK0SGLBw f) {
	NI64 result;
	result = (NI64)0;
	result = (NI64)(((NI64)(NU64)(NU32)(f.dwLowDateTime)) | (NI64)((NU64)(((NI64)(NU64)(NU32)(f.dwHighDateTime))) << (NU64)(((NI) 32))));
	return result;
}
NIM_EXTERNC N_NOINLINE(void, stdlib_winleanInit000)(void) {
	GUID_J2WQBMgezjwf6Trblkflgg T1_;
	GUID_J2WQBMgezjwf6Trblkflgg T2_;
	GUID_J2WQBMgezjwf6Trblkflgg T3_;
	memset((void*)(&T1_), 0, sizeof(T1_));
	T1_.D1 = ((NI32) 631375801);
	T1_.D2 = ((NI16) -8717);
	T1_.D3 = ((NI16) 18016);
	memcpy((void*)T1_.D4, (NIM_CONST void*)TM_k6kyf4Co79a84IkK9blFuQVA_2, sizeof(TY_9cWG514ToTTjfTPLhXXV0IQ));
	WSAID_CONNECTEX_YmR9c9crObjjK9ckt1ygsPQKg = T1_;
	memset((void*)(&T2_), 0, sizeof(T2_));
	T2_.D1 = ((NI32) -1254720015);
	T2_.D2 = ((NI16) -13396);
	T2_.D3 = ((NI16) 4559);
	memcpy((void*)T2_.D4, (NIM_CONST void*)TM_k6kyf4Co79a84IkK9blFuQVA_3, sizeof(TY_9cWG514ToTTjfTPLhXXV0IQ));
	WSAID_ACCEPTEX_pwoOiDuyZgHBOLaI2GSBpg = T2_;
	memset((void*)(&T3_), 0, sizeof(T3_));
	T3_.D1 = ((NI32) -1254720014);
	T3_.D2 = ((NI16) -13396);
	T3_.D3 = ((NI16) 4559);
	memcpy((void*)T3_.D4, (NIM_CONST void*)TM_k6kyf4Co79a84IkK9blFuQVA_3, sizeof(TY_9cWG514ToTTjfTPLhXXV0IQ));
	WSAID_GETACCEPTEXSOCKADDRS_rSjtFMq7pCHQR2EQvcKbDg = T3_;
	inet_ntop_real_FVXn9aJ5AOo23ScDsZUc9aZw = NIM_NIL;
	ws2_hGspZUrVrEMpO9aP9c3dJQPQ = loadLib_lSvQvOASnMsmHZsCRL59ctQ(((NimStringDesc*) &TM_k6kyf4Co79a84IkK9blFuQVA_4), NIM_FALSE);
	{
		void* T8_;
		if (!!((ws2_hGspZUrVrEMpO9aP9c3dJQPQ == NIM_NIL))) goto LA6_;
		T8_ = (void*)0;
		T8_ = symAddr_NHfjIU1Uh0ju9azgMjiSkQA(ws2_hGspZUrVrEMpO9aP9c3dJQPQ, "inet_ntop");
		inet_ntop_real_FVXn9aJ5AOo23ScDsZUc9aZw = ((TY_5ctyytqoGFQ0BA1imFGbVw) (T8_));
	}
	LA6_: ;
}

NIM_EXTERNC N_NOINLINE(void, stdlib_winleanDatInit000)(void) {
if (!((TM_k6kyf4Co79a84IkK9blFuQVA_5 = nimLoadLibrary((NimStringDesc*) &TM_k6kyf4Co79a84IkK9blFuQVA_7))
)) nimLoadLibraryError((NimStringDesc*) &TM_k6kyf4Co79a84IkK9blFuQVA_8);
	Dl_125825_ = (TY_9bc9cLDdaqTE6n5J78feKRYg) nimGetProcAddr(TM_k6kyf4Co79a84IkK9blFuQVA_5, "GetSystemTimeAsFileTime");
}

