/*
 * Code for class SHA_PARSER_32
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F67_1654(EIF_REFERENCE);
extern void F67_1655(EIF_REFERENCE);
extern void F67_1656(EIF_REFERENCE);
extern EIF_TYPED_VALUE F67_1657(EIF_REFERENCE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F67_1658(EIF_REFERENCE);
extern void F67_1659(EIF_REFERENCE);
extern void F67_1660(EIF_REFERENCE);
extern void F67_1661(EIF_REFERENCE);
extern EIF_TYPED_VALUE F67_1662(EIF_REFERENCE);
extern EIF_TYPED_VALUE F67_1663(EIF_REFERENCE);
extern EIF_TYPED_VALUE F67_1664(EIF_REFERENCE);
extern EIF_TYPED_VALUE F67_1665(EIF_REFERENCE);
extern EIF_TYPED_VALUE F67_1666(EIF_REFERENCE);
extern EIF_TYPED_VALUE F67_1667(EIF_REFERENCE);
extern EIF_TYPED_VALUE F67_1668(EIF_REFERENCE);
extern void F67_8699(EIF_REFERENCE, int);
extern void EIF_Minit67(void);

#ifdef __cplusplus
}
#endif

#include "eif_misc.h"

#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {SHA_PARSER_32}.default_create */
void F67_1654 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "default_create";
	RTEX;
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(2);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLIU(2);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 66, Current, 0, 0, 1101);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1101);
	RTIV(Current, RTAL);
	RTHOOK(1);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWF(32, 65))(Current);
	RTHOOK(2);
	RTDBGAA(Current, dtype, 1537, 0xF8000151, 0); /* blocks */
	tr1 = RTLNSMART(RTWCT(1537, dtype, Dftype(Current)).id);
	ui4_1 = ((EIF_INTEGER_32) 0L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(4586, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(2,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(1537, dtype)) = (EIF_REFERENCE) tr1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
#undef ui4_1
}

/* {SHA_PARSER_32}.pad_with_one */
void F67_1655 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "pad_with_one";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_NATURAL_32 loc2 = (EIF_NATURAL_32) 0;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE uu4_1x = {{0}, SK_UINT32};
#define uu4_1 uu4_1x.it_n4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(5);
	RTLR(0,Current);
	RTLR(1,loc1);
	RTLR(2,tr1);
	RTLR(3,tr2);
	RTLR(4,ur1);
	RTLIU(5);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_UINT32, &loc2);
	
	RTEAA(l_feature_name, 66, Current, 2, 0, 1102);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1102);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("is_parsed", EX_PRE);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1512, dtype));
		RTTE(tb1, label_1);
		RTCK;
		RTHOOK(2);
		RTCT("not_padded", EX_PRE);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1511, dtype));
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTHOOK(3);
		RTCT("not_one_padded", EX_PRE);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1510, dtype));
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(4);
	RTDBGAL(2, 0x38000000, 1, 0); /* loc2 */
	loc2 = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_64) RTI64C(2147483648));
	RTHOOK(5);
	RTDBGAL(1, 0xF8000022, 0, 0); /* loc1 */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1537, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(5,1);
	tr2 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(3263, "last", tr1))(tr1)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
	loc1 = (EIF_REFERENCE) RTCCL(tr2);
	RTHOOK(6);
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1156, "count", loc1))(loc1)).it_i4);
	ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
	if ((EIF_BOOLEAN) (ti4_1 < ti4_2)) {
		RTHOOK(7);
		uu4_1 = loc2;
		ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1156, "count", loc1))(loc1)).it_i4);
		ui4_1 = (EIF_INTEGER_32) (ti4_1 - ((EIF_INTEGER_32) 1L));
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(1153, "put", loc1))(loc1, uu4_1x, ui4_1x);
	} else {
		RTHOOK(8);
		RTDBGAL(1, 0xF8000022, 0, 0); /* loc1 */
		tr1 = RTLN(eif_new_type(34, 0x01).id);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
		RTNHOOK(8,1);
		loc1 = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(9);
		uu4_1 = loc2;
		ui4_1 = ((EIF_INTEGER_32) 0L);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(1153, "put", loc1))(loc1, uu4_1x, ui4_1x);
		RTHOOK(10);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1537, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(10,1);
		ur1 = RTCCL(loc1);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2847, "extend", tr1))(tr1, ur1x);
	}
	if (RTAL & CK_ENSURE) {
		RTHOOK(11);
		RTCT("is_one_padded", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1510, dtype));
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(12);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(4);
	RTEE;
#undef up1
#undef up2
#undef ur1
#undef ui4_1
#undef uu4_1
}

