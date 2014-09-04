--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : Half_Adder_tbw.vhw
-- /___/   /\     Timestamp : Sat Mar 08 02:42:05 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: Half_Adder_tbw
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY Half_Adder_tbw IS
END Half_Adder_tbw;

ARCHITECTURE testbench_arch OF Half_Adder_tbw IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT Half_Adder_Src
        PORT (
            x : In std_logic;
            y : In std_logic;
            c : Out std_logic;
            s : Out std_logic
        );
    END COMPONENT;

    SIGNAL x : std_logic := '0';
    SIGNAL y : std_logic := '0';
    SIGNAL c : std_logic := '0';
    SIGNAL s : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : Half_Adder_Src
        PORT MAP (
            x => x,
            y => y,
            c => c,
            s => s
        );

        PROCESS
            PROCEDURE CHECK_c(
                next_c : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (c /= next_c) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns c="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, c);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_c);
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
                -- -------------  Current Time:  2ns
                WAIT FOR 2 ns;
                x <= '1';
                y <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  3ns
                WAIT FOR 1 ns;
                CHECK_c('1', 3);
                -- -------------------------------------
                -- -------------  Current Time:  62ns
                WAIT FOR 59 ns;
                x <= '0';
                y <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  63ns
                WAIT FOR 1 ns;
                CHECK_c('0', 63);
                -- -------------------------------------
                -- -------------  Current Time:  216ns
                WAIT FOR 153 ns;
                x <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  217ns
                WAIT FOR 1 ns;
                CHECK_s('1', 217);
                WAIT FOR 783 ns;

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

