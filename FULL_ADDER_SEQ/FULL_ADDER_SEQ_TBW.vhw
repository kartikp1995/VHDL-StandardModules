--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : FULL_ADDER_SEQ_TBW.vhw
-- /___/   /\     Timestamp : Sun Mar 23 01:27:21 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: FULL_ADDER_SEQ_TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY FULL_ADDER_SEQ_TBW IS
END FULL_ADDER_SEQ_TBW;

ARCHITECTURE testbench_arch OF FULL_ADDER_SEQ_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT FULL_ADDER_SEQ
        PORT (
            X : In std_logic;
            Y : In std_logic;
            S : Out std_logic_vector (4 DownTo 0);
            CLK : In std_logic
        );
    END COMPONENT;

    SIGNAL X : std_logic := '1';
    SIGNAL Y : std_logic := '1';
    SIGNAL S : std_logic_vector (4 DownTo 0) := "00000";
    SIGNAL CLK : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : FULL_ADDER_SEQ
        PORT MAP (
            X => X,
            Y => Y,
            S => S,
            CLK => CLK
        );

        PROCESS    -- clock process for CLK
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CLK <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CLK <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            PROCEDURE CHECK_S(
                next_S : std_logic_vector (4 DownTo 0);
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
                -- -------------  Current Time:  85ns
                WAIT FOR 85 ns;
                X <= '0';
                Y <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  185ns
                WAIT FOR 100 ns;
                X <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  215ns
                WAIT FOR 30 ns;
                CHECK_S("00010", 215);
                -- -------------------------------------
                -- -------------  Current Time:  285ns
                WAIT FOR 70 ns;
                X <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 100 ns;
                X <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  415ns
                WAIT FOR 30 ns;
                CHECK_S("01010", 415);
                -- -------------------------------------
                WAIT FOR 785 ns;

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

