--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : ALU_TBW.vhw
-- /___/   /\     Timestamp : Fri Apr 11 10:11:49 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: ALU_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY ALU_TBW IS
END ALU_TBW;

ARCHITECTURE testbench_arch OF ALU_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT ALU
        PORT (
            SEL : In std_logic_vector (2 DownTo 0);
            Cin : In std_logic;
            M : In std_logic;
            A0 : In std_logic;
            A1 : In std_logic;
            A2 : In std_logic;
            A3 : In std_logic;
            B0 : In std_logic;
            B1 : In std_logic;
            B2 : In std_logic;
            B3 : In std_logic;
            OVR : Out std_logic;
            COUT : Out std_logic;
            F0 : Out std_logic;
            F1 : Out std_logic;
            F2 : Out std_logic;
            F3 : Out std_logic
        );
    END COMPONENT;

    SIGNAL SEL : std_logic_vector (2 DownTo 0) := "000";
    SIGNAL Cin : std_logic := '1';
    SIGNAL M : std_logic := '0';
    SIGNAL A0 : std_logic := '0';
    SIGNAL A1 : std_logic := '0';
    SIGNAL A2 : std_logic := '0';
    SIGNAL A3 : std_logic := '0';
    SIGNAL B0 : std_logic := '0';
    SIGNAL B1 : std_logic := '0';
    SIGNAL B2 : std_logic := '0';
    SIGNAL B3 : std_logic := '0';
    SIGNAL OVR : std_logic := '0';
    SIGNAL COUT : std_logic := '0';
    SIGNAL F0 : std_logic := '0';
    SIGNAL F1 : std_logic := '0';
    SIGNAL F2 : std_logic := '0';
    SIGNAL F3 : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : ALU
        PORT MAP (
            SEL => SEL,
            Cin => Cin,
            M => M,
            A0 => A0,
            A1 => A1,
            A2 => A2,
            A3 => A3,
            B0 => B0,
            B1 => B1,
            B2 => B2,
            B3 => B3,
            OVR => OVR,
            COUT => COUT,
            F0 => F0,
            F1 => F1,
            F2 => F2,
            F3 => F3
        );

        PROCESS
            PROCEDURE CHECK_COUT(
                next_COUT : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (COUT /= next_COUT) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns COUT="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, COUT);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_COUT);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_F0(
                next_F0 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (F0 /= next_F0) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns F0="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, F0);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_F0);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_F1(
                next_F1 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (F1 /= next_F1) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns F1="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, F1);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_F1);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_F2(
                next_F2 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (F2 /= next_F2) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns F2="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, F2);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_F2);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_F3(
                next_F3 : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (F3 /= next_F3) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns F3="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, F3);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_F3);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_OVR(
                next_OVR : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (OVR /= next_OVR) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns OVR="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, OVR);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_OVR);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  50ns
                WAIT FOR 50 ns;
                Cin <= '0';
                A1 <= '1';
                A2 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  55ns
                WAIT FOR 5 ns;
                CHECK_COUT('1', 55);
                CHECK_F0('1', 55);
                CHECK_F2('1', 55);
                -- -------------------------------------
                -- -------------  Current Time:  80ns
                WAIT FOR 25 ns;
                SEL <= "100";
                -- -------------------------------------
                -- -------------  Current Time:  90ns
                WAIT FOR 10 ns;
                A0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  95ns
                WAIT FOR 5 ns;
                CHECK_F0('0', 95);
                -- -------------------------------------
                -- -------------  Current Time:  120ns
                WAIT FOR 25 ns;
                SEL <= "101";
                -- -------------------------------------
                -- -------------  Current Time:  125ns
                WAIT FOR 5 ns;
                CHECK_F0('1', 125);
                CHECK_F2('0', 125);
                -- -------------------------------------
                -- -------------  Current Time:  130ns
                WAIT FOR 5 ns;
                Cin <= '1';
                M <= '1';
                A0 <= '0';
                A3 <= '1';
                B0 <= '1';
                B1 <= '1';
                B2 <= '1';
                B3 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  135ns
                WAIT FOR 5 ns;
                CHECK_COUT('0', 135);
                CHECK_F0('0', 135);
                -- -------------------------------------
                -- -------------  Current Time:  150ns
                WAIT FOR 15 ns;
                SEL <= "111";
                -- -------------------------------------
                -- -------------  Current Time:  155ns
                WAIT FOR 5 ns;
                CHECK_F1('1', 155);
                CHECK_F2('1', 155);
                CHECK_F3('1', 155);
                -- -------------------------------------
                -- -------------  Current Time:  160ns
                WAIT FOR 5 ns;
                A2 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  170ns
                WAIT FOR 10 ns;
                SEL <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  175ns
                WAIT FOR 5 ns;
                CHECK_F0('1', 175);
                -- -------------------------------------
                -- -------------  Current Time:  180ns
                WAIT FOR 5 ns;
                M <= '0';
                B1 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  185ns
                WAIT FOR 5 ns;
                CHECK_OVR('1', 185);
                CHECK_COUT('1', 185);
                CHECK_F0('0', 185);
                CHECK_F1('0', 185);
                CHECK_F2('0', 185);
                CHECK_F3('0', 185);
                -- -------------------------------------
                -- -------------  Current Time:  240ns
                WAIT FOR 55 ns;
                M <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  245ns
                WAIT FOR 5 ns;
                CHECK_OVR('0', 245);
                CHECK_COUT('0', 245);
                CHECK_F0('1', 245);
                CHECK_F1('1', 245);
                CHECK_F2('1', 245);
                CHECK_F3('1', 245);
                -- -------------------------------------
                -- -------------  Current Time:  270ns
                WAIT FOR 25 ns;
                A2 <= '0';
                SEL <= "010";
                -- -------------------------------------
                -- -------------  Current Time:  275ns
                WAIT FOR 5 ns;
                CHECK_F1('0', 275);
                -- -------------------------------------
                -- -------------  Current Time:  290ns
                WAIT FOR 15 ns;
                M <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  295ns
                WAIT FOR 5 ns;
                CHECK_COUT('1', 295);
                CHECK_F0('0', 295);
                CHECK_F2('0', 295);
                CHECK_F3('0', 295);
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 5 ns;
                Cin <= '0';
                SEL <= "111";
                -- -------------------------------------
                -- -------------  Current Time:  305ns
                WAIT FOR 5 ns;
                CHECK_F2('1', 305);
                -- -------------------------------------
                -- -------------  Current Time:  320ns
                WAIT FOR 15 ns;
                B0 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  325ns
                WAIT FOR 5 ns;
                CHECK_OVR('1', 325);
                CHECK_F0('1', 325);
                CHECK_F1('1', 325);
                CHECK_F3('1', 325);
                -- -------------------------------------
                -- -------------  Current Time:  330ns
                WAIT FOR 5 ns;
                SEL <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  335ns
                WAIT FOR 5 ns;
                CHECK_F2('0', 335);
                -- -------------------------------------
                -- -------------  Current Time:  350ns
                WAIT FOR 15 ns;
                A0 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  355ns
                WAIT FOR 5 ns;
                CHECK_F0('0', 355);
                -- -------------------------------------
                -- -------------  Current Time:  360ns
                WAIT FOR 5 ns;
                SEL <= "111";
                -- -------------------------------------
                -- -------------  Current Time:  370ns
                WAIT FOR 10 ns;
                B1 <= '1';
                B3 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  380ns
                WAIT FOR 10 ns;
                M <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 5 ns;
                CHECK_F0('1', 385);
                -- -------------------------------------
                -- -------------  Current Time:  390ns
                WAIT FOR 5 ns;
                SEL <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  395ns
                WAIT FOR 5 ns;
                CHECK_F0('0', 395);
                CHECK_F3('0', 395);
                -- -------------------------------------
                -- -------------  Current Time:  410ns
                WAIT FOR 15 ns;
                SEL <= "100";
                -- -------------------------------------
                -- -------------  Current Time:  415ns
                WAIT FOR 5 ns;
                CHECK_OVR('0', 415);
                CHECK_COUT('0', 415);
                CHECK_F1('0', 415);
                -- -------------------------------------
                -- -------------  Current Time:  420ns
                WAIT FOR 5 ns;
                M <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  425ns
                WAIT FOR 5 ns;
                CHECK_F1('1', 425);
                CHECK_F2('1', 425);
                -- -------------------------------------
                -- -------------  Current Time:  430ns
                WAIT FOR 5 ns;
                A0 <= '0';
                SEL <= "101";
                -- -------------------------------------
                -- -------------  Current Time:  435ns
                WAIT FOR 5 ns;
                CHECK_COUT('1', 435);
                CHECK_F0('1', 435);
                CHECK_F1('0', 435);
                -- -------------------------------------
                -- -------------  Current Time:  440ns
                WAIT FOR 5 ns;
                A2 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  445ns
                WAIT FOR 5 ns;
                CHECK_OVR('1', 445);
                CHECK_F1('1', 445);
                CHECK_F2('0', 445);
                CHECK_F3('1', 445);
                -- -------------------------------------
                -- -------------  Current Time:  450ns
                WAIT FOR 5 ns;
                SEL <= "100";
                -- -------------------------------------
                -- -------------  Current Time:  455ns
                WAIT FOR 5 ns;
                CHECK_COUT('0', 455);
                -- -------------------------------------
                -- -------------  Current Time:  480ns
                WAIT FOR 25 ns;
                SEL <= "101";
                -- -------------------------------------
                -- -------------  Current Time:  485ns
                WAIT FOR 5 ns;
                CHECK_OVR('0', 485);
                CHECK_COUT('1', 485);
                CHECK_F2('1', 485);
                CHECK_F3('0', 485);
                -- -------------------------------------
                -- -------------  Current Time:  510ns
                WAIT FOR 25 ns;
                A1 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  515ns
                WAIT FOR 5 ns;
                CHECK_F1('0', 515);
                CHECK_F2('0', 515);
                -- -------------------------------------
                -- -------------  Current Time:  530ns
                WAIT FOR 15 ns;
                A1 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  535ns
                WAIT FOR 5 ns;
                CHECK_F1('1', 535);
                CHECK_F2('1', 535);
                WAIT FOR 465 ns;

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

