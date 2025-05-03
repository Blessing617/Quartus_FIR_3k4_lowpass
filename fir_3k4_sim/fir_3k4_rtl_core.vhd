-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 17.1 (Release Build #590)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2017 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fir_3k4_rtl_core
-- VHDL created on Thu Jul 06 17:07:33 2023


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fir_3k4_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(7 downto 0);  -- sfix8
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(28 downto 0);  -- sfix29
        clk : in std_logic;
        areset : in std_logic
    );
end fir_3k4_rtl_core;

architecture normal of fir_3k4_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_15_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_count0_inner_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_count0_inner_i : SIGNED (8 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra20_count0_inner_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra20_count0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_count0_i : UNSIGNED (7 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra20_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra20_count1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_count1_i : UNSIGNED (7 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra20_count1_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra20_count1_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_ra20_count1_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_ra20_add_0_0_a : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_add_0_0_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_add_0_0_o : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_add_0_0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_we20_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we20_seq_eq : std_logic;
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (7 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa20_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_wa20_i : UNSIGNED (7 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa20_i : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split1_g_16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr1_ia : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_iq : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_g_17_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split9_f_17_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr9_ia : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_iq : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_q : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_memr17_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr17_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_memr17_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr17_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr17_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_memr17_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_ca20_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_ca20_i : UNSIGNED (7 downto 0);
    attribute preserve of u0_m0_wo0_ca20_i : signal is true;
    signal u0_m0_wo0_ca20_eq : std_logic;
    attribute preserve of u0_m0_wo0_ca20_eq : signal is true;
    signal d_u0_m0_wo0_ca20_q_14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_ca20_q_15_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_s1 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_14_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_s1 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_s1 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_s1 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_s1 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_s1 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_9_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_s1 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_s1 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_7_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_s1 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add0_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_5_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_5_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_5_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_5_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_6_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_6_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_6_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_6_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add1_2_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_2_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_2_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_3_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_3_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_3_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_3_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add2_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_accum_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_accum_i : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_accum_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_accum_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_ir : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_r : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_cm6_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm6_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm6_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm6_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm6_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm6_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm7_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm7_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm7_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm7_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm7_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm7_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm8_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm8_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm8_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm8_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm8_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm8_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm9_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm9_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm9_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm9_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm9_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm9_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm10_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm10_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm10_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm10_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm10_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm10_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm11_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm11_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm11_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm11_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm11_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm11_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm12_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm12_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm12_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm12_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm12_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm12_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm13_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm13_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm13_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm13_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm13_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm13_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm14_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm14_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm14_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm14_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm14_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm14_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_count0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_resize_in : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra20_resize_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_c : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_d : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_e : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_f : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_g : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_h : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_i : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split9_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split9_c : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split9_d : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split9_e : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split9_f : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split9_g : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split9_h : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split9_i : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split17_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split17_c : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_split17_d : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_join1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_join9_q : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_join17_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo0_run(ENABLEGENERATOR,13)@10 + 2
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enableQ;
    u0_m0_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(8 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(1 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(237, 9);
            u0_m0_wo0_run_enableQ <= "0";
            u0_m0_wo0_run_count <= "00";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(8) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-238);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(8 downto 8));
            ELSE
                u0_m0_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "00";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "11";
                WHEN "100" => u0_m0_wo0_run_inc := "00";
                WHEN "101" => u0_m0_wo0_run_inc := "01";
                WHEN "110" => u0_m0_wo0_run_inc := "11";
                WHEN "111" => u0_m0_wo0_run_inc := "00";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_preEnaQ <= u0_m0_wo0_run_count(1 downto 1);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_preEnaQ and VCC_q;

    -- u0_m0_wo0_memread(DELAY,14)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_13(DELAY,159)@12 + 1
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,16)@13
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_13_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_14(DELAY,161)@13 + 1
    d_u0_m0_wo0_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_20(DELAY,162)@14 + 6
    d_u0_m0_wo0_compute_q_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_14_q, xout => d_u0_m0_wo0_compute_q_20_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,105)@20 + 1
    u0_m0_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(9 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "0000000000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "0000000000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 238;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(9 downto 9));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_21(DELAY,163)@20 + 1
    d_u0_m0_wo0_compute_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_20_q, xout => d_u0_m0_wo0_compute_q_21_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra20_count1(COUNTER,23)@12
    -- low=0, high=238, step=1, init=0
    u0_m0_wo0_wi0_r0_ra20_count1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra20_count1_i <= TO_UNSIGNED(0, 8);
            u0_m0_wo0_wi0_r0_ra20_count1_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra20_count1_i = TO_UNSIGNED(237, 8)) THEN
                    u0_m0_wo0_wi0_r0_ra20_count1_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_ra20_count1_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra20_count1_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_ra20_count1_i <= u0_m0_wo0_wi0_r0_ra20_count1_i + 18;
                ELSE
                    u0_m0_wo0_wi0_r0_ra20_count1_i <= u0_m0_wo0_wi0_r0_ra20_count1_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra20_count1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra20_count1_i, 8)));

    -- u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem(DUALMEM,147)@12 + 2
    u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_aa <= u0_m0_wo0_wi0_r0_ra20_count1_q;
    u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 9,
        widthad_a => 8,
        numwords_a => 239,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_3k4_rtl_core_u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_aa,
        q_a => u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_ir
    );
    u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_r <= u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_ir(8 downto 0);

    -- u0_m0_wo0_wi0_r0_ra20_count0_inner(COUNTER,19)@14
    -- low=-1, high=237, step=-1, init=237
    u0_m0_wo0_wi0_r0_ra20_count0_inner_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra20_count0_inner_i <= TO_SIGNED(237, 9);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra20_count0_inner_i(8 downto 8) = "1") THEN
                    u0_m0_wo0_wi0_r0_ra20_count0_inner_i <= u0_m0_wo0_wi0_r0_ra20_count0_inner_i - 274;
                ELSE
                    u0_m0_wo0_wi0_r0_ra20_count0_inner_i <= u0_m0_wo0_wi0_r0_ra20_count0_inner_i - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra20_count0_inner_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra20_count0_inner_i, 9)));

    -- u0_m0_wo0_wi0_r0_ra20_count0_run(LOGICAL,20)@14
    u0_m0_wo0_wi0_r0_ra20_count0_run_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra20_count0_inner_q(8 downto 8));

    -- d_u0_m0_wo0_memread_q_14(DELAY,160)@13 + 1
    d_u0_m0_wo0_memread_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_13_q, xout => d_u0_m0_wo0_memread_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra20_count0(COUNTER,21)@14
    -- low=0, high=255, step=1, init=0
    u0_m0_wo0_wi0_r0_ra20_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra20_count0_i <= TO_UNSIGNED(0, 8);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1" and u0_m0_wo0_wi0_r0_ra20_count0_run_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra20_count0_i <= u0_m0_wo0_wi0_r0_ra20_count0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra20_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra20_count0_i, 9)));

    -- u0_m0_wo0_wi0_r0_ra20_add_0_0(ADD,24)@14 + 1
    u0_m0_wo0_wi0_r0_ra20_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra20_count0_q);
    u0_m0_wo0_wi0_r0_ra20_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra20_count1_lut_lutmem_r);
    u0_m0_wo0_wi0_r0_ra20_add_0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra20_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra20_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra20_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra20_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra20_add_0_0_q <= u0_m0_wo0_wi0_r0_ra20_add_0_0_o(9 downto 0);

    -- u0_m0_wo0_wi0_r0_ra20_resize(BITSELECT,25)@15
    u0_m0_wo0_wi0_r0_ra20_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra20_add_0_0_q(7 downto 0));
    u0_m0_wo0_wi0_r0_ra20_resize_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra20_resize_in(7 downto 0));

    -- d_xIn_0_15(DELAY,157)@10 + 5
    d_xIn_0_15 : dspba_delay
    GENERIC MAP ( width => 8, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_15_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_15(DELAY,158)@10 + 5
    d_in0_m0_wi0_wo0_assign_id1_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,27)@15
    -- low=0, high=255, step=1, init=223
    u0_m0_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(223, 8);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 8)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,29)@15
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_15_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra20_resize_b;
    u0_m0_wo0_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 8,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr0_aa,
        data_a => u0_m0_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_15_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(7 downto 0);

    -- u0_m0_wo0_wi0_r0_join1(BITJOIN,30)@15
    u0_m0_wo0_wi0_r0_join1_q <= u0_m0_wo0_wi0_r0_split1_h & u0_m0_wo0_wi0_r0_split1_g & u0_m0_wo0_wi0_r0_split1_f & u0_m0_wo0_wi0_r0_split1_e & u0_m0_wo0_wi0_r0_split1_d & u0_m0_wo0_wi0_r0_split1_c & u0_m0_wo0_wi0_r0_split1_b & u0_m0_wo0_wi0_r0_memr0_q;

    -- u0_m0_wo0_wi0_r0_we20_seq(SEQUENCE,26)@14 + 1
    u0_m0_wo0_wi0_r0_we20_seq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_wi0_r0_we20_seq_c : SIGNED(9 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we20_seq_c := "0000000000";
            u0_m0_wo0_wi0_r0_we20_seq_q <= "0";
            u0_m0_wo0_wi0_r0_we20_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_14_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_we20_seq_c = "0000000000") THEN
                    u0_m0_wo0_wi0_r0_we20_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_we20_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_we20_seq_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_we20_seq_c := u0_m0_wo0_wi0_r0_we20_seq_c + 238;
                ELSE
                    u0_m0_wo0_wi0_r0_we20_seq_c := u0_m0_wo0_wi0_r0_we20_seq_c - 1;
                END IF;
                u0_m0_wo0_wi0_r0_we20_seq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_we20_seq_c(9 downto 9));
            ELSE
                u0_m0_wo0_wi0_r0_we20_seq_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_wa20(COUNTER,28)@15
    -- low=0, high=255, step=1, init=224
    u0_m0_wo0_wi0_r0_wa20_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa20_i <= TO_UNSIGNED(224, 8);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_we20_seq_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa20_i <= u0_m0_wo0_wi0_r0_wa20_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa20_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa20_i, 8)));

    -- u0_m0_wo0_wi0_r0_memr1(DUALMEM,32)@15
    u0_m0_wo0_wi0_r0_memr1_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join1_q);
    u0_m0_wo0_wi0_r0_memr1_aa <= u0_m0_wo0_wi0_r0_wa20_q;
    u0_m0_wo0_wi0_r0_memr1_ab <= u0_m0_wo0_wi0_r0_ra20_resize_b;
    u0_m0_wo0_wi0_r0_memr1_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 64,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr1_aa,
        data_a => u0_m0_wo0_wi0_r0_memr1_ia,
        wren_a => u0_m0_wo0_wi0_r0_we20_seq_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr1_ab,
        q_b => u0_m0_wo0_wi0_r0_memr1_iq
    );
    u0_m0_wo0_wi0_r0_memr1_q <= u0_m0_wo0_wi0_r0_memr1_iq(63 downto 0);

    -- u0_m0_wo0_wi0_r0_split1(BITSELECT,31)@15
    u0_m0_wo0_wi0_r0_split1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(7 downto 0));
    u0_m0_wo0_wi0_r0_split1_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(15 downto 8));
    u0_m0_wo0_wi0_r0_split1_d <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(23 downto 16));
    u0_m0_wo0_wi0_r0_split1_e <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(31 downto 24));
    u0_m0_wo0_wi0_r0_split1_f <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(39 downto 32));
    u0_m0_wo0_wi0_r0_split1_g <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(47 downto 40));
    u0_m0_wo0_wi0_r0_split1_h <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(55 downto 48));
    u0_m0_wo0_wi0_r0_split1_i <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(63 downto 56));

    -- d_u0_m0_wo0_wi0_r0_split1_g_16(DELAY,164)@15 + 1
    d_u0_m0_wo0_wi0_r0_split1_g_16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split1_g, xout => d_u0_m0_wo0_wi0_r0_split1_g_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_ca20(COUNTER,39)@13
    -- low=0, high=238, step=1, init=0
    u0_m0_wo0_ca20_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca20_i <= TO_UNSIGNED(0, 8);
            u0_m0_wo0_ca20_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_ca20_i = TO_UNSIGNED(237, 8)) THEN
                    u0_m0_wo0_ca20_eq <= '1';
                ELSE
                    u0_m0_wo0_ca20_eq <= '0';
                END IF;
                IF (u0_m0_wo0_ca20_eq = '1') THEN
                    u0_m0_wo0_ca20_i <= u0_m0_wo0_ca20_i + 18;
                ELSE
                    u0_m0_wo0_ca20_i <= u0_m0_wo0_ca20_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca20_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca20_i, 8)));

    -- d_u0_m0_wo0_ca20_q_14(DELAY,167)@13 + 1
    d_u0_m0_wo0_ca20_q_14 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_ca20_q, xout => d_u0_m0_wo0_ca20_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm6_lutmem(DUALMEM,148)@14 + 2
    u0_m0_wo0_cm6_lutmem_aa <= d_u0_m0_wo0_ca20_q_14_q;
    u0_m0_wo0_cm6_lutmem_reset0 <= areset;
    u0_m0_wo0_cm6_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 8,
        numwords_a => 239,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_3k4_rtl_core_u0_m0_wo0_cm6_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm6_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm6_lutmem_aa,
        q_a => u0_m0_wo0_cm6_lutmem_ir
    );
    u0_m0_wo0_cm6_lutmem_r <= u0_m0_wo0_cm6_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_14(MULT,70)@16 + 2
    u0_m0_wo0_mtree_mult1_14_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm6_lutmem_r);
    u0_m0_wo0_mtree_mult1_14_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_split1_g_16_q);
    u0_m0_wo0_mtree_mult1_14_reset <= areset;
    u0_m0_wo0_mtree_mult1_14_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 8,
        lpm_widthp => 16,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_14_a0,
        datab => u0_m0_wo0_mtree_mult1_14_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_14_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_14_s1
    );
    u0_m0_wo0_mtree_mult1_14_q <= u0_m0_wo0_mtree_mult1_14_s1;

    -- u0_m0_wo0_cm7_lutmem(DUALMEM,149)@13 + 2
    u0_m0_wo0_cm7_lutmem_aa <= u0_m0_wo0_ca20_q;
    u0_m0_wo0_cm7_lutmem_reset0 <= areset;
    u0_m0_wo0_cm7_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 8,
        numwords_a => 239,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_3k4_rtl_core_u0_m0_wo0_cm7_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm7_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm7_lutmem_aa,
        q_a => u0_m0_wo0_cm7_lutmem_ir
    );
    u0_m0_wo0_cm7_lutmem_r <= u0_m0_wo0_cm7_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_13(MULT,71)@15 + 2
    u0_m0_wo0_mtree_mult1_13_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm7_lutmem_r);
    u0_m0_wo0_mtree_mult1_13_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split1_h);
    u0_m0_wo0_mtree_mult1_13_reset <= areset;
    u0_m0_wo0_mtree_mult1_13_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 8,
        lpm_widthp => 16,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_13_a0,
        datab => u0_m0_wo0_mtree_mult1_13_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_13_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_13_s1
    );
    u0_m0_wo0_mtree_mult1_13_q <= u0_m0_wo0_mtree_mult1_13_s1;

    -- u0_m0_wo0_cm8_lutmem(DUALMEM,150)@13 + 2
    u0_m0_wo0_cm8_lutmem_aa <= u0_m0_wo0_ca20_q;
    u0_m0_wo0_cm8_lutmem_reset0 <= areset;
    u0_m0_wo0_cm8_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 8,
        numwords_a => 239,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_3k4_rtl_core_u0_m0_wo0_cm8_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm8_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm8_lutmem_aa,
        q_a => u0_m0_wo0_cm8_lutmem_ir
    );
    u0_m0_wo0_cm8_lutmem_r <= u0_m0_wo0_cm8_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_12(MULT,72)@15 + 2
    u0_m0_wo0_mtree_mult1_12_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm8_lutmem_r);
    u0_m0_wo0_mtree_mult1_12_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split1_i);
    u0_m0_wo0_mtree_mult1_12_reset <= areset;
    u0_m0_wo0_mtree_mult1_12_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 8,
        lpm_widthp => 16,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_12_a0,
        datab => u0_m0_wo0_mtree_mult1_12_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_12_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_12_s1
    );
    u0_m0_wo0_mtree_mult1_12_q <= u0_m0_wo0_mtree_mult1_12_s1;

    -- u0_m0_wo0_mtree_add0_6(ADD,91)@17 + 1
    u0_m0_wo0_mtree_add0_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_12_q(15)) & u0_m0_wo0_mtree_mult1_12_q));
    u0_m0_wo0_mtree_add0_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_13_q(15)) & u0_m0_wo0_mtree_mult1_13_q));
    u0_m0_wo0_mtree_add0_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_6_a) + SIGNED(u0_m0_wo0_mtree_add0_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_6_q <= u0_m0_wo0_mtree_add0_6_o(16 downto 0);

    -- u0_m0_wo0_mtree_add1_3(ADD,98)@18 + 1
    u0_m0_wo0_mtree_add1_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_add0_6_q(16)) & u0_m0_wo0_mtree_add0_6_q));
    u0_m0_wo0_mtree_add1_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => u0_m0_wo0_mtree_mult1_14_q(15)) & u0_m0_wo0_mtree_mult1_14_q));
    u0_m0_wo0_mtree_add1_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_3_a) + SIGNED(u0_m0_wo0_mtree_add1_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_3_q <= u0_m0_wo0_mtree_add1_3_o(17 downto 0);

    -- u0_m0_wo0_wi0_r0_join9(BITJOIN,33)@15
    u0_m0_wo0_wi0_r0_join9_q <= u0_m0_wo0_wi0_r0_split9_h & u0_m0_wo0_wi0_r0_split9_g & u0_m0_wo0_wi0_r0_split9_f & u0_m0_wo0_wi0_r0_split9_e & u0_m0_wo0_wi0_r0_split9_d & u0_m0_wo0_wi0_r0_split9_c & u0_m0_wo0_wi0_r0_split9_b & u0_m0_wo0_wi0_r0_split1_i;

    -- u0_m0_wo0_wi0_r0_memr9(DUALMEM,35)@15
    u0_m0_wo0_wi0_r0_memr9_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join9_q);
    u0_m0_wo0_wi0_r0_memr9_aa <= u0_m0_wo0_wi0_r0_wa20_q;
    u0_m0_wo0_wi0_r0_memr9_ab <= u0_m0_wo0_wi0_r0_ra20_resize_b;
    u0_m0_wo0_wi0_r0_memr9_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 64,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr9_aa,
        data_a => u0_m0_wo0_wi0_r0_memr9_ia,
        wren_a => u0_m0_wo0_wi0_r0_we20_seq_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr9_ab,
        q_b => u0_m0_wo0_wi0_r0_memr9_iq
    );
    u0_m0_wo0_wi0_r0_memr9_q <= u0_m0_wo0_wi0_r0_memr9_iq(63 downto 0);

    -- u0_m0_wo0_wi0_r0_split9(BITSELECT,34)@15
    u0_m0_wo0_wi0_r0_split9_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr9_q(7 downto 0));
    u0_m0_wo0_wi0_r0_split9_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr9_q(15 downto 8));
    u0_m0_wo0_wi0_r0_split9_d <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr9_q(23 downto 16));
    u0_m0_wo0_wi0_r0_split9_e <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr9_q(31 downto 24));
    u0_m0_wo0_wi0_r0_split9_f <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr9_q(39 downto 32));
    u0_m0_wo0_wi0_r0_split9_g <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr9_q(47 downto 40));
    u0_m0_wo0_wi0_r0_split9_h <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr9_q(55 downto 48));
    u0_m0_wo0_wi0_r0_split9_i <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr9_q(63 downto 56));

    -- u0_m0_wo0_cm9_lutmem(DUALMEM,151)@13 + 2
    u0_m0_wo0_cm9_lutmem_aa <= u0_m0_wo0_ca20_q;
    u0_m0_wo0_cm9_lutmem_reset0 <= areset;
    u0_m0_wo0_cm9_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 8,
        numwords_a => 239,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_3k4_rtl_core_u0_m0_wo0_cm9_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm9_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm9_lutmem_aa,
        q_a => u0_m0_wo0_cm9_lutmem_ir
    );
    u0_m0_wo0_cm9_lutmem_r <= u0_m0_wo0_cm9_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_11(MULT,73)@15 + 2
    u0_m0_wo0_mtree_mult1_11_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm9_lutmem_r);
    u0_m0_wo0_mtree_mult1_11_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split9_b);
    u0_m0_wo0_mtree_mult1_11_reset <= areset;
    u0_m0_wo0_mtree_mult1_11_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 8,
        lpm_widthp => 16,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_11_a0,
        datab => u0_m0_wo0_mtree_mult1_11_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_11_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_11_s1
    );
    u0_m0_wo0_mtree_mult1_11_q <= u0_m0_wo0_mtree_mult1_11_s1;

    -- u0_m0_wo0_cm10_lutmem(DUALMEM,152)@13 + 2
    u0_m0_wo0_cm10_lutmem_aa <= u0_m0_wo0_ca20_q;
    u0_m0_wo0_cm10_lutmem_reset0 <= areset;
    u0_m0_wo0_cm10_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 8,
        numwords_a => 239,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_3k4_rtl_core_u0_m0_wo0_cm10_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm10_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm10_lutmem_aa,
        q_a => u0_m0_wo0_cm10_lutmem_ir
    );
    u0_m0_wo0_cm10_lutmem_r <= u0_m0_wo0_cm10_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_10(MULT,74)@15 + 2
    u0_m0_wo0_mtree_mult1_10_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm10_lutmem_r);
    u0_m0_wo0_mtree_mult1_10_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split9_c);
    u0_m0_wo0_mtree_mult1_10_reset <= areset;
    u0_m0_wo0_mtree_mult1_10_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 8,
        lpm_widthp => 16,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_10_a0,
        datab => u0_m0_wo0_mtree_mult1_10_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_10_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_10_s1
    );
    u0_m0_wo0_mtree_mult1_10_q <= u0_m0_wo0_mtree_mult1_10_s1;

    -- u0_m0_wo0_mtree_add0_5(ADD,90)@17 + 1
    u0_m0_wo0_mtree_add0_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_10_q(15)) & u0_m0_wo0_mtree_mult1_10_q));
    u0_m0_wo0_mtree_add0_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_11_q(15)) & u0_m0_wo0_mtree_mult1_11_q));
    u0_m0_wo0_mtree_add0_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_5_a) + SIGNED(u0_m0_wo0_mtree_add0_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_5_q <= u0_m0_wo0_mtree_add0_5_o(16 downto 0);

    -- u0_m0_wo0_cm11_lutmem(DUALMEM,153)@13 + 2
    u0_m0_wo0_cm11_lutmem_aa <= u0_m0_wo0_ca20_q;
    u0_m0_wo0_cm11_lutmem_reset0 <= areset;
    u0_m0_wo0_cm11_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 8,
        numwords_a => 239,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_3k4_rtl_core_u0_m0_wo0_cm11_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm11_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm11_lutmem_aa,
        q_a => u0_m0_wo0_cm11_lutmem_ir
    );
    u0_m0_wo0_cm11_lutmem_r <= u0_m0_wo0_cm11_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_9(MULT,75)@15 + 2
    u0_m0_wo0_mtree_mult1_9_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm11_lutmem_r);
    u0_m0_wo0_mtree_mult1_9_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split9_d);
    u0_m0_wo0_mtree_mult1_9_reset <= areset;
    u0_m0_wo0_mtree_mult1_9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 8,
        lpm_widthp => 16,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_9_a0,
        datab => u0_m0_wo0_mtree_mult1_9_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_9_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_9_s1
    );
    u0_m0_wo0_mtree_mult1_9_q <= u0_m0_wo0_mtree_mult1_9_s1;

    -- u0_m0_wo0_cm12_lutmem(DUALMEM,154)@13 + 2
    u0_m0_wo0_cm12_lutmem_aa <= u0_m0_wo0_ca20_q;
    u0_m0_wo0_cm12_lutmem_reset0 <= areset;
    u0_m0_wo0_cm12_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 8,
        numwords_a => 239,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_3k4_rtl_core_u0_m0_wo0_cm12_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm12_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm12_lutmem_aa,
        q_a => u0_m0_wo0_cm12_lutmem_ir
    );
    u0_m0_wo0_cm12_lutmem_r <= u0_m0_wo0_cm12_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_8(MULT,76)@15 + 2
    u0_m0_wo0_mtree_mult1_8_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm12_lutmem_r);
    u0_m0_wo0_mtree_mult1_8_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split9_e);
    u0_m0_wo0_mtree_mult1_8_reset <= areset;
    u0_m0_wo0_mtree_mult1_8_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 8,
        lpm_widthp => 16,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_8_a0,
        datab => u0_m0_wo0_mtree_mult1_8_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_8_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_8_s1
    );
    u0_m0_wo0_mtree_mult1_8_q <= u0_m0_wo0_mtree_mult1_8_s1;

    -- u0_m0_wo0_mtree_add0_4(ADD,89)@17 + 1
    u0_m0_wo0_mtree_add0_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_8_q(15)) & u0_m0_wo0_mtree_mult1_8_q));
    u0_m0_wo0_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_9_q(15)) & u0_m0_wo0_mtree_mult1_9_q));
    u0_m0_wo0_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_a) + SIGNED(u0_m0_wo0_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_q <= u0_m0_wo0_mtree_add0_4_o(16 downto 0);

    -- u0_m0_wo0_mtree_add1_2(ADD,97)@18 + 1
    u0_m0_wo0_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_add0_4_q(16)) & u0_m0_wo0_mtree_add0_4_q));
    u0_m0_wo0_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_add0_5_q(16)) & u0_m0_wo0_mtree_add0_5_q));
    u0_m0_wo0_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_a) + SIGNED(u0_m0_wo0_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_q <= u0_m0_wo0_mtree_add1_2_o(17 downto 0);

    -- u0_m0_wo0_mtree_add2_1(ADD,101)@19 + 1
    u0_m0_wo0_mtree_add2_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_add1_2_q(17)) & u0_m0_wo0_mtree_add1_2_q));
    u0_m0_wo0_mtree_add2_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_add1_3_q(17)) & u0_m0_wo0_mtree_add1_3_q));
    u0_m0_wo0_mtree_add2_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_1_a) + SIGNED(u0_m0_wo0_mtree_add2_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_1_q <= u0_m0_wo0_mtree_add2_1_o(18 downto 0);

    -- d_u0_m0_wo0_wi0_r0_split9_f_17(DELAY,165)@15 + 2
    d_u0_m0_wo0_wi0_r0_split9_f_17 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split9_f, xout => d_u0_m0_wo0_wi0_r0_split9_f_17_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_ca20_q_15(DELAY,168)@14 + 1
    d_u0_m0_wo0_ca20_q_15 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_ca20_q_14_q, xout => d_u0_m0_wo0_ca20_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm13_lutmem(DUALMEM,155)@15 + 2
    u0_m0_wo0_cm13_lutmem_aa <= d_u0_m0_wo0_ca20_q_15_q;
    u0_m0_wo0_cm13_lutmem_reset0 <= areset;
    u0_m0_wo0_cm13_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 8,
        numwords_a => 239,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_3k4_rtl_core_u0_m0_wo0_cm13_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm13_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm13_lutmem_aa,
        q_a => u0_m0_wo0_cm13_lutmem_ir
    );
    u0_m0_wo0_cm13_lutmem_r <= u0_m0_wo0_cm13_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_7(MULT,77)@17 + 2
    u0_m0_wo0_mtree_mult1_7_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm13_lutmem_r);
    u0_m0_wo0_mtree_mult1_7_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_split9_f_17_q);
    u0_m0_wo0_mtree_mult1_7_reset <= areset;
    u0_m0_wo0_mtree_mult1_7_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 8,
        lpm_widthp => 16,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_7_a0,
        datab => u0_m0_wo0_mtree_mult1_7_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_7_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_7_s1
    );
    u0_m0_wo0_mtree_mult1_7_q <= u0_m0_wo0_mtree_mult1_7_s1;

    -- d_u0_m0_wo0_wi0_r0_split9_g_17(DELAY,166)@15 + 2
    d_u0_m0_wo0_wi0_r0_split9_g_17 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split9_g, xout => d_u0_m0_wo0_wi0_r0_split9_g_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm14_lutmem(DUALMEM,156)@15 + 2
    u0_m0_wo0_cm14_lutmem_aa <= d_u0_m0_wo0_ca20_q_15_q;
    u0_m0_wo0_cm14_lutmem_reset0 <= areset;
    u0_m0_wo0_cm14_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 8,
        numwords_a => 239,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_3k4_rtl_core_u0_m0_wo0_cm14_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm14_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm14_lutmem_aa,
        q_a => u0_m0_wo0_cm14_lutmem_ir
    );
    u0_m0_wo0_cm14_lutmem_r <= u0_m0_wo0_cm14_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_6(MULT,78)@17 + 2
    u0_m0_wo0_mtree_mult1_6_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm14_lutmem_r);
    u0_m0_wo0_mtree_mult1_6_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_split9_g_17_q);
    u0_m0_wo0_mtree_mult1_6_reset <= areset;
    u0_m0_wo0_mtree_mult1_6_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 8,
        lpm_widthp => 16,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_6_a0,
        datab => u0_m0_wo0_mtree_mult1_6_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_6_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_6_s1
    );
    u0_m0_wo0_mtree_mult1_6_q <= u0_m0_wo0_mtree_mult1_6_s1;

    -- u0_m0_wo0_mtree_add0_3(ADD,88)@19 + 1
    u0_m0_wo0_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_6_q(15)) & u0_m0_wo0_mtree_mult1_6_q));
    u0_m0_wo0_mtree_add0_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_7_q(15)) & u0_m0_wo0_mtree_mult1_7_q));
    u0_m0_wo0_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_3_a) + SIGNED(u0_m0_wo0_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_q <= u0_m0_wo0_mtree_add0_3_o(16 downto 0);

    -- u0_m0_wo0_mtree_add3_0(ADD,103)@20 + 1
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_mtree_add0_3_q(16)) & u0_m0_wo0_mtree_add0_3_q));
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_add2_1_q(18)) & u0_m0_wo0_mtree_add2_1_q));
    u0_m0_wo0_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(19 downto 0);

    -- u0_m0_wo0_accum(ADD,106)@21 + 1
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 20 => u0_m0_wo0_mtree_add3_0_q(19)) & u0_m0_wo0_mtree_add3_0_q));
    u0_m0_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo0_accum_q);
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_21_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
                ELSE
                    u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a) + SIGNED(u0_m0_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(28 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,107)@20 + 1
    u0_m0_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(9 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "0011101110";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "0000000000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 238;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(9 downto 9));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,108)@21
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_q and d_u0_m0_wo0_compute_q_21_q;

    -- u0_m0_wo0_oseq_gated_reg(REG,109)@21 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,114)@22 + 1
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_accum_q;

    -- u0_m0_wo0_wi0_r0_memr17(DUALMEM,38)@15
    u0_m0_wo0_wi0_r0_memr17_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join17_q);
    u0_m0_wo0_wi0_r0_memr17_aa <= u0_m0_wo0_wi0_r0_wa20_q;
    u0_m0_wo0_wi0_r0_memr17_ab <= u0_m0_wo0_wi0_r0_ra20_resize_b;
    u0_m0_wo0_wi0_r0_memr17_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 32,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr17_aa,
        data_a => u0_m0_wo0_wi0_r0_memr17_ia,
        wren_a => u0_m0_wo0_wi0_r0_we20_seq_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr17_ab,
        q_b => u0_m0_wo0_wi0_r0_memr17_iq
    );
    u0_m0_wo0_wi0_r0_memr17_q <= u0_m0_wo0_wi0_r0_memr17_iq(31 downto 0);

    -- u0_m0_wo0_wi0_r0_split17(BITSELECT,37)@15
    u0_m0_wo0_wi0_r0_split17_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr17_q(7 downto 0));
    u0_m0_wo0_wi0_r0_split17_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr17_q(15 downto 8));
    u0_m0_wo0_wi0_r0_split17_d <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr17_q(23 downto 16));

    -- u0_m0_wo0_wi0_r0_join17(BITJOIN,36)@15
    u0_m0_wo0_wi0_r0_join17_q <= u0_m0_wo0_wi0_r0_split17_d & u0_m0_wo0_wi0_r0_split17_c & u0_m0_wo0_wi0_r0_split17_b & u0_m0_wo0_wi0_r0_split9_i;

END normal;
