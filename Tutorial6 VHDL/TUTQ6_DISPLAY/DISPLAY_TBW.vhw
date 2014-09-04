--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : DISPLAY_TBW.vhw
-- /___/   /\     Timestamp : Fri Apr 11 00:16:08 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: DISPLAY_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY DISPLAY_TBW IS
END DISPLAY_TBW;

ARCHITECTURE testbench_arch OF DISPLAY_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT DISPLAY
        PORT (
            EN : In std_logic;
            X3 : In std_logic;
            X2 : In std_logic;
            X1 : In std_logic;
            X0 : In std_logic;
            a : Out std_logic;
            b : Out std_logic;
            c : Out std_logic;
            d : Out std_logic;
            e : Out std_logic;
            f : Out std_logic;
            g : Out std_logic
        );
    END COMPONENT;

    SIGNAL EN : std_logic := '0';
    SIGNAL X3 : std_logic := '0';
    SIGNAL X2 : std_logic := '0';
    SIGNAL X1 : std_logic := '0';
    SIGNAL X0 : std_logic := '0';
    SIGNAL a : std_logic := '1';
    SIGNAL b : std_logic := '1';
    SIGNAL c : std_logic := '1';
    SIGNAL d : std_logic := '1';
    SIGNAL e : std_logic := '1';
    SIGNAL f : std_logic := '1';
    SIGNAL g : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : DISPLAY
        PORT MAP (
            EN => EN,
            X3 => X3,
            X2 => X2,
            X1 => X1,
            X0 => X0,
            a => a,
            b => b,
            c => c,
            d => d,
            e => e,
            f => f,
            g => g
        );

        PROCESS
            PROCEDURE CHECK_a(
                next_a : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (a /= next_a) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns a="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, a);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_a);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_b(
                next_b : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (b /= next_b) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns b="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, b);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_b);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
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
            PROCEDURE CHECK_d(
                next_d : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (d /= next_d) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns d="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, d);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_d);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_e(
                next_e : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (e /= next_e) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns e="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, e);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_e);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_f(
                next_f : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (f /= next_f) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns f="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, f);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_f);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_g(
                next_g : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (g /= next_g) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns g="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, g);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_g);
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
                X0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  35ns
                WAIT FOR 5 ns;
                CHECK_a('0', 35);
                CHECK_d('0', 35);
                CHECK_e('0', 35);
                CHECK_f('0', 35);
                -- -------------------------------------
                -- -------------  Current Time:  60ns
                WAIT FOR 25 ns;
                X1 <= '1';
                X0 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  65ns
                WAIT FOR 5 ns;
                CHECK_a('1', 65);
                CHECK_c('0', 65);
                CHECK_d('1', 65);
                CHECK_e('1', 65);
                CHECK_g('1', 65);
                -- -------------------------------------
                -- -------------  Current Time:  90ns
                WAIT FOR 25 ns;
                X0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  95ns
                WAIT FOR 5 ns;
                CHECK_c('1', 95);
                CHECK_e('0', 95);
                -- -------------------------------------
                -- -------------  Current Time:  120ns
                WAIT FOR 25 ns;
                X2 <= '1';
                X1 <= '0';
                X0 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  125ns
                WAIT FOR 5 ns;
                CHECK_a('0', 125);
                CHECK_d('0', 125);
                CHECK_f('1', 125);
                -- -------------------------------------
                -- -------------  Current Time:  150ns
                WAIT FOR 25 ns;
                X0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  155ns
                WAIT FOR 5 ns;
                CHECK_a('1', 155);
                CHECK_b('0', 155);
                CHECK_d('1', 155);
                -- -------------------------------------
                -- -------------  Current Time:  180ns
                WAIT FOR 25 ns;
                X1 <= '1';
                X0 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  185ns
                WAIT FOR 5 ns;
                CHECK_e('1', 185);
                -- -------------------------------------
                -- -------------  Current Time:  210ns
                WAIT FOR 25 ns;
                X0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  215ns
                WAIT FOR 5 ns;
                CHECK_b('1', 215);
                CHECK_d('0', 215);
                CHECK_e('0', 215);
                CHECK_f('0', 215);
                CHECK_g('0', 215);
                -- -------------------------------------
                -- -------------  Current Time:  240ns
                WAIT FOR 25 ns;
                X2 <= '0';
                X1 <= '0';
                X0 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  245ns
                WAIT FOR 5 ns;
                CHECK_d('1', 245);
                CHECK_e('1', 245);
                CHECK_f('1', 245);
                -- -------------------------------------
                -- -------------  Current Time:  270ns
                WAIT FOR 25 ns;
                X0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  275ns
                WAIT FOR 5 ns;
                CHECK_a('0', 275);
                CHECK_d('0', 275);
                CHECK_e('0', 275);
                CHECK_f('0', 275);
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 25 ns;
                X3 <= '1';
                X1 <= '1';
                X0 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  305ns
                WAIT FOR 5 ns;
                CHECK_a('1', 305);
                CHECK_c('0', 305);
                CHECK_d('1', 305);
                CHECK_e('1', 305);
                CHECK_f('1', 305);
                CHECK_g('1', 305);
                -- -------------------------------------
                -- -------------  Current Time:  330ns
                WAIT FOR 25 ns;
                X0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  335ns
                WAIT FOR 5 ns;
                CHECK_c('1', 335);
                CHECK_e('0', 335);
                -- -------------------------------------
                -- -------------  Current Time:  360ns
                WAIT FOR 25 ns;
                X2 <= '1';
                X1 <= '0';
                X0 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  390ns
                WAIT FOR 30 ns;
                X0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  395ns
                WAIT FOR 5 ns;
                CHECK_b('0', 395);
                -- -------------------------------------
                -- -------------  Current Time:  420ns
                WAIT FOR 25 ns;
                X1 <= '1';
                X0 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  425ns
                WAIT FOR 5 ns;
                CHECK_e('1', 425);
                -- -------------------------------------
                -- -------------  Current Time:  450ns
                WAIT FOR 25 ns;
                X0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  455ns
                WAIT FOR 5 ns;
                CHECK_b('1', 455);
                CHECK_e('0', 455);
                CHECK_g('0', 455);
                -- -------------------------------------
                -- -------------  Current Time:  480ns
                WAIT FOR 25 ns;
                X2 <= '0';
                X1 <= '0';
                X0 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  485ns
                WAIT FOR 5 ns;
                CHECK_e('1', 485);
                CHECK_g('1', 485);
                -- -------------------------------------
                -- -------------  Current Time:  540ns
                WAIT FOR 55 ns;
                X0 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  1000ns
                WAIT FOR 460 ns;
                EN <= '0';

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

