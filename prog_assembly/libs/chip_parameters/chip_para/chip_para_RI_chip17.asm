/* RI (Recover Injection Above & Sub threshold) parameters */
.set    RI_GATE_S_SWC,     0x0040          /* Gate_S voltage for SWC recover injection = gnd */
.set    RI_VC1_SWC,     5716          /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_SWC,     5583          /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V */
.set    RI_VC3_SWC,     5184           /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V */
.set    RI_VC4_SWC,     4385           /* Verify Current 1 for SWC recover injection = 1nA @ Vgm=0V */
.set    RI_VD1_SWC,     0xea0e          /* Drain Voltage for recover injection final stage */
.set    RI_VD2_SWC,     0xfe0e          /* Drain Voltage for recover injection pre-final stage */
.set RI_INJ_T_SWC, 1 /* Injection time unit (*10us) */
.set RI_NUM_SWC, 300 /* # of Recover Injection */

.set    RI_GATE_S_OTA,    0x0000          /* Gate_S voltage for OTA recover injection = 2.5V @ IVDD 6.0V */
.set    RI_VC1_OTA,     6576           /* Verify Current 1 for OTA recover injection = nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_OTA,     6357          /* Verify Current 1 for OTA recover injection =  nA @ Vgm=0V */
.set    RI_VC3_OTA,     5699           /* Verify Current 1 for OTA recover injection = nA @ Vgm=0V */
.set    RI_VC4_OTA,     4385           /* Verify Current 1 for OTA recover injection = 5nA @ Vgm=0V */
.set    RI_VD1_OTA,     0xea0e          /* Drain Voltage for recover injection final stage */
.set    RI_VD2_OTA,     0xfe0e          /* Drain Voltage for recover injection pre-final stage */
.set RI_INJ_T_OTA, 1 /* Injection time unit (*10us) */
.set RI_NUM_OTA, 300 /* # of Recover Injection */

.set    RI_GATE_S_OTAREF,    0x0040          /* Gate_S voltage for OTAREF recover injection = gnd */
.set    RI_VC1_OTAREF,  5972              /* Verify Current 1 for OTAREF recover injection = nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_OTAREF,  5813             /* Verify Current 1 for OTAREF recover injection = nA @ Vgm=0V */
.set    RI_VC3_OTAREF,  5337              /* Verify Current 1 for OTAREF recover injection = nA @ Vgm=0V */
.set    RI_VC4_OTAREF,  4385              /* Verify Current 1 for OTAREF recover injection = 1nA @ Vgm=0V */
.set    RI_VD1_OTAREF,  0xea0e          /* Drain Voltage for recover injection final stage */
.set    RI_VD2_OTAREF,  0xfe0e          /* Drain Voltage for recover injection pre-final stage */
.set RI_INJ_T_OTAREF, 1 /* Injection time unit (*10us) */
.set RI_NUM_OTAREF, 300 /* # of Recover Injection */

.set    RI_GATE_S_MITE,    0x0000          /* Gate_S voltage for MITE recover injection = 2.5V @ IVDD 6.0V */
.set    RI_VC1_MITE,    6847           /* Verify Current 1 for MITE recover injection = nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_MITE,    6601           /* Verify Current 1 for MITE recover injection =  nA @ Vgm=0V */
.set    RI_VC3_MITE,    5862            /* Verify Current 1 for MITE recover injection = nA @ Vgm=0V */
.set    RI_VC4_MITE,    4385            /* Verify Current 1 for MITE recover injection = 1nA @ Vgm=0V */
.set    RI_VD1_MITE,    0xea0e          /* Drain Voltage for recover injection final stage */
.set    RI_VD2_MITE,    0xfe0e          /* Drain Voltage for recover injection pre-final stage */
.set RI_INJ_T_MITE, 1 /* Injection time unit (*10us) */
.set RI_NUM_MITE, 300 /* # of Recover Injection */

