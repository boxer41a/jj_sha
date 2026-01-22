/*
 * Code for class SHA_DIGEST_32
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F220_6535(EIF_REFERENCE);
extern EIF_TYPED_VALUE F220_6536(EIF_REFERENCE);
extern EIF_TYPED_VALUE F220_6537(EIF_REFERENCE);
extern EIF_TYPED_VALUE F220_6538(EIF_REFERENCE);
extern EIF_TYPED_VALUE F220_6539(EIF_REFERENCE);
extern EIF_TYPED_VALUE F220_6540(EIF_REFERENCE);
extern EIF_TYPED_VALUE F220_6541(EIF_REFERENCE);
extern EIF_TYPED_VALUE F220_6542(EIF_REFERENCE);
extern EIF_TYPED_VALUE F220_6543(EIF_REFERENCE);
extern void F220_6544(EIF_REFERENCE);
extern void F220_6545(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern void F220_6546(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern void EIF_Minit220(void);

#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {SHA_DIGEST_32}.default_create */
void F220_6535 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "default_create";
	RTEX;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 219, Current, 0, 0, 11494);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(219, Current, 11494);
	RTIV(Current, RTAL);
	RTHOOK(1);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWF(32, 218))(Current);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {SHA_DIGEST_32}.word_0 */
EIF_TYPED_VALUE F220_6536 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(4864,Dtype(Current)));
	return r;
}


/* {SHA_DIGEST_32}.word_1 */
EIF_TYPED_VALUE F220_6537 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(4865,Dtype(Current)));
	return r;
}


/* {SHA_DIGEST_32}.word_2 */
EIF_TYPED_VALUE F220_6538 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(4866,Dtype(Current)));
	return r;
}


/* {SHA_DIGEST_32}.word_3 */
EIF_TYPED_VALUE F220_6539 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(4867,Dtype(Current)));
	return r;
}


/* {SHA_DIGEST_32}.word_4 */
EIF_TYPED_VALUE F220_6540 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(4868,Dtype(Current)));
	return r;
}


/* {SHA_DIGEST_32}.word_5 */
EIF_TYPED_VALUE F220_6541 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(4869,Dtype(Current)));
	return r;
}


/* {SHA_DIGEST_32}.word_6 */
EIF_TYPED_VALUE F220_6542 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(4870,Dtype(Current)));
	return r;
}


/* {SHA_DIGEST_32}.word_7 */
EIF_TYPED_VALUE F220_6543 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(4871,Dtype(Current)));
	return r;
}