/* {SHA_PARSER_32}.pad */
void F67_1656 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "pad";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_INTEGER_32 loc2 = (EIF_INTEGER_32) 0;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE uu4_1x = {{0}, SK_UINT32};
#define uu4_1 uu4_1x.it_n4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	EIF_INTEGER_32 ti4_3;
	EIF_INTEGER_32 ti4_4;
	EIF_NATURAL_32 tu4_1;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(5);
	RTLR(0,Current);
	RTLR(1,loc1);
	RTLR(2,tr1);
	RTLR(3,tr2);
	RTLR(4,ur1);
	RTLIU(5);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_INT32, &loc2);
	
	RTEAA(l_feature_name, 66, Current, 2, 0, 1103);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1103);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("is_parsed", EX_PRE);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1512, dtype));
		RTTE(tb1, label_1);
		RTCK;
		RTHOOK(2);
		RTCT("not_padded", EX_PRE);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1511, dtype));
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(3);
	tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1510, dtype));
	if ((EIF_BOOLEAN) !tb1) {
		RTHOOK(4);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWF(1531, dtype))(Current);
	}
	RTHOOK(5);
	RTDBGAL(1, 0xF8000022, 0, 0); /* loc1 */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1537, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(5,1);
	tr2 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(3263, "last", tr1))(tr1)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
	loc1 = (EIF_REFERENCE) RTCCL(tr2);
	RTHOOK(6);
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1156, "count", loc1))(loc1)).it_i4);
	ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
	if ((EIF_BOOLEAN) (ti4_1 < (EIF_INTEGER_32) (ti4_2 - ((EIF_INTEGER_32) 2L)))) {
		RTHOOK(7);
		RTDBGAL(2, 0x10000000, 1, 0); /* loc2 */
		ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1156, "count", loc1))(loc1)).it_i4);
		loc2 = (EIF_INTEGER_32) ti4_1;
		for (;;) {
			RTHOOK(8);
			ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
			if ((EIF_BOOLEAN) (loc2 > (EIF_INTEGER_32) (ti4_1 - ((EIF_INTEGER_32) 2L)))) break;
			RTHOOK(9);
			uu4_1 = (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
			ui4_1 = (EIF_INTEGER_32) (loc2 - ((EIF_INTEGER_32) 1L));
			(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(1153, "put", loc1))(loc1, uu4_1x, ui4_1x);
			RTHOOK(10);
			RTDBGAL(2, 0x10000000, 1, 0); /* loc2 */
			loc2++;
		}
	} else {
		RTHOOK(11);
		RTDBGAL(2, 0x10000000, 1, 0); /* loc2 */
		ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1156, "count", loc1))(loc1)).it_i4);
		loc2 = (EIF_INTEGER_32) ti4_2;
		for (;;) {
			RTHOOK(12);
			ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
			if ((EIF_BOOLEAN) (loc2 > ti4_2)) break;
			RTHOOK(13);
			uu4_1 = (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
			ui4_1 = (EIF_INTEGER_32) (loc2 - ((EIF_INTEGER_32) 1L));
			(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(1153, "put", loc1))(loc1, uu4_1x, ui4_1x);
			RTHOOK(14);
			RTDBGAL(2, 0x10000000, 1, 0); /* loc2 */
			loc2++;
		}
		if (RTAL & CK_CHECK) {
			RTHOOK(15);
			RTCT("last_block_full", EX_CHECK);
			ti4_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1156, "count", loc1))(loc1)).it_i4);
			ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
			if ((EIF_BOOLEAN)(ti4_3 == ti4_4)) {
				RTCK;
			} else {
				RTCF;
			}
		}
		RTHOOK(16);
		RTDBGAL(1, 0xF8000022, 0, 0); /* loc1 */
		tr1 = RTLN(eif_new_type(34, 0x01).id);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
		RTNHOOK(16,1);
		loc1 = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(17);
		uu4_1 = (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
		ti4_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
		ui4_1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) (ti4_3 - ((EIF_INTEGER_32) 2L)) - ((EIF_INTEGER_32) 1L));
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(1153, "put", loc1))(loc1, uu4_1x, ui4_1x);
		RTHOOK(18);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1504, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(18,1);
		ti4_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5572, "count", tr1))(tr1)).it_i4);
		tu4_1 = (EIF_NATURAL_32) ti4_3;
		uu4_1 = tu4_1;
		ti4_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
		ui4_1 = (EIF_INTEGER_32) (ti4_3 - ((EIF_INTEGER_32) 1L));
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(1153, "put", loc1))(loc1, uu4_1x, ui4_1x);
		RTHOOK(19);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1537, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(19,1);
		ur1 = RTCCL(loc1);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2847, "extend", tr1))(tr1, ur1x);
	}
	RTHOOK(20);
	RTDBGAA(Current, dtype, 1511, 0x04000000, 1); /* is_padded */
	*(EIF_BOOLEAN *)(Current + RTWA(1511, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(21);
		RTCT("is_padded", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1511, dtype));
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(22);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(4);
	RTEE;
#undef up1
#undef up2
#undef ur1
#undef ui4_1
#undef uu4_1
}

/* {SHA_PARSER_32}.i_th_word */
EIF_TYPED_VALUE F67_1657 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "i_th_word";
	RTEX;
	EIF_INTEGER_32 loc1 = (EIF_INTEGER_32) 0;
#define arg1 arg1x.it_i4
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_NATURAL_32 tu4_1;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	EIF_BOOLEAN tb3;
	EIF_NATURAL_32 Result = ((EIF_NATURAL_32) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i4 = * (EIF_INTEGER_32 *) arg1x.it_r;
	
	RTLI(2);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLIU(2);
	RTLU (SK_UINT32, &Result);
	RTLU(SK_INT32,&arg1);
	RTLU (SK_REF, &Current);
	RTLU(SK_INT32, &loc1);
	
	RTEAA(l_feature_name, 66, Current, 1, 1, 1104);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1104);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("index_big_enough", EX_PRE);
		RTTE((EIF_BOOLEAN) (arg1 >= ((EIF_INTEGER_32) 1L)), label_1);
		RTCK;
		RTHOOK(2);
		RTCT("index_small_enough", EX_PRE);
		tb1 = '\01';
		ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1514, dtype))(Current)).it_i4);
		if (!(EIF_BOOLEAN) (arg1 <= ti4_1)) {
			tb2 = '\0';
			tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1515, dtype))(Current)).it_b);
			if (tb3) {
				ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1514, dtype))(Current)).it_i4);
				tb2 = (EIF_BOOLEAN) (arg1 <= (EIF_INTEGER_32) (ti4_1 + ((EIF_INTEGER_32) 1L)));
			}
			tb1 = tb2;
		}
		RTTE(tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(3);
	RTDBGAL(1, 0x10000000, 1, 0); /* loc1 */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1528, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(3,1);
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1151, "bytes_per_word", tr1))(tr1)).it_i4);
	loc1 = (EIF_INTEGER_32) (EIF_INTEGER_32) ((EIF_INTEGER_32) (arg1 - ((EIF_INTEGER_32) 1L)) * ti4_1);
	RTHOOK(4);
	RTDBGAL(0, 0x38000000, 1,0); /* Result */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1507, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(4,1);
	ui4_1 = loc1;
	tu4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(3681, "read_natural_32", tr1))(tr1, ui4_1x)).it_n4);
	Result = (EIF_NATURAL_32) tu4_1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(5);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(4);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_UINT32; r.it_n4 = Result; return r; }
#undef up1
#undef ui4_1
#undef arg1
}

