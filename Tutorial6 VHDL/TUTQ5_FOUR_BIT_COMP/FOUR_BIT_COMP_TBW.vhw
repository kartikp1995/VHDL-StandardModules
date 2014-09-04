--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : FOUR_BIT_COMP_TBW.vhw
-- /___/   /\     Timestamp : Fri Apr 11 00:10:09 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: FOUR_BIT_COMP_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY FOUR_BIT_COMP_TBW IS
END FOUR_BIT_COMP_TBW;

ARCHITECTURE testbench_arch OF FOUR_BIT_COMP_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT FOUR_BIT_COMP
        PORT (
            X3 : In std_logic;
            X2 : In std_logic;
            X1 : In std_logic;
            X0 : In std_logic;
            Y3 : In std_logic;
            Y2 : In std_logic;
            Y1 : In std_logic;
            Y0 : In std_logic;
            G : Out std_logic;
            L : Out std_logic;
            E : Out std_logic
        );
    END COMPONENT;

    SIGNAL X3 : std_logic := '1';
    SIGNAL X2 : std_logic := '1';
    SIGNAL X1 : std_logic := '1';
    SIGNAL X0 : std_logic := '0';
    SIGNAL Y3 : std_logic := '1';
    SIGNAL Y2 : std_logic := '1';
    SIGNAL Y1 : std_logic := '0';
    SIGNAL Y0 : std_logic := '1';
    SIGNAL G : std_logic := '1';
    SIGNAL L : std_logic := '0';
    SIGNAL E : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : FOUR_BIT_COMP
        PORT MAP (
            X3 => X3,
            X2 => X2,
            X1 => X1,
            X0 => X0,
            Y3 => Y3,
            Y2 => Y2,
            Y1 => Y1,
            Y0 => Y0,
            G => G,
            L => L,
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
            PROCEDURE CHECK_L(
                next_L : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (L /= next_L) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns L="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, L);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_L);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  90ns
                WAIT FOR 90 ns;
                X3 <= '0';
                X2 <= '0';
                X1 <= '0';
                X0 <= '1';
                Y3 <= '0';
                Y2 <= '0';
                Y1 <= '1';
                Y0 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  95ns
                WAIT FOR 5 ns;
                CHECK_G('0', 95);
                CHECK_L('1', 95);
                WAIT FOR 405 ns;

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

