--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : EIGHT_BIT_PRI_ENCODER_TBW.vhw
-- /___/   /\     Timestamp : Thu Apr 10 23:55:11 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: EIGHT_BIT_PRI_ENCODER_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY EIGHT_BIT_PRI_ENCODER_TBW IS
END EIGHT_BIT_PRI_ENCODER_TBW;

ARCHITECTURE testbench_arch OF EIGHT_BIT_PRI_ENCODER_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT EIGHT_BIT_PRI_ENCODER
        PORT (
            EI : In std_logic;
            I0 : In std_logic;
            I1 : In std_logic;
            I2 : In std_logic;
            I3 : In std_logic;
            I4 : In std_logic;
            I5 : In std_logic;
            I6 : In std_logic;
            I7 : In std_logic;
            A2 : Out std_logic;
            A1 : Out std_logic;
            A0 : Out std_logic;
            EO : Out std_logic;
            GS : Out std_logic
        );
    END COMPONENT;

    SIGNAL EI : std_logic := '0';
    SIGNAL I0 : std_logic := '0';
    SIGNAL I1 : std_logic := '0';
    SIGNAL I2 : std_logic := '0';
    SIGNAL I3 : std_logic := '0';
    SIGNAL I4 : std_logic := '0';
    SIGNAL I5 : std_logic := '0';
    SIGNAL I6 : std_logic := '0';
    SIGNAL I7 : std_logic := '0';
    SIGNAL A2 : std_logic := '0';
    SIGNAL A1 : std_logic := '0';
    SIGNAL A0 : std_logic := '0';
    SIGNAL EO : std_logic := '1';
    SIGNAL GS : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : EIGHT_BIT_PRI_ENCODER
        PORT MAP (
            EI => EI,
            I0 => I0,
            I1 => I1,
            I2 => I2,
            I3 => I3,
            I4 => I4,
            I5 => I5,
            I6 => I6,
            I7 => I7,
            A2 => A2,
            A1 => A1,
            A0 => A0,
            EO => EO,
            GS => GS
        );

        PROCESS
            PROCEDURE CHECK_A0(
                next_A0 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (A0 /= next_A0) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns A0="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, A0);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_A0);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_A1(
                next_A1 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (A1 /= next_A1) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns A1="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, A1);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_A1);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_A2(
                next_A2 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (A2 /= next_A2) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns A2="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, A2);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_A2);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_EO(
                next_EO : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (EO /= next_EO) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns EO="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, EO);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_EO);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_GS(
                next_GS : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (GS /= next_GS) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns GS="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, GS);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_GS);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  6ns
                WAIT FOR 6 ns;
                I6 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  10ns
                WAIT FOR 4 ns;
                I6 <= '0';
                I7 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  11ns
                WAIT FOR 1 ns;
                CHECK_A0('1', 11);
                -- -------------------------------------
                -- -------------  Current Time:  18ns
                WAIT FOR 7 ns;
                I5 <= '1';
                I6 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  19ns
                WAIT FOR 1 ns;
                CHECK_A1('1', 19);
                -- -------------------------------------
                -- -------------  Current Time:  26ns
                WAIT FOR 7 ns;
                I4 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  27ns
                WAIT FOR 1 ns;
                CHECK_A2('1', 27);
                CHECK_A1('0', 27);
                CHECK_A0('0', 27);
                -- -------------------------------------
                -- -------------  Current Time:  34ns
                WAIT FOR 7 ns;
                I3 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  35ns
                WAIT FOR 1 ns;
                CHECK_A0('1', 35);
                -- -------------------------------------
                -- -------------  Current Time:  40ns
                WAIT FOR 5 ns;
                I2 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  41ns
                WAIT FOR 1 ns;
                CHECK_A1('1', 41);
                CHECK_A0('0', 41);
                -- -------------------------------------
                -- -------------  Current Time:  46ns
                WAIT FOR 5 ns;
                I1 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  47ns
                WAIT FOR 1 ns;
                CHECK_A0('1', 47);
                -- -------------------------------------
                -- -------------  Current Time:  50ns
                WAIT FOR 3 ns;
                I0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  51ns
                WAIT FOR 1 ns;
                CHECK_EO('0', 51);
                CHECK_GS('1', 51);
                -- -------------------------------------
                -- -------------  Current Time:  64ns
                WAIT FOR 13 ns;
                EI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  65ns
                WAIT FOR 1 ns;
                CHECK_EO('1', 65);
                -- -------------------------------------
                -- -------------  Current Time:  102ns
                WAIT FOR 37 ns;
                EI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  103ns
                WAIT FOR 1 ns;
                CHECK_EO('0', 103);
                -- -------------------------------------
                -- -------------  Current Time:  120ns
                WAIT FOR 17 ns;
                EI <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  121ns
                WAIT FOR 1 ns;
                CHECK_EO('1', 121);
                -- -------------------------------------
                -- -------------  Current Time:  138ns
                WAIT FOR 17 ns;
                EI <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  139ns
                WAIT FOR 1 ns;
                CHECK_EO('0', 139);
                WAIT FOR 11 ns;

                IF (TX_ERROR = 0) THEN
                    STD.TEXTIO.write(TX_OUT, string'("No errors or warnings"));
                    STD.TEXTIO.writeline(RESULTS, TX_OUT);
                    ASSERT (FALSE) REPORT
                      "Simulation successful (not a failure).  No problems detected."
                      SEVERITY FAILURE;
                ELSE
                    STD.TEXTIO.write(TX_OUT, TX_ERROR);
                    STD.TEXTIO.write(TX_OUT,
                        string'(" errors found in simulation"));
                    STD.TEXTIO.writeline(RESULTS, TX_OUT);
                    ASSERT (FALSE) REPORT "Errors found during simulation"
                         SEVERITY FAILURE;
                END IF;
            END PROCESS;

    END testbench_arch;

