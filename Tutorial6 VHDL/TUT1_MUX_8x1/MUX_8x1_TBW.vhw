library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY MUX_8x1_TBW IS
END MUX_8x1_TBW;

ARCHITECTURE testbench_arch OF MUX_8x1_TBW IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT MUX_8x1
        PORT (
            input7 : In std_logic;
            input6 : In std_logic;
            input5 : In std_logic;
            input4 : In std_logic;
            input3 : In std_logic;
            input2 : In std_logic;
            input1 : In std_logic;
            input0 : In std_logic;
            EN_L : In std_logic;
            SEL : In BIT_VECTOR (2 DownTo 0);
            output : Out std_logic
        );
    END COMPONENT;

    SIGNAL input7 : std_logic := '0';
    SIGNAL input6 : std_logic := '0';
    SIGNAL input5 : std_logic := '0';
    SIGNAL input4 : std_logic := '0';
    SIGNAL input3 : std_logic := '0';
    SIGNAL input2 : std_logic := '0';
    SIGNAL input1 : std_logic := '0';
    SIGNAL input0 : std_logic := '1';
    SIGNAL EN_L : std_logic := '0';
    SIGNAL SEL : BIT_VECTOR (2 DownTo 0) := "111";
    SIGNAL output : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : MUX_8x1
        PORT MAP (
            input7 => input7,
            input6 => input6,
            input5 => input5,
            input4 => input4,
            input3 => input3,
            input2 => input2,
            input1 => input1,
            input0 => input0,
            EN_L => EN_L,
            SEL => SEL,
            output => output
        );

        PROCESS
            PROCEDURE CHECK_output(
                next_output : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (output /= next_output) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns output="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, output);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_output);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  20ns
                WAIT FOR 20 ns;
                input0 <= '0';
                input1 <= '1';
                SEL <= "110";
                -- -------------------------------------
                -- -------------  Current Time:  40ns
                WAIT FOR 20 ns;
                input1 <= '0';
                input2 <= '1';
                SEL <= "101";
                -- -------------------------------------
                -- -------------  Current Time:  60ns
                WAIT FOR 20 ns;
                input2 <= '0';
                input4 <= '1';
                SEL <= "100";
                -- -------------------------------------
                -- -------------  Current Time:  65ns
                WAIT FOR 5 ns;
                CHECK_output('1', 65);
                -- -------------------------------------
                -- -------------  Current Time:  80ns
                WAIT FOR 15 ns;
                input3 <= '1';
                input4 <= '0';
                SEL <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  100ns
                WAIT FOR 20 ns;
                input3 <= '0';
                input5 <= '1';
                SEL <= "010";
                -- -------------------------------------
                -- -------------  Current Time:  105ns
                WAIT FOR 5 ns;
                CHECK_output('0', 105);
                -- -------------------------------------
                -- -------------  Current Time:  120ns
                WAIT FOR 15 ns;
                input5 <= '0';
                input6 <= '1';
                SEL <= "001";
                -- -------------------------------------
                -- -------------  Current Time:  140ns
                WAIT FOR 20 ns;
                input6 <= '0';
                input7 <= '1';
                SEL <= "000";
                -- -------------------------------------
                -- -------------  Current Time:  160ns
                WAIT FOR 20 ns;
                input2 <= '1';
                input3 <= '1';
                input7 <= '0';
                SEL <= "011";
                -- -------------------------------------
                -- -------------  Current Time:  165ns
                WAIT FOR 5 ns;
                CHECK_output('1', 165);
                WAIT FOR 35 ns;

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

