/*
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
*/

/*SECTIONS {
	.memory : {
		. = 0x10000;
		start*(.text);
		*(.text);
		*(*);
		end = .;
	}
}
*/

SECTIONS {
    /* Define program memory */
    .text : {
        . = 0x10000;            /* Start of program memory */
        start = .;              /* Save the start address of the program */
        *(.text);               /* Include all text/code sections */
        *(.rodata);             /* Include read-only data */
        end_of_text = .;        /* Mark end of text section */
    } > MEMORY

    /* Define initialized data */
    .data : {
        . = ALIGN(4);
        start_of_data = .;      /* Start of data section */
        *(.data);               /* Include all initialized data */
        *(.sdata);              /* Small initialized data */
        end_of_data = .;        /* Mark end of data section */
    } > MEMORY

    /* Define uninitialized data */
    .bss : {
        . = ALIGN(4);
        start_of_bss = .;       /* Start of BSS (zero-initialized) section */
        *(.bss);                /* Include all uninitialized data */
        *(.sbss);               /* Small uninitialized data */
        end_of_bss = .;         /* Mark end of BSS section */
    } > MEMORY

    /* Define image data region */
    .image_data : {
        . = 0x30000;            /* Fixed address for image data */
        start_of_image_data = .; 
        *(.image_data);         /* Placeholder for image-specific symbols */
        end_of_image_data = .; 
    } > MEMORY

    /* Define stack */
    .stack : {
        . = ALIGN(8);
        start_of_stack = .;     /* Start of stack */
        . += 0x1000;            /* Allocate 4KB for the stack */
        end_of_stack = .;
    } > MEMORY
}

