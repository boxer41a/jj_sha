/*
 * Code for class CODE_SETS
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern EIF_TYPED_VALUE F30_1183(EIF_REFERENCE);
extern EIF_TYPED_VALUE F30_1184(EIF_REFERENCE);
extern EIF_TYPED_VALUE F30_1185(EIF_REFERENCE);
extern EIF_TYPED_VALUE F30_1186(EIF_REFERENCE);
extern EIF_TYPED_VALUE F30_1187(EIF_REFERENCE);
extern void EIF_Minit30(void);

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

/* {CODE_SETS}.code_pages */
RTOID (F30_1183)
EIF_TYPED_VALUE F30_1183 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "code_pages";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	RTCDD;
	RTSN;
	RTDA;
	RTLD;
	
#define Result RTOTRR
	RTOTDR(F30_1183);
	dtype = Dtype(Current);

	RTLI(5);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,ur1);
	RTLR(3,tr2);
	RTLR(4,ur2);
	RTLIU(5);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 29, Current, 0, 0, 726);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(29, Current, 726);
	RTIV(Current, RTAL);
	RTOTP;
	RTHOOK(1);
	RTDBGAL(0, 0xF8000237, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,567,0xFF01,266,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 122L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(4583, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	tr1 = RTMS_EX_H("ASCII",5,1397417801);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ascii",5,1936639849);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(3);
	tr1 = RTMS_EX_H("ISO-8859-1",10,1255164721);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-1",10,1003358513);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(4);
	tr1 = RTMS_EX_H("ISO-8859-2",10,1255164722);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-2",10,1003358514);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(5);
	tr1 = RTMS_EX_H("ISO-8859-3",10,1255164723);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-3",10,1003358515);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(6);
	tr1 = RTMS_EX_H("ISO-8859-4",10,1255164724);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-4",10,1003358516);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(7);
	tr1 = RTMS_EX_H("ISO-8859-5",10,1255164725);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-5",10,1003358517);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(8);
	tr1 = RTMS_EX_H("ISO-8859-7",10,1255164727);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-7",10,1003358519);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(9);
	tr1 = RTMS_EX_H("ISO-8859-9",10,1255164729);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-9",10,1003358521);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(10);
	tr1 = RTMS_EX_H("ISO-8859-10",11,1347677232);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-10",11,1309682224);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(11);
	tr1 = RTMS_EX_H("ISO-8859-13",11,1347677235);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-13",11,1309682227);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(12);
	tr1 = RTMS_EX_H("ISO-8859-14",11,1347677236);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-14",11,1309682228);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(13);
	tr1 = RTMS_EX_H("ISO-8859-15",11,1347677237);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-15",11,1309682229);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(14);
	tr1 = RTMS_EX_H("ISO-8859-16",11,1347677238);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-16",11,1309682230);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(15);
	tr1 = RTMS_EX_H("KOI8-R",6,1376481106);
	ur1 = tr1;
	tr2 = RTMS_EX_H("koi8-r",6,1976512370);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(16);
	tr1 = RTMS_EX_H("KOI8-U",6,1376481109);
	ur1 = tr1;
	tr2 = RTMS_EX_H("koi8-u",6,1976512373);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(17);
	tr1 = RTMS_EX_H("KOI8-RU",7,192474709);
	ur1 = tr1;
	tr2 = RTMS_EX_H("koi8-ru",7,1329411957);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(18);
	tr1 = RTMS_EX_H("CP1250",6,957715760);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp1250",6,1020876080);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(19);
	tr1 = RTMS_EX_H("CP1251",6,957715761);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp1251",6,1020876081);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(20);
	tr1 = RTMS_EX_H("CP1252",6,957715762);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp1252",6,1020876082);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(21);
	tr1 = RTMS_EX_H("CP1253",6,957715763);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp1253",6,1020876083);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(22);
	tr1 = RTMS_EX_H("CP1254",6,957715764);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp1254",6,1020876084);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(23);
	tr1 = RTMS_EX_H("CP1257",6,957715767);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp1257",6,1020876087);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(24);
	tr1 = RTMS_EX_H("CP850",5,1346375472);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp850",5,1883492144);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(25);
	tr1 = RTMS_EX_H("CP866",5,1346375734);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp866",5,1883492406);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(26);
	tr1 = RTMS_EX_H("MacRoman",8,1512114798);
	ur1 = tr1;
	tr2 = RTMS_EX_H("macroman",8,1519733358);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(27);
	tr1 = RTMS_EX_H("MacCentralEurope",16,596261733);
	ur1 = tr1;
	tr2 = RTMS_EX_H("maccentraleurope",16,1462696293);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(28);
	tr1 = RTMS_EX_H("MacIceland",10,277364324);
	ur1 = tr1;
	tr2 = RTMS_EX_H("maciceland",10,1351997028);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(29);
	tr1 = RTMS_EX_H("MacCroatian",11,1582373742);
	ur1 = tr1;
	tr2 = RTMS_EX_H("maccroatian",11,1810930542);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(30);
	tr1 = RTMS_EX_H("MacRomania",10,352208737);
	ur1 = tr1;
	tr2 = RTMS_EX_H("macromania",10,1426841441);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(31);
	tr1 = RTMS_EX_H("MacCyrillic",11,682570083);
	ur1 = tr1;
	tr2 = RTMS_EX_H("maccyrillic",11,911126883);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(32);
	tr1 = RTMS_EX_H("MacUkraine",10,1854005861);
	ur1 = tr1;
	tr2 = RTMS_EX_H("macukraine",10,781158757);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(33);
	tr1 = RTMS_EX_H("MacGreek",8,1561838699);
	ur1 = tr1;
	tr2 = RTMS_EX_H("macgreek",8,1569457259);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(34);
	tr1 = RTMS_EX_H("MacTurkish",10,1538123624);
	ur1 = tr1;
	tr2 = RTMS_EX_H("macturkish",10,465276520);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(35);
	tr1 = RTMS_EX_H("Macintosh",9,718594408);
	ur1 = tr1;
	tr2 = RTMS_EX_H("macintosh",9,458551400);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(36);
	tr1 = RTMS_EX_H("ISO-8859-6",10,1255164726);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-6",10,1003358518);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(37);
	tr1 = RTMS_EX_H("ISO-8859-8",10,1255164728);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-8",10,1003358520);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(38);
	tr1 = RTMS_EX_H("CP1255",6,957715765);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp1255",6,1020876085);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(39);
	tr1 = RTMS_EX_H("CP1256",6,957715766);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp1256",6,1020876086);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(40);
	tr1 = RTMS_EX_H("CP862",5,1346375730);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp862",5,1883492402);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(41);
	tr1 = RTMS_EX_H("MacHebrew",9,351847799);
	ur1 = tr1;
	tr2 = RTMS_EX_H("machebrew",9,154719351);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(42);
	tr1 = RTMS_EX_H("MacArabic",9,320360291);
	ur1 = tr1;
	tr2 = RTMS_EX_H("macarabic",9,123231843);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(43);
	tr1 = RTMS_EX_H("EUC-JP",6,1263353936);
	ur1 = tr1;
	tr2 = RTMS_EX_H("euc-jp",6,1863393392);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(44);
	tr1 = RTMS_EX_H("SHIFT_JIS",9,441609555);
	ur1 = tr1;
	tr2 = RTMS_EX_H("shift_jis",9,1327973747);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(45);
	tr1 = RTMS_EX_H("CP932",5,1346440498);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp932",5,1883557170);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(46);
	tr1 = RTMS_EX_H("ISO-2022-JP",11,342072400);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-2022-jp",11,304085616);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(47);
	tr1 = RTMS_EX_H("ISO-2022-JP-2",13,515102258);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-2022-jp-2",13,2089803314);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(48);
	tr1 = RTMS_EX_H("ISO-2022-JP-1",13,515102257);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-2022-jp-1",13,2089803313);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(49);
	tr1 = RTMS_EX_H("EUC-CN",6,1263352142);
	ur1 = tr1;
	tr2 = RTMS_EX_H("euc-cn",6,1863391598);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(50);
	tr1 = RTMS_EX_H("HZ",2,18522);
	ur1 = tr1;
	tr2 = RTMS_EX_H("hz",2,26746);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(51);
	tr1 = RTMS_EX_H("GBK",3,4670027);
	ur1 = tr1;
	tr2 = RTMS_EX_H("gbk",3,6775403);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(52);
	tr1 = RTMS_EX_H("CP936",5,1346440502);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp936",5,1883557174);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(53);
	tr1 = RTMS_EX_H("GB18030",7,301133872);
	ur1 = tr1;
	tr2 = RTMS_EX_H("gb18030",7,1437817136);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(54);
	tr1 = RTMS_EX_H("EUC-TW",6,1263356503);
	ur1 = tr1;
	tr2 = RTMS_EX_H("euc-tw",6,1863395959);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(55);
	tr1 = RTMS_EX_H("BIG5",4,1112098613);
	ur1 = tr1;
	tr2 = RTMS_EX_H("big5",4,1651074869);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(56);
	tr1 = RTMS_EX_H("CP950",5,1346441008);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp950",5,1883557680);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(57);
	tr1 = RTMS_EX_H("BIG5-HKSCS",10,274423891);
	ur1 = tr1;
	tr2 = RTMS_EX_H("big5-hkscs",10,561839731);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(58);
	tr1 = RTMS_EX_H("BIG5-HKSCS:2001",15,896680241);
	ur1 = tr1;
	tr2 = RTMS_EX_H("big5-hkscs:2001",15,2037149745);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(59);
	tr1 = RTMS_EX_H("BIG5-HKSCS:1999",15,880495161);
	ur1 = tr1;
	tr2 = RTMS_EX_H("big5-hkscs:1999",15,2020964665);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(60);
	tr1 = RTMS_EX_H("ISO-2022-CN",11,342070606);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-2022-cn",11,304083822);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(61);
	tr1 = RTMS_EX_H("ISO-2022-CN-EXT",15,1493968212);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-2022-cn-ext",15,1814826356);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(62);
	tr1 = RTMS_EX_H("EUC-KR",6,1263354194);
	ur1 = tr1;
	tr2 = RTMS_EX_H("euc-kr",6,1863393650);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(63);
	tr1 = RTMS_EX_H("CP949",5,1346440761);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp949",5,1883557433);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(64);
	tr1 = RTMS_EX_H("ISO-2022-KR",11,342072658);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-2022-kr",11,304085874);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(65);
	tr1 = RTMS_EX_H("JOHAB",5,1330703682);
	ur1 = tr1;
	tr2 = RTMS_EX_H("johab",5,1869925730);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(66);
	tr1 = RTMS_EX_H("ARMSCII-8",9,1051753272);
	ur1 = tr1;
	tr2 = RTMS_EX_H("armscii-8",9,327500344);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(67);
	tr1 = RTMS_EX_H("Georgian-Academy",16,725494137);
	ur1 = tr1;
	tr2 = RTMS_EX_H("georgian-academy",16,429383033);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(68);
	tr1 = RTMS_EX_H("Georgian-PS",11,1170144339);
	ur1 = tr1;
	tr2 = RTMS_EX_H("georgian-ps",11,1391336563);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(69);
	tr1 = RTMS_EX_H("KOI8-T",6,1376481108);
	ur1 = tr1;
	tr2 = RTMS_EX_H("koi8-t",6,1976512372);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(70);
	tr1 = RTMS_EX_H("PT154",5,1413125428);
	ur1 = tr1;
	tr2 = RTMS_EX_H("pt154",5,1950242100);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(71);
	tr1 = RTMS_EX_H("RK1048",6,987037240);
	ur1 = tr1;
	tr2 = RTMS_EX_H("rk1048",6,1050197560);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(72);
	tr1 = RTMS_EX_H("ISO-8859-11",11,1347677233);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-8859-11",11,1309682225);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(73);
	tr1 = RTMS_EX_H("TIS-620",7,231675952);
	ur1 = tr1;
	tr2 = RTMS_EX_H("tis-620",7,1368604976);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(74);
	tr1 = RTMS_EX_H("CP874",5,1346375988);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp874",5,1883492660);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(75);
	tr1 = RTMS_EX_H("MacThai",7,1708329321);
	ur1 = tr1;
	tr2 = RTMS_EX_H("macthai",7,1171489129);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(76);
	tr1 = RTMS_EX_H("MuleLao-1",9,631180593);
	ur1 = tr1;
	tr2 = RTMS_EX_H("mulelao-1",9,371383345);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(77);
	tr1 = RTMS_EX_H("CP1133",6,957649715);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp1133",6,1020810035);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(78);
	tr1 = RTMS_EX_H("VISCII",6,1566562121);
	ur1 = tr1;
	tr2 = RTMS_EX_H("viscii",6,21218921);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(79);
	tr1 = RTMS_EX_H("TCVN",4,1413699150);
	ur1 = tr1;
	tr2 = RTMS_EX_H("tcvn",4,1952675438);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(80);
	tr1 = RTMS_EX_H("CP1258",6,957715768);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp1258",6,1020876088);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(81);
	tr1 = RTMS_EX_H("HP-ROMAN8",9,455119672);
	ur1 = tr1;
	tr2 = RTMS_EX_H("hp-roman8",9,804586040);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(82);
	tr1 = RTMS_EX_H("NEXTSTEP",8,1958823248);
	ur1 = tr1;
	tr2 = RTMS_EX_H("nextstep",8,1494621552);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(83);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(590, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-8",5,1953751864);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(84);
	tr1 = RTMS_EX_H("UCS-2",5,1130177330);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-2",5,1669391154);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(85);
	tr1 = RTMS_EX_H("UCS-2BE",7,722937925);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-2be",7,1859875173);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(86);
	tr1 = RTMS_EX_H("UCS-2LE",7,722940485);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-2le",7,1859877733);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(87);
	tr1 = RTMS_EX_H("UCS-4",5,1130177332);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-4",5,1669391156);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(88);
	tr1 = RTMS_EX_H("UCS-4BE",7,723068997);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-4be",7,1860006245);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(89);
	tr1 = RTMS_EX_H("UCS-4LE",7,723071557);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-4le",7,1860008805);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(90);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(591, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-16",6,1945159990);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(91);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(595, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-16be",8,1456247141);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(92);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(593, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-16le",8,1456249701);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(93);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(592, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-32",6,1945160498);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(94);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(596, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-32be",8,1489539429);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(95);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(594, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-32le",8,1489541989);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(96);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(589, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-7",5,1953751863);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(97);
	tr1 = RTMS_EX_H("C99",3,4405561);
	ur1 = tr1;
	tr2 = RTMS_EX_H("c99",3,6502713);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(98);
	tr1 = RTMS_EX_H("JAVA",4,1245795905);
	ur1 = tr1;
	tr2 = RTMS_EX_H("java",4,1784772193);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(99);
	tr1 = RTMS_EX_H("UCS-2-INTERNAL",14,834453068);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-2-internal",14,1377880940);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(100);
	tr1 = RTMS_EX_H("UCS-4-INTERNAL",14,968724556);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-4-internal",14,1512152428);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(101);
	tr1 = RTMS_EX_H("CP437",5,1346112823);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp437",5,1883229495);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(102);
	tr1 = RTMS_EX_H("CP737",5,1346309431);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp737",5,1883426103);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(103);
	tr1 = RTMS_EX_H("CP775",5,1346310453);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp775",5,1883427125);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(104);
	tr1 = RTMS_EX_H("CP852",5,1346375474);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp852",5,1883492146);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(105);
	tr1 = RTMS_EX_H("CP853",5,1346375475);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp853",5,1883492147);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(106);
	tr1 = RTMS_EX_H("CP855",5,1346375477);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp855",5,1883492149);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(107);
	tr1 = RTMS_EX_H("CP857",5,1346375479);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp857",5,1883492151);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(108);
	tr1 = RTMS_EX_H("CP858",5,1346375480);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp858",5,1883492152);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(109);
	tr1 = RTMS_EX_H("CP860",5,1346375728);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp860",5,1883492400);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(110);
	tr1 = RTMS_EX_H("CP861",5,1346375729);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp861",5,1883492401);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(111);
	tr1 = RTMS_EX_H("CP863",5,1346375731);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp863",5,1883492403);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(112);
	tr1 = RTMS_EX_H("CP865",5,1346375733);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp865",5,1883492405);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(113);
	tr1 = RTMS_EX_H("CP869",5,1346375737);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp869",5,1883492409);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(114);
	tr1 = RTMS_EX_H("CP1125",6,957649461);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp1125",6,1020809781);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(115);
	tr1 = RTMS_EX_H("CP864",5,1346375732);
	ur1 = tr1;
	tr2 = RTMS_EX_H("cp864",5,1883492404);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(116);
	tr1 = RTMS_EX_H("EUC-JISX0213",12,61574707);
	ur1 = tr1;
	tr2 = RTMS_EX_H("euc-jisx0213",12,69073715);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(117);
	tr1 = RTMS_EX_H("Shift_JISX0213",14,441029939);
	ur1 = tr1;
	tr2 = RTMS_EX_H("shift_jisx0213",14,1778412339);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(118);
	tr1 = RTMS_EX_H("ISO-2022-JP-3",13,515102259);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-2022-jp-3",13,2089803315);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(119);
	tr1 = RTMS_EX_H("BIG5-2003",9,1937057843);
	ur1 = tr1;
	tr2 = RTMS_EX_H("big5-2003",9,610676531);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(120);
	tr1 = RTMS_EX_H("TDS565",6,1561669173);
	ur1 = tr1;
	tr2 = RTMS_EX_H("tds565",6,14220597);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(121);
	tr1 = RTMS_EX_H("ATARIST",7,2049561172);
	ur1 = tr1;
	tr2 = RTMS_EX_H("atarist",7,1577986676);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(122);
	tr1 = RTMS_EX_H("RISCOS-LATIN1",13,1872232241);
	ur1 = tr1;
	tr2 = RTMS_EX_H("riscos-latin1",13,1110815793);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTVI(Current, RTAL);
	RTRS;
	RTOTE;
	RTHOOK(123);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
#undef ur1
#undef ur2
#undef ui4_1
#undef Result
}

/* {CODE_SETS}.two_byte_code_pages */
RTOID (F30_1184)
EIF_TYPED_VALUE F30_1184 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "two_byte_code_pages";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	RTCDD;
	RTSN;
	RTDA;
	RTLD;
	
#define Result RTOTRR
	RTOTDR(F30_1184);
	dtype = Dtype(Current);

	RTLI(5);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,ur1);
	RTLR(3,tr2);
	RTLR(4,ur2);
	RTLIU(5);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 29, Current, 0, 0, 727);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(29, Current, 727);
	RTIV(Current, RTAL);
	RTOTP;
	RTHOOK(1);
	RTDBGAL(0, 0xF8000237, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,567,0xFF01,266,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 20L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(4583, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	tr1 = RTMS_EX_H("UCS-2",5,1130177330);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-2",5,1669391154);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(3);
	tr1 = RTMS_EX_H("ISO-10646-UCS-2",15,137660722);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-10646-ucs-2",15,932466994);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(4);
	tr1 = RTMS_EX_H("csUnicode",9,1140938597);
	ur1 = tr1;
	tr2 = RTMS_EX_H("csunicode",9,67227493);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(5);
	tr1 = RTMS_EX_H("UCS-2BE",7,722937925);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-2be",7,1859875173);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(6);
	tr1 = RTMS_EX_H("UNICODEBIG",10,266927431);
	ur1 = tr1;
	tr2 = RTMS_EX_H("unicodebig",10,1691026535);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(7);
	tr1 = RTMS_EX_H("UNICODE-1-1",11,1407647281);
	ur1 = tr1;
	tr2 = RTMS_EX_H("unicode-1-1",11,366474289);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(8);
	tr1 = RTMS_EX_H("csUnicode11",11,1599950641);
	ur1 = tr1;
	tr2 = RTMS_EX_H("csunicode11",11,1339907633);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(9);
	tr1 = RTMS_EX_H("UCS-2LE",7,722940485);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-2le",7,1859877733);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(10);
	tr1 = RTMS_EX_H("UNICODELITTLE",13,852373061);
	ur1 = tr1;
	tr2 = RTMS_EX_H("unicodelittle",13,1164725349);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(11);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(591, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-16",6,1945159990);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(12);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(595, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-16be",8,1456247141);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(13);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(593, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-16le",8,1456249701);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(14);
	tr1 = RTMS_EX_H("UCS-2-INTERNAL",14,834453068);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-2-internal",14,1377880940);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(15);
	tr1 = RTMS_EX_H("UCS-2-SWAPPED",13,297507908);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-2-swapped",13,861666404);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(16);
	tr1 = RTMS_EX_H("JAVA",4,1245795905);
	ur1 = tr1;
	tr2 = RTMS_EX_H("java",4,1784772193);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTVI(Current, RTAL);
	RTRS;
	RTOTE;
	RTHOOK(17);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
#undef ur1
#undef ur2
#undef ui4_1
#undef Result
}

/* {CODE_SETS}.four_byte_code_pages */
RTOID (F30_1185)
EIF_TYPED_VALUE F30_1185 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "four_byte_code_pages";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	RTCDD;
	RTSN;
	RTDA;
	RTLD;
	
#define Result RTOTRR
	RTOTDR(F30_1185);
	dtype = Dtype(Current);

	RTLI(5);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,ur1);
	RTLR(3,tr2);
	RTLR(4,ur2);
	RTLIU(5);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 29, Current, 0, 0, 728);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(29, Current, 728);
	RTIV(Current, RTAL);
	RTOTP;
	RTHOOK(1);
	RTDBGAL(0, 0xF8000237, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,567,0xFF01,266,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(4583, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	tr1 = RTMS_EX_H("UCS-4",5,1130177332);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-4",5,1669391156);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(3);
	tr1 = RTMS_EX_H("ISO-10646-UCS-4",15,137660724);
	ur1 = tr1;
	tr2 = RTMS_EX_H("iso-10646-ucs-4",15,932466996);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(4);
	tr1 = RTMS_EX_H("csUCS4",6,1626000692);
	ur1 = tr1;
	tr2 = RTMS_EX_H("csucs4",6,17497140);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(5);
	tr1 = RTMS_EX_H("UCS-4BE",7,723068997);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-4be",7,1860006245);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(6);
	tr1 = RTMS_EX_H("UCS-4LE",7,723071557);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-4le",7,1860008805);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(7);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(592, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-32",6,1945160498);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(8);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(596, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-32be",8,1489539429);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(9);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(594, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-32le",8,1489541989);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(10);
	tr1 = RTMS_EX_H("UCS-4-INTERNAL",14,968724556);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-4-internal",14,1512152428);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(11);
	tr1 = RTMS_EX_H("UCS-4-SWAPPED",13,415472708);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-4-swapped",13,979631204);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTVI(Current, RTAL);
	RTRS;
	RTOTE;
	RTHOOK(12);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
#undef ur1
#undef ur2
#undef ui4_1
#undef Result
}