/* {SHA_PARSER_32}.partial_word */
EIF_TYPED_VALUE F67_1658 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "partial_word";
	RTEX;
	EIF_INTEGER_32 loc1 = (EIF_INTEGER_32) 0;
	EIF_NATURAL_32 loc2 = (EIF_NATURAL_32) 0;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE uu4_1x = {{0}, SK_UINT32};
#define uu4_1 uu4_1x.it_n4
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	EIF_NATURAL_32 tu4_1;
	EIF_NATURAL_8 tu1_1;
	EIF_BOOLEAN tb1;
	EIF_NATURAL_32 Result = ((EIF_NATURAL_32) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(2);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLIU(2);
	RTLU (SK_UINT32, &Result);
	RTLU (SK_REF, &Current);
	RTLU(SK_INT32, &loc1);
	RTLU(SK_UINT32, &loc2);
	
	RTEAA(l_feature_name, 66, Current, 2, 0, 1105);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1105);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("has_partial_word", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1515, dtype))(Current)).it_b);
		RTTE(tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAL(1, 0x10000000, 1, 0); /* loc1 */
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1514, dtype))(Current)).it_i4);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1528, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(2,1);
	ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1151, "bytes_per_word", tr1))(tr1)).it_i4);
	loc1 = (EIF_INTEGER_32) (EIF_INTEGER_32) ((EIF_INTEGER_32) (ti4_1 * ti4_2) + ((EIF_INTEGER_32) 1L));
	for (;;) {
		RTHOOK(3);
		ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1513, dtype))(Current)).it_i4);
		if ((EIF_BOOLEAN) (loc1 > ti4_1)) break;
		RTHOOK(4);
		RTDBGAL(2, 0x38000000, 1, 0); /* loc2 */
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1507, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(4,1);
		ui4_1 = loc1;
		tu1_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(3679, "read_natural_8", tr1))(tr1, ui4_1x)).it_n1);
		tu4_1 = (EIF_NATURAL_32) tu1_1;
		loc2 = (EIF_NATURAL_32) tu4_1;
		RTHOOK(5);
		RTDBGAL(0, 0x38000000, 1,0); /* Result */
		uu4_1 = loc2;
		tu4_1 = eif_bit_or(Result,uu4_1);
		Result = (EIF_NATURAL_32) tu4_1;
		RTHOOK(6);
		RTDBGAL(0, 0x38000000, 1,0); /* Result */
		ui4_1 = ((EIF_INTEGER_32) 8L);
		tu4_1 = eif_bit_shift_left(Result,ui4_1);
		Result = (EIF_NATURAL_32) tu4_1;
		if (RTAL & CK_CHECK) {
			RTHOOK(7);
			RTCT("not_too_many_byte", EX_CHECK);
			tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1528, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			RTNHOOK(7,1);
			ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1151, "bytes_per_word", tr1))(tr1)).it_i4);
			if ((EIF_BOOLEAN) (loc1 < ti4_2)) {
				RTCK;
			} else {
				RTCF;
			}
		}
		RTHOOK(8);
		RTDBGAL(1, 0x10000000, 1, 0); /* loc1 */
		loc1++;
	}
	RTHOOK(9);
	RTDBGAL(2, 0x38000000, 1, 0); /* loc2 */
	loc2 = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_64) RTI64C(2147483648));
	RTHOOK(10);
	RTDBGAL(0, 0x38000000, 1,0); /* Result */
	uu4_1 = loc2;
	tu4_1 = eif_bit_or(Result,uu4_1);
	Result = (EIF_NATURAL_32) tu4_1;
	RTHOOK(11);
	RTDBGAA(Current, dtype, 1510, 0x04000000, 1); /* is_one_padded */
	*(EIF_BOOLEAN *)(Current + RTWA(1510, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	for (;;) {
		RTHOOK(12);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1528, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(12,1);
		ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1151, "bytes_per_word", tr1))(tr1)).it_i4);
		if ((EIF_BOOLEAN) (loc1 > ti4_2)) break;
		RTHOOK(13);
		RTDBGAL(0, 0x38000000, 1,0); /* Result */
		ui4_1 = ((EIF_INTEGER_32) 8L);
		tu4_1 = eif_bit_shift_left(Result,ui4_1);
		Result = (EIF_NATURAL_32) tu4_1;
		RTHOOK(14);
		RTDBGAL(1, 0x10000000, 1, 0); /* loc1 */
		loc1++;
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(15);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(4);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_UINT32; r.it_n4 = Result; return r; }
#undef up1
#undef ui4_1
#undef uu4_1
}

/* {SHA_PARSER_32}.parse_string_32 */
void F67_1659 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "parse_string_32";
	RTEX;
	EIF_INTEGER_32 loc1 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc2 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc3 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc4 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc5 = (EIF_INTEGER_32) 0;
	EIF_REFERENCE loc6 = (EIF_REFERENCE) 0;
	EIF_NATURAL_32 loc7 = (EIF_NATURAL_32) 0;
	EIF_REFERENCE loc8 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc9 = (EIF_REFERENCE) 0;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE uu4_1x = {{0}, SK_UINT32};