/* {SHA_DIGEST_32}.wipe_out */
void F220_6544 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "wipe_out";
	RTEX;
	EIF_NATURAL_32 tu4_1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 219, Current, 0, 0, 11491);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(219, Current, 11491);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 4864, 0x38000000, 1); /* word_0 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4864, dtype)) = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
	RTHOOK(2);
	RTDBGAA(Current, dtype, 4865, 0x38000000, 1); /* word_1 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4865, dtype)) = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
	RTHOOK(3);
	RTDBGAA(Current, dtype, 4866, 0x38000000, 1); /* word_2 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4866, dtype)) = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
	RTHOOK(4);
	RTDBGAA(Current, dtype, 4867, 0x38000000, 1); /* word_3 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4867, dtype)) = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
	RTHOOK(5);
	RTDBGAA(Current, dtype, 4868, 0x38000000, 1); /* word_4 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4868, dtype)) = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
	RTHOOK(6);
	RTDBGAA(Current, dtype, 4869, 0x38000000, 1); /* word_5 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4869, dtype)) = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
	RTHOOK(7);
	RTDBGAA(Current, dtype, 4870, 0x38000000, 1); /* word_6 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4870, dtype)) = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
	RTHOOK(8);
	RTDBGAA(Current, dtype, 4871, 0x38000000, 1); /* word_7 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4871, dtype)) = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
	if (RTAL & CK_ENSURE) {
		RTHOOK(9);
		RTCT("word_0_is_zero", EX_POST);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(4864, dtype));
		if ((EIF_BOOLEAN)(tu4_1 == (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L))) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(10);
		RTCT("word_1_is_zero", EX_POST);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(4865, dtype));
		if ((EIF_BOOLEAN)(tu4_1 == (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L))) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(11);
		RTCT("word_2_is_zero", EX_POST);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(4866, dtype));
		if ((EIF_BOOLEAN)(tu4_1 == (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L))) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(12);
		RTCT("word_3_is_zero", EX_POST);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(4867, dtype));
		if ((EIF_BOOLEAN)(tu4_1 == (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L))) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(13);
		RTCT("word_4_is_zero", EX_POST);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(4868, dtype));
		if ((EIF_BOOLEAN)(tu4_1 == (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L))) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(14);
		RTCT("word_5_is_zero", EX_POST);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(4869, dtype));
		if ((EIF_BOOLEAN)(tu4_1 == (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L))) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(15);
		RTCT("word_6_is_zero", EX_POST);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(4870, dtype));
		if ((EIF_BOOLEAN)(tu4_1 == (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L))) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(16);
		RTCT("word_7_is_zero", EX_POST);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(4871, dtype));
		if ((EIF_BOOLEAN)(tu4_1 == (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L))) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(17);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {SHA_DIGEST_32}.set_five */
