NODE S(SWAP *) bH_000_a0_ab *
NODE C0(SWAP *) * *
NODE C1(SWAP *) * *
NODE ft(SWAP *) * *
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
NODE b_0_p0(SWAP *) C0 *
NODE b_0_p1(SWAP *) C1 *
NODE b_0_b(SWAP *) b_0_p0 b_0_p1
NODE b_1_p0(SWAP *) C0 *
NODE b_1_p1(SWAP *) C1 *
NODE b_1_b(SWAP *) b_1_p0 b_1_p1
NODE b_2_p0(SWAP *) C0 *
NODE b_2_p1(SWAP *) C1 *
NODE b_2_b(SWAP *) b_2_p0 b_2_p1
NODE b_3_p0(SWAP *) C0 *
NODE b_3_p1(SWAP *) C1 *
NODE b_3_b(SWAP *) b_3_p0 b_3_p1
NODE b_4_p0(SWAP *) C0 *
NODE b_4_p1(SWAP *) C1 *
NODE b_4_b(SWAP *) b_4_p0 b_4_p1
NODE b_5_p0(SWAP *) C0 *
NODE b_5_p1(SWAP *) C1 *
NODE b_5_b(SWAP *) b_5_p0 b_5_p1
NODE b_6_p0(SWAP *) C0 *
NODE b_6_p1(SWAP *) C1 *
NODE b_6_b(SWAP *) b_6_p0 b_6_p1
NODE b_7_p0(SWAP *) C0 *
NODE b_7_p1(SWAP *) C1 *
NODE b_7_b(SWAP *) b_7_p0 b_7_p1
NODE b_0_f_(SWAP b_0_b) ft *
NODE b_1_f_(SWAP b_1_b) ft *
NODE b_2_f_(SWAP b_2_b) ft *
NODE b_3_f_(SWAP b_3_b) ft *
NODE b_4_f_(SWAP b_4_b) ft *
NODE b_5_f_(SWAP b_5_b) ft *
NODE b_6_f_(SWAP b_6_b) ft *
NODE b_7_f_(SWAP b_7_b) ft *
NODE bH_111_a1_ab(PUSH bH_p111 *) fH_000_a0_af *
NODE bH_111_a0_ab(PUSH bH_p111 b_7_b) bH_111_a1_ab *
NODE bH_110_a1_ab(PUSH bH_p110 *) bH_111_a0_ab *
NODE bH_110_a0_ab(PUSH bH_p110 b_6_b) bH_110_a1_ab *
NODE bH_101_a1_ab(PUSH bH_p101 *) bH_110_a0_ab *
NODE bH_101_a0_ab(PUSH bH_p101 b_5_b) bH_101_a1_ab *
NODE bH_100_a1_ab(PUSH bH_p100 *) bH_101_a0_ab *
NODE bH_100_a0_ab(PUSH bH_p100 b_4_b) bH_100_a1_ab *
NODE bH_011_a1_ab(PUSH bH_p011 *) bH_100_a0_ab *
NODE bH_011_a0_ab(PUSH bH_p011 b_3_b) bH_011_a1_ab *
NODE bH_010_a1_ab(PUSH bH_p010 *) bH_011_a0_ab *
NODE bH_010_a0_ab(PUSH bH_p010 b_2_b) bH_010_a1_ab *
NODE bH_001_a1_ab(PUSH bH_p001 *) bH_010_a0_ab *
NODE bH_001_a0_ab(PUSH bH_p001 b_1_b) bH_001_a1_ab *
NODE bH_000_a1_ab(PUSH bH_p000 *) bH_001_a0_ab *
NODE bH_000_a0_ab(PUSH bH_p000 b_0_b) bH_000_a1_ab *
NODE fH_111_a1_af(PUSH fH_p111 *) out_s *
NODE fH_111_a0_af(PUSH fH_p111 b_7_f_) fH_111_a1_af *
NODE fH_110_a1_af(PUSH fH_p110 *) fH_111_a0_af *
NODE fH_110_a0_af(PUSH fH_p110 b_6_f_) fH_110_a1_af *
NODE fH_101_a1_af(PUSH fH_p101 *) fH_110_a0_af *
NODE fH_101_a0_af(PUSH fH_p101 b_5_f_) fH_101_a1_af *
NODE fH_100_a1_af(PUSH fH_p100 *) fH_101_a0_af *
NODE fH_100_a0_af(PUSH fH_p100 b_4_f_) fH_100_a1_af *
NODE fH_011_a1_af(PUSH fH_p011 *) fH_100_a0_af *
NODE fH_011_a0_af(PUSH fH_p011 b_3_f_) fH_011_a1_af *
NODE fH_010_a1_af(PUSH fH_p010 *) fH_011_a0_af *
NODE fH_010_a0_af(PUSH fH_p010 b_2_f_) fH_010_a1_af *
NODE fH_001_a1_af(PUSH fH_p001 *) fH_010_a0_af *
NODE fH_001_a0_af(PUSH fH_p001 b_1_f_) fH_001_a1_af *
NODE fH_000_a1_af(PUSH fH_p000 *) fH_001_a0_af *
NODE fH_000_a0_af(PUSH fH_p000 b_0_f_) fH_000_a1_af *
NODE inc_t(SWAP *) out_s *
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
NODE out_t(SWAP *) inc_s *
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

END
CUR = S
INPUT = 
NORECORD