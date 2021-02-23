library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Calc.all;
use work.Types.all;

entity AXI4_GPIO is
	generic (
        GPIO_WIDTH	: integer	:= 32;
		GPIO_DEPTH	: integer	:= 64;
        
		C_S00_AXI_ID_WIDTH	: integer	:= 1;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 8;
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_AWUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_ARUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_WUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_RUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_BUSER_WIDTH	: integer	:= 0
	);
	port (
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awid	: in std_logic_vector(C_S00_AXI_ID_WIDTH-1 downto 0);
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awlen	: in std_logic_vector(7 downto 0);
		s00_axi_awsize	: in std_logic_vector(2 downto 0);
		s00_axi_awburst	: in std_logic_vector(1 downto 0);
		s00_axi_awlock	: in std_logic;
		s00_axi_awcache	: in std_logic_vector(3 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awqos	: in std_logic_vector(3 downto 0);
		s00_axi_awregion	: in std_logic_vector(3 downto 0);
		s00_axi_awuser	: in std_logic_vector(C_S00_AXI_AWUSER_WIDTH-1 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(GPIO_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((GPIO_WIDTH/8)-1 downto 0);
		s00_axi_wlast	: in std_logic;
		s00_axi_wuser	: in std_logic_vector(C_S00_AXI_WUSER_WIDTH-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bid	: out std_logic_vector(C_S00_AXI_ID_WIDTH-1 downto 0);
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_buser	: out std_logic_vector(C_S00_AXI_BUSER_WIDTH-1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_arid	: in std_logic_vector(C_S00_AXI_ID_WIDTH-1 downto 0);
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arlen	: in std_logic_vector(7 downto 0);
		s00_axi_arsize	: in std_logic_vector(2 downto 0);
		s00_axi_arburst	: in std_logic_vector(1 downto 0);
		s00_axi_arlock	: in std_logic;
		s00_axi_arcache	: in std_logic_vector(3 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arqos	: in std_logic_vector(3 downto 0);
		s00_axi_arregion	: in std_logic_vector(3 downto 0);
		s00_axi_aruser	: in std_logic_vector(C_S00_AXI_ARUSER_WIDTH-1 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rid	: out std_logic_vector(C_S00_AXI_ID_WIDTH-1 downto 0);
		s00_axi_rdata	: out std_logic_vector(GPIO_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rlast	: out std_logic;
		s00_axi_ruser	: out std_logic_vector(C_S00_AXI_RUSER_WIDTH-1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic;
        GPIO_000_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_001_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_002_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_003_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_004_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_005_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_006_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_007_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_008_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_009_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_010_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_011_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_012_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_013_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_014_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_015_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_016_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_017_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_018_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_019_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_020_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_021_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_022_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_023_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_024_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_025_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_026_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_027_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_028_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_029_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_030_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_031_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_032_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_033_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_034_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_035_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_036_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_037_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_038_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_039_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_040_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_041_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_042_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_043_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_044_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_045_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_046_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_047_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_048_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_049_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_050_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_051_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_052_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_053_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_054_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_055_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_056_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_057_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_058_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_059_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_060_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_061_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_062_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_063_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_064_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_065_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_066_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_067_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_068_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_069_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_070_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_071_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_072_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_073_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_074_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_075_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_076_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_077_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_078_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_079_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_080_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_081_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_082_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_083_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_084_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_085_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_086_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_087_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_088_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_089_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_090_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_091_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_092_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_093_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_094_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_095_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_096_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_097_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_098_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_099_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_100_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_101_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_102_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_103_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_104_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_105_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_106_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_107_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_108_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_109_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_110_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_111_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_112_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_113_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_114_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_115_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_116_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_117_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_118_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_119_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_120_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_121_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_122_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_123_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_124_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_125_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_126_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_127_IN         : in std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_000_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_001_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_002_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_003_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_004_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_005_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_006_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_007_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_008_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_009_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_010_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_011_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_012_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_013_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_014_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_015_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_016_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_017_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_018_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_019_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_020_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_021_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_022_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_023_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_024_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_025_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_026_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_027_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_028_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_029_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_030_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_031_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_032_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_033_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_034_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_035_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_036_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_037_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_038_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_039_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_040_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_041_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_042_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_043_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_044_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_045_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_046_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_047_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_048_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_049_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_050_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_051_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_052_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_053_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_054_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_055_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_056_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_057_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_058_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_059_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_060_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_061_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_062_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_063_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_064_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_065_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_066_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_067_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_068_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_069_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_070_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_071_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_072_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_073_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_074_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_075_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_076_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_077_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_078_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_079_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_080_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_081_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_082_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_083_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_084_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_085_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_086_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_087_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_088_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_089_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_090_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_091_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_092_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_093_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_094_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_095_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_096_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_097_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_098_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_099_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_100_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_101_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_102_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_103_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_104_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_105_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_106_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_107_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_108_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_109_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_110_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_111_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_112_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_113_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_114_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_115_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_116_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_117_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_118_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_119_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_120_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_121_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_122_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_123_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_124_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_125_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_126_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0);
        GPIO_127_OUT        : out std_logic_vector(GPIO_WIDTH-1 downto 0)
    );
end AXI4_GPIO;

architecture arch_imp of AXI4_GPIO is

    signal GPIO_IN : std_logic_array(0 to GPIO_DEPTH-1)(C_S00_AXI_DATA_WIDTH-1 downto 0);
    signal GPIO_OUT : std_logic_array(0 to GPIO_DEPTH-1)(C_S00_AXI_DATA_WIDTH-1 downto 0);

	-- component declaration
	component AXI4_GPIO_S_AXI is
		generic (
            GPIO_DEPTH           : integer   := 64;
            C_S_AXI_ID_WIDTH	: integer	:= 1;
            C_S_AXI_DATA_WIDTH	: integer	:= 32;
            C_S_AXI_ADDR_WIDTH	: integer	:= 8;
            C_S_AXI_AWUSER_WIDTH	: integer	:= 0;
            C_S_AXI_ARUSER_WIDTH	: integer	:= 0;
            C_S_AXI_WUSER_WIDTH	: integer	:= 0;
            C_S_AXI_RUSER_WIDTH	: integer	:= 0;
            C_S_AXI_BUSER_WIDTH	: integer	:= 0
		);
		port (
            GPIO_IN     : in std_logic_array(0 to GPIO_DEPTH-1)(C_S_AXI_DATA_WIDTH-1 downto 0);
            GPIO_OUT    : out std_logic_array(0 to GPIO_DEPTH-1)(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_ACLK	: in std_logic;
            S_AXI_ARESETN	: in std_logic;
            S_AXI_AWID	: in std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
            S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_AWLEN	: in std_logic_vector(7 downto 0);
            S_AXI_AWSIZE	: in std_logic_vector(2 downto 0);
            S_AXI_AWBURST	: in std_logic_vector(1 downto 0);
            S_AXI_AWLOCK	: in std_logic;
            S_AXI_AWCACHE	: in std_logic_vector(3 downto 0);
            S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
            S_AXI_AWQOS	: in std_logic_vector(3 downto 0);
            S_AXI_AWREGION	: in std_logic_vector(3 downto 0);
            S_AXI_AWUSER	: in std_logic_vector(C_S_AXI_AWUSER_WIDTH-1 downto 0);
            S_AXI_AWVALID	: in std_logic;
            S_AXI_AWREADY	: out std_logic;
            S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
            S_AXI_WLAST	: in std_logic;
            S_AXI_WUSER	: in std_logic_vector(C_S_AXI_WUSER_WIDTH-1 downto 0);
            S_AXI_WVALID	: in std_logic;
            S_AXI_WREADY	: out std_logic;
            S_AXI_BID	: out std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
            S_AXI_BRESP	: out std_logic_vector(1 downto 0);
            S_AXI_BUSER	: out std_logic_vector(C_S_AXI_BUSER_WIDTH-1 downto 0);
            S_AXI_BVALID	: out std_logic;
            S_AXI_BREADY	: in std_logic;
            S_AXI_ARID	: in std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
            S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_ARLEN	: in std_logic_vector(7 downto 0);
            S_AXI_ARSIZE	: in std_logic_vector(2 downto 0);
            S_AXI_ARBURST	: in std_logic_vector(1 downto 0);
            S_AXI_ARLOCK	: in std_logic;
            S_AXI_ARCACHE	: in std_logic_vector(3 downto 0);
            S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
            S_AXI_ARQOS	: in std_logic_vector(3 downto 0);
            S_AXI_ARREGION	: in std_logic_vector(3 downto 0);
            S_AXI_ARUSER	: in std_logic_vector(C_S_AXI_ARUSER_WIDTH-1 downto 0);
            S_AXI_ARVALID	: in std_logic;
            S_AXI_ARREADY	: out std_logic;
            S_AXI_RID	: out std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
            S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_RRESP	: out std_logic_vector(1 downto 0);
            S_AXI_RLAST	: out std_logic;
            S_AXI_RUSER	: out std_logic_vector(C_S_AXI_RUSER_WIDTH-1 downto 0);
            S_AXI_RVALID	: out std_logic;
            S_AXI_RREADY	: in std_logic
		);
	end component AXI4_GPIO_S_AXI;

begin

    -- Instantiation of Axi Bus Interface S00_AXI
    AXI4_GPIO_S_AXI_inst : AXI4_GPIO_S_AXI
	generic map (
		C_S_AXI_ID_WIDTH	=> C_S00_AXI_ID_WIDTH,
		C_S_AXI_DATA_WIDTH	=> GPIO_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH,
		GPIO_DEPTH       	=> GPIO_DEPTH,
		C_S_AXI_AWUSER_WIDTH	=> C_S00_AXI_AWUSER_WIDTH,
		C_S_AXI_ARUSER_WIDTH	=> C_S00_AXI_ARUSER_WIDTH,
		C_S_AXI_WUSER_WIDTH	=> C_S00_AXI_WUSER_WIDTH,
		C_S_AXI_RUSER_WIDTH	=> C_S00_AXI_RUSER_WIDTH,
		C_S_AXI_BUSER_WIDTH	=> C_S00_AXI_BUSER_WIDTH
	)
	port map (
        GPIO_IN     => GPIO_IN,
        GPIO_OUT    => GPIO_OUT,
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWID	=> s00_axi_awid,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWLEN	=> s00_axi_awlen,
		S_AXI_AWSIZE	=> s00_axi_awsize,
		S_AXI_AWBURST	=> s00_axi_awburst,
		S_AXI_AWLOCK	=> s00_axi_awlock,
		S_AXI_AWCACHE	=> s00_axi_awcache,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWQOS	=> s00_axi_awqos,
		S_AXI_AWREGION	=> s00_axi_awregion,
		S_AXI_AWUSER	=> s00_axi_awuser,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WLAST	=> s00_axi_wlast,
		S_AXI_WUSER	=> s00_axi_wuser,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BID	=> s00_axi_bid,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BUSER	=> s00_axi_buser,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARID	=> s00_axi_arid,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARLEN	=> s00_axi_arlen,
		S_AXI_ARSIZE	=> s00_axi_arsize,
		S_AXI_ARBURST	=> s00_axi_arburst,
		S_AXI_ARLOCK	=> s00_axi_arlock,
		S_AXI_ARCACHE	=> s00_axi_arcache,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARQOS	=> s00_axi_arqos,
		S_AXI_ARREGION	=> s00_axi_arregion,
		S_AXI_ARUSER	=> s00_axi_aruser,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RID	=> s00_axi_rid,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RLAST	=> s00_axi_rlast,
		S_AXI_RUSER	=> s00_axi_ruser,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	);

    
    IN_OUT_000: if 000<GPIO_DEPTH generate
        GPIO_IN(000) <= GPIO_000_IN;
        GPIO_000_OUT <= GPIO_OUT(000);
    end generate IN_OUT_000;
    IN_OUT_001: if 001<GPIO_DEPTH generate
        GPIO_IN(001) <= GPIO_001_IN;
        GPIO_001_OUT <= GPIO_OUT(001);
    end generate IN_OUT_001;
    IN_OUT_002: if 002<GPIO_DEPTH generate
        GPIO_IN(002) <= GPIO_002_IN;
        GPIO_002_OUT <= GPIO_OUT(002);
    end generate IN_OUT_002;
    IN_OUT_003: if 003<GPIO_DEPTH generate
        GPIO_IN(003) <= GPIO_003_IN;
        GPIO_003_OUT <= GPIO_OUT(003);
    end generate IN_OUT_003;
    IN_OUT_004: if 004<GPIO_DEPTH generate
        GPIO_IN(004) <= GPIO_004_IN;
        GPIO_004_OUT <= GPIO_OUT(004);
    end generate IN_OUT_004;
    IN_OUT_005: if 005<GPIO_DEPTH generate
        GPIO_IN(005) <= GPIO_005_IN;
        GPIO_005_OUT <= GPIO_OUT(005);
    end generate IN_OUT_005;
    IN_OUT_006: if 006<GPIO_DEPTH generate
        GPIO_IN(006) <= GPIO_006_IN;
        GPIO_006_OUT <= GPIO_OUT(006);
    end generate IN_OUT_006;
    IN_OUT_007: if 007<GPIO_DEPTH generate
        GPIO_IN(007) <= GPIO_007_IN;
        GPIO_007_OUT <= GPIO_OUT(007);
    end generate IN_OUT_007;
    IN_OUT_008: if 008<GPIO_DEPTH generate
        GPIO_IN(008) <= GPIO_008_IN;
        GPIO_008_OUT <= GPIO_OUT(008);
    end generate IN_OUT_008;
    IN_OUT_009: if 009<GPIO_DEPTH generate
        GPIO_IN(009) <= GPIO_009_IN;
        GPIO_009_OUT <= GPIO_OUT(009);
    end generate IN_OUT_009;
    IN_OUT_010: if 010<GPIO_DEPTH generate
        GPIO_IN(010) <= GPIO_010_IN;
        GPIO_010_OUT <= GPIO_OUT(010);
    end generate IN_OUT_010;
    IN_OUT_011: if 011<GPIO_DEPTH generate
        GPIO_IN(011) <= GPIO_011_IN;
        GPIO_011_OUT <= GPIO_OUT(011);
    end generate IN_OUT_011;
    IN_OUT_012: if 012<GPIO_DEPTH generate
        GPIO_IN(012) <= GPIO_012_IN;
        GPIO_012_OUT <= GPIO_OUT(012);
    end generate IN_OUT_012;
    IN_OUT_013: if 013<GPIO_DEPTH generate
        GPIO_IN(013) <= GPIO_013_IN;
        GPIO_013_OUT <= GPIO_OUT(013);
    end generate IN_OUT_013;
    IN_OUT_014: if 014<GPIO_DEPTH generate
        GPIO_IN(014) <= GPIO_014_IN;
        GPIO_014_OUT <= GPIO_OUT(014);
    end generate IN_OUT_014;
    IN_OUT_015: if 015<GPIO_DEPTH generate
        GPIO_IN(015) <= GPIO_015_IN;
        GPIO_015_OUT <= GPIO_OUT(015);
    end generate IN_OUT_015;
    IN_OUT_016: if 016<GPIO_DEPTH generate
        GPIO_IN(016) <= GPIO_016_IN;
        GPIO_016_OUT <= GPIO_OUT(016);
    end generate IN_OUT_016;
    IN_OUT_017: if 017<GPIO_DEPTH generate
        GPIO_IN(017) <= GPIO_017_IN;
        GPIO_017_OUT <= GPIO_OUT(017);
    end generate IN_OUT_017;
    IN_OUT_018: if 018<GPIO_DEPTH generate
        GPIO_IN(018) <= GPIO_018_IN;
        GPIO_018_OUT <= GPIO_OUT(018);
    end generate IN_OUT_018;
    IN_OUT_019: if 019<GPIO_DEPTH generate
        GPIO_IN(019) <= GPIO_019_IN;
        GPIO_019_OUT <= GPIO_OUT(019);
    end generate IN_OUT_019;
    IN_OUT_020: if 020<GPIO_DEPTH generate
        GPIO_IN(020) <= GPIO_020_IN;
        GPIO_020_OUT <= GPIO_OUT(020);
    end generate IN_OUT_020;
    IN_OUT_021: if 021<GPIO_DEPTH generate
        GPIO_IN(021) <= GPIO_021_IN;
        GPIO_021_OUT <= GPIO_OUT(021);
    end generate IN_OUT_021;
    IN_OUT_022: if 022<GPIO_DEPTH generate
        GPIO_IN(022) <= GPIO_022_IN;
        GPIO_022_OUT <= GPIO_OUT(022);
    end generate IN_OUT_022;
    IN_OUT_023: if 023<GPIO_DEPTH generate
        GPIO_IN(023) <= GPIO_023_IN;
        GPIO_023_OUT <= GPIO_OUT(023);
    end generate IN_OUT_023;
    IN_OUT_024: if 024<GPIO_DEPTH generate
        GPIO_IN(024) <= GPIO_024_IN;
        GPIO_024_OUT <= GPIO_OUT(024);
    end generate IN_OUT_024;
    IN_OUT_025: if 025<GPIO_DEPTH generate
        GPIO_IN(025) <= GPIO_025_IN;
        GPIO_025_OUT <= GPIO_OUT(025);
    end generate IN_OUT_025;
    IN_OUT_026: if 026<GPIO_DEPTH generate
        GPIO_IN(026) <= GPIO_026_IN;
        GPIO_026_OUT <= GPIO_OUT(026);
    end generate IN_OUT_026;
    IN_OUT_027: if 027<GPIO_DEPTH generate
        GPIO_IN(027) <= GPIO_027_IN;
        GPIO_027_OUT <= GPIO_OUT(027);
    end generate IN_OUT_027;
    IN_OUT_028: if 028<GPIO_DEPTH generate
        GPIO_IN(028) <= GPIO_028_IN;
        GPIO_028_OUT <= GPIO_OUT(028);
    end generate IN_OUT_028;
    IN_OUT_029: if 029<GPIO_DEPTH generate
        GPIO_IN(029) <= GPIO_029_IN;
        GPIO_029_OUT <= GPIO_OUT(029);
    end generate IN_OUT_029;
    IN_OUT_030: if 030<GPIO_DEPTH generate
        GPIO_IN(030) <= GPIO_030_IN;
        GPIO_030_OUT <= GPIO_OUT(030);
    end generate IN_OUT_030;
    IN_OUT_031: if 031<GPIO_DEPTH generate
        GPIO_IN(031) <= GPIO_031_IN;
        GPIO_031_OUT <= GPIO_OUT(031);
    end generate IN_OUT_031;
    IN_OUT_032: if 032<GPIO_DEPTH generate
        GPIO_IN(032) <= GPIO_032_IN;
        GPIO_032_OUT <= GPIO_OUT(032);
    end generate IN_OUT_032;
    IN_OUT_033: if 033<GPIO_DEPTH generate
        GPIO_IN(033) <= GPIO_033_IN;
        GPIO_033_OUT <= GPIO_OUT(033);
    end generate IN_OUT_033;
    IN_OUT_034: if 034<GPIO_DEPTH generate
        GPIO_IN(034) <= GPIO_034_IN;
        GPIO_034_OUT <= GPIO_OUT(034);
    end generate IN_OUT_034;
    IN_OUT_035: if 035<GPIO_DEPTH generate
        GPIO_IN(035) <= GPIO_035_IN;
        GPIO_035_OUT <= GPIO_OUT(035);
    end generate IN_OUT_035;
    IN_OUT_036: if 036<GPIO_DEPTH generate
        GPIO_IN(036) <= GPIO_036_IN;
        GPIO_036_OUT <= GPIO_OUT(036);
    end generate IN_OUT_036;
    IN_OUT_037: if 037<GPIO_DEPTH generate
        GPIO_IN(037) <= GPIO_037_IN;
        GPIO_037_OUT <= GPIO_OUT(037);
    end generate IN_OUT_037;
    IN_OUT_038: if 038<GPIO_DEPTH generate
        GPIO_IN(038) <= GPIO_038_IN;
        GPIO_038_OUT <= GPIO_OUT(038);
    end generate IN_OUT_038;
    IN_OUT_039: if 039<GPIO_DEPTH generate
        GPIO_IN(039) <= GPIO_039_IN;
        GPIO_039_OUT <= GPIO_OUT(039);
    end generate IN_OUT_039;
    IN_OUT_040: if 040<GPIO_DEPTH generate
        GPIO_IN(040) <= GPIO_040_IN;
        GPIO_040_OUT <= GPIO_OUT(040);
    end generate IN_OUT_040;
    IN_OUT_041: if 041<GPIO_DEPTH generate
        GPIO_IN(041) <= GPIO_041_IN;
        GPIO_041_OUT <= GPIO_OUT(041);
    end generate IN_OUT_041;
    IN_OUT_042: if 042<GPIO_DEPTH generate
        GPIO_IN(042) <= GPIO_042_IN;
        GPIO_042_OUT <= GPIO_OUT(042);
    end generate IN_OUT_042;
    IN_OUT_043: if 043<GPIO_DEPTH generate
        GPIO_IN(043) <= GPIO_043_IN;
        GPIO_043_OUT <= GPIO_OUT(043);
    end generate IN_OUT_043;
    IN_OUT_044: if 044<GPIO_DEPTH generate
        GPIO_IN(044) <= GPIO_044_IN;
        GPIO_044_OUT <= GPIO_OUT(044);
    end generate IN_OUT_044;
    IN_OUT_045: if 045<GPIO_DEPTH generate
        GPIO_IN(045) <= GPIO_045_IN;
        GPIO_045_OUT <= GPIO_OUT(045);
    end generate IN_OUT_045;
    IN_OUT_046: if 046<GPIO_DEPTH generate
        GPIO_IN(046) <= GPIO_046_IN;
        GPIO_046_OUT <= GPIO_OUT(046);
    end generate IN_OUT_046;
    IN_OUT_047: if 047<GPIO_DEPTH generate
        GPIO_IN(047) <= GPIO_047_IN;
        GPIO_047_OUT <= GPIO_OUT(047);
    end generate IN_OUT_047;
    IN_OUT_048: if 048<GPIO_DEPTH generate
        GPIO_IN(048) <= GPIO_048_IN;
        GPIO_048_OUT <= GPIO_OUT(048);
    end generate IN_OUT_048;
    IN_OUT_049: if 049<GPIO_DEPTH generate
        GPIO_IN(049) <= GPIO_049_IN;
        GPIO_049_OUT <= GPIO_OUT(049);
    end generate IN_OUT_049;
    IN_OUT_050: if 050<GPIO_DEPTH generate
        GPIO_IN(050) <= GPIO_050_IN;
        GPIO_050_OUT <= GPIO_OUT(050);
    end generate IN_OUT_050;
    IN_OUT_051: if 051<GPIO_DEPTH generate
        GPIO_IN(051) <= GPIO_051_IN;
        GPIO_051_OUT <= GPIO_OUT(051);
    end generate IN_OUT_051;
    IN_OUT_052: if 052<GPIO_DEPTH generate
        GPIO_IN(052) <= GPIO_052_IN;
        GPIO_052_OUT <= GPIO_OUT(052);
    end generate IN_OUT_052;
    IN_OUT_053: if 053<GPIO_DEPTH generate
        GPIO_IN(053) <= GPIO_053_IN;
        GPIO_053_OUT <= GPIO_OUT(053);
    end generate IN_OUT_053;
    IN_OUT_054: if 054<GPIO_DEPTH generate
        GPIO_IN(054) <= GPIO_054_IN;
        GPIO_054_OUT <= GPIO_OUT(054);
    end generate IN_OUT_054;
    IN_OUT_055: if 055<GPIO_DEPTH generate
        GPIO_IN(055) <= GPIO_055_IN;
        GPIO_055_OUT <= GPIO_OUT(055);
    end generate IN_OUT_055;
    IN_OUT_056: if 056<GPIO_DEPTH generate
        GPIO_IN(056) <= GPIO_056_IN;
        GPIO_056_OUT <= GPIO_OUT(056);
    end generate IN_OUT_056;
    IN_OUT_057: if 057<GPIO_DEPTH generate
        GPIO_IN(057) <= GPIO_057_IN;
        GPIO_057_OUT <= GPIO_OUT(057);
    end generate IN_OUT_057;
    IN_OUT_058: if 058<GPIO_DEPTH generate
        GPIO_IN(058) <= GPIO_058_IN;
        GPIO_058_OUT <= GPIO_OUT(058);
    end generate IN_OUT_058;
    IN_OUT_059: if 059<GPIO_DEPTH generate
        GPIO_IN(059) <= GPIO_059_IN;
        GPIO_059_OUT <= GPIO_OUT(059);
    end generate IN_OUT_059;
    IN_OUT_060: if 060<GPIO_DEPTH generate
        GPIO_IN(060) <= GPIO_060_IN;
        GPIO_060_OUT <= GPIO_OUT(060);
    end generate IN_OUT_060;
    IN_OUT_061: if 061<GPIO_DEPTH generate
        GPIO_IN(061) <= GPIO_061_IN;
        GPIO_061_OUT <= GPIO_OUT(061);
    end generate IN_OUT_061;
    IN_OUT_062: if 062<GPIO_DEPTH generate
        GPIO_IN(062) <= GPIO_062_IN;
        GPIO_062_OUT <= GPIO_OUT(062);
    end generate IN_OUT_062;
    IN_OUT_063: if 063<GPIO_DEPTH generate
        GPIO_IN(063) <= GPIO_063_IN;
        GPIO_063_OUT <= GPIO_OUT(063);
    end generate IN_OUT_063;
    IN_OUT_064: if 064<GPIO_DEPTH generate
        GPIO_IN(064) <= GPIO_064_IN;
        GPIO_064_OUT <= GPIO_OUT(064);
    end generate IN_OUT_064;
    IN_OUT_065: if 065<GPIO_DEPTH generate
        GPIO_IN(065) <= GPIO_065_IN;
        GPIO_065_OUT <= GPIO_OUT(065);
    end generate IN_OUT_065;
    IN_OUT_066: if 066<GPIO_DEPTH generate
        GPIO_IN(066) <= GPIO_066_IN;
        GPIO_066_OUT <= GPIO_OUT(066);
    end generate IN_OUT_066;
    IN_OUT_067: if 067<GPIO_DEPTH generate
        GPIO_IN(067) <= GPIO_067_IN;
        GPIO_067_OUT <= GPIO_OUT(067);
    end generate IN_OUT_067;
    IN_OUT_068: if 068<GPIO_DEPTH generate
        GPIO_IN(068) <= GPIO_068_IN;
        GPIO_068_OUT <= GPIO_OUT(068);
    end generate IN_OUT_068;
    IN_OUT_069: if 069<GPIO_DEPTH generate
        GPIO_IN(069) <= GPIO_069_IN;
        GPIO_069_OUT <= GPIO_OUT(069);
    end generate IN_OUT_069;
    IN_OUT_070: if 070<GPIO_DEPTH generate
        GPIO_IN(070) <= GPIO_070_IN;
        GPIO_070_OUT <= GPIO_OUT(070);
    end generate IN_OUT_070;
    IN_OUT_071: if 071<GPIO_DEPTH generate
        GPIO_IN(071) <= GPIO_071_IN;
        GPIO_071_OUT <= GPIO_OUT(071);
    end generate IN_OUT_071;
    IN_OUT_072: if 072<GPIO_DEPTH generate
        GPIO_IN(072) <= GPIO_072_IN;
        GPIO_072_OUT <= GPIO_OUT(072);
    end generate IN_OUT_072;
    IN_OUT_073: if 073<GPIO_DEPTH generate
        GPIO_IN(073) <= GPIO_073_IN;
        GPIO_073_OUT <= GPIO_OUT(073);
    end generate IN_OUT_073;
    IN_OUT_074: if 074<GPIO_DEPTH generate
        GPIO_IN(074) <= GPIO_074_IN;
        GPIO_074_OUT <= GPIO_OUT(074);
    end generate IN_OUT_074;
    IN_OUT_075: if 075<GPIO_DEPTH generate
        GPIO_IN(075) <= GPIO_075_IN;
        GPIO_075_OUT <= GPIO_OUT(075);
    end generate IN_OUT_075;
    IN_OUT_076: if 076<GPIO_DEPTH generate
        GPIO_IN(076) <= GPIO_076_IN;
        GPIO_076_OUT <= GPIO_OUT(076);
    end generate IN_OUT_076;
    IN_OUT_077: if 077<GPIO_DEPTH generate
        GPIO_IN(077) <= GPIO_077_IN;
        GPIO_077_OUT <= GPIO_OUT(077);
    end generate IN_OUT_077;
    IN_OUT_078: if 078<GPIO_DEPTH generate
        GPIO_IN(078) <= GPIO_078_IN;
        GPIO_078_OUT <= GPIO_OUT(078);
    end generate IN_OUT_078;
    IN_OUT_079: if 079<GPIO_DEPTH generate
        GPIO_IN(079) <= GPIO_079_IN;
        GPIO_079_OUT <= GPIO_OUT(079);
    end generate IN_OUT_079;
    IN_OUT_080: if 080<GPIO_DEPTH generate
        GPIO_IN(080) <= GPIO_080_IN;
        GPIO_080_OUT <= GPIO_OUT(080);
    end generate IN_OUT_080;
    IN_OUT_081: if 081<GPIO_DEPTH generate
        GPIO_IN(081) <= GPIO_081_IN;
        GPIO_081_OUT <= GPIO_OUT(081);
    end generate IN_OUT_081;
    IN_OUT_082: if 082<GPIO_DEPTH generate
        GPIO_IN(082) <= GPIO_082_IN;
        GPIO_082_OUT <= GPIO_OUT(082);
    end generate IN_OUT_082;
    IN_OUT_083: if 083<GPIO_DEPTH generate
        GPIO_IN(083) <= GPIO_083_IN;
        GPIO_083_OUT <= GPIO_OUT(083);
    end generate IN_OUT_083;
    IN_OUT_084: if 084<GPIO_DEPTH generate
        GPIO_IN(084) <= GPIO_084_IN;
        GPIO_084_OUT <= GPIO_OUT(084);
    end generate IN_OUT_084;
    IN_OUT_085: if 085<GPIO_DEPTH generate
        GPIO_IN(085) <= GPIO_085_IN;
        GPIO_085_OUT <= GPIO_OUT(085);
    end generate IN_OUT_085;
    IN_OUT_086: if 086<GPIO_DEPTH generate
        GPIO_IN(086) <= GPIO_086_IN;
        GPIO_086_OUT <= GPIO_OUT(086);
    end generate IN_OUT_086;
    IN_OUT_087: if 087<GPIO_DEPTH generate
        GPIO_IN(087) <= GPIO_087_IN;
        GPIO_087_OUT <= GPIO_OUT(087);
    end generate IN_OUT_087;
    IN_OUT_088: if 088<GPIO_DEPTH generate
        GPIO_IN(088) <= GPIO_088_IN;
        GPIO_088_OUT <= GPIO_OUT(088);
    end generate IN_OUT_088;
    IN_OUT_089: if 089<GPIO_DEPTH generate
        GPIO_IN(089) <= GPIO_089_IN;
        GPIO_089_OUT <= GPIO_OUT(089);
    end generate IN_OUT_089;
    IN_OUT_090: if 090<GPIO_DEPTH generate
        GPIO_IN(090) <= GPIO_090_IN;
        GPIO_090_OUT <= GPIO_OUT(090);
    end generate IN_OUT_090;
    IN_OUT_091: if 091<GPIO_DEPTH generate
        GPIO_IN(091) <= GPIO_091_IN;
        GPIO_091_OUT <= GPIO_OUT(091);
    end generate IN_OUT_091;
    IN_OUT_092: if 092<GPIO_DEPTH generate
        GPIO_IN(092) <= GPIO_092_IN;
        GPIO_092_OUT <= GPIO_OUT(092);
    end generate IN_OUT_092;
    IN_OUT_093: if 093<GPIO_DEPTH generate
        GPIO_IN(093) <= GPIO_093_IN;
        GPIO_093_OUT <= GPIO_OUT(093);
    end generate IN_OUT_093;
    IN_OUT_094: if 094<GPIO_DEPTH generate
        GPIO_IN(094) <= GPIO_094_IN;
        GPIO_094_OUT <= GPIO_OUT(094);
    end generate IN_OUT_094;
    IN_OUT_095: if 095<GPIO_DEPTH generate
        GPIO_IN(095) <= GPIO_095_IN;
        GPIO_095_OUT <= GPIO_OUT(095);
    end generate IN_OUT_095;
    IN_OUT_096: if 096<GPIO_DEPTH generate
        GPIO_IN(096) <= GPIO_096_IN;
        GPIO_096_OUT <= GPIO_OUT(096);
    end generate IN_OUT_096;
    IN_OUT_097: if 097<GPIO_DEPTH generate
        GPIO_IN(097) <= GPIO_097_IN;
        GPIO_097_OUT <= GPIO_OUT(097);
    end generate IN_OUT_097;
    IN_OUT_098: if 098<GPIO_DEPTH generate
        GPIO_IN(098) <= GPIO_098_IN;
        GPIO_098_OUT <= GPIO_OUT(098);
    end generate IN_OUT_098;
    IN_OUT_099: if 099<GPIO_DEPTH generate
        GPIO_IN(099) <= GPIO_099_IN;
        GPIO_099_OUT <= GPIO_OUT(099);
    end generate IN_OUT_099;
    IN_OUT_100: if 100<GPIO_DEPTH generate
        GPIO_IN(100) <= GPIO_100_IN;
        GPIO_100_OUT <= GPIO_OUT(100);
    end generate IN_OUT_100;
    IN_OUT_101: if 101<GPIO_DEPTH generate
        GPIO_IN(101) <= GPIO_101_IN;
        GPIO_101_OUT <= GPIO_OUT(101);
    end generate IN_OUT_101;
    IN_OUT_102: if 102<GPIO_DEPTH generate
        GPIO_IN(102) <= GPIO_102_IN;
        GPIO_102_OUT <= GPIO_OUT(102);
    end generate IN_OUT_102;
    IN_OUT_103: if 103<GPIO_DEPTH generate
        GPIO_IN(103) <= GPIO_103_IN;
        GPIO_103_OUT <= GPIO_OUT(103);
    end generate IN_OUT_103;
    IN_OUT_104: if 104<GPIO_DEPTH generate
        GPIO_IN(104) <= GPIO_104_IN;
        GPIO_104_OUT <= GPIO_OUT(104);
    end generate IN_OUT_104;
    IN_OUT_105: if 105<GPIO_DEPTH generate
        GPIO_IN(105) <= GPIO_105_IN;
        GPIO_105_OUT <= GPIO_OUT(105);
    end generate IN_OUT_105;
    IN_OUT_106: if 106<GPIO_DEPTH generate
        GPIO_IN(106) <= GPIO_106_IN;
        GPIO_106_OUT <= GPIO_OUT(106);
    end generate IN_OUT_106;
    IN_OUT_107: if 107<GPIO_DEPTH generate
        GPIO_IN(107) <= GPIO_107_IN;
        GPIO_107_OUT <= GPIO_OUT(107);
    end generate IN_OUT_107;
    IN_OUT_108: if 108<GPIO_DEPTH generate
        GPIO_IN(108) <= GPIO_108_IN;
        GPIO_108_OUT <= GPIO_OUT(108);
    end generate IN_OUT_108;
    IN_OUT_109: if 109<GPIO_DEPTH generate
        GPIO_IN(109) <= GPIO_109_IN;
        GPIO_109_OUT <= GPIO_OUT(109);
    end generate IN_OUT_109;
    IN_OUT_110: if 110<GPIO_DEPTH generate
        GPIO_IN(110) <= GPIO_110_IN;
        GPIO_110_OUT <= GPIO_OUT(110);
    end generate IN_OUT_110;
    IN_OUT_111: if 111<GPIO_DEPTH generate
        GPIO_IN(111) <= GPIO_111_IN;
        GPIO_111_OUT <= GPIO_OUT(111);
    end generate IN_OUT_111;
    IN_OUT_112: if 112<GPIO_DEPTH generate
        GPIO_IN(112) <= GPIO_112_IN;
        GPIO_112_OUT <= GPIO_OUT(112);
    end generate IN_OUT_112;
    IN_OUT_113: if 113<GPIO_DEPTH generate
        GPIO_IN(113) <= GPIO_113_IN;
        GPIO_113_OUT <= GPIO_OUT(113);
    end generate IN_OUT_113;
    IN_OUT_114: if 114<GPIO_DEPTH generate
        GPIO_IN(114) <= GPIO_114_IN;
        GPIO_114_OUT <= GPIO_OUT(114);
    end generate IN_OUT_114;
    IN_OUT_115: if 115<GPIO_DEPTH generate
        GPIO_IN(115) <= GPIO_115_IN;
        GPIO_115_OUT <= GPIO_OUT(115);
    end generate IN_OUT_115;
    IN_OUT_116: if 116<GPIO_DEPTH generate
        GPIO_IN(116) <= GPIO_116_IN;
        GPIO_116_OUT <= GPIO_OUT(116);
    end generate IN_OUT_116;
    IN_OUT_117: if 117<GPIO_DEPTH generate
        GPIO_IN(117) <= GPIO_117_IN;
        GPIO_117_OUT <= GPIO_OUT(117);
    end generate IN_OUT_117;
    IN_OUT_118: if 118<GPIO_DEPTH generate
        GPIO_IN(118) <= GPIO_118_IN;
        GPIO_118_OUT <= GPIO_OUT(118);
    end generate IN_OUT_118;
    IN_OUT_119: if 119<GPIO_DEPTH generate
        GPIO_IN(119) <= GPIO_119_IN;
        GPIO_119_OUT <= GPIO_OUT(119);
    end generate IN_OUT_119;
    IN_OUT_120: if 120<GPIO_DEPTH generate
        GPIO_IN(120) <= GPIO_120_IN;
        GPIO_120_OUT <= GPIO_OUT(120);
    end generate IN_OUT_120;
    IN_OUT_121: if 121<GPIO_DEPTH generate
        GPIO_IN(121) <= GPIO_121_IN;
        GPIO_121_OUT <= GPIO_OUT(121);
    end generate IN_OUT_121;
    IN_OUT_122: if 122<GPIO_DEPTH generate
        GPIO_IN(122) <= GPIO_122_IN;
        GPIO_122_OUT <= GPIO_OUT(122);
    end generate IN_OUT_122;
    IN_OUT_123: if 123<GPIO_DEPTH generate
        GPIO_IN(123) <= GPIO_123_IN;
        GPIO_123_OUT <= GPIO_OUT(123);
    end generate IN_OUT_123;
    IN_OUT_124: if 124<GPIO_DEPTH generate
        GPIO_IN(124) <= GPIO_124_IN;
        GPIO_124_OUT <= GPIO_OUT(124);
    end generate IN_OUT_124;
    IN_OUT_125: if 125<GPIO_DEPTH generate
        GPIO_IN(125) <= GPIO_125_IN;
        GPIO_125_OUT <= GPIO_OUT(125);
    end generate IN_OUT_125;
    IN_OUT_126: if 126<GPIO_DEPTH generate
        GPIO_IN(126) <= GPIO_126_IN;
        GPIO_126_OUT <= GPIO_OUT(126);
    end generate IN_OUT_126;
    IN_OUT_127: if 127<GPIO_DEPTH generate
        GPIO_IN(127) <= GPIO_127_IN;
        GPIO_127_OUT <= GPIO_OUT(127);
    end generate IN_OUT_127;
    
end arch_imp;
