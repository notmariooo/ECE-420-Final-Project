
-------------------------------------------------------------------------------
-- Title      : Top Level
-- Project    : ECE420 Final Project - AXI Performance Monitor
-------------------------------------------------------------------------------
-- File       : top_level.vhd
-- Author     : Mario
-- Company    : CSUN
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity top_level is
    port (
        clk_125mhz  : in  std_logic;
        reset_btn   : in  std_logic;
        led_locked  : out std_logic;
        led_done    : out std_logic;
        led_error   : out std_logic
    );
end top_level;

architecture Behavioral of top_level is

    component system_controller is
        generic (RESET_COUNT : integer := 32);
        port (
            clk_in    : in  std_logic;
            reset_in  : in  std_logic;
            clk_out1  : out std_logic;
            clk_out2  : out std_logic;
            locked    : out std_logic;
            reset_out : out std_logic
        );
    end component;

    component axi_traffic_gen is
        generic (
            C_M_AXI_ADDR_WIDTH : integer := 32;
            C_M_AXI_DATA_WIDTH : integer := 32;
            NUM_TRANSACTIONS   : integer := 16
        );
        port (
            clk           : in  std_logic;
            resetn        : in  std_logic;
            M_AXI_AWADDR  : out std_logic_vector(31 downto 0);
            M_AXI_AWLEN   : out std_logic_vector(7 downto 0);
            M_AXI_AWSIZE  : out std_logic_vector(2 downto 0);
            M_AXI_AWBURST : out std_logic_vector(1 downto 0);
            M_AXI_AWVALID : out std_logic;
            M_AXI_AWREADY : in  std_logic;
            M_AXI_WDATA   : out std_logic_vector(31 downto 0);
            M_AXI_WSTRB   : out std_logic_vector(3 downto 0);
            M_AXI_WLAST   : out std_logic;
            M_AXI_WVALID  : out std_logic;
            M_AXI_WREADY  : in  std_logic;
            M_AXI_BRESP   : in  std_logic_vector(1 downto 0);
            M_AXI_BVALID  : in  std_logic;
            M_AXI_BREADY  : out std_logic;
            M_AXI_ARADDR  : out std_logic_vector(31 downto 0);
            M_AXI_ARLEN   : out std_logic_vector(7 downto 0);
            M_AXI_ARSIZE  : out std_logic_vector(2 downto 0);
            M_AXI_ARBURST : out std_logic_vector(1 downto 0);
            M_AXI_ARVALID : out std_logic;
            M_AXI_ARREADY : in  std_logic;
            M_AXI_RDATA   : in  std_logic_vector(31 downto 0);
            M_AXI_RRESP   : in  std_logic_vector(1 downto 0);
            M_AXI_RLAST   : in  std_logic;
            M_AXI_RVALID  : in  std_logic;
            M_AXI_RREADY  : out std_logic;
            done          : out std_logic;
            error         : out std_logic
        );
    end component;

    -- Exact port list from axi_perf_mon_0_stub.vhdl
    component axi_perf_mon_0 is
        port (
            s_axi_aclk         : in  std_logic;
            s_axi_aresetn      : in  std_logic;
            s_axi_awaddr       : in  std_logic_vector(15 downto 0);
            s_axi_awvalid      : in  std_logic;
            s_axi_awready      : out std_logic;
            s_axi_wdata        : in  std_logic_vector(31 downto 0);
            s_axi_wstrb        : in  std_logic_vector(3 downto 0);
            s_axi_wvalid       : in  std_logic;
            s_axi_wready       : out std_logic;
            s_axi_bresp        : out std_logic_vector(1 downto 0);
            s_axi_bvalid       : out std_logic;
            s_axi_bready       : in  std_logic;
            s_axi_araddr       : in  std_logic_vector(15 downto 0);
            s_axi_arvalid      : in  std_logic;
            s_axi_arready      : out std_logic;
            s_axi_rdata        : out std_logic_vector(31 downto 0);
            s_axi_rresp        : out std_logic_vector(1 downto 0);
            s_axi_rvalid       : out std_logic;
            s_axi_rready       : in  std_logic;
            slot_0_axi_aclk    : in  std_logic;
            slot_0_axi_aresetn : in  std_logic;
            slot_0_axi_awid    : in  std_logic_vector(0 to 0);
            slot_0_axi_awaddr  : in  std_logic_vector(31 downto 0);
            slot_0_axi_awprot  : in  std_logic_vector(2 downto 0);
            slot_0_axi_awlen   : in  std_logic_vector(7 downto 0);
            slot_0_axi_awsize  : in  std_logic_vector(2 downto 0);
            slot_0_axi_awburst : in  std_logic_vector(1 downto 0);
            slot_0_axi_awcache : in  std_logic_vector(3 downto 0);
            slot_0_axi_awlock  : in  std_logic_vector(0 to 0);
            slot_0_axi_awvalid : in  std_logic;
            slot_0_axi_awready : in  std_logic;
            slot_0_axi_wdata   : in  std_logic_vector(31 downto 0);
            slot_0_axi_wstrb   : in  std_logic_vector(3 downto 0);
            slot_0_axi_wlast   : in  std_logic;
            slot_0_axi_wvalid  : in  std_logic;
            slot_0_axi_wready  : in  std_logic;
            slot_0_axi_bid     : in  std_logic_vector(0 to 0);
            slot_0_axi_bresp   : in  std_logic_vector(1 downto 0);
            slot_0_axi_bvalid  : in  std_logic;
            slot_0_axi_bready  : in  std_logic;
            slot_0_axi_arid    : in  std_logic_vector(0 to 0);
            slot_0_axi_araddr  : in  std_logic_vector(31 downto 0);
            slot_0_axi_arlen   : in  std_logic_vector(7 downto 0);
            slot_0_axi_arsize  : in  std_logic_vector(2 downto 0);
            slot_0_axi_arburst : in  std_logic_vector(1 downto 0);
            slot_0_axi_arcache : in  std_logic_vector(3 downto 0);
            slot_0_axi_arprot  : in  std_logic_vector(2 downto 0);
            slot_0_axi_arlock  : in  std_logic_vector(0 to 0);
            slot_0_axi_arvalid : in  std_logic;
            slot_0_axi_arready : in  std_logic;
            slot_0_axi_rid     : in  std_logic_vector(0 to 0);
            slot_0_axi_rdata   : in  std_logic_vector(31 downto 0);
            slot_0_axi_rresp   : in  std_logic_vector(1 downto 0);
            slot_0_axi_rlast   : in  std_logic;
            slot_0_axi_rvalid  : in  std_logic;
            slot_0_axi_rready  : in  std_logic;
            capture_event      : in  std_logic;
            reset_event        : in  std_logic;
            core_aclk          : in  std_logic;
            core_aresetn       : in  std_logic;
            interrupt          : out std_logic
        );
    end component;

    signal clk_125     : std_logic;
    signal clk_50      : std_logic;
    signal locked      : std_logic;
    signal sys_reset_n : std_logic;
    signal sys_reset   : std_logic;

    signal axi_awaddr  : std_logic_vector(31 downto 0);
    signal axi_awlen   : std_logic_vector(7 downto 0);
    signal axi_awsize  : std_logic_vector(2 downto 0);
    signal axi_awburst : std_logic_vector(1 downto 0);
    signal axi_awvalid : std_logic;
    signal axi_awready : std_logic;
    signal axi_wdata   : std_logic_vector(31 downto 0);
    signal axi_wstrb   : std_logic_vector(3 downto 0);
    signal axi_wlast   : std_logic;
    signal axi_wvalid  : std_logic;
    signal axi_wready  : std_logic;
    signal axi_bresp   : std_logic_vector(1 downto 0);
    signal axi_bvalid  : std_logic;
    signal axi_bready  : std_logic;
    signal axi_araddr  : std_logic_vector(31 downto 0);
    signal axi_arlen   : std_logic_vector(7 downto 0);
    signal axi_arsize  : std_logic_vector(2 downto 0);
    signal axi_arburst : std_logic_vector(1 downto 0);
    signal axi_arvalid : std_logic;
    signal axi_arready : std_logic;
    signal axi_rdata   : std_logic_vector(31 downto 0);
    signal axi_rresp   : std_logic_vector(1 downto 0);
    signal axi_rlast   : std_logic;
    signal axi_rvalid  : std_logic;
    signal axi_rready  : std_logic;
    signal tg_done     : std_logic;
    signal tg_error    : std_logic;

    -- ID signals (1-bit wide, used as inputs to APM)
    signal axi_awid    : std_logic_vector(0 to 0) := (others => '0');
    signal axi_arid    : std_logic_vector(0 to 0) := (others => '0');
    signal axi_bid     : std_logic_vector(0 to 0) := (others => '0');
    signal axi_rid     : std_logic_vector(0 to 0) := (others => '0');
    signal axi_awlock  : std_logic_vector(0 to 0) := (others => '0');
    signal axi_arlock  : std_logic_vector(0 to 0) := (others => '0');

    type ram_type is array (0 to 15) of std_logic_vector(31 downto 0);
    signal ram               : ram_type := (others => (others => '0'));
    signal wr_addr_accepted  : std_logic := '0';
    signal wr_data_accepted  : std_logic := '0';
    signal wr_addr_reg       : std_logic_vector(3 downto 0) := (others => '0');
    signal wr_data_reg       : std_logic_vector(31 downto 0) := (others => '0');

