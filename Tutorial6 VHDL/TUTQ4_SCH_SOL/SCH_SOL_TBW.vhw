--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : SCH_SOL_TBW.vhw
-- /___/   /\     Timestamp : Fri Apr 11 00:02:11 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: SCH_SOL_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY SCH_SOL_TBW IS
END SCH_SOL_TBW;

ARCHITECTURE testbench_arch OF SCH_SOL_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT SCH_SOL
        PORT (
            A : In std_logic;
            B : In std_logic;
            C : In std_logic;
            D : In std_logic;
            E : In std_logic;
            F : In std_logic;
            O1 : Out std_logic;
            O2 : Out std_logic;
            O3 : Out std_logic;
            O4 : Out std_logic;
            O5 : Out std_logic;
            O6 : Out std_logic;
            O7 : Out std_logic;
            O8 : Out std_logic
        );
    END COMPONENT;

    SIGNAL A : std_logic := '0';
    SIGNAL B : std_logic := '0';
    SIGNAL C : std_logic := '0';
    SIGNAL D : std_logic := '0';
    SIGNAL E : std_logic := '0';
    SIGNAL F : std_logic := '0';
    SIGNAL O1 : std_logic := '0';
    SIGNAL O2 : std_logic := '1';
    SIGNAL O3 : std_logic := '1';
    SIGNAL O4 : std_logic := '1';
    SIGNAL O5 : std_logic := '1';
    SIGNAL O6 : std_logic := '0';
    SIGNAL O7 : std_logic := '0';
    SIGNAL O8 : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : SCH_SOL
        PORT MAP (
            A => A,
            B => B,
            C => C,
            D => D,
            E => E,
            F => F,
            O1 => O1,
            O2 => O2,
            O3 => O3,
            O4 => O4,
            O5 => O5,
            O6 => O6,
            O7 => O7,
            O8 => O8
        );

        PROCESS
            PROCEDURE CHECK_O1(
                next_O1 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (O1 /= next_O1) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns O1="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, O1);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_O1);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_O2(
                next_O2 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (O2 /= next_O2) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns O2="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, O2);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_O2);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_O3(
                next_O3 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (O3 /= next_O3) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns O3="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, O3);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_O3);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_O4(
                next_O4 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (O4 /= next_O4) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns O4="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, O4);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_O4);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_O5(
                next_O5 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (O5 /= next_O5) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns O5="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, O5);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_O5);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_O6(
                next_O6 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (O6 /= next_O6) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns O6="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, O6);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_O6);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_O7(
                next_O7 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (O7 /= next_O7) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns O7="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, O7);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_O7);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_O8(
                next_O8 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (O8 /= next_O8) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns O8="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, O8);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_O8);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  2ns
                WAIT FOR 2 ns;
                A <= '1';
                D <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  3ns
                WAIT FOR 1 ns;
                CHECK_O1('1', 3);
                CHECK_O5('0', 3);
                CHECK_O7('1', 3);
                -- -------------------------------------
                -- -------------  Current Time:  6ns
                WAIT FOR 3 ns;
                A <= '0';
                F <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  7ns
                WAIT FOR 1 ns;
                CHECK_O3('0', 7);
                -- -------------------------------------
                -- -------------  Current Time:  8ns
                WAIT FOR 1 ns;
                B <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  9ns
                WAIT FOR 1 ns;
                CHECK_O3('1', 9);
                -- -------------------------------------
                -- -------------  Current Time:  14ns
                WAIT FOR 5 ns;
                E <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  15ns
                WAIT FOR 1 ns;
                CHECK_O7('0', 15);
                -- -------------------------------------
                -- -------------  Current Time:  16ns
                WAIT FOR 1 ns;
                C <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  18ns
                WAIT FOR 2 ns;
                A <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  22ns
                WAIT FOR 4 ns;
                D <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  24ns
                WAIT FOR 2 ns;
                F <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  25ns
                WAIT FOR 1 ns;
                CHECK_O6('1', 25);
                -- -------------------------------------
                -- -------------  Current Time:  26ns
                WAIT FOR 1 ns;
                C <= '0';
                E <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  27ns
                WAIT FOR 1 ns;
                CHECK_O5('1', 27);
                CHECK_O6('0', 27);
                -- -------------------------------------
                -- -------------  Current Time:  32ns
                WAIT FOR 5 ns;
                F <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  34ns
                WAIT FOR 2 ns;
                A <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  35ns
                WAIT FOR 1 ns;
                CHECK_O1('0', 35);
                -- -------------------------------------
                -- -------------  Current Time:  38ns
                WAIT FOR 3 ns;
                C <= '1';
                D <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  39ns
                WAIT FOR 1 ns;
                CHECK_O1('1', 39);
                CHECK_O4('0', 39);
                CHECK_O5('0', 39);
                CHECK_O8('1', 39);
                WAIT FOR 61 ns;

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