#define uu4_1 uu4_1x.it_n4
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	EIF_INTEGER_32 ti4_3;
	EIF_INTEGER_32 ti4_4;
	EIF_INTEGER_32 ti4_5;
	EIF_NATURAL_32 tu4_1;
	EIF_CHARACTER_32 tw1;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(5);
	RTLR(0,Current);
	RTLR(1,loc8);
	RTLR(2,tr1);
	RTLR(3,loc9);
	RTLR(4,loc6);
	RTLIU(5);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTLU(SK_INT32, &loc1);
	RTLU(SK_INT32, &loc2);
	RTLU(SK_INT32, &loc3);
	RTLU(SK_INT32, &loc4);
	RTLU(SK_INT32, &loc5);
	RTLU(SK_REF, &loc6);
	RTLU(SK_UINT32, &loc7);
	RTLU(SK_REF, &loc8);
	RTLU(SK_REF, &loc9);
	
	RTEAA(l_feature_name, 66, Current, 9, 0, 1106);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1106);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("not_file_input", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1508, dtype))(Current)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTHOOK(2);
		RTCT("is_32_bit_string", EX_PRE);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1504, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		loc8 = RTCCL(tr1);
		loc8 = RTRV(eif_new_type(270, 0x01),loc8);
		RTTE(EIF_TEST(loc8), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(3);
	RTCT0("attached {IMMUTABLE_STRING_32} message as m", EX_CHECK);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1504, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	loc9 = RTCCL(tr1);
	loc9 = RTRV(eif_new_type(270, 0x01),loc9);
	if (EIF_TEST(loc9)) {
		RTCK0;
	} else {
		RTCF0;
	}
	RTHOOK(4);
	RTDBGAL(4, 0x10000000, 1, 0); /* loc4 */
	ti4_1 = *(EIF_INTEGER_32 *)(loc9 + RTVA(5810, "count", loc9));
	ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
	loc4 = (EIF_INTEGER_32) (EIF_INTEGER_32) (ti4_1 / ti4_2);
	RTHOOK(5);
	RTDBGAL(1, 0x10000000, 1, 0); /* loc1 */
	loc1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 1L);
	for (;;) {
		RTHOOK(6);
		if ((EIF_BOOLEAN) (loc1 > loc4)) break;
		RTHOOK(7);
		RTDBGAL(6, 0xF8000022, 0, 0); /* loc6 */
		tr1 = RTLN(eif_new_type(34, 0x01).id);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
		RTNHOOK(7,1);
		loc6 = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(8);
		RTDBGAL(2, 0x10000000, 1, 0); /* loc2 */
		loc2 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 0L);
		for (;;) {
			RTHOOK(9);
			ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
			if ((EIF_BOOLEAN) (loc2 > (EIF_INTEGER_32) (ti4_1 - ((EIF_INTEGER_32) 1L)))) break;
			RTHOOK(10);
			RTDBGAL(7, 0x38000000, 1, 0); /* loc7 */
			ui4_1 = (EIF_INTEGER_32) (loc1 * loc2);
			tw1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(5536, "item", loc9))(loc9, ui4_1x)).it_c4);
			tu4_1 = (EIF_NATURAL_32) tw1;
			loc7 = (EIF_NATURAL_32) tu4_1;
			RTHOOK(11);
			uu4_1 = loc7;
			ui4_1 = loc2;
			(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(1153, "put", loc6))(loc6, uu4_1x, ui4_1x);
			RTHOOK(12);
			RTDBGAL(2, 0x10000000, 1, 0); /* loc2 */
			loc2++;
		}
		RTHOOK(13);
		RTDBGAL(1, 0x10000000, 1, 0); /* loc1 */
		loc1++;
	}
	RTHOOK(14);
	RTDBGAL(5, 0x10000000, 1, 0); /* loc5 */
	ti4_2 = *(EIF_INTEGER_32 *)(loc9 + RTVA(5810, "count", loc9));
	ti4_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
	loc5 = (EIF_INTEGER_32) (EIF_INTEGER_32) (ti4_2 % ti4_3);
	RTHOOK(15);
	if ((EIF_BOOLEAN) (loc5 > ((EIF_INTEGER_32) 0L))) {
		RTHOOK(16);
		RTDBGAL(1, 0x10000000, 1, 0); /* loc1 */
		ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
		loc1 = (EIF_INTEGER_32) (EIF_INTEGER_32) ((EIF_INTEGER_32) (loc4 * ti4_2) + ((EIF_INTEGER_32) 1L));
		if (RTAL & CK_CHECK) {
			RTHOOK(17);
			RTCT("index_big_enough", EX_CHECK);
			if ((EIF_BOOLEAN) (loc1 >= ((EIF_INTEGER_32) 1L))) {
				RTCK;
			} else {
				RTCF;
			}
			RTHOOK(18);
			RTCT("index_small_enough", EX_CHECK);
			ti4_2 = *(EIF_INTEGER_32 *)(loc9 + RTVA(5810, "count", loc9));
			if ((EIF_BOOLEAN) (loc1 <= ti4_2)) {
				RTCK;
			} else {
				RTCF;
			}
		}
		RTHOOK(19);
		RTDBGAL(6, 0xF8000022, 0, 0); /* loc6 */
		tr1 = RTLN(eif_new_type(34, 0x01).id);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
		RTNHOOK(19,1);
		loc6 = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(20);
		RTDBGAL(2, 0x10000000, 1, 0); /* loc2 */
		loc2 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 0L);
		RTHOOK(21);
		RTDBGAL(1, 0x10000000, 1, 0); /* loc1 */
		loc1 += loc2;
		RTHOOK(22);
		RTDBGAL(3, 0x10000000, 1, 0); /* loc3 */
		loc3 = (EIF_INTEGER_32) (EIF_INTEGER_32) (loc1 + loc2);
		if (RTAL & CK_LOOP) {
			RTHOOK(23);
			RTCT("i > fbc * {SHA_BLOCK_32}.words_per_block and pos <= m.count and b.count < {SHA_BLOCK_32}.words_per_block", EX_LINV);
			tb1 = '\0';
			tb2 = '\0';
			ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
			if ((EIF_BOOLEAN) (loc1 > (EIF_INTEGER_32) (loc4 * ti4_4))) {
				ti4_4 = *(EIF_INTEGER_32 *)(loc9 + RTVA(5810, "count", loc9));
				tb2 = (EIF_BOOLEAN) (loc3 <= ti4_4);
			}
			if (tb2) {
				ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1156, "count", loc6))(loc6)).it_i4);
				ti4_5 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
				tb1 = (EIF_BOOLEAN) (ti4_4 < ti4_5);
			}
			if (tb1) {
				RTCK;
			} else {
				RTCF;
			}
		}
		if (RTAL & CK_LOOP) {
			RTHOOK(24);
			RTCT("m.count - pos", EX_VAR);
			ti4_4 = *(EIF_INTEGER_32 *)(loc9 + RTVA(5810, "count", loc9));
			ti4_3 = (EIF_INTEGER_32) (ti4_4 - loc3);
			if (ti4_3 >= 0) {
				RTCK;
			} else {
				RTCF;
			}
		}
		for (;;) {
			RTHOOK(25);
			ti4_4 = *(EIF_INTEGER_32 *)(loc9 + RTVA(5810, "count", loc9));
			if ((EIF_BOOLEAN) (loc3 > ti4_4)) break;
			RTHOOK(26);
			RTDBGAL(3, 0x10000000, 1, 0); /* loc3 */
			loc3 = (EIF_INTEGER_32) (EIF_INTEGER_32) (loc1 + loc2);
			RTHOOK(27);
			ui4_1 = loc3;
			tw1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(5536, "item", loc9))(loc9, ui4_1x)).it_c4);
			tu4_1 = (EIF_NATURAL_32) tw1;
			uu4_1 = tu4_1;
			ui4_1 = loc3;
			(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(1153, "put", loc6))(loc6, uu4_1x, ui4_1x);
			RTHOOK(28);
			RTDBGAL(2, 0x10000000, 1, 0); /* loc2 */
			loc2++;
			if (RTAL & CK_LOOP) {
				RTHOOK(23);
				RTCT("i > fbc * {SHA_BLOCK_32}.words_per_block and pos <= m.count and b.count < {SHA_BLOCK_32}.words_per_block", EX_LINV);
				tb1 = '\0';
				tb2 = '\0';
				ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
				if ((EIF_BOOLEAN) (loc1 > (EIF_INTEGER_32) (loc4 * ti4_4))) {
					ti4_4 = *(EIF_INTEGER_32 *)(loc9 + RTVA(5810, "count", loc9));
					tb2 = (EIF_BOOLEAN) (loc3 <= ti4_4);
				}
				if (tb2) {
					ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1156, "count", loc6))(loc6)).it_i4);
					ti4_5 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
					tb1 = (EIF_BOOLEAN) (ti4_4 < ti4_5);
				}
				if (tb1) {
					RTCK;
				} else {
					RTCF;
				}
			}
			if (RTAL & CK_LOOP) {
				RTHOOK(24);
				RTCT("m.count - pos", EX_VAR);
				ti4_4 = *(EIF_INTEGER_32 *)(loc9 + RTVA(5810, "count", loc9));
				ti4_2 = (EIF_INTEGER_32) (ti4_4 - loc3);
				if ((ti4_3 > ti4_2) && ti4_2 >= 0) {
					RTCK;
					ti4_3 = ti4_2;
				} else {
					RTCF;
				}
			}
		}
	}
	RTHOOK(29);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWF(1523, dtype))(Current);
	RTHOOK(30);
	RTDBGAA(Current, dtype, 1511, 0x04000000, 1); /* is_padded */
	*(EIF_BOOLEAN *)(Current + RTWA(1511, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	RTHOOK(31);
	RTDBGAA(Current, dtype, 1512, 0x04000000, 1); /* is_parsed */
	*(EIF_BOOLEAN *)(Current + RTWA(1512, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(32);
		RTCT("is_padded", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1511, dtype));
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(33);
		RTCT("is_parsed", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1512, dtype));
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(34);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(11);
	RTEE;
#undef up1
#undef ui4_1
#undef uu4_1
}

/* {SHA_PARSER_32}.parse_string_8 */
void F67_1660 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "parse_string_8";
	RTEX;
	EIF_INTEGER_32 loc1 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc2 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc3 = (EIF_INTEGER_32) 0;
	EIF_REFERENCE loc4 = (EIF_REFERENCE) 0;
	EIF_CHARACTER_8 loc5 = (EIF_CHARACTER_8) 0;
	EIF_NATURAL_32 loc6 = (EIF_NATURAL_32) 0;
	EIF_INTEGER_32 loc7 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc8 = (EIF_INTEGER_32) 0;
	EIF_REFERENCE loc9 = (EIF_REFERENCE) 0;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(3);
	RTLR(0,Current);
	RTLR(1,loc9);
	RTLR(2,tr1);
	RTLIU(3);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTLU(SK_INT32, &loc1);
	RTLU(SK_INT32, &loc2);
	RTLU(SK_INT32, &loc3);
	RTLU(SK_REF, &loc4);
	RTLU(SK_CHAR8, &loc5);
	RTLU(SK_UINT32, &loc6);
	RTLU(SK_INT32, &loc7);
	RTLU(SK_INT32, &loc8);
	RTLU(SK_REF, &loc9);
	
	RTEAA(l_feature_name, 66, Current, 9, 0, 1107);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1107);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("not_file_input", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1508, dtype))(Current)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTHOOK(2);
		RTCT("is_8_bit_string", EX_PRE);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1504, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		loc9 = RTCCL(tr1);
		loc9 = RTRV(eif_new_type(267, 0x01),loc9);
		RTTE(EIF_TEST(loc9), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT("is_padded", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1511, dtype));
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(4);
		RTCT("is_parsed", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1512, dtype));
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(5);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(11);
	RTEE;
