NODE S(SWAP *) bH_000_a0_B0_ab * 
NODE bH_p000(SWAP *) * * 
NODE bH_p001(SWAP *) * * 
NODE bH_p010(SWAP *) * * 
NODE bH_p011(SWAP *) * * 
NODE bH_p100(SWAP *) * * 
NODE bH_p101(SWAP *) * * 
NODE bH_p110(SWAP *) * * 
NODE bH_p111(SWAP *) * * 
NODE bH_p00(SWAP *) bH_p000 bH_p001 
NODE bH_p01(SWAP *) bH_p010 bH_p011 
NODE bH_p10(SWAP *) bH_p100 bH_p101 
NODE bH_p11(SWAP *) bH_p110 bH_p111 
NODE bH_p0(SWAP *) bH_p00 bH_p01 
NODE bH_p1(SWAP *) bH_p10 bH_p11 
NODE bH_p(SWAP *) bH_p0 bH_p1 
NODE C0(SWAP *) * * 
NODE C1(SWAP *) * * 
NODE fH_p000(SWAP *) * * 
NODE fH_p001(SWAP *) * * 
NODE fH_p010(SWAP *) * * 
NODE fH_p011(SWAP *) * * 
NODE fH_p100(SWAP *) * * 
NODE fH_p101(SWAP *) * * 
NODE fH_p110(SWAP *) * * 
NODE fH_p111(SWAP *) * * 
NODE fH_p00(SWAP *) fH_p000 fH_p001 
NODE fH_p01(SWAP *) fH_p010 fH_p011 
NODE fH_p10(SWAP *) fH_p100 fH_p101 
NODE fH_p11(SWAP *) fH_p110 fH_p111 
NODE fH_p0(SWAP *) fH_p00 fH_p01 
NODE fH_p1(SWAP *) fH_p10 fH_p11 
NODE fH_p(SWAP *) fH_p0 fH_p1 
NODE ft(SWAP *) * * 
NODE iH_p000(SWAP *) iH_p000_si * 
NODE iH_p001(SWAP *) iH_p001_si * 
NODE iH_p010(SWAP *) iH_p010_si * 
NODE iH_p011(SWAP *) iH_p011_si * 
NODE iH_p100(SWAP *) iH_p100_si * 
NODE iH_p101(SWAP *) iH_p101_si * 
NODE iH_p110(SWAP *) iH_p110_si * 
NODE iH_p111(SWAP *) iH_e * 
NODE iH_p00(SWAP *) iH_p000 iH_p001 
NODE iH_p01(SWAP *) iH_p010 iH_p011 
NODE iH_p10(SWAP *) iH_p100 iH_p101 
NODE iH_p11(SWAP *) iH_p110 iH_p111 
NODE iH_p0(SWAP *) iH_p00 iH_p01 
NODE iH_p1(SWAP *) iH_p10 iH_p11 
NODE iH_p(SWAP *) iH_p0 iH_p1 
NODE iH_e(SWAP *) * * 
NODE iH_t(SWAP *) * * 
NODE iH_p000_sb(SWAP bH_p00) iH_t * 
NODE iH_p000_sf(SWAP fH_p00) iH_p000_sb * 
NODE iH_p000_si(SWAP iH_p00) iH_p000_sf * 
NODE iH_p001_sb(SWAP bH_p0) iH_t * 
NODE iH_p001_sf(SWAP fH_p0) iH_p001_sb * 
NODE iH_p001_si(SWAP iH_p0) iH_p001_sf * 
NODE iH_p010_sb(SWAP bH_p01) iH_t * 
NODE iH_p010_sf(SWAP fH_p01) iH_p010_sb * 
NODE iH_p010_si(SWAP iH_p01) iH_p010_sf * 
NODE iH_p011_sb(SWAP bH_p) iH_t * 
NODE iH_p011_sf(SWAP fH_p) iH_p011_sb * 
NODE iH_p011_si(SWAP iH_p) iH_p011_sf * 
NODE iH_p100_sb(SWAP bH_p10) iH_t * 
NODE iH_p100_sf(SWAP fH_p10) iH_p100_sb * 
NODE iH_p100_si(SWAP iH_p10) iH_p100_sf * 
NODE iH_p101_sb(SWAP bH_p1) iH_t * 
NODE iH_p101_sf(SWAP fH_p1) iH_p101_sb * 
NODE iH_p101_si(SWAP iH_p1) iH_p101_sf * 
NODE iH_p110_sb(SWAP bH_p11) iH_t * 
NODE iH_p110_sf(SWAP fH_p11) iH_p110_sb * 
NODE iH_p110_si(SWAP iH_p11) iH_p110_sf * 
NODE bH_11_r1_rbH(PUSH bH_p11 bH_p111) fH_p_r0_rfH * 
NODE bH_11_r0_rbH(PUSH bH_p11 bH_p110) bH_11_r1_rbH * 
NODE bH_10_r1_rbH(PUSH bH_p10 bH_p101) bH_11_r0_rbH * 
NODE bH_10_r0_rbH(PUSH bH_p10 bH_p100) bH_10_r1_rbH * 
NODE bH_01_r1_rbH(PUSH bH_p01 bH_p011) bH_10_r0_rbH * 
NODE bH_01_r0_rbH(PUSH bH_p01 bH_p010) bH_01_r1_rbH * 
NODE bH_00_r1_rbH(PUSH bH_p00 bH_p001) bH_01_r0_rbH * 
NODE bH_00_r0_rbH(PUSH bH_p00 bH_p000) bH_00_r1_rbH * 
NODE bH_1_r1_rbH(PUSH bH_p1 bH_p11) bH_00_r0_rbH * 
NODE bH_1_r0_rbH(PUSH bH_p1 bH_p10) bH_1_r1_rbH * 
NODE bH_0_r1_rbH(PUSH bH_p0 bH_p01) bH_1_r0_rbH * 
NODE bH_0_r0_rbH(PUSH bH_p0 bH_p00) bH_0_r1_rbH * 
NODE bH_p_r1_rbH(PUSH bH_p bH_p1) bH_0_r0_rbH * 
NODE bH_p_r0_rbH(PUSH bH_p bH_p0) bH_p_r1_rbH * 
NODE fH_11_r1_rfH(PUSH fH_p11 fH_p111) iH_p_r0_riH * 
NODE fH_11_r0_rfH(PUSH fH_p11 fH_p110) fH_11_r1_rfH * 
NODE fH_10_r1_rfH(PUSH fH_p10 fH_p101) fH_11_r0_rfH * 
NODE fH_10_r0_rfH(PUSH fH_p10 fH_p100) fH_10_r1_rfH * 
NODE fH_01_r1_rfH(PUSH fH_p01 fH_p011) fH_10_r0_rfH * 
NODE fH_01_r0_rfH(PUSH fH_p01 fH_p010) fH_01_r1_rfH * 
NODE fH_00_r1_rfH(PUSH fH_p00 fH_p001) fH_01_r0_rfH * 
NODE fH_00_r0_rfH(PUSH fH_p00 fH_p000) fH_00_r1_rfH * 
NODE fH_1_r1_rfH(PUSH fH_p1 fH_p11) fH_00_r0_rfH * 
NODE fH_1_r0_rfH(PUSH fH_p1 fH_p10) fH_1_r1_rfH * 
NODE fH_0_r1_rfH(PUSH fH_p0 fH_p01) fH_1_r0_rfH * 
NODE fH_0_r0_rfH(PUSH fH_p0 fH_p00) fH_0_r1_rfH * 
NODE fH_p_r1_rfH(PUSH fH_p fH_p1) fH_0_r0_rfH * 
NODE fH_p_r0_rfH(PUSH fH_p fH_p0) fH_p_r1_rfH * 
NODE iH_11_r1_riH(PUSH iH_p11 iH_p111) Hr_t * 
NODE iH_11_r0_riH(PUSH iH_p11 iH_p110) iH_11_r1_riH * 
NODE iH_10_r1_riH(PUSH iH_p10 iH_p101) iH_11_r0_riH * 
NODE iH_10_r0_riH(PUSH iH_p10 iH_p100) iH_10_r1_riH * 
NODE iH_01_r1_riH(PUSH iH_p01 iH_p011) iH_10_r0_riH * 
NODE iH_01_r0_riH(PUSH iH_p01 iH_p010) iH_01_r1_riH * 
NODE iH_00_r1_riH(PUSH iH_p00 iH_p001) iH_01_r0_riH * 
NODE iH_00_r0_riH(PUSH iH_p00 iH_p000) iH_00_r1_riH * 
NODE iH_1_r1_riH(PUSH iH_p1 iH_p11) iH_00_r0_riH * 
NODE iH_1_r0_riH(PUSH iH_p1 iH_p10) iH_1_r1_riH * 
NODE iH_0_r1_riH(PUSH iH_p0 iH_p01) iH_1_r0_riH * 
NODE iH_0_r0_riH(PUSH iH_p0 iH_p00) iH_0_r1_riH * 
NODE iH_p_r1_riH(PUSH iH_p iH_p1) iH_0_r0_riH * 
NODE iH_p_r0_riH(PUSH iH_p iH_p0) iH_p_r1_riH * 
NODE Hr_s(SWAP *) bH_p_r0_rbH * 
NODE Hr_t(SWAP *) * * 
NODE inc_t(SWAP *) * * 
NODE inc_p1_Hr(PUSH Hr_t *) fH_p * 
NODE inc_p0_Hr(PUSH Hr_t inc_t) inc_p1_Hr * 
NODE inc_p1_C1(PUSH C1 *) inc_p0_Hr * 
NODE inc_p0_C1(PUSH C1 Hr_s) inc_p1_C1 * 
NODE inc_p1_iH(PUSH iH_t *) inc_p0_C1 * 
NODE inc_p0_iH(PUSH iH_t fH_p) inc_p1_iH * 
NODE inc_p1_C0(PUSH C0 *) inc_p0_iH * 
NODE inc_p0_C0(PUSH C0 iH_p) inc_p1_C0 * 
NODE inc_p1_ft(PUSH ft *) inc_p0_C0 * 
NODE inc_p0_ft(PUSH ft bH_p) inc_p1_ft * 
NODE inc_p1_e(PUSH iH_e *) inc_p0_ft * 
NODE inc_p0_e(PUSH iH_e Hr_s) inc_p1_e * 
NODE inc_s(SWAP *) inc_p0_e * 
NODE dec_t(SWAP *) * * 
NODE dec_p1_Hr(PUSH Hr_t *) fH_p * 
NODE dec_p0_Hr(PUSH Hr_t dec_t) dec_p1_Hr * 
NODE dec_p1_C0(PUSH C0 *) dec_p0_Hr * 
NODE dec_p0_C0(PUSH C0 Hr_s) dec_p1_C0 * 
NODE dec_p1_iH(PUSH iH_t *) dec_p0_C0 * 
NODE dec_p0_iH(PUSH iH_t fH_p) dec_p1_iH * 
NODE dec_p1_C1(PUSH C1 *) dec_p0_iH * 
NODE dec_p0_C1(PUSH C1 iH_p) dec_p1_C1 * 
NODE dec_p1_ft(PUSH ft *) dec_p0_C1 * 
NODE dec_p0_ft(PUSH ft bH_p) dec_p1_ft * 
NODE dec_p1_e(PUSH iH_e *) dec_p0_ft * 
NODE dec_p0_e(PUSH iH_e Hr_s) dec_p1_e * 
NODE dec_s(SWAP *) dec_p0_e * 
NODE in_t(SWAP *) * * 
NODE in_p1_Hr(PUSH Hr_t *) I * 
NODE in_p0_Hr(PUSH Hr_t in_t) in_p1_Hr * 
NODE in_p1_e(PUSH iH_e *) in_p0_Hr * 
NODE in_p0_e(PUSH iH_e Hr_s) in_p1_e * 
NODE in_p1_iH(PUSH iH_t *) in_p0_e * 
NODE in_p0_iH(PUSH iH_t I) in_p1_iH * 
NODE in_p1_O1(PUSH ft *) in_p0_iH * 
NODE in_p0_O1(PUSH ft iH_p) in_p1_O1 * 
NODE in_p1_I(PUSH I fH_p) in_p0_O1 * 
NODE in_p0_I(PUSH I iH_p) in_p1_I * 
NODE in_s(SWAP *) in_p0_I * 
NODE out_t(SWAP *) * * 
NODE out_p1_Hr(PUSH Hr_t *) bH_p * 
NODE out_p0_Hr(PUSH Hr_t out_t) out_p1_Hr * 
NODE out_p1_e(PUSH iH_e *) out_p0_Hr * 
NODE out_p0_e(PUSH iH_e Hr_s) out_p1_e * 
NODE out_p1_iH(PUSH iH_t *) out_p0_e * 
NODE out_p0_iH(PUSH iH_t bH_p) out_p1_iH * 
NODE out_p1_O0(PUSH O0 *) out_p0_iH * 
NODE out_p0_O0(PUSH O0 iH_p) out_p1_O0 * 
NODE out_p1_O1(PUSH O1 *) out_p0_O0 * 
NODE out_p0_O1(PUSH O1 iH_p) out_p1_O1 * 
NODE out_p1_C1(PUSH C1 *) out_p0_O1 * 
NODE out_p0_C1(PUSH C1 O1) out_p1_C1 * 
NODE out_p1_C0(PUSH C0 *) out_p0_C1 * 
NODE out_p0_C0(PUSH C0 O0) out_p1_C0 * 
NODE out_s(SWAP *) out_p0_C0 * 
NODE and_eq(SWAP *) * * 
NODE and_gt(SWAP *) * * 
NODE c_zf(SWAP Hr_t) Hr_s * 
NODE and_p1_Hr(PUSH Hr_t and_gt) bH_p * 
NODE and_p0_Hr(PUSH Hr_t and_eq) and_p1_Hr * 
NODE and_p1_C1(PUSH C1 *) and_p0_Hr * 
NODE and_p0_C1(PUSH C1 c_zf) and_p1_C1 * 
NODE and_p1_iH(PUSH iH_t *) and_p0_C1 * 
NODE and_p0_iH(PUSH iH_t bH_p) and_p1_iH * 
NODE and_p1_C0(PUSH C0 *) and_p0_iH * 
NODE and_p0_C0(PUSH C0 iH_p) and_p1_C0 * 
NODE and_p1_e(PUSH iH_e *) and_p0_C0 * 
NODE and_p0_e(PUSH iH_e Hr_s) and_p1_e * 
NODE and_s(SWAP *) and_p0_e * 
NODE B0_0_p0(SWAP *) B0_oC0 * 
NODE B0_0_p1(SWAP *) B0_oC1 * 
NODE B0_0_b(SWAP *) B0_0_p0 B0_0_p1 
NODE B0_1_p0(SWAP *) B0_oC0 * 
NODE B0_1_p1(SWAP *) B0_oC1 * 
NODE B0_1_b(SWAP *) B0_1_p0 B0_1_p1 
NODE B0_2_p0(SWAP *) B0_oC0 * 
NODE B0_2_p1(SWAP *) B0_oC1 * 
NODE B0_2_b(SWAP *) B0_2_p0 B0_2_p1 
NODE B0_3_p0(SWAP *) B0_oC0 * 
NODE B0_3_p1(SWAP *) B0_oC1 * 
NODE B0_3_b(SWAP *) B0_3_p0 B0_3_p1 
NODE B0_4_p0(SWAP *) B0_oC0 * 
NODE B0_4_p1(SWAP *) B0_oC1 * 
NODE B0_4_b(SWAP *) B0_4_p0 B0_4_p1 
NODE B0_5_p0(SWAP *) B0_oC0 * 
NODE B0_5_p1(SWAP *) B0_oC1 * 
NODE B0_5_b(SWAP *) B0_5_p0 B0_5_p1 
NODE B0_6_p0(SWAP *) B0_oC0 * 
NODE B0_6_p1(SWAP *) B0_oC1 * 
NODE B0_6_b(SWAP *) B0_6_p0 B0_6_p1 
NODE B0_7_p0(SWAP *) B0_oC0 * 
NODE B0_7_p1(SWAP *) B0_oC1 * 
NODE B0_7_b(SWAP *) B0_7_p0 B0_7_p1 
NODE B0_0_f_fh(SWAP B0_0_b) B0_oft * 
NODE B0_1_f_fh(SWAP B0_1_b) B0_oft * 
NODE B0_2_f_fh(SWAP B0_2_b) B0_oft * 
NODE B0_3_f_fh(SWAP B0_3_b) B0_oft * 
NODE B0_4_f_fh(SWAP B0_4_b) B0_oft * 
NODE B0_5_f_fh(SWAP B0_5_b) B0_oft * 
NODE B0_6_f_fh(SWAP B0_6_b) B0_oft * 
NODE B0_7_f_fh(SWAP B0_7_b) B0_oft * 
NODE B0_oC0(SWAP *) C0 * 
NODE B0_oC1(SWAP *) C1 * 
NODE B0_oft(SWAP *) ft * 
NODE B1_0_p0(SWAP *) B1_oC0 * 
NODE B1_0_p1(SWAP *) B1_oC1 * 
NODE B1_0_b(SWAP *) B1_0_p0 B1_0_p1 
NODE B1_1_p0(SWAP *) B1_oC0 * 
NODE B1_1_p1(SWAP *) B1_oC1 * 
NODE B1_1_b(SWAP *) B1_1_p0 B1_1_p1 
NODE B1_2_p0(SWAP *) B1_oC0 * 
NODE B1_2_p1(SWAP *) B1_oC1 * 
NODE B1_2_b(SWAP *) B1_2_p0 B1_2_p1 
NODE B1_3_p0(SWAP *) B1_oC0 * 
NODE B1_3_p1(SWAP *) B1_oC1 * 
NODE B1_3_b(SWAP *) B1_3_p0 B1_3_p1 
NODE B1_4_p0(SWAP *) B1_oC0 * 
NODE B1_4_p1(SWAP *) B1_oC1 * 
NODE B1_4_b(SWAP *) B1_4_p0 B1_4_p1 
NODE B1_5_p0(SWAP *) B1_oC0 * 
NODE B1_5_p1(SWAP *) B1_oC1 * 
NODE B1_5_b(SWAP *) B1_5_p0 B1_5_p1 
NODE B1_6_p0(SWAP *) B1_oC0 * 
NODE B1_6_p1(SWAP *) B1_oC1 * 
NODE B1_6_b(SWAP *) B1_6_p0 B1_6_p1 
NODE B1_7_p0(SWAP *) B1_oC0 * 
NODE B1_7_p1(SWAP *) B1_oC1 * 
NODE B1_7_b(SWAP *) B1_7_p0 B1_7_p1 
NODE B1_0_f_fh(SWAP B1_0_b) B1_oft * 
NODE B1_1_f_fh(SWAP B1_1_b) B1_oft * 
NODE B1_2_f_fh(SWAP B1_2_b) B1_oft * 
NODE B1_3_f_fh(SWAP B1_3_b) B1_oft * 
NODE B1_4_f_fh(SWAP B1_4_b) B1_oft * 
NODE B1_5_f_fh(SWAP B1_5_b) B1_oft * 
NODE B1_6_f_fh(SWAP B1_6_b) B1_oft * 
NODE B1_7_f_fh(SWAP B1_7_b) B1_oft * 
NODE B1_oC0(SWAP *) C0 * 
NODE B1_oC1(SWAP *) C1 * 
NODE B1_oft(SWAP *) ft * 
NODE B2_0_p0(SWAP *) B2_oC0 * 
NODE B2_0_p1(SWAP *) B2_oC1 * 
NODE B2_0_b(SWAP *) B2_0_p0 B2_0_p1 
NODE B2_1_p0(SWAP *) B2_oC0 * 
NODE B2_1_p1(SWAP *) B2_oC1 * 
NODE B2_1_b(SWAP *) B2_1_p0 B2_1_p1 
NODE B2_2_p0(SWAP *) B2_oC0 * 
NODE B2_2_p1(SWAP *) B2_oC1 * 
NODE B2_2_b(SWAP *) B2_2_p0 B2_2_p1 
NODE B2_3_p0(SWAP *) B2_oC0 * 
NODE B2_3_p1(SWAP *) B2_oC1 * 
NODE B2_3_b(SWAP *) B2_3_p0 B2_3_p1 
NODE B2_4_p0(SWAP *) B2_oC0 * 
NODE B2_4_p1(SWAP *) B2_oC1 * 
NODE B2_4_b(SWAP *) B2_4_p0 B2_4_p1 
NODE B2_5_p0(SWAP *) B2_oC0 * 
NODE B2_5_p1(SWAP *) B2_oC1 * 
NODE B2_5_b(SWAP *) B2_5_p0 B2_5_p1 
NODE B2_6_p0(SWAP *) B2_oC0 * 
NODE B2_6_p1(SWAP *) B2_oC1 * 
NODE B2_6_b(SWAP *) B2_6_p0 B2_6_p1 
NODE B2_7_p0(SWAP *) B2_oC0 * 
NODE B2_7_p1(SWAP *) B2_oC1 * 
NODE B2_7_b(SWAP *) B2_7_p0 B2_7_p1 
NODE B2_0_f_fh(SWAP B2_0_b) B2_oft * 
NODE B2_1_f_fh(SWAP B2_1_b) B2_oft * 
NODE B2_2_f_fh(SWAP B2_2_b) B2_oft * 
NODE B2_3_f_fh(SWAP B2_3_b) B2_oft * 
NODE B2_4_f_fh(SWAP B2_4_b) B2_oft * 
NODE B2_5_f_fh(SWAP B2_5_b) B2_oft * 
NODE B2_6_f_fh(SWAP B2_6_b) B2_oft * 
NODE B2_7_f_fh(SWAP B2_7_b) B2_oft * 
NODE B2_oC0(SWAP *) C0 * 
NODE B2_oC1(SWAP *) C1 * 
NODE B2_oft(SWAP *) ft * 
NODE B3_0_p0(SWAP *) B3_oC0 * 
NODE B3_0_p1(SWAP *) B3_oC1 * 
NODE B3_0_b(SWAP *) B3_0_p0 B3_0_p1 
NODE B3_1_p0(SWAP *) B3_oC0 * 
NODE B3_1_p1(SWAP *) B3_oC1 * 
NODE B3_1_b(SWAP *) B3_1_p0 B3_1_p1 
NODE B3_2_p0(SWAP *) B3_oC0 * 
NODE B3_2_p1(SWAP *) B3_oC1 * 
NODE B3_2_b(SWAP *) B3_2_p0 B3_2_p1 
NODE B3_3_p0(SWAP *) B3_oC0 * 
NODE B3_3_p1(SWAP *) B3_oC1 * 
NODE B3_3_b(SWAP *) B3_3_p0 B3_3_p1 
NODE B3_4_p0(SWAP *) B3_oC0 * 
NODE B3_4_p1(SWAP *) B3_oC1 * 
NODE B3_4_b(SWAP *) B3_4_p0 B3_4_p1 
NODE B3_5_p0(SWAP *) B3_oC0 * 
NODE B3_5_p1(SWAP *) B3_oC1 * 
NODE B3_5_b(SWAP *) B3_5_p0 B3_5_p1 
NODE B3_6_p0(SWAP *) B3_oC0 * 
NODE B3_6_p1(SWAP *) B3_oC1 * 
NODE B3_6_b(SWAP *) B3_6_p0 B3_6_p1 
NODE B3_7_p0(SWAP *) B3_oC0 * 
NODE B3_7_p1(SWAP *) B3_oC1 * 
NODE B3_7_b(SWAP *) B3_7_p0 B3_7_p1 
NODE B3_0_f_fh(SWAP B3_0_b) B3_oft * 
NODE B3_1_f_fh(SWAP B3_1_b) B3_oft * 
NODE B3_2_f_fh(SWAP B3_2_b) B3_oft * 
NODE B3_3_f_fh(SWAP B3_3_b) B3_oft * 
NODE B3_4_f_fh(SWAP B3_4_b) B3_oft * 
NODE B3_5_f_fh(SWAP B3_5_b) B3_oft * 
NODE B3_6_f_fh(SWAP B3_6_b) B3_oft * 
NODE B3_7_f_fh(SWAP B3_7_b) B3_oft * 
NODE B3_oC0(SWAP *) C0 * 
NODE B3_oC1(SWAP *) C1 * 
NODE B3_oft(SWAP *) ft * 
NODE shl(SWAP *) * * 
NODE shr(SWAP *) * * 
NODE t(SWAP *) 0_,p0 * 
NODE bH_111_a1_B0_ab(PUSH bH_p111 *) fH_000_a0_B0_af * 
NODE bH_111_a0_B0_ab(PUSH bH_p111 B0_7_b) bH_111_a1_B0_ab * 
NODE bH_110_a1_B0_ab(PUSH bH_p110 *) bH_111_a0_B0_ab * 
NODE bH_110_a0_B0_ab(PUSH bH_p110 B0_6_b) bH_110_a1_B0_ab * 
NODE bH_101_a1_B0_ab(PUSH bH_p101 *) bH_110_a0_B0_ab * 
NODE bH_101_a0_B0_ab(PUSH bH_p101 B0_5_b) bH_101_a1_B0_ab * 
NODE bH_100_a1_B0_ab(PUSH bH_p100 *) bH_101_a0_B0_ab * 
NODE bH_100_a0_B0_ab(PUSH bH_p100 B0_4_b) bH_100_a1_B0_ab * 
NODE bH_011_a1_B0_ab(PUSH bH_p011 *) bH_100_a0_B0_ab * 
NODE bH_011_a0_B0_ab(PUSH bH_p011 B0_3_b) bH_011_a1_B0_ab * 
NODE bH_010_a1_B0_ab(PUSH bH_p010 *) bH_011_a0_B0_ab * 
NODE bH_010_a0_B0_ab(PUSH bH_p010 B0_2_b) bH_010_a1_B0_ab * 
NODE bH_001_a1_B0_ab(PUSH bH_p001 *) bH_010_a0_B0_ab * 
NODE bH_001_a0_B0_ab(PUSH bH_p001 B0_1_b) bH_001_a1_B0_ab * 
NODE bH_000_a1_B0_ab(PUSH bH_p000 *) bH_001_a0_B0_ab * 
NODE bH_000_a0_B0_ab(PUSH bH_p000 B0_0_b) bH_000_a1_B0_ab * 
NODE fH_111_a1_B0_af(PUSH fH_p111 *) B0_p0_shl * 
NODE fH_111_a0_B0_af(PUSH fH_p111 B0_7_f_fh) fH_111_a1_B0_af * 
NODE fH_110_a1_B0_af(PUSH fH_p110 *) fH_111_a0_B0_af * 
NODE fH_110_a0_B0_af(PUSH fH_p110 B0_6_f_fh) fH_110_a1_B0_af * 
NODE fH_101_a1_B0_af(PUSH fH_p101 *) fH_110_a0_B0_af * 
NODE fH_101_a0_B0_af(PUSH fH_p101 B0_5_f_fh) fH_101_a1_B0_af * 
NODE fH_100_a1_B0_af(PUSH fH_p100 *) fH_101_a0_B0_af * 
NODE fH_100_a0_B0_af(PUSH fH_p100 B0_4_f_fh) fH_100_a1_B0_af * 
NODE fH_011_a1_B0_af(PUSH fH_p011 *) fH_100_a0_B0_af * 
NODE fH_011_a0_B0_af(PUSH fH_p011 B0_3_f_fh) fH_011_a1_B0_af * 
NODE fH_010_a1_B0_af(PUSH fH_p010 *) fH_011_a0_B0_af * 
NODE fH_010_a0_B0_af(PUSH fH_p010 B0_2_f_fh) fH_010_a1_B0_af * 
NODE fH_001_a1_B0_af(PUSH fH_p001 *) fH_010_a0_B0_af * 
NODE fH_001_a0_B0_af(PUSH fH_p001 B0_1_f_fh) fH_001_a1_B0_af * 
NODE fH_000_a1_B0_af(PUSH fH_p000 *) fH_001_a0_B0_af * 
NODE fH_000_a0_B0_af(PUSH fH_p000 B0_0_f_fh) fH_000_a1_B0_af * 
NODE bH_111_a1_B1_ab(PUSH bH_p111 *) fH_000_a0_B1_af * 
NODE bH_111_a0_B1_ab(PUSH bH_p111 B1_7_b) bH_111_a1_B1_ab * 
NODE bH_110_a1_B1_ab(PUSH bH_p110 *) bH_111_a0_B1_ab * 
NODE bH_110_a0_B1_ab(PUSH bH_p110 B1_6_b) bH_110_a1_B1_ab * 
NODE bH_101_a1_B1_ab(PUSH bH_p101 *) bH_110_a0_B1_ab * 
NODE bH_101_a0_B1_ab(PUSH bH_p101 B1_5_b) bH_101_a1_B1_ab * 
NODE bH_100_a1_B1_ab(PUSH bH_p100 *) bH_101_a0_B1_ab * 
NODE bH_100_a0_B1_ab(PUSH bH_p100 B1_4_b) bH_100_a1_B1_ab * 
NODE bH_011_a1_B1_ab(PUSH bH_p011 *) bH_100_a0_B1_ab * 
NODE bH_011_a0_B1_ab(PUSH bH_p011 B1_3_b) bH_011_a1_B1_ab * 
NODE bH_010_a1_B1_ab(PUSH bH_p010 *) bH_011_a0_B1_ab * 
NODE bH_010_a0_B1_ab(PUSH bH_p010 B1_2_b) bH_010_a1_B1_ab * 
NODE bH_001_a1_B1_ab(PUSH bH_p001 *) bH_010_a0_B1_ab * 
NODE bH_001_a0_B1_ab(PUSH bH_p001 B1_1_b) bH_001_a1_B1_ab * 
NODE bH_000_a1_B1_ab(PUSH bH_p000 *) bH_001_a0_B1_ab * 
NODE bH_000_a0_B1_ab(PUSH bH_p000 B1_0_b) bH_000_a1_B1_ab * 
NODE fH_111_a1_B1_af(PUSH fH_p111 *) B1_p0_shl * 
NODE fH_111_a0_B1_af(PUSH fH_p111 B1_7_f_fh) fH_111_a1_B1_af * 
NODE fH_110_a1_B1_af(PUSH fH_p110 *) fH_111_a0_B1_af * 
NODE fH_110_a0_B1_af(PUSH fH_p110 B1_6_f_fh) fH_110_a1_B1_af * 
NODE fH_101_a1_B1_af(PUSH fH_p101 *) fH_110_a0_B1_af * 
NODE fH_101_a0_B1_af(PUSH fH_p101 B1_5_f_fh) fH_101_a1_B1_af * 
NODE fH_100_a1_B1_af(PUSH fH_p100 *) fH_101_a0_B1_af * 
NODE fH_100_a0_B1_af(PUSH fH_p100 B1_4_f_fh) fH_100_a1_B1_af * 
NODE fH_011_a1_B1_af(PUSH fH_p011 *) fH_100_a0_B1_af * 
NODE fH_011_a0_B1_af(PUSH fH_p011 B1_3_f_fh) fH_011_a1_B1_af * 
NODE fH_010_a1_B1_af(PUSH fH_p010 *) fH_011_a0_B1_af * 
NODE fH_010_a0_B1_af(PUSH fH_p010 B1_2_f_fh) fH_010_a1_B1_af * 
NODE fH_001_a1_B1_af(PUSH fH_p001 *) fH_010_a0_B1_af * 
NODE fH_001_a0_B1_af(PUSH fH_p001 B1_1_f_fh) fH_001_a1_B1_af * 
NODE fH_000_a1_B1_af(PUSH fH_p000 *) fH_001_a0_B1_af * 
NODE fH_000_a0_B1_af(PUSH fH_p000 B1_0_f_fh) fH_000_a1_B1_af * 
NODE bH_111_a1_B2_ab(PUSH bH_p111 *) fH_000_a0_B2_af * 
NODE bH_111_a0_B2_ab(PUSH bH_p111 B2_7_b) bH_111_a1_B2_ab * 
NODE bH_110_a1_B2_ab(PUSH bH_p110 *) bH_111_a0_B2_ab * 
NODE bH_110_a0_B2_ab(PUSH bH_p110 B2_6_b) bH_110_a1_B2_ab * 
NODE bH_101_a1_B2_ab(PUSH bH_p101 *) bH_110_a0_B2_ab * 
NODE bH_101_a0_B2_ab(PUSH bH_p101 B2_5_b) bH_101_a1_B2_ab * 
NODE bH_100_a1_B2_ab(PUSH bH_p100 *) bH_101_a0_B2_ab * 
NODE bH_100_a0_B2_ab(PUSH bH_p100 B2_4_b) bH_100_a1_B2_ab * 
NODE bH_011_a1_B2_ab(PUSH bH_p011 *) bH_100_a0_B2_ab * 
NODE bH_011_a0_B2_ab(PUSH bH_p011 B2_3_b) bH_011_a1_B2_ab * 
NODE bH_010_a1_B2_ab(PUSH bH_p010 *) bH_011_a0_B2_ab * 
NODE bH_010_a0_B2_ab(PUSH bH_p010 B2_2_b) bH_010_a1_B2_ab * 
NODE bH_001_a1_B2_ab(PUSH bH_p001 *) bH_010_a0_B2_ab * 
NODE bH_001_a0_B2_ab(PUSH bH_p001 B2_1_b) bH_001_a1_B2_ab * 
NODE bH_000_a1_B2_ab(PUSH bH_p000 *) bH_001_a0_B2_ab * 
NODE bH_000_a0_B2_ab(PUSH bH_p000 B2_0_b) bH_000_a1_B2_ab * 
NODE fH_111_a1_B2_af(PUSH fH_p111 *) B2_p0_shl * 
NODE fH_111_a0_B2_af(PUSH fH_p111 B2_7_f_fh) fH_111_a1_B2_af * 
NODE fH_110_a1_B2_af(PUSH fH_p110 *) fH_111_a0_B2_af * 
NODE fH_110_a0_B2_af(PUSH fH_p110 B2_6_f_fh) fH_110_a1_B2_af * 
NODE fH_101_a1_B2_af(PUSH fH_p101 *) fH_110_a0_B2_af * 
NODE fH_101_a0_B2_af(PUSH fH_p101 B2_5_f_fh) fH_101_a1_B2_af * 
NODE fH_100_a1_B2_af(PUSH fH_p100 *) fH_101_a0_B2_af * 
NODE fH_100_a0_B2_af(PUSH fH_p100 B2_4_f_fh) fH_100_a1_B2_af * 
NODE fH_011_a1_B2_af(PUSH fH_p011 *) fH_100_a0_B2_af * 
NODE fH_011_a0_B2_af(PUSH fH_p011 B2_3_f_fh) fH_011_a1_B2_af * 
NODE fH_010_a1_B2_af(PUSH fH_p010 *) fH_011_a0_B2_af * 
NODE fH_010_a0_B2_af(PUSH fH_p010 B2_2_f_fh) fH_010_a1_B2_af * 
NODE fH_001_a1_B2_af(PUSH fH_p001 *) fH_010_a0_B2_af * 
NODE fH_001_a0_B2_af(PUSH fH_p001 B2_1_f_fh) fH_001_a1_B2_af * 
NODE fH_000_a1_B2_af(PUSH fH_p000 *) fH_001_a0_B2_af * 
NODE fH_000_a0_B2_af(PUSH fH_p000 B2_0_f_fh) fH_000_a1_B2_af * 
NODE bH_111_a1_B3_ab(PUSH bH_p111 *) fH_000_a0_B3_af * 
NODE bH_111_a0_B3_ab(PUSH bH_p111 B3_7_b) bH_111_a1_B3_ab * 
NODE bH_110_a1_B3_ab(PUSH bH_p110 *) bH_111_a0_B3_ab * 
NODE bH_110_a0_B3_ab(PUSH bH_p110 B3_6_b) bH_110_a1_B3_ab * 
NODE bH_101_a1_B3_ab(PUSH bH_p101 *) bH_110_a0_B3_ab * 
NODE bH_101_a0_B3_ab(PUSH bH_p101 B3_5_b) bH_101_a1_B3_ab * 
NODE bH_100_a1_B3_ab(PUSH bH_p100 *) bH_101_a0_B3_ab * 
NODE bH_100_a0_B3_ab(PUSH bH_p100 B3_4_b) bH_100_a1_B3_ab * 
NODE bH_011_a1_B3_ab(PUSH bH_p011 *) bH_100_a0_B3_ab * 
NODE bH_011_a0_B3_ab(PUSH bH_p011 B3_3_b) bH_011_a1_B3_ab * 
NODE bH_010_a1_B3_ab(PUSH bH_p010 *) bH_011_a0_B3_ab * 
NODE bH_010_a0_B3_ab(PUSH bH_p010 B3_2_b) bH_010_a1_B3_ab * 
NODE bH_001_a1_B3_ab(PUSH bH_p001 *) bH_010_a0_B3_ab * 
NODE bH_001_a0_B3_ab(PUSH bH_p001 B3_1_b) bH_001_a1_B3_ab * 
NODE bH_000_a1_B3_ab(PUSH bH_p000 *) bH_001_a0_B3_ab * 
NODE bH_000_a0_B3_ab(PUSH bH_p000 B3_0_b) bH_000_a1_B3_ab * 
NODE fH_111_a1_B3_af(PUSH fH_p111 *) B3_p0_shl * 
NODE fH_111_a0_B3_af(PUSH fH_p111 B3_7_f_fh) fH_111_a1_B3_af * 
NODE fH_110_a1_B3_af(PUSH fH_p110 *) fH_111_a0_B3_af * 
NODE fH_110_a0_B3_af(PUSH fH_p110 B3_6_f_fh) fH_110_a1_B3_af * 
NODE fH_101_a1_B3_af(PUSH fH_p101 *) fH_110_a0_B3_af * 
NODE fH_101_a0_B3_af(PUSH fH_p101 B3_5_f_fh) fH_101_a1_B3_af * 
NODE fH_100_a1_B3_af(PUSH fH_p100 *) fH_101_a0_B3_af * 
NODE fH_100_a0_B3_af(PUSH fH_p100 B3_4_f_fh) fH_100_a1_B3_af * 
NODE fH_011_a1_B3_af(PUSH fH_p011 *) fH_100_a0_B3_af * 
NODE fH_011_a0_B3_af(PUSH fH_p011 B3_3_f_fh) fH_011_a1_B3_af * 
NODE fH_010_a1_B3_af(PUSH fH_p010 *) fH_011_a0_B3_af * 
NODE fH_010_a0_B3_af(PUSH fH_p010 B3_2_f_fh) fH_010_a1_B3_af * 
NODE fH_001_a1_B3_af(PUSH fH_p001 *) fH_010_a0_B3_af * 
NODE fH_001_a0_B3_af(PUSH fH_p001 B3_1_f_fh) fH_001_a1_B3_af * 
NODE fH_000_a1_B3_af(PUSH fH_p000 *) fH_001_a0_B3_af * 
NODE fH_000_a0_B3_af(PUSH fH_p000 B3_0_f_fh) fH_000_a1_B3_af * 
NODE B0_p0_shl(PUSH shl bH_000_a0_B3_ab) B0_p1_shl * 
NODE B0_p1_shl(PUSH shl *) B0_p0_shr * 
NODE B0_p0_shr(PUSH shr bH_000_a0_B1_ab) B0_p1_shr * 
NODE B0_p1_shr(PUSH shr *) t * 
NODE B1_p0_shl(PUSH shl bH_000_a0_B0_ab) B1_p1_shl * 
NODE B1_p1_shl(PUSH shl *) B1_p0_shr * 
NODE B1_p0_shr(PUSH shr bH_000_a0_B2_ab) B1_p1_shr * 
NODE B1_p1_shr(PUSH shr *) t * 
NODE B2_p0_shl(PUSH shl bH_000_a0_B1_ab) B2_p1_shl * 
NODE B2_p1_shl(PUSH shl *) B2_p0_shr * 
NODE B2_p0_shr(PUSH shr bH_000_a0_B3_ab) B2_p1_shr * 
NODE B2_p1_shr(PUSH shr *) t * 
NODE B3_p0_shl(PUSH shl bH_000_a0_B2_ab) B3_p1_shl * 
NODE B3_p1_shl(PUSH shl *) B3_p0_shr * 
NODE B3_p0_shr(PUSH shr bH_000_a0_B0_ab) B3_p1_shr * 
NODE B3_p1_shr(PUSH shr *) t * 
NODE 0_,t(SWAP *) 1_>p0 * 
NODE 0_,s(SWAP *) in_s * 
NODE 0_,p1(PUSH in_t *) 0_,s * 
NODE 0_,p0(PUSH in_t 0_,t) 0_,p1 * 
NODE 1_>t(SWAP *) 2_,p0 * 
NODE 1_>s(SWAP *) shr * 
NODE 1_>p1(PUSH t *) 1_>s * 
NODE 1_>p0(PUSH t 1_>t) 1_>p1 * 
NODE 2_,t(SWAP *) 3_<p0 * 
NODE 2_,s(SWAP *) in_s * 
NODE 2_,p1(PUSH in_t *) 2_,s * 
NODE 2_,p0(PUSH in_t 2_,t) 2_,p1 * 
NODE 3_<t(SWAP *) 4_[ * 
NODE 3_<s(SWAP *) shl * 
NODE 3_<p1(PUSH t *) 3_<s * 
NODE 3_<p0(PUSH t 3_<t) 3_<p1 * 
NODE 4_[(SWAP *) 5_-p0 * 
NODE 5_-t(SWAP *) 6_>p0 * 
NODE 5_-s(SWAP *) dec_s * 
NODE 5_-p1(PUSH dec_t *) 5_-s * 
NODE 5_-p0(PUSH dec_t 5_-t) 5_-p1 * 
NODE 6_>t(SWAP *) 7_[ * 
NODE 6_>s(SWAP *) shr * 
NODE 6_>p1(PUSH t *) 6_>s * 
NODE 6_>p0(PUSH t 6_>t) 6_>p1 * 
NODE 7_[(SWAP *) 8_-p0 * 
NODE 8_-t(SWAP *) 9_>p0 * 
NODE 8_-s(SWAP *) dec_s * 
NODE 8_-p1(PUSH dec_t *) 8_-s * 
NODE 8_-p0(PUSH dec_t 8_-t) 8_-p1 * 
NODE 9_>t(SWAP *) 10_+p0 * 
NODE 9_>s(SWAP *) shr * 
NODE 9_>p1(PUSH t *) 9_>s * 
NODE 9_>p0(PUSH t 9_>t) 9_>p1 * 
NODE 10_+t(SWAP *) 11_>p0 * 
NODE 10_+s(SWAP *) inc_s * 
NODE 10_+p1(PUSH inc_t *) 10_+s * 
NODE 10_+p0(PUSH inc_t 10_+t) 10_+p1 * 
NODE 11_>t(SWAP *) 12_+p0 * 
NODE 11_>s(SWAP *) shr * 
NODE 11_>p1(PUSH t *) 11_>s * 
NODE 11_>p0(PUSH t 11_>t) 11_>p1 * 
NODE 12_+t(SWAP *) 13_<p0 * 
NODE 12_+s(SWAP *) inc_s * 
NODE 12_+p1(PUSH inc_t *) 12_+s * 
NODE 12_+p0(PUSH inc_t 12_+t) 12_+p1 * 
NODE 13_<t(SWAP *) 14_<p0 * 
NODE 13_<s(SWAP *) shl * 
NODE 13_<p1(PUSH t *) 13_<s * 
NODE 13_<p0(PUSH t 13_<t) 13_<p1 * 
NODE 14_<t(SWAP *) 15_]p00 * 
NODE 14_<s(SWAP *) shl * 
NODE 14_<p1(PUSH t *) 14_<s * 
NODE 14_<p0(PUSH t 14_<t) 14_<p1 * 
NODE 15_]t(SWAP *) 16_>p0 * 
NODE 15_]s(SWAP *) and_s * 
NODE 15_]p11(PUSH and_gt *) 15_]s * 
NODE 15_]p10(PUSH and_gt 7_[) 15_]p11 * 
NODE 15_]p01(PUSH and_eq *) 15_]p10 * 
NODE 15_]p00(PUSH and_eq 15_]t) 15_]p01 * 
NODE 16_>t(SWAP *) 17_>p0 * 
NODE 16_>s(SWAP *) shr * 
NODE 16_>p1(PUSH t *) 16_>s * 
NODE 16_>p0(PUSH t 16_>t) 16_>p1 * 
NODE 17_>t(SWAP *) 18_[ * 
NODE 17_>s(SWAP *) shr * 
NODE 17_>p1(PUSH t *) 17_>s * 
NODE 17_>p0(PUSH t 17_>t) 17_>p1 * 
NODE 18_[(SWAP *) 19_-p0 * 
NODE 19_-t(SWAP *) 20_<p0 * 
NODE 19_-s(SWAP *) dec_s * 
NODE 19_-p1(PUSH dec_t *) 19_-s * 
NODE 19_-p0(PUSH dec_t 19_-t) 19_-p1 * 
NODE 20_<t(SWAP *) 21_<p0 * 
NODE 20_<s(SWAP *) shl * 
NODE 20_<p1(PUSH t *) 20_<s * 
NODE 20_<p0(PUSH t 20_<t) 20_<p1 * 
NODE 21_<t(SWAP *) 22_+p0 * 
NODE 21_<s(SWAP *) shl * 
NODE 21_<p1(PUSH t *) 21_<s * 
NODE 21_<p0(PUSH t 21_<t) 21_<p1 * 
NODE 22_+t(SWAP *) 23_>p0 * 
NODE 22_+s(SWAP *) inc_s * 
NODE 22_+p1(PUSH inc_t *) 22_+s * 
NODE 22_+p0(PUSH inc_t 22_+t) 22_+p1 * 
NODE 23_>t(SWAP *) 24_>p0 * 
NODE 23_>s(SWAP *) shr * 
NODE 23_>p1(PUSH t *) 23_>s * 
NODE 23_>p0(PUSH t 23_>t) 23_>p1 * 
NODE 24_>t(SWAP *) 25_]p00 * 
NODE 24_>s(SWAP *) shr * 
NODE 24_>p1(PUSH t *) 24_>s * 
NODE 24_>p0(PUSH t 24_>t) 24_>p1 * 
NODE 25_]t(SWAP *) 26_<p0 * 
NODE 25_]s(SWAP *) and_s * 
NODE 25_]p11(PUSH and_gt *) 25_]s * 
NODE 25_]p10(PUSH and_gt 18_[) 25_]p11 * 
NODE 25_]p01(PUSH and_eq *) 25_]p10 * 
NODE 25_]p00(PUSH and_eq 25_]t) 25_]p01 * 
NODE 26_<t(SWAP *) 27_<p0 * 
NODE 26_<s(SWAP *) shl * 
NODE 26_<p1(PUSH t *) 26_<s * 
NODE 26_<p0(PUSH t 26_<t) 26_<p1 * 
NODE 27_<t(SWAP *) 28_<p0 * 
NODE 27_<s(SWAP *) shl * 
NODE 27_<p1(PUSH t *) 27_<s * 
NODE 27_<p0(PUSH t 27_<t) 27_<p1 * 
NODE 28_<t(SWAP *) 29_]p00 * 
NODE 28_<s(SWAP *) shl * 
NODE 28_<p1(PUSH t *) 28_<s * 
NODE 28_<p0(PUSH t 28_<t) 28_<p1 * 
NODE 29_]t(SWAP *) 30_>p0 * 
NODE 29_]s(SWAP *) and_s * 
NODE 29_]p11(PUSH and_gt *) 29_]s * 
NODE 29_]p10(PUSH and_gt 4_[) 29_]p11 * 
NODE 29_]p01(PUSH and_eq *) 29_]p10 * 
NODE 29_]p00(PUSH and_eq 29_]t) 29_]p01 * 
NODE 30_>t(SWAP *) 31_>p0 * 
NODE 30_>s(SWAP *) shr * 
NODE 30_>p1(PUSH t *) 30_>s * 
NODE 30_>p0(PUSH t 30_>t) 30_>p1 * 
NODE 31_>t(SWAP *) 32_.p0 * 
NODE 31_>s(SWAP *) shr * 
NODE 31_>p1(PUSH t *) 31_>s * 
NODE 31_>p0(PUSH t 31_>t) 31_>p1 * 
NODE 32_.t(SWAP *) * * 
NODE 32_.s(SWAP *) out_s * 
NODE 32_.p1(PUSH out_t *) 32_.s * 
NODE 32_.p0(PUSH out_t 32_.t) 32_.p1 * 

END
CUR = S
INPUT = 0010000001000000
SIMSCALE = 3