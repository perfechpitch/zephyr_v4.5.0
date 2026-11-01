/* SPDX-FileCopyrightText: Copyright The Zephyr Project Contributors */
/* SPDX-License-Identifier: Apache-2.0 */

#include <zephyr/toolchain.h>
#include <zephyr/linker/sections.h>

_ASM_FILE_PROLOGUE

GTEXT(soc_early_reset_hook)

SECTION_FUNC(TEXT, soc_early_reset_hook)
	/* Enable ITCM and DTCM before Zephyr places its stack in DTCM. */
	ldr r0, =0xe000ef90
	ldr r1, [r0]
	orr r1, r1, #1
	str r1, [r0]
	ldr r0, =0xe000ef94
	ldr r1, [r0]
	orr r1, r1, #1
	str r1, [r0]
	dsb
	isb
	bx lr
