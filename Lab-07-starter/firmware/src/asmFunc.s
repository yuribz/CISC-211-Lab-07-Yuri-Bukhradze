/*** asmFunc.s   ***/
/* Tell the assembler to allow both 16b and 32b extended Thumb instructions */
.syntax unified

#include <xc.h>

/* Tell the assembler that what follows is in data memory    */
.data
.align
 
/* define and initialize global variables that C can access */

.global a_value,b_value
.type a_value,%gnu_unique_object
.type b_value,%gnu_unique_object

/* NOTE! These are only initialized ONCE, right before the program runs.
 * If you want these to be 0 every time asmFunc gets called, you must set
 * them to 0 at the start of your code!
 */
a_value:          .word     0  
b_value:           .word     0  

 /* Tell the assembler that what follows is in instruction memory    */
.text
.align

    
/********************************************************************
function name: asmFunc
function description:
     output = asmFunc ()
     
where:
     output: 
     
     function description: The C call ..........
     
     notes:
        None
          
********************************************************************/    
.global asmFunc
.type asmFunc,%function
asmFunc:   

    /* save the caller's registers, as required by the ARM calling convention */
    push {r4-r11,LR}
 
.if 0
    /* profs test code. */
    mov r0,r0
.endif
    
    /** note to profs: asmFunc.s solution is in Canvas at:
     *    Canvas Files->
     *        Lab Files and Coding Examples->
     *            Lab 5 Division
     * Use it to test the C test code */
    
    /*** STUDENTS: Place your code BELOW this line!!! **************/
    
    /***
     r1 is for Ra, where value for A starts.
     r2 is for Rb, where value for B starts.
     r3 is for A's final value.
     r4 is for B's final value.
     r5 is for memory addresses.
     
    ***/
    
    mov r1, r0 /* Save A to a separate register */
    mov r2, r0 /* Save B to a separate register */
    
    /* Set a name for 16 bit shift, for clarity */
    .equ HALFWORD, 16
    
    /* Let's start with A */
    
    ASR r3, r1, HALFWORD /* Arithmetic shift (sign extension) 16 times to r3.*/
    LDR r5, =a_value /* Get memory address for a_value */
    STR r3, [r5] /* Store unpacked A to memory */
    
    /* Let's do B */
    
    LSL r4, r2, HALFWORD /* Logical shift left 16 times to move LSB to MSB */
    ASR r4, r4, HALFWORD /* Arithmetic shift right 16 times to extend the sign */
    LDR r5, =b_value /* Get memory address for b_value */
    STR r4, [r5] /* Store unpacked B to memory */
    
    /* Done */
    
    
    /*** STUDENTS: Place your code ABOVE this line!!! **************/

done:    
    /* restore the caller's registers, as required by the 
     * ARM calling convention 
     */
    mov r0,r0 /* these are do-nothing lines to deal with IDE mem display bug */
    mov r0,r0 /* this is a do-nothing line to deal with IDE mem display bug */

screen_shot:    pop {r4-r11,LR}

    mov pc, lr	 /* asmFunc return to caller */
   

/**********************************************************************/   
.end  /* The assembler will not process anything after this directive!!! */
           




