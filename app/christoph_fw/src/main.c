/* SPDX-FileCopyrightText: Copyright The Zephyr Project Contributors */
/* SPDX-License-Identifier: Apache-2.0 */

#include <stdbool.h>

#include <zephyr/kernel.h>
#include <zephyr/sys/printk.h>

int main(void)
{
	printk("Christoph firmware started on %s\n", CONFIG_BOARD_TARGET);

	while (true) {
		k_sleep(K_SECONDS(1));
		printk("Christoph firmware heartbeat\n");
	}

	return 0;
}
