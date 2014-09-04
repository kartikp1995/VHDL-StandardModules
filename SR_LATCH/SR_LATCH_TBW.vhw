--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : SR_LATCH_TBW.vhw
-- /___/   /\     Timestamp : Fri Mar 21 09:42:27 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: SR_LATCH_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY SR_LATCH_TBW IS
END SR_LATCH_TBW;

ARCHITECTURE testbench_arch OF SR_LATCH_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT SR_LATCH
        PORT (
            S : In std_logic;
            R : In std_logic;
            Q : Out std_logic;
            Q_bar : Out std_logic
        );
    END COMPONENT;

    SIGNAL S : std_logic := '0';
    SIGNAL R : std_logic := '0';
    SIGNAL Q : std_logic := '1';
    SIGNAL Q_bar : std_logic := '1';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : SR_LATCH
        PORT MAP (
            S => S,
            R => R,
            Q => Q,
            Q_bar => Q_bar
        );

        PROCESS
            PROCEDURE CHECK_Q(
                next_Q : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (Q /= next_Q) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns Q="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, Q);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_Q);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_Q_bar(
                next_Q_bar : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (Q_bar /= next_Q_bar) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns Q_bar="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, Q_bar);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_Q_bar);
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
                S <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  7ns
                WAIT FOR 1 ns;
                CHECK_Q('0', 7);
                -- -------------------------------------
                -- -------------  Current Time:  38ns
                WAIT FOR 31 ns;
                R <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  60ns
                WAIT FOR 22 ns;
                S <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  61ns
                WAIT FOR 1 ns;
                CHECK_Q('1', 61);
                CHECK_Q_bar('0', 61);
                -- -------------------------------------
                -- -------------  Current Time:  114ns
                WAIT FOR 53 ns;
                R <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  115ns
                WAIT FOR 1 ns;
                CHECK_Q_bar('1', 115);
                -- -------------------------------------
                -- -------------  Current Time:  150ns
                WAIT FOR 35 ns;
                S <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  151ns
                WAIT FOR 1 ns;
                CHECK_Q('0', 151);
                -- -------------------------------------
                -- -------------  Current Time:  190ns
                WAIT FOR 39 ns;
                R <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  244ns
                WAIT FOR 54 ns;
                S <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  245ns
                WAIT FOR 1 ns;
                CHECK_Q('1', 245);
                CHECK_Q_bar('0', 245);
                -- -------------------------------------
                -- -------------  Current Time:  314ns
                WAIT FOR 69 ns;
                R <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  315ns
                WAIT FOR 1 ns;
                CHECK_Q_bar('1', 315);
                WAIT FOR 685 ns;

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

