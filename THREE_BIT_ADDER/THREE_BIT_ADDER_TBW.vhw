--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : THREE_BIT_ADDER_TBW.vhw
-- /___/   /\     Timestamp : Sat Mar 08 03:11:36 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: THREE_BIT_ADDER_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY THREE_BIT_ADDER_TBW IS
END THREE_BIT_ADDER_TBW;

ARCHITECTURE testbench_arch OF THREE_BIT_ADDER_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT THREE_BIT_ADDER
        PORT (
            a : In std_logic_vector (2 DownTo 0);
            b : In std_logic_vector (2 DownTo 0);
            cin : In std_logic;
            sum : Out std_logic_vector (2 DownTo 0);
            cout : Out std_logic;
            v : Out std_logic
        );
    END COMPONENT;

    SIGNAL a : std_logic_vector (2 DownTo 0) := "000";
    SIGNAL b : std_logic_vector (2 DownTo 0) := "000";
    SIGNAL cin : std_logic := '0';
    SIGNAL sum : std_logic_vector (2 DownTo 0) := "000";
    SIGNAL cout : std_logic := '0';
    SIGNAL v : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : THREE_BIT_ADDER
        PORT MAP (
            a => a,
            b => b,
            cin => cin,
            sum => sum,
            cout => cout,
            v => v
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
            PROCEDURE CHECK_sum(
                next_sum : std_logic_vector (2 DownTo 0);
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (sum /= next_sum) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns sum="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, sum);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_sum);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_v(
                next_v : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (v /= next_v) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns v="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, v);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_v);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  226ns
                WAIT FOR 226 ns;
                b <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  227ns
                WAIT FOR 1 ns;
                CHECK_sum("110", 227);
                -- -------------------------------------
                -- -------------  Current Time:  228ns
                WAIT FOR 1 ns;
                a <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  229ns
                WAIT FOR 1 ns;
                CHECK_cout('1', 229);
                CHECK_sum("100", 229);
                -- -------------------------------------
                -- -------------  Current Time:  326ns
                WAIT FOR 97 ns;
                b <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  327ns
                WAIT FOR 1 ns;
                CHECK_sum("001", 327);
                -- -------------------------------------
                -- -------------  Current Time:  328ns
                WAIT FOR 1 ns;
                a <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  329ns
                WAIT FOR 1 ns;
                CHECK_cout('0', 329);
                CHECK_v('1', 329);
                CHECK_sum("110", 329);
                -- -------------------------------------
                -- -------------  Current Time:  426ns
                WAIT FOR 97 ns;
                b <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  427ns
                WAIT FOR 1 ns;
                CHECK_cout('1', 427);
                CHECK_v('0', 427);
                CHECK_sum("001", 427);
                -- -------------------------------------
                -- -------------  Current Time:  428ns
                WAIT FOR 1 ns;
                a <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  429ns
                WAIT FOR 1 ns;
                CHECK_sum("100", 429);
                -- -------------------------------------
                -- -------------  Current Time:  526ns
                WAIT FOR 97 ns;
                b <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  527ns
                WAIT FOR 1 ns;
                CHECK_sum("001", 527);
                -- -------------------------------------
                -- -------------  Current Time:  528ns
                WAIT FOR 1 ns;
                a <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  529ns
                WAIT FOR 1 ns;
                CHECK_cout('0', 529);
                CHECK_v('1', 529);
                CHECK_sum("110", 529);
                -- -------------------------------------
                -- -------------  Current Time:  626ns
                WAIT FOR 97 ns;
                b <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  627ns
                WAIT FOR 1 ns;
                CHECK_cout('1', 627);
                CHECK_v('0', 627);
                CHECK_sum("001", 627);
                -- -------------------------------------
                -- -------------  Current Time:  628ns
                WAIT FOR 1 ns;
                a <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  629ns
                WAIT FOR 1 ns;
                CHECK_sum("100", 629);
                -- -------------------------------------
                -- -------------  Current Time:  726ns
                WAIT FOR 97 ns;
                b <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  727ns
                WAIT FOR 1 ns;
                CHECK_sum("001", 727);
                -- -------------------------------------
                -- -------------  Current Time:  728ns
                WAIT FOR 1 ns;
                a <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  729ns
                WAIT FOR 1 ns;
                CHECK_cout('0', 729);
                CHECK_v('1', 729);
                CHECK_sum("110", 729);
                -- -------------------------------------
                -- -------------  Current Time:  826ns
                WAIT FOR 97 ns;
                b <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  827ns
                WAIT FOR 1 ns;
                CHECK_cout('1', 827);
                CHECK_v('0', 827);
                CHECK_sum("001", 827);
                -- -------------------------------------
                -- -------------  Current Time:  828ns
                WAIT FOR 1 ns;
                a <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  829ns
                WAIT FOR 1 ns;
                CHECK_sum("100", 829);
                -- -------------------------------------
                -- -------------  Current Time:  926ns
                WAIT FOR 97 ns;
                b <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  927ns
                WAIT FOR 1 ns;
                CHECK_sum("001", 927);
                -- -------------------------------------
                -- -------------  Current Time:  928ns
                WAIT FOR 1 ns;
                a <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  929ns
                WAIT FOR 1 ns;
                CHECK_cout('0', 929);
                CHECK_v('1', 929);
                CHECK_sum("110", 929);
                -- -------------------------------------
                -- -------------  Current Time:  1000ns
                WAIT FOR 71 ns;
                cin <= '0';

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

