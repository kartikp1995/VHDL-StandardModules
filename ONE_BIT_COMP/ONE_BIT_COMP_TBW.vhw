--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : ONE_BIT_COMP_TBW.vhw
-- /___/   /\     Timestamp : Sun Mar 16 17:40:48 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: ONE_BIT_COMP_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY ONE_BIT_COMP_TBW IS
END ONE_BIT_COMP_TBW;

ARCHITECTURE testbench_arch OF ONE_BIT_COMP_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT ONE_BIT_COMP
        PORT (
            x : In std_logic;
            y : In std_logic;
            G : Out std_logic;
            S : Out std_logic;
            E : Out std_logic
        );
    END COMPONENT;

    SIGNAL x : std_logic := '0';
    SIGNAL y : std_logic := '0';
    SIGNAL G : std_logic := '0';
    SIGNAL S : std_logic := '0';
    SIGNAL E : std_logic := '1';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : ONE_BIT_COMP
        PORT MAP (
            x => x,
            y => y,
            G => G,
            S => S,
            E => E
        );

        PROCESS
            PROCEDURE CHECK_E(
                next_E : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (E /= next_E) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns E="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, E);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_E);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_G(
                next_G : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (G /= next_G) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns G="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, G);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_G);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_S(
                next_S : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (S /= next_S) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns S="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, S);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_S);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  24ns
                WAIT FOR 24 ns;
                x <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  26ns
                WAIT FOR 2 ns;
                CHECK_G('1', 26);
                CHECK_E('0', 26);
                -- -------------------------------------
                -- -------------  Current Time:  92ns
                WAIT FOR 66 ns;
                y <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  94ns
                WAIT FOR 2 ns;
                CHECK_G('0', 94);
                CHECK_E('1', 94);
                -- -------------------------------------
                -- -------------  Current Time:  112ns
                WAIT FOR 18 ns;
                x <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  114ns
                WAIT FOR 2 ns;
                CHECK_S('1', 114);
                CHECK_E('0', 114);
                -- -------------------------------------
                -- -------------  Current Time:  148ns
                WAIT FOR 34 ns;
                y <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  150ns
                WAIT FOR 2 ns;
                CHECK_S('0', 150);
                CHECK_E('1', 150);
                -- -------------------------------------
                -- -------------  Current Time:  204ns
                WAIT FOR 54 ns;
                y <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  206ns
                WAIT FOR 2 ns;
                CHECK_S('1', 206);
                CHECK_E('0', 206);
                -- -------------------------------------
                -- -------------  Current Time:  236ns
                WAIT FOR 30 ns;
                x <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  238ns
                WAIT FOR 2 ns;
                CHECK_S('0', 238);
                CHECK_E('1', 238);
                -- -------------------------------------
                -- -------------  Current Time:  308ns
                WAIT FOR 70 ns;
                y <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  310ns
                WAIT FOR 2 ns;
                CHECK_G('1', 310);
                CHECK_E('0', 310);
                WAIT FOR 690 ns;

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