begin

    sys_reset_n <= not sys_reset;

    u_sys_ctrl : system_controller
        generic map (RESET_COUNT => 32)
        port map (
            clk_in    => clk_125mhz,
            reset_in  => reset_btn,
            clk_out1  => clk_125,
            clk_out2  => clk_50,
            locked    => locked,
            reset_out => sys_reset
        );

    u_traffic_gen : axi_traffic_gen
        generic map (
            C_M_AXI_ADDR_WIDTH => 32,
            C_M_AXI_DATA_WIDTH => 32,
            NUM_TRANSACTIONS   => 16
        )
        port map (
            clk           => clk_125,
            resetn        => sys_reset_n,
            M_AXI_AWADDR  => axi_awaddr,
            M_AXI_AWLEN   => axi_awlen,
            M_AXI_AWSIZE  => axi_awsize,
            M_AXI_AWBURST => axi_awburst,
            M_AXI_AWVALID => axi_awvalid,
            M_AXI_AWREADY => axi_awready,
            M_AXI_WDATA   => axi_wdata,
            M_AXI_WSTRB   => axi_wstrb,
            M_AXI_WLAST   => axi_wlast,
            M_AXI_WVALID  => axi_wvalid,
            M_AXI_WREADY  => axi_wready,
            M_AXI_BRESP   => axi_bresp,
            M_AXI_BVALID  => axi_bvalid,
            M_AXI_BREADY  => axi_bready,
            M_AXI_ARADDR  => axi_araddr,
            M_AXI_ARLEN   => axi_arlen,
            M_AXI_ARSIZE  => axi_arsize,
            M_AXI_ARBURST => axi_arburst,
            M_AXI_ARVALID => axi_arvalid,
            M_AXI_ARREADY => axi_arready,
            M_AXI_RDATA   => axi_rdata,
            M_AXI_RRESP   => axi_rresp,
            M_AXI_RLAST   => axi_rlast,
            M_AXI_RVALID  => axi_rvalid,
            M_AXI_RREADY  => axi_rready,
            done          => tg_done,
            error         => tg_error
        );

    u_apm : axi_perf_mon_0
        port map (
            s_axi_aclk         => clk_125,
            s_axi_aresetn      => sys_reset_n,
            s_axi_awaddr       => (others => '0'),
            s_axi_awvalid      => '0',
            s_axi_awready      => open,
            s_axi_wdata        => (others => '0'),
            s_axi_wstrb        => (others => '0'),
            s_axi_wvalid       => '0',
            s_axi_wready       => open,
            s_axi_bresp        => open,
            s_axi_bvalid       => open,
            s_axi_bready       => '1',
            s_axi_araddr       => (others => '0'),
            s_axi_arvalid      => '0',
            s_axi_arready      => open,
            s_axi_rdata        => open,
            s_axi_rresp        => open,
            s_axi_rvalid       => open,
            s_axi_rready       => '1',
            slot_0_axi_aclk    => clk_125,
            slot_0_axi_aresetn => sys_reset_n,
            slot_0_axi_awid    => axi_awid,
            slot_0_axi_awaddr  => axi_awaddr,
            slot_0_axi_awprot  => "000",
            slot_0_axi_awlen   => axi_awlen,
            slot_0_axi_awsize  => axi_awsize,
            slot_0_axi_awburst => axi_awburst,
            slot_0_axi_awcache => "0000",
            slot_0_axi_awlock  => axi_awlock,
            slot_0_axi_awvalid => axi_awvalid,
            slot_0_axi_awready => axi_awready,
            slot_0_axi_wdata   => axi_wdata,
            slot_0_axi_wstrb   => axi_wstrb,
            slot_0_axi_wlast   => axi_wlast,
            slot_0_axi_wvalid  => axi_wvalid,
            slot_0_axi_wready  => axi_wready,
            slot_0_axi_bid     => axi_bid,
            slot_0_axi_bresp   => axi_bresp,
            slot_0_axi_bvalid  => axi_bvalid,
            slot_0_axi_bready  => axi_bready,
            slot_0_axi_arid    => axi_arid,
            slot_0_axi_araddr  => axi_araddr,
            slot_0_axi_arlen   => axi_arlen,
            slot_0_axi_arsize  => axi_arsize,
            slot_0_axi_arburst => axi_arburst,
            slot_0_axi_arcache => "0000",
            slot_0_axi_arprot  => "000",
            slot_0_axi_arlock  => axi_arlock,
            slot_0_axi_arvalid => axi_arvalid,
            slot_0_axi_arready => axi_arready,
            slot_0_axi_rid     => axi_rid,
            slot_0_axi_rdata   => axi_rdata,
            slot_0_axi_rresp   => axi_rresp,
            slot_0_axi_rlast   => axi_rlast,
            slot_0_axi_rvalid  => axi_rvalid,
            slot_0_axi_rready  => axi_rready,
            capture_event      => '0',
            reset_event        => '0',
            core_aclk          => clk_125,
            core_aresetn       => sys_reset_n,
            interrupt          => open
        );

    p_write : process(clk_125)
    begin
        if rising_edge(clk_125) then
            if sys_reset = '1' then
                axi_awready      <= '0';
                axi_wready       <= '0';
                axi_bvalid       <= '0';
                axi_bresp        <= "00";
                wr_addr_accepted <= '0';
                wr_data_accepted <= '0';
            else
                axi_awready <= '0';
                axi_wready  <= '0';
                axi_bvalid  <= '0';

                if axi_awvalid = '1' and wr_addr_accepted = '0' then
                    axi_awready      <= '1';
                    wr_addr_reg      <= axi_awaddr(5 downto 2);
                    wr_addr_accepted <= '1';
                end if;

                if axi_wvalid = '1' and wr_data_accepted = '0' then
                    axi_wready       <= '1';
                    wr_data_reg      <= axi_wdata;
                    wr_data_accepted <= '1';
                end if;

                if wr_addr_accepted = '1' and wr_data_accepted = '1' then
                    ram(to_integer(unsigned(wr_addr_reg))) <= wr_data_reg;
                    axi_bvalid       <= '1';
                    axi_bresp        <= "00";
                    wr_addr_accepted <= '0';
                    wr_data_accepted <= '0';
                end if;
            end if;
        end if;
    end process;

    p_read : process(clk_125)
    begin
        if rising_edge(clk_125) then
            if sys_reset = '1' then
                axi_arready <= '0';
                axi_rvalid  <= '0';
                axi_rresp   <= "00";
                axi_rlast   <= '0';
                axi_rdata   <= (others => '0');
            else
                axi_arready <= '0';
                axi_rvalid  <= '0';
                axi_rlast   <= '0';

                if axi_arvalid = '1' then
                    axi_arready <= '1';
                    axi_rdata   <= ram(to_integer(unsigned(axi_araddr(5 downto 2))));
                    axi_rvalid  <= '1';
                    axi_rresp   <= "00";
                    axi_rlast   <= '1';
                end if;
            end if;
        end if;
    end process;

    led_locked <= locked;
    led_done   <= tg_done;
    led_error  <= tg_error;

end Behavioral;