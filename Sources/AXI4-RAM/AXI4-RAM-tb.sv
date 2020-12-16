`timescale 1ns/1ps

import axi_vip_pkg::*;
import AXI4_RAM_test_axi_vip_0_0_pkg::*;

module AXI4_RAM_tb();

AXI4_RAM_test_axi_vip_0_0_mst_t master;
bit aclk;
bit aresetn;
xil_axi_uint id;
xil_axi_ulong addr;
xil_axi_len_t len;
xil_axi_size_t size;
xil_axi_burst_t burst;
xil_axi_lock_t lock;
xil_axi_cache_t cache;
xil_axi_prot_t prot;
xil_axi_region_t region;
xil_axi_qos_t qos;
xil_axi_user_beat wuser;
xil_axi_data_beat [255:0] ruser;
bit [8*4096-1:0] wdata;
bit [8*4096-1:0] rdata;
xil_axi_resp_t [255:0] resp;
shortint i;

AXI4_RAM_test_wrapper UUT
(
    .aclk_0               (aclk),
    .aresetn_0            (aresetn)
);

// Clock
always #2ns aclk = ~aclk;

// Reset
initial begin
    aresetn = 0;
    #9ns
    aresetn = 1;
end

// Master
initial begin
    master = new("RAM Master", UUT.AXI4_RAM_test_i.axi_vip_0.inst.IF);
    master.start_master();
    #15ns
    id = 0;
    addr = 0;
    len = 127;
    size = XIL_AXI_SIZE_8BYTE;
    burst = XIL_AXI_BURST_TYPE_INCR;
    lock = XIL_AXI_ALOCK_NOLOCK;
    cache = 0;
    prot = 0;
    region = 0;
    qos = 0;
    wuser = 0;
    for (i = 0; i < 512; i++) begin
        wdata[i*16 +: 16] = i;
    end
    master.AXI4_WRITE_BURST(id, addr, len, size, burst, lock, cache, prot, region, qos, wuser, wdata, wuser, resp);
    #50ns
    id = 1;
    master.AXI4_READ_BURST(id, addr, len, size, burst, lock, cache, prot, region, qos, wuser, rdata, resp, ruser);
    #500ns
    for (i = 0; i < 512; i++) begin
        assert (rdata[i*16 +: 16] == i) else $display("Incorrect value in RAM. Expected 0x%x but received 0x%x", i, rdata[i*16 +: 16]);
    end
    #50ns
    id = 2;
    addr = 8;
    len = 0;
    size = XIL_AXI_SIZE_2BYTE;
    burst = XIL_AXI_BURST_TYPE_INCR;
    lock = XIL_AXI_ALOCK_NOLOCK;
    cache = 0;
    prot = 0;
    region = 0;
    qos = 0;
    wuser = 0;
    wdata[15:0] = 2048;
    master.AXI4_WRITE_BURST(id, addr, len, size, burst, lock, cache, prot, region, qos, wuser, wdata, wuser, resp);
    #50ns
    id = 3;
    #500ns
    master.AXI4_READ_BURST(id, addr, len, size, burst, lock, cache, prot, region, qos, wuser, rdata, resp, ruser);
    i = 2048;
    assert (rdata[15:0] == i) else $display("Incorrect value in RAM. Expected 0x%x but received 0x%x", 2048, rdata[15:0]);
end
endmodule
