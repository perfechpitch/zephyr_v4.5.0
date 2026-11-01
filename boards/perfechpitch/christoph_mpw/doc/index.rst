.. SPDX-FileCopyrightText: Copyright The Zephyr Project Contributors
.. SPDX-License-Identifier: Apache-2.0

.. zephyr:board:: christoph_mpw

Overview
********

The Christoph MPW board uses a Cortex-M7 core. This initial board definition
places executable code in the 256 KiB ITCM at address ``0x00000000`` and data
in the 256 KiB DTCM at address ``0x20000000``.

Hardware
********

The SoC also provides 256 KiB of shared RAM at ``0x20200000``. UART0 is at
``0x40411000`` with NVIC interrupt 5. The Cortex-M7 clock is configured as
1 GHz and the DesignWare UART input clock as 25 MHz. UART0 uses 115200 baud.

Building
********

In a west workspace, build the hello_world sample with:

.. zephyr-app-commands::
   :zephyr-app: samples/hello_world
   :board: christoph_mpw
   :goals: build

Programming and Debugging
*************************

The build produces ``zephyr.bin`` and ``zephyr.elf``. The binary contains the
image for ITCM address ``0x00000000``, including the initial contents copied to
DTCM by Zephyr startup. The vector table begins at ``0x00000000``. The loader
must make ITCM visible there before starting the reset handler. The reset
handler enables ITCM and DTCM before using the DTCM stack.

The board has no Zephyr flash runner. The boot environment must configure the
1 GHz core clock and 25 MHz UART clock, release UART0 from reset, and route its
pins before UART console output is available.
