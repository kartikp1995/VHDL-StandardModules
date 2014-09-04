--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.2i
--  \   \         Application : ISE
--  /   /         Filename : TBW.vhw
-- /___/   /\     Timestamp : Sun Mar 23 00:06:20 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: TBW
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY TBW IS
END TBW;

ARCHITECTURE testbench_arch OF TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT SOURCE
        PORT (
            X : In std_logic;
            CLK : In std_logic;
            O : Out std_logic
        );
    END COMPONENT;

    SIGNAL X : std_logic := '0';
    SIGNAL CLK : std_logic := '0';
    SIGNAL O : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    constant PERIOD : time := 20 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : SOURCE
        PORT MAP (
            X => X,
            CLK => CLK,
            O => O
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
            PROCEDURE CHECK_O(
                next_O : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (O /= next_O) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns O="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, O);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_O);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  25ns
                WAIT FOR 25 ns;
                X <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  35ns
                WAIT FOR 10 ns;
                X <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  45ns
                WAIT FOR 10 ns;
                X <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  55ns
                WAIT FOR 10 ns;
                X <= '0';
                CHECK_O('1', 55);
                -- -------------------------------------
                -- -------------  Current Time:  65ns
                WAIT FOR 10 ns;
                X <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  75ns
                WAIT FOR 10 ns;
                X <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  85ns
                WAIT FOR 10 ns;
                X <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  95ns
                WAIT FOR 10 ns;
                X <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  115ns
                WAIT FOR 20 ns;
                CHECK_O('0', 115);
                -- -------------------------------------
                WAIT FOR 905 ns;

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

