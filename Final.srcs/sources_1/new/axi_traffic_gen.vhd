-------------------------------------------------------------------------------
-- Title      : AXI Traffic Generator
-- Project    : ECE420 Final Project
-------------------------------------------------------------------------------
-- File       : axi_traffic_gen.vhd
-- Author     : Mario
-- Company    : CSUN
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Generates AXI4 write and read transactions for the AXI
--              Performance Monitor to observe. Performs N writes followed
--              by N reads to the same addresses.
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity axi_traffic_gen is
    generic (
        C_M_AXI_ADDR_WIDTH : integer := 32;
        C_M_AXI_DATA_WIDTH : integer := 32;
        NUM_TRANSACTIONS   : integer := 16   -- number of write+read pairs
    );
    port (
        -- Clock and Reset
        clk       : in  std_logic;
        resetn    : in  std_logic;  -- active low reset

        -- AXI4 Write Address Channel
        M_AXI_AWADDR  : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
        M_AXI_AWLEN   : out std_logic_vector(7 downto 0);
        M_AXI_AWSIZE  : out std_logic_vector(2 downto 0);
        M_AXI_AWBURST : out std_logic_vector(1 downto 0);
        M_AXI_AWVALID : out std_logic;
        M_AXI_AWREADY : in  std_logic;

        -- AXI4 Write Data Channel
        M_AXI_WDATA   : out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
        M_AXI_WSTRB   : out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
        M_AXI_WLAST   : out std_logic;
        M_AXI_WVALID  : out std_logic;
        M_AXI_WREADY  : in  std_logic;

        -- AXI4 Write Response Channel
        M_AXI_BRESP   : in  std_logic_vector(1 downto 0);
        M_AXI_BVALID  : in  std_logic;
        M_AXI_BREADY  : out std_logic;

        -- AXI4 Read Address Channel
        M_AXI_ARADDR  : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
        M_AXI_ARLEN   : out std_logic_vector(7 downto 0);
        M_AXI_ARSIZE  : out std_logic_vector(2 downto 0);
        M_AXI_ARBURST : out std_logic_vector(1 downto 0);
        M_AXI_ARVALID : out std_logic;
        M_AXI_ARREADY : in  std_logic;

        -- AXI4 Read Data Channel
        M_AXI_RDATA   : in  std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
        M_AXI_RRESP   : in  std_logic_vector(1 downto 0);
        M_AXI_RLAST   : in  std_logic;
        M_AXI_RVALID  : in  std_logic;
        M_AXI_RREADY  : out std_logic;

        -- Status
        done          : out std_logic;
        error         : out std_logic
    );
end axi_traffic_gen;

architecture Behavioral of axi_traffic_gen is

    -- FSM states
    type state_type is (
        S_IDLE,
        S_WRITE_ADDR,
        S_WRITE_DATA,
        S_WRITE_RESP,
        S_READ_ADDR,
        S_READ_DATA,
        S_DONE
    );
    signal state : state_type := S_IDLE;

    -- Transaction counter
    signal trans_count  : integer range 0 to NUM_TRANSACTIONS := 0;

    -- Current address (increments by 4 each transaction)
    signal current_addr : unsigned(C_M_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');

    -- Data to write (we write the address value so we can verify on read)
    signal write_data   : unsigned(C_M_AXI_DATA_WIDTH-1 downto 0) := (others => '0');

    -- Internal signals
    signal aw_done      : std_logic := '0';
    signal w_done       : std_logic := '0';

begin

    -- Static AXI signal assignments
    M_AXI_AWLEN   <= (others => '0');   -- 1 beat per transaction
    M_AXI_AWSIZE  <= "010";             -- 4 bytes
    M_AXI_AWBURST <= "01";             -- INCR burst
    M_AXI_WSTRB   <= (others => '1');  -- all byte lanes valid
    M_AXI_WLAST   <= '1';              -- always last (single beat)
    M_AXI_ARLEN   <= (others => '0');  -- 1 beat
    M_AXI_ARSIZE  <= "010";            -- 4 bytes
    M_AXI_ARBURST <= "01";             -- INCR

    -- FSM
    process(clk)
    begin
        if rising_edge(clk) then
            if resetn = '0' then
                state        <= S_IDLE;
                trans_count  <= 0;
                current_addr <= (others => '0');
                write_data   <= (others => '0');
                aw_done      <= '0';
                w_done       <= '0';
                done         <= '0';
                error        <= '0';

                M_AXI_AWADDR  <= (others => '0');
                M_AXI_AWVALID <= '0';
                M_AXI_WDATA   <= (others => '0');
                M_AXI_WVALID  <= '0';
                M_AXI_BREADY  <= '0';
                M_AXI_ARADDR  <= (others => '0');
                M_AXI_ARVALID <= '0';
                M_AXI_RREADY  <= '0';

            else
                case state is

                    -- Wait one cycle after reset
                    when S_IDLE =>
                        done  <= '0';
                        error <= '0';
                        if trans_count < NUM_TRANSACTIONS then
                            state <= S_WRITE_ADDR;
                        else
                            state <= S_DONE;
                        end if;

                    -- Send write address
                    when S_WRITE_ADDR =>
                        M_AXI_AWADDR  <= std_logic_vector(current_addr);
                        M_AXI_AWVALID <= '1';
                        M_AXI_WDATA   <= std_logic_vector(write_data);
                        M_AXI_WVALID  <= '1';

                        if M_AXI_AWREADY = '1' then
                            M_AXI_AWVALID <= '0';
                            aw_done <= '1';
                        end if;

                        if M_AXI_WREADY = '1' then
                            M_AXI_WVALID <= '0';
                            w_done <= '1';
                        end if;

                        if (aw_done = '1' or M_AXI_AWREADY = '1') and
                           (w_done  = '1' or M_AXI_WREADY  = '1') then
                            aw_done <= '0';
                            w_done  <= '0';
                            state   <= S_WRITE_RESP;
                        end if;

                    -- Dummy state kept for clarity (handled in WRITE_ADDR)
                    when S_WRITE_DATA =>
                        state <= S_WRITE_RESP;

                    -- Wait for write response
                    when S_WRITE_RESP =>
                        M_AXI_BREADY <= '1';
                        if M_AXI_BVALID = '1' then
                            M_AXI_BREADY <= '0';
                            if M_AXI_BRESP /= "00" then
                                error <= '1';
                            end if;
                            state <= S_READ_ADDR;
                        end if;

                    -- Send read address (same address we just wrote)
                    when S_READ_ADDR =>
                        M_AXI_ARADDR  <= std_logic_vector(current_addr);
                        M_AXI_ARVALID <= '1';
                        if M_AXI_ARREADY = '1' then
                            M_AXI_ARVALID <= '0';
                            state <= S_READ_DATA;
                        end if;

                    -- Receive read data and verify
                    when S_READ_DATA =>
                        M_AXI_RREADY <= '1';
                        if M_AXI_RVALID = '1' then
                            M_AXI_RREADY <= '0';
                            -- Verify read data matches what we wrote
                            if M_AXI_RDATA /= std_logic_vector(write_data) then
                                error <= '1';
                            end if;
                            -- Advance to next transaction
                            current_addr <= current_addr + 4;
                            write_data   <= write_data + 1;
                            trans_count  <= trans_count + 1;
                            state        <= S_IDLE;
                        end if;

                    -- All transactions complete
                    when S_DONE =>
                        done <= '1';

                    when others =>
                        state <= S_IDLE;

                end case;
            end if;
        end if;
    end process;

end Behavioral;