#undef up1
}

/* {SHA_PARSER_32}.parse_file */
void F67_1661 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "parse_file";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc3 = (EIF_REFERENCE) 0;
	EIF_INTEGER_32 loc4 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc5 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc6 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc7 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc8 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc9 = (EIF_INTEGER_32) 0;
	EIF_NATURAL_32 loc10 = (EIF_NATURAL_32) 0;
	EIF_NATURAL_32 loc11 = (EIF_NATURAL_32) 0;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE ui4_2x = {{0}, SK_INT32};
#define ui4_2 ui4_2x.it_i4
	EIF_TYPED_VALUE uu4_1x = {{0}, SK_UINT32};
#define uu4_1 uu4_1x.it_n4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	EIF_INTEGER_32 ti4_3;
	EIF_INTEGER_32 ti4_4;
	EIF_INTEGER_32 ti4_5;
	EIF_INTEGER_32 ti4_6;
	EIF_NATURAL_32 tu4_1;
	EIF_NATURAL_8 tu1_1;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(7);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,tr2);
	RTLR(3,ur1);
	RTLR(4,loc1);
	RTLR(5,loc3);
	RTLR(6,loc2);
	RTLIU(7);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_REF, &loc2);
	RTLU(SK_REF, &loc3);
	RTLU(SK_INT32, &loc4);
	RTLU(SK_INT32, &loc5);
	RTLU(SK_INT32, &loc6);
	RTLU(SK_INT32, &loc7);
	RTLU(SK_INT32, &loc8);
	RTLU(SK_INT32, &loc9);
	RTLU(SK_UINT32, &loc10);
	RTLU(SK_UINT32, &loc11);
	
	RTEAA(l_feature_name, 66, Current, 11, 0, 1108);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1108);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("origin_is_file", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1508, dtype))(Current)).it_b);
		RTTE(tb1, label_1);
		RTCK;
		RTHOOK(2);
		RTCT("filename_not_empty", EX_PRE);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1504, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(2,1);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5550, "is_empty", tr1))(tr1)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTHOOK(3);
		RTCT("filename_not_blank", EX_PRE);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1504, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(3,1);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(5551, "is_whitespace", tr1))(tr1)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTHOOK(4);
		RTCT("file_exists", EX_PRE);
		tr1 = RTLN(eif_new_type(199, 0x01).id);
		tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1504, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		ur1 = RTCCL(tr2);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(4099, Dtype(tr1)))(tr1, ur1x);
		RTNHOOK(4,1);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(3856, "exists", tr1))(tr1)).it_b);
		RTTE(tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(5);
	RTDBGAL(1, 0xF80000C7, 0, 0); /* loc1 */
	tr1 = RTLN(eif_new_type(199, 0x01).id);
	tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1504, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(4104, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(5,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(6);
	RTDBGAL(3, 0xF80000BC, 0, 0); /* loc3 */
	tr1 = RTLN(eif_new_type(188, 0x01).id);
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2895, "count", loc1))(loc1)).it_i4);
	ui4_1 = ti4_1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3670, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(6,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(7);
	ur1 = RTCCL(loc3);
	ui4_1 = ((EIF_INTEGER_32) 0L);
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2895, "count", loc1))(loc1)).it_i4);
	ui4_2 = ti4_1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3918, "read_to_managed_pointer", loc1))(loc1, ur1x, ui4_1x, ui4_2x);
	RTHOOK(8);
	RTDBGAL(4, 0x10000000, 1, 0); /* loc4 */
	ti4_1 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
	ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1149, 34))(Current)).it_i4);
	loc4 = (EIF_INTEGER_32) (EIF_INTEGER_32) (ti4_1 / ti4_2);
	RTHOOK(9);
	RTDBGAL(5, 0x10000000, 1, 0); /* loc5 */
	loc5 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 1L);
	for (;;) {
		RTHOOK(10);
		if ((EIF_BOOLEAN) (loc5 > loc4)) break;
		RTHOOK(11);
		RTDBGAL(2, 0xF8000022, 0, 0); /* loc2 */
		tr1 = RTLN(eif_new_type(34, 0x01).id);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
		RTNHOOK(11,1);
		loc2 = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(12);
		RTDBGAL(6, 0x10000000, 1, 0); /* loc6 */
		loc6 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 0L);
		for (;;) {
			RTHOOK(13);
			ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
			if ((EIF_BOOLEAN) (loc6 > (EIF_INTEGER_32) (ti4_1 - ((EIF_INTEGER_32) 1L)))) break;
			RTHOOK(14);
			RTDBGAL(10, 0x38000000, 1, 0); /* loc10 */
			ui4_1 = (EIF_INTEGER_32) (loc5 * loc6);
			tu4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(3681, "read_natural_32", loc3))(loc3, ui4_1x)).it_n4);
			loc10 = (EIF_NATURAL_32) tu4_1;
			RTHOOK(15);
			uu4_1 = loc10;
			ui4_1 = loc6;
			(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(1153, "put", loc2))(loc2, uu4_1x, ui4_1x);
			RTHOOK(16);
			RTDBGAL(6, 0x10000000, 1, 0); /* loc6 */
			loc6++;
		}
		RTHOOK(17);
		RTDBGAL(5, 0x10000000, 1, 0); /* loc5 */
		loc5++;
	}
	RTHOOK(18);
	RTDBGAL(8, 0x10000000, 1, 0); /* loc8 */
	ti4_2 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
	ti4_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1149, 34))(Current)).it_i4);
	loc8 = (EIF_INTEGER_32) (EIF_INTEGER_32) (ti4_2 % ti4_3);
	RTHOOK(19);
	if ((EIF_BOOLEAN) (loc8 > ((EIF_INTEGER_32) 0L))) {
		RTHOOK(20);
		RTDBGAL(5, 0x10000000, 1, 0); /* loc5 */
		ti4_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
		loc5 = (EIF_INTEGER_32) (EIF_INTEGER_32) ((EIF_INTEGER_32) (loc4 * ti4_2) + ((EIF_INTEGER_32) 1L));
		if (RTAL & CK_CHECK) {
			RTHOOK(21);
			RTCT("index_big_enough", EX_CHECK);
			if ((EIF_BOOLEAN) (loc5 >= ((EIF_INTEGER_32) 1L))) {
				RTCK;
			} else {
				RTCF;
			}
			RTHOOK(22);
			RTCT("index_small_enough", EX_CHECK);
			ti4_2 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
			if ((EIF_BOOLEAN) (loc5 <= ti4_2)) {
				RTCK;
			} else {
				RTCF;
			}
		}
		RTHOOK(23);
		RTDBGAL(2, 0xF8000022, 0, 0); /* loc2 */
		tr1 = RTLN(eif_new_type(34, 0x01).id);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
		RTNHOOK(23,1);
		loc2 = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(24);
		RTDBGAL(6, 0x10000000, 1, 0); /* loc6 */
		loc6 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 0L);
		RTHOOK(25);
		RTDBGAL(5, 0x10000000, 1, 0); /* loc5 */
		loc5 += loc6;
		RTHOOK(26);
		RTDBGAL(7, 0x10000000, 1, 0); /* loc7 */
		loc7 = (EIF_INTEGER_32) loc5;
		if (RTAL & CK_LOOP) {
			RTHOOK(27);
			RTCT("i > fbc * {SHA_BLOCK_32}.words_per_block and pos <= mp.count and b.count < {SHA_BLOCK_32}.words_per_block", EX_LINV);
			tb1 = '\0';
			tb2 = '\0';
			ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
			if ((EIF_BOOLEAN) (loc5 > (EIF_INTEGER_32) (loc4 * ti4_4))) {
				ti4_4 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
				tb2 = (EIF_BOOLEAN) (loc7 <= ti4_4);
			}
			if (tb2) {
				ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1156, "count", loc2))(loc2)).it_i4);
				ti4_5 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
				tb1 = (EIF_BOOLEAN) (ti4_4 < ti4_5);
			}
			if (tb1) {
				RTCK;
			} else {
				RTCF;
			}
		}
		if (RTAL & CK_LOOP) {
			RTHOOK(28);
			RTCT("mp.count - (pos)", EX_VAR);
			ti4_4 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
			ti4_3 = (EIF_INTEGER_32) (ti4_4 - loc7);
			if (ti4_3 >= 0) {
				RTCK;
			} else {
				RTCF;
			}
		}
		for (;;) {
			RTHOOK(29);
			ti4_4 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
			if ((EIF_BOOLEAN) (loc7 > ti4_4)) break;
			RTHOOK(30);
			RTDBGAL(7, 0x10000000, 1, 0); /* loc7 */
			loc7 = (EIF_INTEGER_32) (EIF_INTEGER_32) (loc5 + loc6);
			RTHOOK(31);
			ti4_5 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1148, 34))(Current)).it_i4);
			ti4_6 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
			if ((EIF_BOOLEAN) ((EIF_INTEGER_32) (loc7 + ti4_5) <= ti4_6)) {
				RTHOOK(32);
				RTDBGAL(10, 0x38000000, 1, 0); /* loc10 */
				ui4_1 = loc7;
				tu4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(3681, "read_natural_32", loc3))(loc3, ui4_1x)).it_n4);
				loc10 = (EIF_NATURAL_32) tu4_1;
			} else {
				if (RTAL & CK_CHECK) {
					RTHOOK(33);
					RTCT("is_some_bytes_remaining", EX_CHECK);
					ti4_5 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2329, "natural_8_bytes", loc3))(loc3)).it_i4);
					ti4_6 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
					if ((EIF_BOOLEAN) ((EIF_INTEGER_32) (loc7 + ti4_5) <= ti4_6)) {
						RTCK;
					} else {
						RTCF;
					}
				}
				if (RTAL & CK_CHECK) {
					RTHOOK(34);
					RTCT("not_full_word_reamining", EX_CHECK);
					ti4_5 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2345, "natural_32_bits", loc3))(loc3)).it_i4);
					ti4_6 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
					if ((EIF_BOOLEAN) ((EIF_INTEGER_32) (loc7 + ti4_5) > ti4_6)) {
						RTCK;
					} else {
						RTCF;
					}
				}
				for (;;) {
					RTHOOK(35);
					ti4_5 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
					if ((EIF_BOOLEAN) (loc7 > ti4_5)) break;
					RTHOOK(36);
					RTDBGAL(11, 0x38000000, 1, 0); /* loc11 */
					ui4_1 = loc7;
					tu1_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(3679, "read_natural_8", loc3))(loc3, ui4_1x)).it_n1);
					tu4_1 = (EIF_NATURAL_32) tu1_1;
					loc11 = (EIF_NATURAL_32) tu4_1;
					RTHOOK(37);
					RTDBGAL(10, 0x38000000, 1, 0); /* loc10 */
					uu4_1 = loc11;
					tu4_1 = eif_bit_or(loc10,uu4_1);
					loc10 = (EIF_NATURAL_32) tu4_1;
					RTHOOK(38);
					RTDBGAL(10, 0x38000000, 1, 0); /* loc10 */
					ui4_1 = ((EIF_INTEGER_32) 8L);
					tu4_1 = eif_bit_shift_left(loc10,ui4_1);
					loc10 = (EIF_NATURAL_32) tu4_1;
					RTHOOK(39);
					RTDBGAL(7, 0x10000000, 1, 0); /* loc7 */
					ti4_6 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(2343, "natural_8_bits", loc3))(loc3)).it_i4);
					loc7 += ti4_6;
					RTHOOK(40);
					RTDBGAL(9, 0x10000000, 1, 0); /* loc9 */
					loc9++;
					if (RTAL & CK_CHECK) {
						RTHOOK(41);
						RTCT("not_too_many_bytes_read", EX_CHECK);
						ti4_6 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1151, 34))(Current)).it_i4);
						if ((EIF_BOOLEAN) (loc9 < ti4_6)) {
							RTCK;
						} else {
							RTCF;
						}
					}
				}
				RTHOOK(42);
				RTDBGAL(11, 0x38000000, 1, 0); /* loc11 */
				loc11 = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_64) RTI64C(2147483648));
				RTHOOK(43);
				RTDBGAL(10, 0x38000000, 1, 0); /* loc10 */
				uu4_1 = loc11;
				tu4_1 = eif_bit_or(loc10,uu4_1);
				loc10 = (EIF_NATURAL_32) tu4_1;
				RTHOOK(44);
				RTDBGAL(9, 0x10000000, 1, 0); /* loc9 */
				loc9++;
				RTHOOK(45);
				RTDBGAA(Current, dtype, 1510, 0x04000000, 1); /* is_one_padded */
				*(EIF_BOOLEAN *)(Current + RTWA(1510, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
				RTHOOK(46);
				ti4_6 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1151, 34))(Current)).it_i4);
				if ((EIF_BOOLEAN) (loc9 < ti4_6)) {
					for (;;) {
						RTHOOK(47);
						ti4_6 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1151, 34))(Current)).it_i4);
						if ((EIF_BOOLEAN) (loc9 > ti4_6)) break;
						RTHOOK(48);
						RTDBGAL(10, 0x38000000, 1, 0); /* loc10 */
						ui4_1 = ((EIF_INTEGER_32) 8L);
						tu4_1 = eif_bit_shift_left(loc10,ui4_1);
						loc10 = (EIF_NATURAL_32) tu4_1;
						RTHOOK(49);
						RTDBGAL(11, 0x38000000, 1, 0); /* loc11 */
						loc11 = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L);
						RTHOOK(50);
						RTDBGAL(10, 0x38000000, 1, 0); /* loc10 */
						uu4_1 = loc11;
						tu4_1 = eif_bit_or(loc10,uu4_1);
						loc10 = (EIF_NATURAL_32) tu4_1;
						RTHOOK(51);
						RTDBGAL(9, 0x10000000, 1, 0); /* loc9 */
						loc9++;
					}
				}
			}
			RTHOOK(52);
			uu4_1 = loc10;
			ui4_1 = loc6;
			(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(1153, "put", loc2))(loc2, uu4_1x, ui4_1x);
			RTHOOK(53);
			RTDBGAL(6, 0x10000000, 1, 0); /* loc6 */
			loc6++;
			if (RTAL & CK_LOOP) {
				RTHOOK(27);
				RTCT("i > fbc * {SHA_BLOCK_32}.words_per_block and pos <= mp.count and b.count < {SHA_BLOCK_32}.words_per_block", EX_LINV);
				tb1 = '\0';
				tb2 = '\0';
				ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
				if ((EIF_BOOLEAN) (loc5 > (EIF_INTEGER_32) (loc4 * ti4_4))) {
					ti4_4 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
					tb2 = (EIF_BOOLEAN) (loc7 <= ti4_4);
				}
				if (tb2) {
					ti4_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(1156, "count", loc2))(loc2)).it_i4);
					ti4_5 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1146, 34))(Current)).it_i4);
					tb1 = (EIF_BOOLEAN) (ti4_4 < ti4_5);
				}
				if (tb1) {
					RTCK;
				} else {
					RTCF;
				}
			}
			if (RTAL & CK_LOOP) {
				RTHOOK(28);
				RTCT("mp.count - (pos)", EX_VAR);
				ti4_4 = *(EIF_INTEGER_32 *)(loc3 + RTVA(3677, "count", loc3));
				ti4_2 = (EIF_INTEGER_32) (ti4_4 - loc7);
				if ((ti4_3 > ti4_2) && ti4_2 >= 0) {
					RTCK;
					ti4_3 = ti4_2;
				} else {
					RTCF;
				}
			}
		}
	}
	RTHOOK(54);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWF(1523, dtype))(Current);
	RTHOOK(55);
	RTDBGAA(Current, dtype, 1511, 0x04000000, 1); /* is_padded */
	*(EIF_BOOLEAN *)(Current + RTWA(1511, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	RTHOOK(56);
	RTDBGAA(Current, dtype, 1512, 0x04000000, 1); /* is_parsed */
	*(EIF_BOOLEAN *)(Current + RTWA(1512, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(57);
		RTCT("is_one_padded", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1510, dtype));
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(58);
		RTCT("is_padded", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1511, dtype));
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(59);
		RTCT("is_parsed", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1512, dtype));
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(60);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(13);
	RTEE;
#undef up1
#undef ur1
#undef ui4_1
#undef ui4_2
#undef uu4_1
}

