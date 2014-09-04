--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : FULL_ADDER_TBW.vhw
-- /___/   /\     Timestamp : Sat Mar 08 02:52:27 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: FULL_ADDER_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY FULL_ADDER_TBW IS
END FULL_ADDER_TBW;

ARCHITECTURE testbench_arch OF FULL_ADDER_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT FULL_ADDER_SRC
        PORT (
            x : In std_logic;
            y : In std_logic;
            cin : In std_logic;
            s : Out std_logic;
            cout : Out std_logic
        );
    END COMPONENT;

    SIGNAL x : std_logic := '0';
    SIGNAL y : std_logic := '0';
    SIGNAL cin : std_logic := '0';
    SIGNAL s : std_logic := '0';
    SIGNAL cout : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : FULL_ADDER_SRC
        PORT MAP (
            x => x,
            y => y,
            cin => cin,
            s => s,
            cout => cout
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
            PROCEDURE CHECK_s(
                next_s : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (s /= next_s) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns s="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, s);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_s);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  30ns
                WAIT FOR 30 ns;
                x <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  31ns
                WAIT FOR 1 ns;
                CHECK_s('1', 31);
                -- -------------------------------------
                -- -------------  Current Time:  70ns
                WAIT FOR 39 ns;
                y <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  71ns
                WAIT FOR 1 ns;
                CHECK_s('0', 71);
                CHECK_cout('1', 71);
                -- -------------------------------------
                -- -------------  Current Time:  110ns
                WAIT FOR 39 ns;
                cin <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  111ns
                WAIT FOR 1 ns;
                CHECK_s('1', 111);
                -- -------------------------------------
                -- -------------  Current Time:  118ns
                WAIT FOR 7 ns;
                x <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  119ns
                WAIT FOR 1 ns;
                CHECK_s('0', 119);
                -- -------------------------------------
                -- -------------  Current Time:  148ns
                WAIT FOR 29 ns;
                y <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  149ns
                WAIT FOR 1 ns;
                CHECK_s('1', 149);
                CHECK_cout('0', 149);
                -- -------------------------------------
                -- -------------  Current Time:  176ns
                WAIT FOR 27 ns;
                x <= '1';
                cin <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  188ns
                WAIT FOR 12 ns;
                y <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  189ns
                WAIT FOR 1 ns;
                CHECK_s('0', 189);
                CHECK_cout('1', 189);
                -- -------------------------------------
                -- -------------  Current Time:  220ns
                WAIT FOR 31 ns;
                cin <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  221ns
                WAIT FOR 1 ns;
                CHECK_s('1', 221);
                WAIT FOR 779 ns;

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

