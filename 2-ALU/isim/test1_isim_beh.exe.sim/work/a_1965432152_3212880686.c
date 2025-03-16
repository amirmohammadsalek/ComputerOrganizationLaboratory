/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/ASA/Desktop/Az Ajza/ALU/and_func.vhd";
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);


static void work_a_1965432152_3212880686_p_0(char *t0)
{
    char t1[16];
    char t2[16];
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(43, ng0);

LAB3:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t3 = (t0 + 4664U);
    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t5 = (t0 + 4680U);
    t7 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t2, t4, t3, t6, t5);
    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t8 = (t0 + 4696U);
    t10 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t1, t7, t2, t9, t8);
    t11 = (t1 + 12U);
    t12 = *((unsigned int *)t11);
    t13 = (1U * t12);
    t14 = (8U != t13);
    if (t14 == 1)
        goto LAB5;

LAB6:    t15 = (t0 + 3072);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t10, 8U);
    xsi_driver_first_trans_fast_port(t15);

LAB2:    t20 = (t0 + 2992);
    *((int *)t20) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t13, 0);
    goto LAB6;

}


extern void work_a_1965432152_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1965432152_3212880686_p_0};
	xsi_register_didat("work_a_1965432152_3212880686", "isim/test1_isim_beh.exe.sim/work/a_1965432152_3212880686.didat");
	xsi_register_executes(pe);
}