void F220_6545 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x, EIF_TYPED_VALUE arg3x, EIF_TYPED_VALUE arg4x, EIF_TYPED_VALUE arg5x)
{
	GTCX
	char *l_feature_name = "set_five";
	RTEX;
#define arg1 arg1x.it_n4
#define arg2 arg2x.it_n4
#define arg3 arg3x.it_n4
#define arg4 arg4x.it_n4
#define arg5 arg5x.it_n4
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg5x.type & SK_HEAD) == SK_REF) arg5x.it_n4 = * (EIF_NATURAL_32 *) arg5x.it_r;
	if ((arg4x.type & SK_HEAD) == SK_REF) arg4x.it_n4 = * (EIF_NATURAL_32 *) arg4x.it_r;
	if ((arg3x.type & SK_HEAD) == SK_REF) arg3x.it_n4 = * (EIF_NATURAL_32 *) arg3x.it_r;
	if ((arg2x.type & SK_HEAD) == SK_REF) arg2x.it_n4 = * (EIF_NATURAL_32 *) arg2x.it_r;
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_n4 = * (EIF_NATURAL_32 *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_UINT32,&arg1);
	RTLU(SK_UINT32,&arg2);
	RTLU(SK_UINT32,&arg3);
	RTLU(SK_UINT32,&arg4);
	RTLU(SK_UINT32,&arg5);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 219, Current, 0, 5, 11492);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(219, Current, 11492);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 4864, 0x38000000, 1); /* word_0 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4864, dtype)) = (EIF_NATURAL_32) arg1;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 4865, 0x38000000, 1); /* word_1 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4865, dtype)) = (EIF_NATURAL_32) arg2;
	RTHOOK(3);
	RTDBGAA(Current, dtype, 4866, 0x38000000, 1); /* word_2 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4866, dtype)) = (EIF_NATURAL_32) arg3;
	RTHOOK(4);
	RTDBGAA(Current, dtype, 4867, 0x38000000, 1); /* word_3 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4867, dtype)) = (EIF_NATURAL_32) arg4;
	RTHOOK(5);
	RTDBGAA(Current, dtype, 4868, 0x38000000, 1); /* word_4 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4868, dtype)) = (EIF_NATURAL_32) arg5;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(6);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(7);
	RTEE;
#undef arg5
#undef arg4
#undef arg3
#undef arg2
#undef arg1
}

/* {SHA_DIGEST_32}.set_all */
void F220_6546 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x, EIF_TYPED_VALUE arg3x, EIF_TYPED_VALUE arg4x, EIF_TYPED_VALUE arg5x, EIF_TYPED_VALUE arg6x, EIF_TYPED_VALUE arg7x, EIF_TYPED_VALUE arg8x)
{
	GTCX
	char *l_feature_name = "set_all";
	RTEX;
#define arg1 arg1x.it_n4
#define arg2 arg2x.it_n4
#define arg3 arg3x.it_n4
#define arg4 arg4x.it_n4
#define arg5 arg5x.it_n4
#define arg6 arg6x.it_n4
#define arg7 arg7x.it_n4
#define arg8 arg8x.it_n4
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg8x.type & SK_HEAD) == SK_REF) arg8x.it_n4 = * (EIF_NATURAL_32 *) arg8x.it_r;
	if ((arg7x.type & SK_HEAD) == SK_REF) arg7x.it_n4 = * (EIF_NATURAL_32 *) arg7x.it_r;
	if ((arg6x.type & SK_HEAD) == SK_REF) arg6x.it_n4 = * (EIF_NATURAL_32 *) arg6x.it_r;
	if ((arg5x.type & SK_HEAD) == SK_REF) arg5x.it_n4 = * (EIF_NATURAL_32 *) arg5x.it_r;
	if ((arg4x.type & SK_HEAD) == SK_REF) arg4x.it_n4 = * (EIF_NATURAL_32 *) arg4x.it_r;
	if ((arg3x.type & SK_HEAD) == SK_REF) arg3x.it_n4 = * (EIF_NATURAL_32 *) arg3x.it_r;
	if ((arg2x.type & SK_HEAD) == SK_REF) arg2x.it_n4 = * (EIF_NATURAL_32 *) arg2x.it_r;
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_n4 = * (EIF_NATURAL_32 *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_UINT32,&arg1);
	RTLU(SK_UINT32,&arg2);
	RTLU(SK_UINT32,&arg3);
	RTLU(SK_UINT32,&arg4);
	RTLU(SK_UINT32,&arg5);
	RTLU(SK_UINT32,&arg6);
	RTLU(SK_UINT32,&arg7);
	RTLU(SK_UINT32,&arg8);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 219, Current, 0, 8, 11493);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(219, Current, 11493);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 4864, 0x38000000, 1); /* word_0 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4864, dtype)) = (EIF_NATURAL_32) arg1;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 4865, 0x38000000, 1); /* word_1 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4865, dtype)) = (EIF_NATURAL_32) arg2;
	RTHOOK(3);
	RTDBGAA(Current, dtype, 4866, 0x38000000, 1); /* word_2 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4866, dtype)) = (EIF_NATURAL_32) arg3;
	RTHOOK(4);
	RTDBGAA(Current, dtype, 4867, 0x38000000, 1); /* word_3 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4867, dtype)) = (EIF_NATURAL_32) arg4;
	RTHOOK(5);
	RTDBGAA(Current, dtype, 4868, 0x38000000, 1); /* word_4 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4868, dtype)) = (EIF_NATURAL_32) arg5;
	RTHOOK(6);
	RTDBGAA(Current, dtype, 4869, 0x38000000, 1); /* word_5 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4869, dtype)) = (EIF_NATURAL_32) arg6;
	RTHOOK(7);
	RTDBGAA(Current, dtype, 4870, 0x38000000, 1); /* word_6 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4870, dtype)) = (EIF_NATURAL_32) arg7;
	RTHOOK(8);
	RTDBGAA(Current, dtype, 4871, 0x38000000, 1); /* word_7 */
	*(EIF_NATURAL_32 *)(Current + RTWA(4871, dtype)) = (EIF_NATURAL_32) arg8;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(9);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(10);
	RTEE;
#undef arg8
#undef arg7
#undef arg6
#undef arg5
#undef arg4
#undef arg3
#undef arg2
#undef arg1
}

void EIF_Minit220 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