/* {SHA_PARSER_32}.bits_per_word */
EIF_TYPED_VALUE F67_1662 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 32L);
	return r;
}

/* {SHA_PARSER_32}.bytes_per_word */
EIF_TYPED_VALUE F67_1663 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 4L);
	return r;
}

/* {SHA_PARSER_32}.blocks */
EIF_TYPED_VALUE F67_1664 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(1537,Dtype(Current)));
	return r;
}


/* {SHA_PARSER_32}.new_block */
EIF_TYPED_VALUE F67_1665 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "new_block";
	RTEX;
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(3);
	RTLR(0,tr1);
	RTLR(1,Result);
	RTLR(2,Current);
	RTLIU(3);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 66, Current, 0, 0, 1112);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1112);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0xF8000022, 0,0); /* Result */
	tr1 = RTLN(eif_new_type(34, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
}

/* {SHA_PARSER_32}.anchor_block */
EIF_TYPED_VALUE F67_1666 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "anchor_block";
	RTEX;
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(3);
	RTLR(0,tr1);
	RTLR(1,Result);
	RTLR(2,Current);
	RTLIU(3);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 66, Current, 0, 0, 1113);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1113);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0xF8000022, 0,0); /* Result */
	tr1 = RTLN(eif_new_type(34, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
}

/* {SHA_PARSER_32}.word_anchor */
EIF_TYPED_VALUE F67_1667 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "word_anchor";
	RTEX;
	EIF_NATURAL_32 Result = ((EIF_NATURAL_32) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_UINT32, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 66, Current, 0, 0, 1114);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1114);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("not_callable", EX_PRE);
		RTTE((EIF_BOOLEAN) 0, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTCT0("do_not_call", EX_CHECK);
		RTCF0;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_UINT32; r.it_n4 = Result; return r; }
}

/* {SHA_PARSER_32}.block_anchor */
EIF_TYPED_VALUE F67_1668 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "block_anchor";
	RTEX;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 66, Current, 0, 0, 1115);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(66, Current, 1115);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("not_callable", EX_PRE);
		RTTE((EIF_BOOLEAN) 0, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTCT0("do_not_call", EX_CHECK);
		RTCF0;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
}

/* {SHA_PARSER_32}._invariant */
void F67_8699 (EIF_REFERENCE Current, int where)
{
	GTCX
	char *l_feature_name = "_invariant";
	RTEX;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	RTCDT;
	RTLD;
	RTDA;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTEAINV(l_feature_name, 66, Current, 0, 8698);
	RTSA(dtype);
	RTME(dtype, 0);
	RTIT("is_padded implies is_one_padded", Current);
	tb1 = *(EIF_BOOLEAN *)(Current + RTWA(1511, dtype));
	tb2 = *(EIF_BOOLEAN *)(Current + RTWA(1510, dtype));
	if ((!(tb1) || (tb2))) {
		RTCK;
	} else {
		RTCF;
	}
	RTLO(2);
	RTMD(0);
	RTLE;
	RTEE;
}

void EIF_Minit67 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
