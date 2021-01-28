library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AXI4S_Replicator is
    generic
    (
        DATA_WIDTH      : integer := 32
    );
    port
    (
        S00_AXIS_aclk     : in std_logic;
        S00_AXIS_areset   : in std_logic;
        S00_AXIS_tdata    : in std_logic_vector(DATA_WIDTH-1 downto 0);
        S00_AXIS_tkeep    : in std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        S00_AXIS_tlast    : in std_logic;
        S00_AXIS_tvalid   : in std_logic;
        S00_AXIS_tready   : out std_logic;

        M00_AXIS_aclk     : out std_logic;
        M00_AXIS_areset   : out std_logic;
        M00_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M00_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M00_AXIS_tlast    : out std_logic;
        M00_AXIS_tvalid   : out std_logic;
        M00_AXIS_tready   : in std_logic;

        M01_AXIS_aclk     : out std_logic;
        M01_AXIS_areset   : out std_logic;
        M01_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M01_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M01_AXIS_tlast    : out std_logic;
        M01_AXIS_tvalid   : out std_logic;
        M01_AXIS_tready   : in std_logic;

        M02_AXIS_aclk     : out std_logic;
        M02_AXIS_areset   : out std_logic;
        M02_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M02_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M02_AXIS_tlast    : out std_logic;
        M02_AXIS_tvalid   : out std_logic;
        M02_AXIS_tready   : in std_logic;

        M03_AXIS_aclk     : out std_logic;
        M03_AXIS_areset   : out std_logic;
        M03_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M03_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M03_AXIS_tlast    : out std_logic;
        M03_AXIS_tvalid   : out std_logic;
        M03_AXIS_tready   : in std_logic;

        M04_AXIS_aclk     : out std_logic;
        M04_AXIS_areset   : out std_logic;
        M04_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M04_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M04_AXIS_tlast    : out std_logic;
        M04_AXIS_tvalid   : out std_logic;
        M04_AXIS_tready   : in std_logic;

        M05_AXIS_aclk     : out std_logic;
        M05_AXIS_areset   : out std_logic;
        M05_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M05_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M05_AXIS_tlast    : out std_logic;
        M05_AXIS_tvalid   : out std_logic;
        M05_AXIS_tready   : in std_logic;

        M06_AXIS_aclk     : out std_logic;
        M06_AXIS_areset   : out std_logic;
        M06_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M06_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M06_AXIS_tlast    : out std_logic;
        M06_AXIS_tvalid   : out std_logic;
        M06_AXIS_tready   : in std_logic;

        M07_AXIS_aclk     : out std_logic;
        M07_AXIS_areset   : out std_logic;
        M07_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M07_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M07_AXIS_tlast    : out std_logic;
        M07_AXIS_tvalid   : out std_logic;
        M07_AXIS_tready   : in std_logic;

        M08_AXIS_aclk     : out std_logic;
        M08_AXIS_areset   : out std_logic;
        M08_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M08_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M08_AXIS_tlast    : out std_logic;
        M08_AXIS_tvalid   : out std_logic;
        M08_AXIS_tready   : in std_logic;

        M09_AXIS_aclk     : out std_logic;
        M09_AXIS_areset   : out std_logic;
        M09_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M09_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M09_AXIS_tlast    : out std_logic;
        M09_AXIS_tvalid   : out std_logic;
        M09_AXIS_tready   : in std_logic;

        M10_AXIS_aclk     : out std_logic;
        M10_AXIS_areset   : out std_logic;
        M10_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M10_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M10_AXIS_tlast    : out std_logic;
        M10_AXIS_tvalid   : out std_logic;
        M10_AXIS_tready   : in std_logic;

        M11_AXIS_aclk     : out std_logic;
        M11_AXIS_areset   : out std_logic;
        M11_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M11_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M11_AXIS_tlast    : out std_logic;
        M11_AXIS_tvalid   : out std_logic;
        M11_AXIS_tready   : in std_logic;

        M12_AXIS_aclk     : out std_logic;
        M12_AXIS_areset   : out std_logic;
        M12_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M12_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M12_AXIS_tlast    : out std_logic;
        M12_AXIS_tvalid   : out std_logic;
        M12_AXIS_tready   : in std_logic;

        M13_AXIS_aclk     : out std_logic;
        M13_AXIS_areset   : out std_logic;
        M13_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M13_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M13_AXIS_tlast    : out std_logic;
        M13_AXIS_tvalid   : out std_logic;
        M13_AXIS_tready   : in std_logic;

        M14_AXIS_aclk     : out std_logic;
        M14_AXIS_areset   : out std_logic;
        M14_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M14_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M14_AXIS_tlast    : out std_logic;
        M14_AXIS_tvalid   : out std_logic;
        M14_AXIS_tready   : in std_logic;

        M15_AXIS_aclk     : out std_logic;
        M15_AXIS_areset   : out std_logic;
        M15_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M15_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M15_AXIS_tlast    : out std_logic;
        M15_AXIS_tvalid   : out std_logic;
        M15_AXIS_tready   : in std_logic;

        M16_AXIS_aclk     : out std_logic;
        M16_AXIS_areset   : out std_logic;
        M16_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M16_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M16_AXIS_tlast    : out std_logic;
        M16_AXIS_tvalid   : out std_logic;
        M16_AXIS_tready   : in std_logic;

        M17_AXIS_aclk     : out std_logic;
        M17_AXIS_areset   : out std_logic;
        M17_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M17_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M17_AXIS_tlast    : out std_logic;
        M17_AXIS_tvalid   : out std_logic;
        M17_AXIS_tready   : in std_logic;

        M18_AXIS_aclk     : out std_logic;
        M18_AXIS_areset   : out std_logic;
        M18_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M18_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M18_AXIS_tlast    : out std_logic;
        M18_AXIS_tvalid   : out std_logic;
        M18_AXIS_tready   : in std_logic;

        M19_AXIS_aclk     : out std_logic;
        M19_AXIS_areset   : out std_logic;
        M19_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M19_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M19_AXIS_tlast    : out std_logic;
        M19_AXIS_tvalid   : out std_logic;
        M19_AXIS_tready   : in std_logic;

        M20_AXIS_aclk     : out std_logic;
        M20_AXIS_areset   : out std_logic;
        M20_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M20_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M20_AXIS_tlast    : out std_logic;
        M20_AXIS_tvalid   : out std_logic;
        M20_AXIS_tready   : in std_logic;

        M21_AXIS_aclk     : out std_logic;
        M21_AXIS_areset   : out std_logic;
        M21_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M21_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M21_AXIS_tlast    : out std_logic;
        M21_AXIS_tvalid   : out std_logic;
        M21_AXIS_tready   : in std_logic;

        M22_AXIS_aclk     : out std_logic;
        M22_AXIS_areset   : out std_logic;
        M22_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M22_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M22_AXIS_tlast    : out std_logic;
        M22_AXIS_tvalid   : out std_logic;
        M22_AXIS_tready   : in std_logic;

        M23_AXIS_aclk     : out std_logic;
        M23_AXIS_areset   : out std_logic;
        M23_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M23_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M23_AXIS_tlast    : out std_logic;
        M23_AXIS_tvalid   : out std_logic;
        M23_AXIS_tready   : in std_logic;

        M24_AXIS_aclk     : out std_logic;
        M24_AXIS_areset   : out std_logic;
        M24_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M24_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M24_AXIS_tlast    : out std_logic;
        M24_AXIS_tvalid   : out std_logic;
        M24_AXIS_tready   : in std_logic;

        M25_AXIS_aclk     : out std_logic;
        M25_AXIS_areset   : out std_logic;
        M25_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M25_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M25_AXIS_tlast    : out std_logic;
        M25_AXIS_tvalid   : out std_logic;
        M25_AXIS_tready   : in std_logic;

        M26_AXIS_aclk     : out std_logic;
        M26_AXIS_areset   : out std_logic;
        M26_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M26_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M26_AXIS_tlast    : out std_logic;
        M26_AXIS_tvalid   : out std_logic;
        M26_AXIS_tready   : in std_logic;

        M27_AXIS_aclk     : out std_logic;
        M27_AXIS_areset   : out std_logic;
        M27_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M27_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M27_AXIS_tlast    : out std_logic;
        M27_AXIS_tvalid   : out std_logic;
        M27_AXIS_tready   : in std_logic;

        M28_AXIS_aclk     : out std_logic;
        M28_AXIS_areset   : out std_logic;
        M28_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M28_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M28_AXIS_tlast    : out std_logic;
        M28_AXIS_tvalid   : out std_logic;
        M28_AXIS_tready   : in std_logic;

        M29_AXIS_aclk     : out std_logic;
        M29_AXIS_areset   : out std_logic;
        M29_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M29_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M29_AXIS_tlast    : out std_logic;
        M29_AXIS_tvalid   : out std_logic;
        M29_AXIS_tready   : in std_logic;

        M30_AXIS_aclk     : out std_logic;
        M30_AXIS_areset   : out std_logic;
        M30_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M30_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M30_AXIS_tlast    : out std_logic;
        M30_AXIS_tvalid   : out std_logic;
        M30_AXIS_tready   : in std_logic;

        M31_AXIS_aclk     : out std_logic;
        M31_AXIS_areset   : out std_logic;
        M31_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M31_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M31_AXIS_tlast    : out std_logic;
        M31_AXIS_tvalid   : out std_logic;
        M31_AXIS_tready   : in std_logic;

        M32_AXIS_aclk     : out std_logic;
        M32_AXIS_areset   : out std_logic;
        M32_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M32_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M32_AXIS_tlast    : out std_logic;
        M32_AXIS_tvalid   : out std_logic;
        M32_AXIS_tready   : in std_logic;

        M33_AXIS_aclk     : out std_logic;
        M33_AXIS_areset   : out std_logic;
        M33_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M33_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M33_AXIS_tlast    : out std_logic;
        M33_AXIS_tvalid   : out std_logic;
        M33_AXIS_tready   : in std_logic;

        M34_AXIS_aclk     : out std_logic;
        M34_AXIS_areset   : out std_logic;
        M34_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M34_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M34_AXIS_tlast    : out std_logic;
        M34_AXIS_tvalid   : out std_logic;
        M34_AXIS_tready   : in std_logic;

        M35_AXIS_aclk     : out std_logic;
        M35_AXIS_areset   : out std_logic;
        M35_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M35_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M35_AXIS_tlast    : out std_logic;
        M35_AXIS_tvalid   : out std_logic;
        M35_AXIS_tready   : in std_logic;

        M36_AXIS_aclk     : out std_logic;
        M36_AXIS_areset   : out std_logic;
        M36_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M36_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M36_AXIS_tlast    : out std_logic;
        M36_AXIS_tvalid   : out std_logic;
        M36_AXIS_tready   : in std_logic;

        M37_AXIS_aclk     : out std_logic;
        M37_AXIS_areset   : out std_logic;
        M37_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M37_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M37_AXIS_tlast    : out std_logic;
        M37_AXIS_tvalid   : out std_logic;
        M37_AXIS_tready   : in std_logic;

        M38_AXIS_aclk     : out std_logic;
        M38_AXIS_areset   : out std_logic;
        M38_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M38_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M38_AXIS_tlast    : out std_logic;
        M38_AXIS_tvalid   : out std_logic;
        M38_AXIS_tready   : in std_logic;

        M39_AXIS_aclk     : out std_logic;
        M39_AXIS_areset   : out std_logic;
        M39_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M39_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M39_AXIS_tlast    : out std_logic;
        M39_AXIS_tvalid   : out std_logic;
        M39_AXIS_tready   : in std_logic;

        M40_AXIS_aclk     : out std_logic;
        M40_AXIS_areset   : out std_logic;
        M40_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M40_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M40_AXIS_tlast    : out std_logic;
        M40_AXIS_tvalid   : out std_logic;
        M40_AXIS_tready   : in std_logic;

        M41_AXIS_aclk     : out std_logic;
        M41_AXIS_areset   : out std_logic;
        M41_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M41_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M41_AXIS_tlast    : out std_logic;
        M41_AXIS_tvalid   : out std_logic;
        M41_AXIS_tready   : in std_logic;

        M42_AXIS_aclk     : out std_logic;
        M42_AXIS_areset   : out std_logic;
        M42_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M42_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M42_AXIS_tlast    : out std_logic;
        M42_AXIS_tvalid   : out std_logic;
        M42_AXIS_tready   : in std_logic;

        M43_AXIS_aclk     : out std_logic;
        M43_AXIS_areset   : out std_logic;
        M43_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M43_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M43_AXIS_tlast    : out std_logic;
        M43_AXIS_tvalid   : out std_logic;
        M43_AXIS_tready   : in std_logic;

        M44_AXIS_aclk     : out std_logic;
        M44_AXIS_areset   : out std_logic;
        M44_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M44_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M44_AXIS_tlast    : out std_logic;
        M44_AXIS_tvalid   : out std_logic;
        M44_AXIS_tready   : in std_logic;

        M45_AXIS_aclk     : out std_logic;
        M45_AXIS_areset   : out std_logic;
        M45_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M45_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M45_AXIS_tlast    : out std_logic;
        M45_AXIS_tvalid   : out std_logic;
        M45_AXIS_tready   : in std_logic;

        M46_AXIS_aclk     : out std_logic;
        M46_AXIS_areset   : out std_logic;
        M46_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M46_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M46_AXIS_tlast    : out std_logic;
        M46_AXIS_tvalid   : out std_logic;
        M46_AXIS_tready   : in std_logic;

        M47_AXIS_aclk     : out std_logic;
        M47_AXIS_areset   : out std_logic;
        M47_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M47_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M47_AXIS_tlast    : out std_logic;
        M47_AXIS_tvalid   : out std_logic;
        M47_AXIS_tready   : in std_logic;

        M48_AXIS_aclk     : out std_logic;
        M48_AXIS_areset   : out std_logic;
        M48_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M48_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M48_AXIS_tlast    : out std_logic;
        M48_AXIS_tvalid   : out std_logic;
        M48_AXIS_tready   : in std_logic;

        M49_AXIS_aclk     : out std_logic;
        M49_AXIS_areset   : out std_logic;
        M49_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M49_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M49_AXIS_tlast    : out std_logic;
        M49_AXIS_tvalid   : out std_logic;
        M49_AXIS_tready   : in std_logic;

        M50_AXIS_aclk     : out std_logic;
        M50_AXIS_areset   : out std_logic;
        M50_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M50_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M50_AXIS_tlast    : out std_logic;
        M50_AXIS_tvalid   : out std_logic;
        M50_AXIS_tready   : in std_logic;

        M51_AXIS_aclk     : out std_logic;
        M51_AXIS_areset   : out std_logic;
        M51_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M51_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M51_AXIS_tlast    : out std_logic;
        M51_AXIS_tvalid   : out std_logic;
        M51_AXIS_tready   : in std_logic;

        M52_AXIS_aclk     : out std_logic;
        M52_AXIS_areset   : out std_logic;
        M52_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M52_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M52_AXIS_tlast    : out std_logic;
        M52_AXIS_tvalid   : out std_logic;
        M52_AXIS_tready   : in std_logic;

        M53_AXIS_aclk     : out std_logic;
        M53_AXIS_areset   : out std_logic;
        M53_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M53_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M53_AXIS_tlast    : out std_logic;
        M53_AXIS_tvalid   : out std_logic;
        M53_AXIS_tready   : in std_logic;

        M54_AXIS_aclk     : out std_logic;
        M54_AXIS_areset   : out std_logic;
        M54_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M54_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M54_AXIS_tlast    : out std_logic;
        M54_AXIS_tvalid   : out std_logic;
        M54_AXIS_tready   : in std_logic;

        M55_AXIS_aclk     : out std_logic;
        M55_AXIS_areset   : out std_logic;
        M55_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M55_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M55_AXIS_tlast    : out std_logic;
        M55_AXIS_tvalid   : out std_logic;
        M55_AXIS_tready   : in std_logic;

        M56_AXIS_aclk     : out std_logic;
        M56_AXIS_areset   : out std_logic;
        M56_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M56_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M56_AXIS_tlast    : out std_logic;
        M56_AXIS_tvalid   : out std_logic;
        M56_AXIS_tready   : in std_logic;

        M57_AXIS_aclk     : out std_logic;
        M57_AXIS_areset   : out std_logic;
        M57_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M57_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M57_AXIS_tlast    : out std_logic;
        M57_AXIS_tvalid   : out std_logic;
        M57_AXIS_tready   : in std_logic;

        M58_AXIS_aclk     : out std_logic;
        M58_AXIS_areset   : out std_logic;
        M58_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M58_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M58_AXIS_tlast    : out std_logic;
        M58_AXIS_tvalid   : out std_logic;
        M58_AXIS_tready   : in std_logic;

        M59_AXIS_aclk     : out std_logic;
        M59_AXIS_areset   : out std_logic;
        M59_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M59_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M59_AXIS_tlast    : out std_logic;
        M59_AXIS_tvalid   : out std_logic;
        M59_AXIS_tready   : in std_logic;

        M60_AXIS_aclk     : out std_logic;
        M60_AXIS_areset   : out std_logic;
        M60_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M60_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M60_AXIS_tlast    : out std_logic;
        M60_AXIS_tvalid   : out std_logic;
        M60_AXIS_tready   : in std_logic;

        M61_AXIS_aclk     : out std_logic;
        M61_AXIS_areset   : out std_logic;
        M61_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M61_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M61_AXIS_tlast    : out std_logic;
        M61_AXIS_tvalid   : out std_logic;
        M61_AXIS_tready   : in std_logic;

        M62_AXIS_aclk     : out std_logic;
        M62_AXIS_areset   : out std_logic;
        M62_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M62_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M62_AXIS_tlast    : out std_logic;
        M62_AXIS_tvalid   : out std_logic;
        M62_AXIS_tready   : in std_logic;

        M63_AXIS_aclk     : out std_logic;
        M63_AXIS_areset   : out std_logic;
        M63_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M63_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M63_AXIS_tlast    : out std_logic;
        M63_AXIS_tvalid   : out std_logic;
        M63_AXIS_tready   : in std_logic;

        M64_AXIS_aclk     : out std_logic;
        M64_AXIS_areset   : out std_logic;
        M64_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M64_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M64_AXIS_tlast    : out std_logic;
        M64_AXIS_tvalid   : out std_logic;
        M64_AXIS_tready   : in std_logic;

        M65_AXIS_aclk     : out std_logic;
        M65_AXIS_areset   : out std_logic;
        M65_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M65_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M65_AXIS_tlast    : out std_logic;
        M65_AXIS_tvalid   : out std_logic;
        M65_AXIS_tready   : in std_logic;

        M66_AXIS_aclk     : out std_logic;
        M66_AXIS_areset   : out std_logic;
        M66_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M66_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M66_AXIS_tlast    : out std_logic;
        M66_AXIS_tvalid   : out std_logic;
        M66_AXIS_tready   : in std_logic;

        M67_AXIS_aclk     : out std_logic;
        M67_AXIS_areset   : out std_logic;
        M67_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M67_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M67_AXIS_tlast    : out std_logic;
        M67_AXIS_tvalid   : out std_logic;
        M67_AXIS_tready   : in std_logic;

        M68_AXIS_aclk     : out std_logic;
        M68_AXIS_areset   : out std_logic;
        M68_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M68_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M68_AXIS_tlast    : out std_logic;
        M68_AXIS_tvalid   : out std_logic;
        M68_AXIS_tready   : in std_logic;

        M69_AXIS_aclk     : out std_logic;
        M69_AXIS_areset   : out std_logic;
        M69_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M69_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M69_AXIS_tlast    : out std_logic;
        M69_AXIS_tvalid   : out std_logic;
        M69_AXIS_tready   : in std_logic;

        M70_AXIS_aclk     : out std_logic;
        M70_AXIS_areset   : out std_logic;
        M70_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M70_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M70_AXIS_tlast    : out std_logic;
        M70_AXIS_tvalid   : out std_logic;
        M70_AXIS_tready   : in std_logic;

        M71_AXIS_aclk     : out std_logic;
        M71_AXIS_areset   : out std_logic;
        M71_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M71_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M71_AXIS_tlast    : out std_logic;
        M71_AXIS_tvalid   : out std_logic;
        M71_AXIS_tready   : in std_logic;

        M72_AXIS_aclk     : out std_logic;
        M72_AXIS_areset   : out std_logic;
        M72_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M72_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M72_AXIS_tlast    : out std_logic;
        M72_AXIS_tvalid   : out std_logic;
        M72_AXIS_tready   : in std_logic;

        M73_AXIS_aclk     : out std_logic;
        M73_AXIS_areset   : out std_logic;
        M73_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M73_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M73_AXIS_tlast    : out std_logic;
        M73_AXIS_tvalid   : out std_logic;
        M73_AXIS_tready   : in std_logic;

        M74_AXIS_aclk     : out std_logic;
        M74_AXIS_areset   : out std_logic;
        M74_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M74_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M74_AXIS_tlast    : out std_logic;
        M74_AXIS_tvalid   : out std_logic;
        M74_AXIS_tready   : in std_logic;

        M75_AXIS_aclk     : out std_logic;
        M75_AXIS_areset   : out std_logic;
        M75_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M75_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M75_AXIS_tlast    : out std_logic;
        M75_AXIS_tvalid   : out std_logic;
        M75_AXIS_tready   : in std_logic;

        M76_AXIS_aclk     : out std_logic;
        M76_AXIS_areset   : out std_logic;
        M76_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M76_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M76_AXIS_tlast    : out std_logic;
        M76_AXIS_tvalid   : out std_logic;
        M76_AXIS_tready   : in std_logic;

        M77_AXIS_aclk     : out std_logic;
        M77_AXIS_areset   : out std_logic;
        M77_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M77_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M77_AXIS_tlast    : out std_logic;
        M77_AXIS_tvalid   : out std_logic;
        M77_AXIS_tready   : in std_logic;

        M78_AXIS_aclk     : out std_logic;
        M78_AXIS_areset   : out std_logic;
        M78_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M78_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M78_AXIS_tlast    : out std_logic;
        M78_AXIS_tvalid   : out std_logic;
        M78_AXIS_tready   : in std_logic;

        M79_AXIS_aclk     : out std_logic;
        M79_AXIS_areset   : out std_logic;
        M79_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M79_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M79_AXIS_tlast    : out std_logic;
        M79_AXIS_tvalid   : out std_logic;
        M79_AXIS_tready   : in std_logic;

        M80_AXIS_aclk     : out std_logic;
        M80_AXIS_areset   : out std_logic;
        M80_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M80_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M80_AXIS_tlast    : out std_logic;
        M80_AXIS_tvalid   : out std_logic;
        M80_AXIS_tready   : in std_logic;

        M81_AXIS_aclk     : out std_logic;
        M81_AXIS_areset   : out std_logic;
        M81_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M81_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M81_AXIS_tlast    : out std_logic;
        M81_AXIS_tvalid   : out std_logic;
        M81_AXIS_tready   : in std_logic;

        M82_AXIS_aclk     : out std_logic;
        M82_AXIS_areset   : out std_logic;
        M82_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M82_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M82_AXIS_tlast    : out std_logic;
        M82_AXIS_tvalid   : out std_logic;
        M82_AXIS_tready   : in std_logic;

        M83_AXIS_aclk     : out std_logic;
        M83_AXIS_areset   : out std_logic;
        M83_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M83_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M83_AXIS_tlast    : out std_logic;
        M83_AXIS_tvalid   : out std_logic;
        M83_AXIS_tready   : in std_logic;

        M84_AXIS_aclk     : out std_logic;
        M84_AXIS_areset   : out std_logic;
        M84_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M84_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M84_AXIS_tlast    : out std_logic;
        M84_AXIS_tvalid   : out std_logic;
        M84_AXIS_tready   : in std_logic;

        M85_AXIS_aclk     : out std_logic;
        M85_AXIS_areset   : out std_logic;
        M85_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M85_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M85_AXIS_tlast    : out std_logic;
        M85_AXIS_tvalid   : out std_logic;
        M85_AXIS_tready   : in std_logic;

        M86_AXIS_aclk     : out std_logic;
        M86_AXIS_areset   : out std_logic;
        M86_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M86_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M86_AXIS_tlast    : out std_logic;
        M86_AXIS_tvalid   : out std_logic;
        M86_AXIS_tready   : in std_logic;

        M87_AXIS_aclk     : out std_logic;
        M87_AXIS_areset   : out std_logic;
        M87_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M87_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M87_AXIS_tlast    : out std_logic;
        M87_AXIS_tvalid   : out std_logic;
        M87_AXIS_tready   : in std_logic;

        M88_AXIS_aclk     : out std_logic;
        M88_AXIS_areset   : out std_logic;
        M88_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M88_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M88_AXIS_tlast    : out std_logic;
        M88_AXIS_tvalid   : out std_logic;
        M88_AXIS_tready   : in std_logic;

        M89_AXIS_aclk     : out std_logic;
        M89_AXIS_areset   : out std_logic;
        M89_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M89_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M89_AXIS_tlast    : out std_logic;
        M89_AXIS_tvalid   : out std_logic;
        M89_AXIS_tready   : in std_logic;

        M90_AXIS_aclk     : out std_logic;
        M90_AXIS_areset   : out std_logic;
        M90_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M90_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M90_AXIS_tlast    : out std_logic;
        M90_AXIS_tvalid   : out std_logic;
        M90_AXIS_tready   : in std_logic;

        M91_AXIS_aclk     : out std_logic;
        M91_AXIS_areset   : out std_logic;
        M91_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M91_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M91_AXIS_tlast    : out std_logic;
        M91_AXIS_tvalid   : out std_logic;
        M91_AXIS_tready   : in std_logic;

        M92_AXIS_aclk     : out std_logic;
        M92_AXIS_areset   : out std_logic;
        M92_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M92_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M92_AXIS_tlast    : out std_logic;
        M92_AXIS_tvalid   : out std_logic;
        M92_AXIS_tready   : in std_logic;

        M93_AXIS_aclk     : out std_logic;
        M93_AXIS_areset   : out std_logic;
        M93_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M93_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M93_AXIS_tlast    : out std_logic;
        M93_AXIS_tvalid   : out std_logic;
        M93_AXIS_tready   : in std_logic;

        M94_AXIS_aclk     : out std_logic;
        M94_AXIS_areset   : out std_logic;
        M94_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M94_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M94_AXIS_tlast    : out std_logic;
        M94_AXIS_tvalid   : out std_logic;
        M94_AXIS_tready   : in std_logic;

        M95_AXIS_aclk     : out std_logic;
        M95_AXIS_areset   : out std_logic;
        M95_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M95_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M95_AXIS_tlast    : out std_logic;
        M95_AXIS_tvalid   : out std_logic;
        M95_AXIS_tready   : in std_logic;

        M96_AXIS_aclk     : out std_logic;
        M96_AXIS_areset   : out std_logic;
        M96_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M96_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M96_AXIS_tlast    : out std_logic;
        M96_AXIS_tvalid   : out std_logic;
        M96_AXIS_tready   : in std_logic;

        M97_AXIS_aclk     : out std_logic;
        M97_AXIS_areset   : out std_logic;
        M97_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M97_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M97_AXIS_tlast    : out std_logic;
        M97_AXIS_tvalid   : out std_logic;
        M97_AXIS_tready   : in std_logic;

        M98_AXIS_aclk     : out std_logic;
        M98_AXIS_areset   : out std_logic;
        M98_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M98_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M98_AXIS_tlast    : out std_logic;
        M98_AXIS_tvalid   : out std_logic;
        M98_AXIS_tready   : in std_logic;

        M99_AXIS_aclk     : out std_logic;
        M99_AXIS_areset   : out std_logic;
        M99_AXIS_tdata    : out std_logic_vector(DATA_WIDTH-1 downto 0);
        M99_AXIS_tkeep    : out std_logic_vector((DATA_WIDTH/8)-1 downto 0);
        M99_AXIS_tlast    : out std_logic;
        M99_AXIS_tvalid   : out std_logic;
        M99_AXIS_tready   : in std_logic
    );
