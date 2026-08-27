-------------------------------------------------------------------------------
-- Title      : Testbench for AXI Performance Monitor Project
-- Project    : ECE420 Final Project
-------------------------------------------------------------------------------
-- File       : testbench.vhd
-- Author     : Mario
-- Company    : CSUN
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Self-checking testbench for the top_level design.
--              Drives clock and reset, then waits for the traffic generator
--              to complete all 16 write+read transactions.
--              Includes a timeout process that flags FAILURE if the test
--              does not complete in time.
--              Displays "TEST PASSED" only if done=1 and error=0.
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench is
-- Testbench has no ports
end testbench;

architecture Behavioral of testbench is

    ----------------------------------------------------------------------------
    -- Component Declaration
    ----------------------------------------------------------------------------
    component top_level is
        port (
            clk_125mhz  : in  std_logic;
            reset_btn   : in  std_logic;
            led_locked  : out std_logic;
            led_done    : out std_logic;
            led_error   : out std_logic
        );
    end component;

    ----------------------------------------------------------------------------
    -- Testbench Constants
    ----------------------------------------------------------------------------
    constant CLK_PERIOD  : time    := 8 ns;   -- 125 MHz
    constant TIMEOUT_VAL : integer := 100000; -- clock cycles before timeout

    ----------------------------------------------------------------------------
    -- Testbench Signals
    ----------------------------------------------------------------------------
    signal clk_125mhz : std_logic := '0';
    signal reset_btn  : std_logic := '1';  -- start in reset
    signal led_locked : std_logic;
    signal led_done   : std_logic;
    signal led_error  : std_logic;

    -- Timeout flag
    signal timeout_flag : std_logic := '0';

begin

    ----------------------------------------------------------------------------
    -- Clock Generation: 125 MHz
    ----------------------------------------------------------------------------
    clk_gen : process
    begin
        clk_125mhz <= '0';
        wait for CLK_PERIOD / 2;
        clk_125mhz <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    ----------------------------------------------------------------------------
    -- Device Under Test
    ----------------------------------------------------------------------------
    u_dut : top_level
        port map (
            clk_125mhz => clk_125mhz,
            reset_btn  => reset_btn,
            led_locked => led_locked,
            led_done   => led_done,
            led_error  => led_error
        );

    ----------------------------------------------------------------------------
    -- Reset Stimulus
    -- Hold reset for 20 clock cycles then release
    ----------------------------------------------------------------------------
    reset_proc : process
    begin
        reset_btn <= '1';
        wait for CLK_PERIOD * 20;
        reset_btn <= '0';
        wait;
    end process;

    ----------------------------------------------------------------------------
    -- Timeout Process
    -- If test doesn't complete within TIMEOUT_VAL cycles, flag failure
    ----------------------------------------------------------------------------
    timeout_proc : process
        variable cycle_count : integer := 0;
    begin
        wait for CLK_PERIOD * 20;  -- wait past reset
        while led_done = '0' loop
            wait for CLK_PERIOD;
            cycle_count := cycle_count + 1;
            if cycle_count >= TIMEOUT_VAL then
                timeout_flag <= '1';
                report "TIMEOUT: Test did not complete in time! FAILURE."
                    severity failure;
            end if;
        end loop;
        wait;
    end process;

    ----------------------------------------------------------------------------
    -- Result Checker
    -- Waits for done signal then checks for errors
    ----------------------------------------------------------------------------
    check_proc : process
    begin
        -- Wait until reset is released
        wait until reset_btn = '0';

        -- Wait for test to complete or timeout
        wait until led_done = '1' or timeout_flag = '1';

        -- Give one more clock for signals to settle
        wait for CLK_PERIOD * 2;

        if timeout_flag = '1' then
            report "TEST FAILED: Timeout occurred." severity failure;

        elsif led_error = '1' then
            report "TEST FAILED: AXI read data did not match written data!"
                severity failure;

        else
            report "TEST PASSED: All 16 AXI write/read transactions completed successfully."
                severity note;
        end if;

        -- Stop simulation
        wait for CLK_PERIOD * 10;
        std.env.stop;

    end process;

end Behavioral;