.set    RI_GATE_S_DIRSWC,     0x0040          /* Gate_S voltage for SWC recover injection = gnd */
.set    RI_VC1_DIRSWC,     5716          /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V -> 1nA @ Vgm = 0.6V */
.set    RI_VC2_DIRSWC,     5583          /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V */
.set    RI_VC3_DIRSWC,     5184           /* Verify Current 1 for SWC recover injection = nA @ Vgm=0V */
.set    RI_VC4_DIRSWC,     4385           /* Verify Current 1 for SWC recover injection = 1nA @ Vgm=0V */
.set    RI_VD1_DIRSWC,     0xea0e          /* Drain Voltage for recover injection final stage */
.set    RI_VD2_DIRSWC,     0xfe0e          /* Drain Voltage for recover injection pre-final stage */
.set RI_INJ_T_DIRSWC, 1 /* Injection time unit (*10us) */
.set RI_NUM_DIRSWC, 300 /* # of Recover Injection */

/* RIL (Recover Injection low sub threshold) parameters */
.set    RIL_GATE_S_SWC,     0x0040          /* Gate_S voltage for SWC low sub Vth recover injection = gnd */
.set    RIL_VC1_SWC,     4385          /* Verify Current 1 for SWC low sub Vth recover injection = 1nA @ Vgm = 0V */ 
.set    RIL_VC2_SWC,     4089          /* Verify Current 1 for SWC low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */
.set    RIL_VD1_SWC,     0xea0e          /* Drain Voltage for recover injection final stage */
.set RIL_INJ_T_SWC, 1 /* Injection time unit (*10us) */
.set RIL_NUM_SWC, 300 /* # of Recover Injection */

.set    RIL_GATE_S_OTA,    0x0000          /* Gate_S voltage for OTA low sub Vth recover injection = 2.5V @ IVDD 6.0V */
.set    RIL_VC1_OTA,     4385           /* Verify Current 1 for OTA low sub Vth recover injection = 1nA @ Vgm=0V */ 
.set    RIL_VC2_OTA,     4084          /* Verify Current 1 for OTA low sub Vth recover injection =  hundreds pA below 1nA @ Vgm=0V */
.set    RIL_VD1_OTA,     0xea0e          /* Drain Voltage for recover injection final stage */
.set RIL_INJ_T_OTA, 1 /* Injection time unit (*10us) */
.set RIL_NUM_OTA, 300 /* # of Recover Injection */

.set    RIL_GATE_S_OTAREF,    0x0040          /* Gate_S voltage for OTAREF low sub Vth recover injection = gnd */
.set    RIL_VC1_OTAREF,  4385              /* Verify Current 1 for OTAREF low sub Vth recover injection = 1nA @ Vgm=0V */
.set    RIL_VC2_OTAREF,  4077             /* Verify Current 1 for OTAREF low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */
.set    RIL_VD1_OTAREF,  0xea0e          /* Drain Voltage for recover injection final stage */
.set RIL_INJ_T_OTAREF, 1 /* Injection time unit (*10us) */
.set RIL_NUM_OTAREF, 300 /* # of Recover Injection */

.set    RIL_GATE_S_MITE,    0x0000          /* Gate_S voltage for MITE low sub Vth recover injection = 2.5V @ IVDD 6.0V */
.set    RIL_VC1_MITE,    4385           /* Verify Current 1 for MITE low sub Vth recover injection = 1nA @ Vgm=0V */  
.set    RIL_VC2_MITE,    4094           /* Verify Current 1 for MITE rlow sub Vth ecover injection =  hundreds pA below 1nA @ Vgm=0V */
.set    RIL_VD1_MITE,    0xea0e          /* Drain Voltage for recover injection final stage */
.set RIL_INJ_T_MITE, 1 /* Injection time unit (*10us) */
.set RIL_NUM_MITE, 300 /* # of Recover Injection */

.set    RIL_GATE_S_DIRSWC,     0x0040          /* Gate_S voltage for SWC low sub Vth recover injection = gnd */
.set    RIL_VC1_DIRSWC,     4385          /* Verify Current 1 for SWC low sub Vth recover injection = 1nA @ Vgm = 0V */ 
.set    RIL_VC2_DIRSWC,     4089          /* Verify Current 1 for SWC low sub Vth recover injection = hundreds pA below 1nA @ Vgm=0V */
.set    RIL_VD1_DIRSWC,     0xea0e          /* Drain Voltage for recover injection final stage */
.set RIL_INJ_T_DIRSWC, 1 /* Injection time unit (*10us) */
.set RIL_NUM_DIRSWC, 300 /* # of Recover Injection */