end entity;

architecture arch of AXI4S_Replicator is
    
    signal all_ready : std_logic;

begin
    
    all_ready <= M00_AXIS_tready and M01_AXIS_tready and M02_AXIS_tready and M03_AXIS_tready and M04_AXIS_tready and M05_AXIS_tready and M06_AXIS_tready and M07_AXIS_tready and M08_AXIS_tready and M09_AXIS_tready and M10_AXIS_tready and M11_AXIS_tready and M12_AXIS_tready and M13_AXIS_tready and M14_AXIS_tready and M15_AXIS_tready and M16_AXIS_tready and M17_AXIS_tready and M18_AXIS_tready and M19_AXIS_tready and M20_AXIS_tready and M21_AXIS_tready and M22_AXIS_tready and M23_AXIS_tready and M24_AXIS_tready and M25_AXIS_tready and M26_AXIS_tready and M27_AXIS_tready and M28_AXIS_tready and M29_AXIS_tready and M30_AXIS_tready and M31_AXIS_tready and M32_AXIS_tready and M33_AXIS_tready and M34_AXIS_tready and M35_AXIS_tready and M36_AXIS_tready and M37_AXIS_tready and M38_AXIS_tready and M39_AXIS_tready and M40_AXIS_tready and M41_AXIS_tready and M42_AXIS_tready and M43_AXIS_tready and M44_AXIS_tready and M45_AXIS_tready and M46_AXIS_tready and M47_AXIS_tready and M48_AXIS_tready and M49_AXIS_tready and M50_AXIS_tready and M51_AXIS_tready and M52_AXIS_tready and M53_AXIS_tready and M54_AXIS_tready and M55_AXIS_tready and M56_AXIS_tready and M57_AXIS_tready and M58_AXIS_tready and M59_AXIS_tready and M60_AXIS_tready and M61_AXIS_tready and M62_AXIS_tready and M63_AXIS_tready and M64_AXIS_tready and M65_AXIS_tready and M66_AXIS_tready and M67_AXIS_tready and M68_AXIS_tready and M69_AXIS_tready and M70_AXIS_tready and M71_AXIS_tready and M72_AXIS_tready and M73_AXIS_tready and M74_AXIS_tready and M75_AXIS_tready and M76_AXIS_tready and M77_AXIS_tready and M78_AXIS_tready and M79_AXIS_tready and M80_AXIS_tready and M81_AXIS_tready and M82_AXIS_tready and M83_AXIS_tready and M84_AXIS_tready and M85_AXIS_tready and M86_AXIS_tready and M87_AXIS_tready and M88_AXIS_tready and M89_AXIS_tready and M90_AXIS_tready and M91_AXIS_tready and M92_AXIS_tready and M93_AXIS_tready and M94_AXIS_tready and M95_AXIS_tready and M96_AXIS_tready and M97_AXIS_tready and M98_AXIS_tready and M99_AXIS_tready;

    
        M00_AXIS_aclk     <= S00_AXIS_aclk;
        M00_AXIS_areset   <= S00_AXIS_areset;
        M00_AXIS_tdata    <= S00_AXIS_tdata;
        M00_AXIS_tkeep    <= S00_AXIS_tkeep;
        M00_AXIS_tlast    <= S00_AXIS_tlast;
        M00_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M01_AXIS_aclk     <= S00_AXIS_aclk;
        M01_AXIS_areset   <= S00_AXIS_areset;
        M01_AXIS_tdata    <= S00_AXIS_tdata;
        M01_AXIS_tkeep    <= S00_AXIS_tkeep;
        M01_AXIS_tlast    <= S00_AXIS_tlast;
        M01_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M02_AXIS_aclk     <= S00_AXIS_aclk;
        M02_AXIS_areset   <= S00_AXIS_areset;
        M02_AXIS_tdata    <= S00_AXIS_tdata;
        M02_AXIS_tkeep    <= S00_AXIS_tkeep;
        M02_AXIS_tlast    <= S00_AXIS_tlast;
        M02_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M03_AXIS_aclk     <= S00_AXIS_aclk;
        M03_AXIS_areset   <= S00_AXIS_areset;
        M03_AXIS_tdata    <= S00_AXIS_tdata;
        M03_AXIS_tkeep    <= S00_AXIS_tkeep;
        M03_AXIS_tlast    <= S00_AXIS_tlast;
        M03_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M04_AXIS_aclk     <= S00_AXIS_aclk;
        M04_AXIS_areset   <= S00_AXIS_areset;
        M04_AXIS_tdata    <= S00_AXIS_tdata;
        M04_AXIS_tkeep    <= S00_AXIS_tkeep;
        M04_AXIS_tlast    <= S00_AXIS_tlast;
        M04_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M05_AXIS_aclk     <= S00_AXIS_aclk;
        M05_AXIS_areset   <= S00_AXIS_areset;
        M05_AXIS_tdata    <= S00_AXIS_tdata;
        M05_AXIS_tkeep    <= S00_AXIS_tkeep;
        M05_AXIS_tlast    <= S00_AXIS_tlast;
        M05_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M06_AXIS_aclk     <= S00_AXIS_aclk;
        M06_AXIS_areset   <= S00_AXIS_areset;
        M06_AXIS_tdata    <= S00_AXIS_tdata;
        M06_AXIS_tkeep    <= S00_AXIS_tkeep;
        M06_AXIS_tlast    <= S00_AXIS_tlast;
        M06_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M07_AXIS_aclk     <= S00_AXIS_aclk;
        M07_AXIS_areset   <= S00_AXIS_areset;
        M07_AXIS_tdata    <= S00_AXIS_tdata;
        M07_AXIS_tkeep    <= S00_AXIS_tkeep;
        M07_AXIS_tlast    <= S00_AXIS_tlast;
        M07_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M08_AXIS_aclk     <= S00_AXIS_aclk;
        M08_AXIS_areset   <= S00_AXIS_areset;
        M08_AXIS_tdata    <= S00_AXIS_tdata;
        M08_AXIS_tkeep    <= S00_AXIS_tkeep;
        M08_AXIS_tlast    <= S00_AXIS_tlast;
        M08_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M09_AXIS_aclk     <= S00_AXIS_aclk;
        M09_AXIS_areset   <= S00_AXIS_areset;
        M09_AXIS_tdata    <= S00_AXIS_tdata;
        M09_AXIS_tkeep    <= S00_AXIS_tkeep;
        M09_AXIS_tlast    <= S00_AXIS_tlast;
        M09_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M10_AXIS_aclk     <= S00_AXIS_aclk;
        M10_AXIS_areset   <= S00_AXIS_areset;
        M10_AXIS_tdata    <= S00_AXIS_tdata;
        M10_AXIS_tkeep    <= S00_AXIS_tkeep;
        M10_AXIS_tlast    <= S00_AXIS_tlast;
        M10_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M11_AXIS_aclk     <= S00_AXIS_aclk;
        M11_AXIS_areset   <= S00_AXIS_areset;
        M11_AXIS_tdata    <= S00_AXIS_tdata;
        M11_AXIS_tkeep    <= S00_AXIS_tkeep;
        M11_AXIS_tlast    <= S00_AXIS_tlast;
        M11_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M12_AXIS_aclk     <= S00_AXIS_aclk;
        M12_AXIS_areset   <= S00_AXIS_areset;
        M12_AXIS_tdata    <= S00_AXIS_tdata;
        M12_AXIS_tkeep    <= S00_AXIS_tkeep;
        M12_AXIS_tlast    <= S00_AXIS_tlast;
        M12_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M13_AXIS_aclk     <= S00_AXIS_aclk;
        M13_AXIS_areset   <= S00_AXIS_areset;
        M13_AXIS_tdata    <= S00_AXIS_tdata;
        M13_AXIS_tkeep    <= S00_AXIS_tkeep;
        M13_AXIS_tlast    <= S00_AXIS_tlast;
        M13_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M14_AXIS_aclk     <= S00_AXIS_aclk;
        M14_AXIS_areset   <= S00_AXIS_areset;
        M14_AXIS_tdata    <= S00_AXIS_tdata;
        M14_AXIS_tkeep    <= S00_AXIS_tkeep;
        M14_AXIS_tlast    <= S00_AXIS_tlast;
        M14_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M15_AXIS_aclk     <= S00_AXIS_aclk;
        M15_AXIS_areset   <= S00_AXIS_areset;
        M15_AXIS_tdata    <= S00_AXIS_tdata;
        M15_AXIS_tkeep    <= S00_AXIS_tkeep;
        M15_AXIS_tlast    <= S00_AXIS_tlast;
        M15_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M16_AXIS_aclk     <= S00_AXIS_aclk;
        M16_AXIS_areset   <= S00_AXIS_areset;
        M16_AXIS_tdata    <= S00_AXIS_tdata;
        M16_AXIS_tkeep    <= S00_AXIS_tkeep;
        M16_AXIS_tlast    <= S00_AXIS_tlast;
        M16_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M17_AXIS_aclk     <= S00_AXIS_aclk;
        M17_AXIS_areset   <= S00_AXIS_areset;
        M17_AXIS_tdata    <= S00_AXIS_tdata;
        M17_AXIS_tkeep    <= S00_AXIS_tkeep;
        M17_AXIS_tlast    <= S00_AXIS_tlast;
        M17_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M18_AXIS_aclk     <= S00_AXIS_aclk;
        M18_AXIS_areset   <= S00_AXIS_areset;
        M18_AXIS_tdata    <= S00_AXIS_tdata;
        M18_AXIS_tkeep    <= S00_AXIS_tkeep;
        M18_AXIS_tlast    <= S00_AXIS_tlast;
        M18_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M19_AXIS_aclk     <= S00_AXIS_aclk;
        M19_AXIS_areset   <= S00_AXIS_areset;
        M19_AXIS_tdata    <= S00_AXIS_tdata;
        M19_AXIS_tkeep    <= S00_AXIS_tkeep;
        M19_AXIS_tlast    <= S00_AXIS_tlast;
        M19_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M20_AXIS_aclk     <= S00_AXIS_aclk;
        M20_AXIS_areset   <= S00_AXIS_areset;
        M20_AXIS_tdata    <= S00_AXIS_tdata;
        M20_AXIS_tkeep    <= S00_AXIS_tkeep;
        M20_AXIS_tlast    <= S00_AXIS_tlast;
        M20_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M21_AXIS_aclk     <= S00_AXIS_aclk;
        M21_AXIS_areset   <= S00_AXIS_areset;
        M21_AXIS_tdata    <= S00_AXIS_tdata;
        M21_AXIS_tkeep    <= S00_AXIS_tkeep;
        M21_AXIS_tlast    <= S00_AXIS_tlast;
        M21_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M22_AXIS_aclk     <= S00_AXIS_aclk;
        M22_AXIS_areset   <= S00_AXIS_areset;
        M22_AXIS_tdata    <= S00_AXIS_tdata;
        M22_AXIS_tkeep    <= S00_AXIS_tkeep;
        M22_AXIS_tlast    <= S00_AXIS_tlast;
        M22_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M23_AXIS_aclk     <= S00_AXIS_aclk;
        M23_AXIS_areset   <= S00_AXIS_areset;
        M23_AXIS_tdata    <= S00_AXIS_tdata;
        M23_AXIS_tkeep    <= S00_AXIS_tkeep;
        M23_AXIS_tlast    <= S00_AXIS_tlast;
        M23_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M24_AXIS_aclk     <= S00_AXIS_aclk;
        M24_AXIS_areset   <= S00_AXIS_areset;
        M24_AXIS_tdata    <= S00_AXIS_tdata;
        M24_AXIS_tkeep    <= S00_AXIS_tkeep;
        M24_AXIS_tlast    <= S00_AXIS_tlast;
        M24_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M25_AXIS_aclk     <= S00_AXIS_aclk;
        M25_AXIS_areset   <= S00_AXIS_areset;
        M25_AXIS_tdata    <= S00_AXIS_tdata;
        M25_AXIS_tkeep    <= S00_AXIS_tkeep;
        M25_AXIS_tlast    <= S00_AXIS_tlast;
        M25_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M26_AXIS_aclk     <= S00_AXIS_aclk;
        M26_AXIS_areset   <= S00_AXIS_areset;
        M26_AXIS_tdata    <= S00_AXIS_tdata;
        M26_AXIS_tkeep    <= S00_AXIS_tkeep;
        M26_AXIS_tlast    <= S00_AXIS_tlast;
        M26_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M27_AXIS_aclk     <= S00_AXIS_aclk;
        M27_AXIS_areset   <= S00_AXIS_areset;
        M27_AXIS_tdata    <= S00_AXIS_tdata;
        M27_AXIS_tkeep    <= S00_AXIS_tkeep;
        M27_AXIS_tlast    <= S00_AXIS_tlast;
        M27_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M28_AXIS_aclk     <= S00_AXIS_aclk;
        M28_AXIS_areset   <= S00_AXIS_areset;
        M28_AXIS_tdata    <= S00_AXIS_tdata;
        M28_AXIS_tkeep    <= S00_AXIS_tkeep;
        M28_AXIS_tlast    <= S00_AXIS_tlast;
        M28_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M29_AXIS_aclk     <= S00_AXIS_aclk;
        M29_AXIS_areset   <= S00_AXIS_areset;
        M29_AXIS_tdata    <= S00_AXIS_tdata;
        M29_AXIS_tkeep    <= S00_AXIS_tkeep;
        M29_AXIS_tlast    <= S00_AXIS_tlast;
        M29_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M30_AXIS_aclk     <= S00_AXIS_aclk;
        M30_AXIS_areset   <= S00_AXIS_areset;
        M30_AXIS_tdata    <= S00_AXIS_tdata;
        M30_AXIS_tkeep    <= S00_AXIS_tkeep;
        M30_AXIS_tlast    <= S00_AXIS_tlast;
        M30_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M31_AXIS_aclk     <= S00_AXIS_aclk;
        M31_AXIS_areset   <= S00_AXIS_areset;
        M31_AXIS_tdata    <= S00_AXIS_tdata;
        M31_AXIS_tkeep    <= S00_AXIS_tkeep;
        M31_AXIS_tlast    <= S00_AXIS_tlast;
        M31_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M32_AXIS_aclk     <= S00_AXIS_aclk;
        M32_AXIS_areset   <= S00_AXIS_areset;
        M32_AXIS_tdata    <= S00_AXIS_tdata;
        M32_AXIS_tkeep    <= S00_AXIS_tkeep;
        M32_AXIS_tlast    <= S00_AXIS_tlast;
        M32_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M33_AXIS_aclk     <= S00_AXIS_aclk;
        M33_AXIS_areset   <= S00_AXIS_areset;
        M33_AXIS_tdata    <= S00_AXIS_tdata;
        M33_AXIS_tkeep    <= S00_AXIS_tkeep;
        M33_AXIS_tlast    <= S00_AXIS_tlast;
        M33_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M34_AXIS_aclk     <= S00_AXIS_aclk;
        M34_AXIS_areset   <= S00_AXIS_areset;
        M34_AXIS_tdata    <= S00_AXIS_tdata;
        M34_AXIS_tkeep    <= S00_AXIS_tkeep;
        M34_AXIS_tlast    <= S00_AXIS_tlast;
        M34_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M35_AXIS_aclk     <= S00_AXIS_aclk;
        M35_AXIS_areset   <= S00_AXIS_areset;
        M35_AXIS_tdata    <= S00_AXIS_tdata;
        M35_AXIS_tkeep    <= S00_AXIS_tkeep;
        M35_AXIS_tlast    <= S00_AXIS_tlast;
        M35_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M36_AXIS_aclk     <= S00_AXIS_aclk;
        M36_AXIS_areset   <= S00_AXIS_areset;
        M36_AXIS_tdata    <= S00_AXIS_tdata;
        M36_AXIS_tkeep    <= S00_AXIS_tkeep;
        M36_AXIS_tlast    <= S00_AXIS_tlast;
        M36_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M37_AXIS_aclk     <= S00_AXIS_aclk;
        M37_AXIS_areset   <= S00_AXIS_areset;
        M37_AXIS_tdata    <= S00_AXIS_tdata;
        M37_AXIS_tkeep    <= S00_AXIS_tkeep;
        M37_AXIS_tlast    <= S00_AXIS_tlast;
        M37_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M38_AXIS_aclk     <= S00_AXIS_aclk;
        M38_AXIS_areset   <= S00_AXIS_areset;
        M38_AXIS_tdata    <= S00_AXIS_tdata;
        M38_AXIS_tkeep    <= S00_AXIS_tkeep;
        M38_AXIS_tlast    <= S00_AXIS_tlast;
        M38_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M39_AXIS_aclk     <= S00_AXIS_aclk;
        M39_AXIS_areset   <= S00_AXIS_areset;
        M39_AXIS_tdata    <= S00_AXIS_tdata;
        M39_AXIS_tkeep    <= S00_AXIS_tkeep;
        M39_AXIS_tlast    <= S00_AXIS_tlast;
        M39_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M40_AXIS_aclk     <= S00_AXIS_aclk;
        M40_AXIS_areset   <= S00_AXIS_areset;
        M40_AXIS_tdata    <= S00_AXIS_tdata;
        M40_AXIS_tkeep    <= S00_AXIS_tkeep;
        M40_AXIS_tlast    <= S00_AXIS_tlast;
        M40_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M41_AXIS_aclk     <= S00_AXIS_aclk;
        M41_AXIS_areset   <= S00_AXIS_areset;
        M41_AXIS_tdata    <= S00_AXIS_tdata;
        M41_AXIS_tkeep    <= S00_AXIS_tkeep;
        M41_AXIS_tlast    <= S00_AXIS_tlast;
        M41_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M42_AXIS_aclk     <= S00_AXIS_aclk;
        M42_AXIS_areset   <= S00_AXIS_areset;
        M42_AXIS_tdata    <= S00_AXIS_tdata;
        M42_AXIS_tkeep    <= S00_AXIS_tkeep;
        M42_AXIS_tlast    <= S00_AXIS_tlast;
        M42_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M43_AXIS_aclk     <= S00_AXIS_aclk;
        M43_AXIS_areset   <= S00_AXIS_areset;
        M43_AXIS_tdata    <= S00_AXIS_tdata;
        M43_AXIS_tkeep    <= S00_AXIS_tkeep;
        M43_AXIS_tlast    <= S00_AXIS_tlast;
        M43_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M44_AXIS_aclk     <= S00_AXIS_aclk;
        M44_AXIS_areset   <= S00_AXIS_areset;
        M44_AXIS_tdata    <= S00_AXIS_tdata;
        M44_AXIS_tkeep    <= S00_AXIS_tkeep;
        M44_AXIS_tlast    <= S00_AXIS_tlast;
        M44_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M45_AXIS_aclk     <= S00_AXIS_aclk;
        M45_AXIS_areset   <= S00_AXIS_areset;
        M45_AXIS_tdata    <= S00_AXIS_tdata;
        M45_AXIS_tkeep    <= S00_AXIS_tkeep;
        M45_AXIS_tlast    <= S00_AXIS_tlast;
        M45_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M46_AXIS_aclk     <= S00_AXIS_aclk;
        M46_AXIS_areset   <= S00_AXIS_areset;
        M46_AXIS_tdata    <= S00_AXIS_tdata;
        M46_AXIS_tkeep    <= S00_AXIS_tkeep;
        M46_AXIS_tlast    <= S00_AXIS_tlast;
        M46_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M47_AXIS_aclk     <= S00_AXIS_aclk;
        M47_AXIS_areset   <= S00_AXIS_areset;
        M47_AXIS_tdata    <= S00_AXIS_tdata;
        M47_AXIS_tkeep    <= S00_AXIS_tkeep;
        M47_AXIS_tlast    <= S00_AXIS_tlast;
        M47_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M48_AXIS_aclk     <= S00_AXIS_aclk;
        M48_AXIS_areset   <= S00_AXIS_areset;
        M48_AXIS_tdata    <= S00_AXIS_tdata;
        M48_AXIS_tkeep    <= S00_AXIS_tkeep;
        M48_AXIS_tlast    <= S00_AXIS_tlast;
        M48_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M49_AXIS_aclk     <= S00_AXIS_aclk;
        M49_AXIS_areset   <= S00_AXIS_areset;
        M49_AXIS_tdata    <= S00_AXIS_tdata;
        M49_AXIS_tkeep    <= S00_AXIS_tkeep;
        M49_AXIS_tlast    <= S00_AXIS_tlast;
        M49_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M50_AXIS_aclk     <= S00_AXIS_aclk;
        M50_AXIS_areset   <= S00_AXIS_areset;
        M50_AXIS_tdata    <= S00_AXIS_tdata;
        M50_AXIS_tkeep    <= S00_AXIS_tkeep;
        M50_AXIS_tlast    <= S00_AXIS_tlast;
        M50_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M51_AXIS_aclk     <= S00_AXIS_aclk;
        M51_AXIS_areset   <= S00_AXIS_areset;
        M51_AXIS_tdata    <= S00_AXIS_tdata;
        M51_AXIS_tkeep    <= S00_AXIS_tkeep;
        M51_AXIS_tlast    <= S00_AXIS_tlast;
        M51_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M52_AXIS_aclk     <= S00_AXIS_aclk;
        M52_AXIS_areset   <= S00_AXIS_areset;
        M52_AXIS_tdata    <= S00_AXIS_tdata;
        M52_AXIS_tkeep    <= S00_AXIS_tkeep;
        M52_AXIS_tlast    <= S00_AXIS_tlast;
        M52_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M53_AXIS_aclk     <= S00_AXIS_aclk;
        M53_AXIS_areset   <= S00_AXIS_areset;
        M53_AXIS_tdata    <= S00_AXIS_tdata;
        M53_AXIS_tkeep    <= S00_AXIS_tkeep;
        M53_AXIS_tlast    <= S00_AXIS_tlast;
        M53_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M54_AXIS_aclk     <= S00_AXIS_aclk;
        M54_AXIS_areset   <= S00_AXIS_areset;
        M54_AXIS_tdata    <= S00_AXIS_tdata;
        M54_AXIS_tkeep    <= S00_AXIS_tkeep;
        M54_AXIS_tlast    <= S00_AXIS_tlast;
        M54_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M55_AXIS_aclk     <= S00_AXIS_aclk;
        M55_AXIS_areset   <= S00_AXIS_areset;
        M55_AXIS_tdata    <= S00_AXIS_tdata;
        M55_AXIS_tkeep    <= S00_AXIS_tkeep;
        M55_AXIS_tlast    <= S00_AXIS_tlast;
        M55_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M56_AXIS_aclk     <= S00_AXIS_aclk;
        M56_AXIS_areset   <= S00_AXIS_areset;
        M56_AXIS_tdata    <= S00_AXIS_tdata;
        M56_AXIS_tkeep    <= S00_AXIS_tkeep;
        M56_AXIS_tlast    <= S00_AXIS_tlast;
        M56_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M57_AXIS_aclk     <= S00_AXIS_aclk;
        M57_AXIS_areset   <= S00_AXIS_areset;
        M57_AXIS_tdata    <= S00_AXIS_tdata;
        M57_AXIS_tkeep    <= S00_AXIS_tkeep;
        M57_AXIS_tlast    <= S00_AXIS_tlast;
        M57_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M58_AXIS_aclk     <= S00_AXIS_aclk;
        M58_AXIS_areset   <= S00_AXIS_areset;
        M58_AXIS_tdata    <= S00_AXIS_tdata;
        M58_AXIS_tkeep    <= S00_AXIS_tkeep;
        M58_AXIS_tlast    <= S00_AXIS_tlast;
        M58_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M59_AXIS_aclk     <= S00_AXIS_aclk;
        M59_AXIS_areset   <= S00_AXIS_areset;
        M59_AXIS_tdata    <= S00_AXIS_tdata;
        M59_AXIS_tkeep    <= S00_AXIS_tkeep;
        M59_AXIS_tlast    <= S00_AXIS_tlast;
        M59_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M60_AXIS_aclk     <= S00_AXIS_aclk;
        M60_AXIS_areset   <= S00_AXIS_areset;
        M60_AXIS_tdata    <= S00_AXIS_tdata;
        M60_AXIS_tkeep    <= S00_AXIS_tkeep;
        M60_AXIS_tlast    <= S00_AXIS_tlast;
        M60_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M61_AXIS_aclk     <= S00_AXIS_aclk;
        M61_AXIS_areset   <= S00_AXIS_areset;
        M61_AXIS_tdata    <= S00_AXIS_tdata;
        M61_AXIS_tkeep    <= S00_AXIS_tkeep;
        M61_AXIS_tlast    <= S00_AXIS_tlast;
        M61_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M62_AXIS_aclk     <= S00_AXIS_aclk;
        M62_AXIS_areset   <= S00_AXIS_areset;
        M62_AXIS_tdata    <= S00_AXIS_tdata;
        M62_AXIS_tkeep    <= S00_AXIS_tkeep;
        M62_AXIS_tlast    <= S00_AXIS_tlast;
        M62_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M63_AXIS_aclk     <= S00_AXIS_aclk;
        M63_AXIS_areset   <= S00_AXIS_areset;
        M63_AXIS_tdata    <= S00_AXIS_tdata;
        M63_AXIS_tkeep    <= S00_AXIS_tkeep;
        M63_AXIS_tlast    <= S00_AXIS_tlast;
        M63_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M64_AXIS_aclk     <= S00_AXIS_aclk;
        M64_AXIS_areset   <= S00_AXIS_areset;
        M64_AXIS_tdata    <= S00_AXIS_tdata;
        M64_AXIS_tkeep    <= S00_AXIS_tkeep;
        M64_AXIS_tlast    <= S00_AXIS_tlast;
        M64_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M65_AXIS_aclk     <= S00_AXIS_aclk;
        M65_AXIS_areset   <= S00_AXIS_areset;
        M65_AXIS_tdata    <= S00_AXIS_tdata;
        M65_AXIS_tkeep    <= S00_AXIS_tkeep;
        M65_AXIS_tlast    <= S00_AXIS_tlast;
        M65_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M66_AXIS_aclk     <= S00_AXIS_aclk;
        M66_AXIS_areset   <= S00_AXIS_areset;
        M66_AXIS_tdata    <= S00_AXIS_tdata;
        M66_AXIS_tkeep    <= S00_AXIS_tkeep;
        M66_AXIS_tlast    <= S00_AXIS_tlast;
        M66_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M67_AXIS_aclk     <= S00_AXIS_aclk;
        M67_AXIS_areset   <= S00_AXIS_areset;
        M67_AXIS_tdata    <= S00_AXIS_tdata;
        M67_AXIS_tkeep    <= S00_AXIS_tkeep;
        M67_AXIS_tlast    <= S00_AXIS_tlast;
        M67_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M68_AXIS_aclk     <= S00_AXIS_aclk;
        M68_AXIS_areset   <= S00_AXIS_areset;
        M68_AXIS_tdata    <= S00_AXIS_tdata;
        M68_AXIS_tkeep    <= S00_AXIS_tkeep;
        M68_AXIS_tlast    <= S00_AXIS_tlast;
        M68_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M69_AXIS_aclk     <= S00_AXIS_aclk;
        M69_AXIS_areset   <= S00_AXIS_areset;
        M69_AXIS_tdata    <= S00_AXIS_tdata;
        M69_AXIS_tkeep    <= S00_AXIS_tkeep;
        M69_AXIS_tlast    <= S00_AXIS_tlast;
        M69_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M70_AXIS_aclk     <= S00_AXIS_aclk;
        M70_AXIS_areset   <= S00_AXIS_areset;
        M70_AXIS_tdata    <= S00_AXIS_tdata;
        M70_AXIS_tkeep    <= S00_AXIS_tkeep;
        M70_AXIS_tlast    <= S00_AXIS_tlast;
        M70_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M71_AXIS_aclk     <= S00_AXIS_aclk;
        M71_AXIS_areset   <= S00_AXIS_areset;
        M71_AXIS_tdata    <= S00_AXIS_tdata;
        M71_AXIS_tkeep    <= S00_AXIS_tkeep;
        M71_AXIS_tlast    <= S00_AXIS_tlast;
        M71_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M72_AXIS_aclk     <= S00_AXIS_aclk;
        M72_AXIS_areset   <= S00_AXIS_areset;
        M72_AXIS_tdata    <= S00_AXIS_tdata;
        M72_AXIS_tkeep    <= S00_AXIS_tkeep;
        M72_AXIS_tlast    <= S00_AXIS_tlast;
        M72_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M73_AXIS_aclk     <= S00_AXIS_aclk;
        M73_AXIS_areset   <= S00_AXIS_areset;
        M73_AXIS_tdata    <= S00_AXIS_tdata;
        M73_AXIS_tkeep    <= S00_AXIS_tkeep;
        M73_AXIS_tlast    <= S00_AXIS_tlast;
        M73_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M74_AXIS_aclk     <= S00_AXIS_aclk;
        M74_AXIS_areset   <= S00_AXIS_areset;
        M74_AXIS_tdata    <= S00_AXIS_tdata;
        M74_AXIS_tkeep    <= S00_AXIS_tkeep;
        M74_AXIS_tlast    <= S00_AXIS_tlast;
        M74_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M75_AXIS_aclk     <= S00_AXIS_aclk;
        M75_AXIS_areset   <= S00_AXIS_areset;
        M75_AXIS_tdata    <= S00_AXIS_tdata;
        M75_AXIS_tkeep    <= S00_AXIS_tkeep;
        M75_AXIS_tlast    <= S00_AXIS_tlast;
        M75_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M76_AXIS_aclk     <= S00_AXIS_aclk;
        M76_AXIS_areset   <= S00_AXIS_areset;
        M76_AXIS_tdata    <= S00_AXIS_tdata;
        M76_AXIS_tkeep    <= S00_AXIS_tkeep;
        M76_AXIS_tlast    <= S00_AXIS_tlast;
        M76_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M77_AXIS_aclk     <= S00_AXIS_aclk;
        M77_AXIS_areset   <= S00_AXIS_areset;
        M77_AXIS_tdata    <= S00_AXIS_tdata;
        M77_AXIS_tkeep    <= S00_AXIS_tkeep;
        M77_AXIS_tlast    <= S00_AXIS_tlast;
        M77_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M78_AXIS_aclk     <= S00_AXIS_aclk;
        M78_AXIS_areset   <= S00_AXIS_areset;
        M78_AXIS_tdata    <= S00_AXIS_tdata;
        M78_AXIS_tkeep    <= S00_AXIS_tkeep;
        M78_AXIS_tlast    <= S00_AXIS_tlast;
        M78_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M79_AXIS_aclk     <= S00_AXIS_aclk;
        M79_AXIS_areset   <= S00_AXIS_areset;
        M79_AXIS_tdata    <= S00_AXIS_tdata;
        M79_AXIS_tkeep    <= S00_AXIS_tkeep;
        M79_AXIS_tlast    <= S00_AXIS_tlast;
        M79_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M80_AXIS_aclk     <= S00_AXIS_aclk;
        M80_AXIS_areset   <= S00_AXIS_areset;
        M80_AXIS_tdata    <= S00_AXIS_tdata;
        M80_AXIS_tkeep    <= S00_AXIS_tkeep;
        M80_AXIS_tlast    <= S00_AXIS_tlast;
        M80_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M81_AXIS_aclk     <= S00_AXIS_aclk;
        M81_AXIS_areset   <= S00_AXIS_areset;
        M81_AXIS_tdata    <= S00_AXIS_tdata;
        M81_AXIS_tkeep    <= S00_AXIS_tkeep;
        M81_AXIS_tlast    <= S00_AXIS_tlast;
        M81_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M82_AXIS_aclk     <= S00_AXIS_aclk;
        M82_AXIS_areset   <= S00_AXIS_areset;
        M82_AXIS_tdata    <= S00_AXIS_tdata;
        M82_AXIS_tkeep    <= S00_AXIS_tkeep;
        M82_AXIS_tlast    <= S00_AXIS_tlast;
        M82_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M83_AXIS_aclk     <= S00_AXIS_aclk;
        M83_AXIS_areset   <= S00_AXIS_areset;
        M83_AXIS_tdata    <= S00_AXIS_tdata;
        M83_AXIS_tkeep    <= S00_AXIS_tkeep;
        M83_AXIS_tlast    <= S00_AXIS_tlast;
        M83_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M84_AXIS_aclk     <= S00_AXIS_aclk;
        M84_AXIS_areset   <= S00_AXIS_areset;
        M84_AXIS_tdata    <= S00_AXIS_tdata;
        M84_AXIS_tkeep    <= S00_AXIS_tkeep;
        M84_AXIS_tlast    <= S00_AXIS_tlast;
        M84_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M85_AXIS_aclk     <= S00_AXIS_aclk;
        M85_AXIS_areset   <= S00_AXIS_areset;
        M85_AXIS_tdata    <= S00_AXIS_tdata;
        M85_AXIS_tkeep    <= S00_AXIS_tkeep;
        M85_AXIS_tlast    <= S00_AXIS_tlast;
        M85_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M86_AXIS_aclk     <= S00_AXIS_aclk;
        M86_AXIS_areset   <= S00_AXIS_areset;
        M86_AXIS_tdata    <= S00_AXIS_tdata;
        M86_AXIS_tkeep    <= S00_AXIS_tkeep;
        M86_AXIS_tlast    <= S00_AXIS_tlast;
        M86_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M87_AXIS_aclk     <= S00_AXIS_aclk;
        M87_AXIS_areset   <= S00_AXIS_areset;
        M87_AXIS_tdata    <= S00_AXIS_tdata;
        M87_AXIS_tkeep    <= S00_AXIS_tkeep;
        M87_AXIS_tlast    <= S00_AXIS_tlast;
        M87_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M88_AXIS_aclk     <= S00_AXIS_aclk;
        M88_AXIS_areset   <= S00_AXIS_areset;
        M88_AXIS_tdata    <= S00_AXIS_tdata;
        M88_AXIS_tkeep    <= S00_AXIS_tkeep;
        M88_AXIS_tlast    <= S00_AXIS_tlast;
        M88_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M89_AXIS_aclk     <= S00_AXIS_aclk;
        M89_AXIS_areset   <= S00_AXIS_areset;
        M89_AXIS_tdata    <= S00_AXIS_tdata;
        M89_AXIS_tkeep    <= S00_AXIS_tkeep;
        M89_AXIS_tlast    <= S00_AXIS_tlast;
        M89_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M90_AXIS_aclk     <= S00_AXIS_aclk;
        M90_AXIS_areset   <= S00_AXIS_areset;
        M90_AXIS_tdata    <= S00_AXIS_tdata;
        M90_AXIS_tkeep    <= S00_AXIS_tkeep;
        M90_AXIS_tlast    <= S00_AXIS_tlast;
        M90_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M91_AXIS_aclk     <= S00_AXIS_aclk;
        M91_AXIS_areset   <= S00_AXIS_areset;
        M91_AXIS_tdata    <= S00_AXIS_tdata;
        M91_AXIS_tkeep    <= S00_AXIS_tkeep;
        M91_AXIS_tlast    <= S00_AXIS_tlast;
        M91_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M92_AXIS_aclk     <= S00_AXIS_aclk;
        M92_AXIS_areset   <= S00_AXIS_areset;
        M92_AXIS_tdata    <= S00_AXIS_tdata;
        M92_AXIS_tkeep    <= S00_AXIS_tkeep;
        M92_AXIS_tlast    <= S00_AXIS_tlast;
        M92_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M93_AXIS_aclk     <= S00_AXIS_aclk;
        M93_AXIS_areset   <= S00_AXIS_areset;
        M93_AXIS_tdata    <= S00_AXIS_tdata;
        M93_AXIS_tkeep    <= S00_AXIS_tkeep;
        M93_AXIS_tlast    <= S00_AXIS_tlast;
        M93_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M94_AXIS_aclk     <= S00_AXIS_aclk;
        M94_AXIS_areset   <= S00_AXIS_areset;
        M94_AXIS_tdata    <= S00_AXIS_tdata;
        M94_AXIS_tkeep    <= S00_AXIS_tkeep;
        M94_AXIS_tlast    <= S00_AXIS_tlast;
        M94_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M95_AXIS_aclk     <= S00_AXIS_aclk;
        M95_AXIS_areset   <= S00_AXIS_areset;
        M95_AXIS_tdata    <= S00_AXIS_tdata;
        M95_AXIS_tkeep    <= S00_AXIS_tkeep;
        M95_AXIS_tlast    <= S00_AXIS_tlast;
        M95_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M96_AXIS_aclk     <= S00_AXIS_aclk;
        M96_AXIS_areset   <= S00_AXIS_areset;
        M96_AXIS_tdata    <= S00_AXIS_tdata;
        M96_AXIS_tkeep    <= S00_AXIS_tkeep;
        M96_AXIS_tlast    <= S00_AXIS_tlast;
        M96_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M97_AXIS_aclk     <= S00_AXIS_aclk;
        M97_AXIS_areset   <= S00_AXIS_areset;
        M97_AXIS_tdata    <= S00_AXIS_tdata;
        M97_AXIS_tkeep    <= S00_AXIS_tkeep;
        M97_AXIS_tlast    <= S00_AXIS_tlast;
        M97_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M98_AXIS_aclk     <= S00_AXIS_aclk;
        M98_AXIS_areset   <= S00_AXIS_areset;
        M98_AXIS_tdata    <= S00_AXIS_tdata;
        M98_AXIS_tkeep    <= S00_AXIS_tkeep;
        M98_AXIS_tlast    <= S00_AXIS_tlast;
        M98_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;

        M99_AXIS_aclk     <= S00_AXIS_aclk;
        M99_AXIS_areset   <= S00_AXIS_areset;
        M99_AXIS_tdata    <= S00_AXIS_tdata;
        M99_AXIS_tkeep    <= S00_AXIS_tkeep;
        M99_AXIS_tlast    <= S00_AXIS_tlast;
        M99_AXIS_tvalid   <= S00_AXIS_tvalid and all_ready;


    S00_AXIS_tready <= all_ready;

end architecture;

