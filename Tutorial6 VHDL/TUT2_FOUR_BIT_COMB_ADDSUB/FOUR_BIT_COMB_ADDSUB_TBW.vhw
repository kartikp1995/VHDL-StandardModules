--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : FOUR_BIT_COMB_ADDSUB_TBW.vhw
-- /___/   /\     Timestamp : Thu Apr 10 23:39:12 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: FOUR_BIT_COMB_ADDSUB_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY FOUR_BIT_COMB_ADDSUB_TBW IS
END FOUR_BIT_COMB_ADDSUB_TBW;

ARCHITECTURE testbench_arch OF FOUR_BIT_COMB_ADDSUB_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT FOUR_BIT_COMB_ADDSUB
        PORT (
            a0 : In std_logic;
            a1 : In std_logic;
            a2 : In std_logic;
            a3 : In std_logic;
            b0 : In std_logic;
            b1 : In std_logic;
            b2 : In std_logic;
            b3 : In std_logic;
            m : In std_logic;
            cout : Out std_logic;
            sum0 : Out std_logic;
            sum1 : Out std_logic;
            sum2 : Out std_logic;
            sum3 : Out std_logic;
            overflow : Out std_logic
        );
    END COMPONENT;

    SIGNAL a0 : std_logic := '0';
    SIGNAL a1 : std_logic := '0';
    SIGNAL a2 : std_logic := '0';
    SIGNAL a3 : std_logic := '0';
    SIGNAL b0 : std_logic := '0';
    SIGNAL b1 : std_logic := '0';
    SIGNAL b2 : std_logic := '0';
    SIGNAL b3 : std_logic := '0';
    SIGNAL m : std_logic := '0';
    SIGNAL cout : std_logic := '0';
    SIGNAL sum0 : std_logic := '0';
    SIGNAL sum1 : std_logic := '0';
    SIGNAL sum2 : std_logic := '0';
    SIGNAL sum3 : std_logic := '0';
    SIGNAL overflow : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : FOUR_BIT_COMB_ADDSUB
        PORT MAP (
            a0 => a0,
            a1 => a1,
            a2 => a2,
            a3 => a3,
            b0 => b0,
            b1 => b1,
            b2 => b2,
            b3 => b3,
            m => m,
            cout => cout,
            sum0 => sum0,
            sum1 => sum1,
            sum2 => sum2,
            sum3 => sum3,
            overflow => overflow
        );

        PROCESS
            PROCEDURE CHECK_cout(
                next_cout : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (cout /= next_cout) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns cout="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, cout);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_cout);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_overflow(
                next_overflow : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (overflow /= next_overflow) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns overflow="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, overflow);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_overflow);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_sum0(
                next_sum0 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (sum0 /= next_sum0) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns sum0="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, sum0);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_sum0);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_sum1(
                next_sum1 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (sum1 /= next_sum1) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns sum1="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, sum1);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_sum1);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_sum2(
                next_sum2 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (sum2 /= next_sum2) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns sum2="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, sum2);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_sum2);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_sum3(
                next_sum3 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (sum3 /= next_sum3) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns sum3="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, sum3);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_sum3);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  40ns
                WAIT FOR 40 ns;
                a3 <= '1';
                b1 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  50ns
                WAIT FOR 10 ns;
                CHECK_sum1('1', 50);
                CHECK_sum3('1', 50);
                -- -------------------------------------
                -- -------------  Current Time:  80ns
                WAIT FOR 30 ns;
                m <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  90ns
                WAIT FOR 10 ns;
                CHECK_cout('1', 90);
                CHECK_sum2('1', 90);
                CHECK_sum3('0', 90);
                CHECK_overflow('1', 90);
                -- -------------------------------------
                -- -------------  Current Time:  120ns
                WAIT FOR 30 ns;
                a2 <= '1';
                b3 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  130ns
                WAIT FOR 10 ns;
                CHECK_sum2('0', 130);
                CHECK_overflow('0', 130);
                -- -------------------------------------
                -- -------------  Current Time:  160ns
                WAIT FOR 30 ns;
                b2 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  170ns
                WAIT FOR 10 ns;
                CHECK_cout('0', 170);
                CHECK_sum2('1', 170);
                CHECK_sum3('1', 170);
                -- -------------------------------------
                -- -------------  Current Time:  220ns
                WAIT FOR 50 ns;
                a1 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  230ns
                WAIT FOR 10 ns;
                CHECK_cout('1', 230);
                CHECK_sum1('0', 230);
                CHECK_sum2('0', 230);
                CHECK_sum3('0', 230);
                -- -------------------------------------
                -- -------------  Current Time:  240ns
                WAIT FOR 10 ns;
                b0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  250ns
                WAIT FOR 10 ns;
                CHECK_cout('0', 250);
                CHECK_sum0('1', 250);
                CHECK_sum1('1', 250);
                CHECK_sum2('1', 250);
                CHECK_sum3('1', 250);
                -- -------------------------------------
                -- -------------  Current Time:  280ns
                WAIT FOR 30 ns;
                a0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  290ns
                WAIT FOR 10 ns;
                CHECK_cout('1', 290);
                CHECK_sum0('0', 290);
                CHECK_sum1('0', 290);
                CHECK_sum2('0', 290);
                CHECK_sum3('0', 290);
                -- -------------------------------------
                -- -------------  Current Time:  320ns
                WAIT FOR 30 ns;
                m <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  330ns
                WAIT FOR 10 ns;
                CHECK_sum1('1', 330);
                CHECK_sum2('1', 330);
                CHECK_sum3('1', 330);
                -- -------------------------------------
                -- -------------  Current Time:  10000ns
                WAIT FOR 9670 ns;
                a0 <= '0';

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

