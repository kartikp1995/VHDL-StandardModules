--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : MULTIPLIER_TBW.vhw
-- /___/   /\     Timestamp : Sun Mar 23 01:39:02 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: MULTIPLIER_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY MULTIPLIER_TBW IS
END MULTIPLIER_TBW;

ARCHITECTURE testbench_arch OF MULTIPLIER_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT THREE_BIT_MULTIPLIER
        PORT (
            a : In BIT_VECTOR (2 DownTo 0);
            b : In BIT_VECTOR (2 DownTo 0);
            p : Out BIT_VECTOR (5 DownTo 0)
        );
    END COMPONENT;

    SIGNAL a : BIT_VECTOR (2 DownTo 0) := "000";
    SIGNAL b : BIT_VECTOR (2 DownTo 0) := "000";
    SIGNAL p : BIT_VECTOR (5 DownTo 0) := "000000";

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : THREE_BIT_MULTIPLIER
        PORT MAP (
            a => a,
            b => b,
            p => p
        );

        PROCESS
            PROCEDURE CHECK_p(
                next_p : BIT_VECTOR (5 DownTo 0);
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (p /= next_p) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns p="));
                    STD.TEXTIO.write(TX_LOC, p);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    STD.TEXTIO.write(TX_LOC, next_p);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  80ns
                WAIT FOR 80 ns;
                a <= "100";
                -- -------------------------------------
                -- -------------  Current Time:  100ns
                WAIT FOR 20 ns;
                b <= "100";
                -- -------------------------------------
                -- -------------  Current Time:  110ns
                WAIT FOR 10 ns;
                CHECK_p("010000", 110);
                -- -------------------------------------
                -- -------------  Current Time:  120ns
                WAIT FOR 10 ns;
                a <= "000";
                -- -------------------------------------
                -- -------------  Current Time:  130ns
                WAIT FOR 10 ns;
                CHECK_p("000000", 130);
                -- -------------------------------------
                -- -------------  Current Time:  160ns
                WAIT FOR 30 ns;
                a <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  170ns
                WAIT FOR 10 ns;
                CHECK_p("001100", 170);
                -- -------------------------------------
                -- -------------  Current Time:  220ns
                WAIT FOR 50 ns;
                a <= "010";
                -- -------------------------------------
                -- -------------  Current Time:  230ns
                WAIT FOR 10 ns;
                CHECK_p("001000", 230);
                -- -------------------------------------
                -- -------------  Current Time:  240ns
                WAIT FOR 10 ns;
                b <= "000";
                -- -------------------------------------
                -- -------------  Current Time:  250ns
                WAIT FOR 10 ns;
                CHECK_p("000000", 250);
                -- -------------------------------------
                -- -------------  Current Time:  260ns
                WAIT FOR 10 ns;
                b <= "010";
                -- -------------------------------------
                -- -------------  Current Time:  270ns
                WAIT FOR 10 ns;
                CHECK_p("000100", 270);
                -- -------------------------------------
                -- -------------  Current Time:  280ns
                WAIT FOR 10 ns;
                b <= "000";
                -- -------------------------------------
                -- -------------  Current Time:  290ns
                WAIT FOR 10 ns;
                CHECK_p("000000", 290);
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 10 ns;
                b <= "001";
                -- -------------------------------------
                -- -------------  Current Time:  310ns
                WAIT FOR 10 ns;
                CHECK_p("000010", 310);
                -- -------------------------------------
                -- -------------  Current Time:  320ns
                WAIT FOR 10 ns;
                a <= "110";
                b <= "000";
                -- -------------------------------------
                -- -------------  Current Time:  330ns
                WAIT FOR 10 ns;
                CHECK_p("000000", 330);
                -- -------------------------------------
                -- -------------  Current Time:  360ns
                WAIT FOR 30 ns;
                a <= "100";
                -- -------------------------------------
                -- -------------  Current Time:  520ns
                WAIT FOR 160 ns;
                a <= "000";
                WAIT FOR 480 ns;

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

