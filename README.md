bcc_s6_lib
==========

This project provides a user-space application for configuring the Blank Canvas Cape Spartan 6 (BCC S6), a Beaglebone cape which provides a Xilinx Spartan 6 FPGA connected to the Beaglebone I/O connectors. Find out more details about the BCC S6 here:

http://ebrombaugh.studionebula.com/embedded/bcc_s6/index.html

In addition to the application, an underlying interface library is also provided which facilitates creation of additional applications for interfacing to the FPGA via the SPI interface.

Building & Installing
=====================

In order to build/install the bcc_tool do the following.

Clone the repository

cd to the directory containing the source files

Build the files: $ make

bcc_tool
This is the application. Usage is as follows:

bcc_tool [-a addr][-r addr][-w addr data][-v][-V] [BITSTREAM]

BITSTREAM is a file containing the FPGA bitstream to download to the FPGA or configuration flash. With no other options the application will quietly configure the FPGA with the contents of BITSTREAM.

-a address the BCC S6 at cape address <addr> where <addr> is 0-3

This option allows multiple BCC S6 boards to be connected to a single BBB, each addressed uniquely

-r read SPI control port at addr

This option allows a quick check of SPI communications with the SPI slave port in the FPGA by reading from the slave port at the provided address. This can also be used to check status and results from any functions attached to the SPI slave.

-w write SPI control port at addr w/ data

This option allows a quick check of SPI communications with the SPI slave port in the FPGA by writing data to a specific address. This can also be used to control & configure any functions that are attached to the SPI slave.

-v enables verbose progress messages

This option provides detailed progress information on the process of communicating with the FPGA. Use this to debug any problems with the application.

-V prints the tool version

bcc_lib
=======

This is the underlying access library which provides all the interfaces needed to configure the FPGA, program the SPI flash configuration memory and communicate with the SPI slave. The following functions are available:

int bcc_i2c_get_prom(bfpga *s, int saddr, __u8 loc);

int bcc_i2c_set_prom(bfpga *s, int saddr, __u8 loc, __u8 dat);

int bcc_i2c_get(bfpga *s, int saddr);

int bcc_i2c_set(bfpga *s, int saddr, __u8 dat);

int bcc_i2c_pcf_rd(bfpga *s, int bit);

void bcc_i2c_pcf_wr(bfpga *s, int bit, int val);

int bcc_spi_txrx(bfpga *s, uint8_t *tx, uint8_t *rx, __u32 len);

bfpga *bcc_init(int i2c_bus, int spi_bus, int spi_add, int verbose);

FILE *bfpga_open_bitfile(bfpga *s, char *bitfile, long *n);

int bcc_cfg(bfpga *s, char *bitfile);

int bcc_pgm(bfpga *s, char *bitfile);

void bcc_delete(bfpga *s);

Usage details can be inferred from the source.

E. Brombaugh 03-25-2014