/* {CODE_SETS}.little_endian_code_pages */
RTOID (F30_1186)
EIF_TYPED_VALUE F30_1186 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "little_endian_code_pages";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	RTCDD;
	RTSN;
	RTDA;
	RTLD;
	
#define Result RTOTRR
	RTOTDR(F30_1186);
	dtype = Dtype(Current);

	RTLI(5);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,ur1);
	RTLR(3,tr2);
	RTLR(4,ur2);
	RTLIU(5);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 29, Current, 0, 0, 729);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(29, Current, 729);
	RTIV(Current, RTAL);
	RTOTP;
	RTHOOK(1);
	RTDBGAL(0, 0xF8000237, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,567,0xFF01,266,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 5L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(4583, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	tr1 = RTMS_EX_H("UCS-2LE",7,722940485);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-2le",7,1859877733);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(3);
	tr1 = RTMS_EX_H("UNICODELITTLE",13,852373061);
	ur1 = tr1;
	tr2 = RTMS_EX_H("unicodelittle",13,1164725349);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(4);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(593, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-16le",8,1456249701);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(5);
	tr1 = RTMS_EX_H("UCS-4LE",7,723071557);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-4le",7,1860008805);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(6);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(594, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-32le",8,1489541989);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTVI(Current, RTAL);
	RTRS;
	RTOTE;
	RTHOOK(7);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
#undef ur1
#undef ur2
#undef ui4_1
#undef Result
}

/* {CODE_SETS}.big_endian_code_pages */
RTOID (F30_1187)
EIF_TYPED_VALUE F30_1187 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "big_endian_code_pages";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	RTCDD;
	RTSN;
	RTDA;
	RTLD;
	
#define Result RTOTRR
	RTOTDR(F30_1187);
	dtype = Dtype(Current);

	RTLI(5);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,ur1);
	RTLR(3,tr2);
	RTLR(4,ur2);
	RTLIU(5);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 29, Current, 0, 0, 730);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(29, Current, 730);
	RTIV(Current, RTAL);
	RTOTP;
	RTHOOK(1);
	RTDBGAL(0, 0xF8000237, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,567,0xFF01,266,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 5L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(4583, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	tr1 = RTMS_EX_H("UCS-2BE",7,722937925);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-2be",7,1859875173);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(3);
	tr1 = RTMS_EX_H("UNICODEBIG",10,266927431);
	ur1 = tr1;
	tr2 = RTMS_EX_H("unicodebig",10,1691026535);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(4);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(595, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-16be",8,1456247141);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(5);
	tr1 = RTMS_EX_H("UCS-4BE",7,723068997);
	ur1 = tr1;
	tr2 = RTMS_EX_H("ucs-4be",7,1860006245);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTHOOK(6);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(596, 12))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("utf-32be",8,1489539429);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2856, "put", Result))(Result, ur1x, ur2x);
	RTVI(Current, RTAL);
	RTRS;
	RTOTE;
	RTHOOK(7);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
#undef ur1
#undef ur2
#undef ui4_1
#undef Result
}

void EIF_Minit30 (void)
{
	GTCX
	RTOTS (1183,F30_1183)
	RTOTS (1184,F30_1184)
	RTOTS (1185,F30_1185)
	RTOTS (1186,F30_1186)
	RTOTS (1187,F30_1187)
}


#ifdef __cplusplus
}
#endif
