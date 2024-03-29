/* 
 * CS:APP Data Lab 
 * 
 * <Please put your name and userid here>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function. 
     The max operator count is checked by dlc. Note that '=' is not 
     counted; you may use as many of these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
/* Copyright (C) 1991-2022 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses Unicode 10.0.0.  Version 10.0 of the Unicode Standard is
   synchronized with ISO/IEC 10646:2017, fifth edition, plus
   the following additions from Amendment 1 to the fifth edition:
   - 56 emoji characters
   - 285 hentaigana
   - 3 additional Zanabazar Square characters */
/* 
 * bitXnor - ~(x^y) using only ~ and | 
 *   Example: bitXnor(6, -5) = 2
 *   Legal ops: ~ |
 *   Max ops: 7
 *   Rating: 1
 */
int bitXnor(int x, int y) {
  /* x Xnor y = (x == y == 0 | x == y == 1) = (x&y | ~x&~y) */
  return ((~((~x)|(~y))) | (~(y|x)));
}
/* 
 * bitConditional - x ? y : z for each bit respectively
 *   Example: bitConditional(0b00110011, 0b01010101, 0b00001111) = 0b00011101
 *   Legal ops: & | ^ ~
 *   Max ops: 4
 *   Rating: 1
 */
int bitConditional(int x, int y, int z) {
  /* If y == z, output z = z ^ 0 = z ^ ((y ^ z) & ANY)
   * If y != z, output x ? y : z = x ? ~z : z = x ^ z = z ^ (x & 1)
   */
  return z ^ (x & (y ^ z));
}
/* 
 * byteSwap - swaps the nth byte and the mth byte
 *  Examples: byteSwap(0x12345678, 1, 3) = 0x56341278
 *            byteSwap(0xDEADBEEF, 0, 2) = 0xDEEFBEAD
 *  You may assume that 0 <= n <= 3, 0 <= m <= 3
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 16
 *  Rating: 2
 */
int byteSwap(int x, int n, int m) {
    /* m-th = m-th ^ (n-th ^ m-th)
     * n-th = n-th ^ (n-th ^ m-th)
     */
    int n8 = n << 3;
    int m8 = m << 3;
    int mth_xor_nth = ((x >> n8) ^ (x >> m8)) & 0xFF;
    x = x ^ ((mth_xor_nth << m8) | (mth_xor_nth << n8));
    return x;
}
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int logicalShift(int x, int n) {
  /* Use mask like 0..01..1 = ~1..10..0 = ~(1 << 31 >> ...)*/
  return (x >> n) & (~(((1 << 31) >> n) << 1));
}
/* 
 * cleanConsecutive1 - change any consecutive 1 to zeros in the binary form of x.
 *   Consecutive 1 means a set of 1 that contains more than one 1.
 *   Examples cleanConsecutive1(0x10) = 0x10
 *            cleanConsecutive1(0xF0) = 0x0
 *            cleanConsecutive1(0xFFFF0001) = 0x1
 *            cleanConsecutive1(0x4F4F4F4F) = 0x40404040
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 4
 */
int cleanConsecutive1(int x){
    /* Keep the 1s where x_i == 1 and (x << 1)_i == 0 and (x >>logic 1)_i == 0 */
    int lsx = x << 1;
    int rsx = (x >> 1) ^ (1 << 31);
    x = x & ~(lsx | rsx);
    return x;
}
/*
 * leftBitCount - returns count of number of consective 1's in
 *     left-hand (most significant) end of word.
 *   Examples: leftBitCount(-1) = 32, leftBitCount(0xFFF0F0F0) = 12
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 50
 *   Rating: 4
 */
int leftBitCount(int x) {
  /* Bisection method. Check half bits of x in left-hand 
   * whether they are all 1's.
   * If true, add the number of bits to ans;
   *        and take right-hand bits as new x
   * If false, take left-hand bits as new x
   */
  int ans = 0;
  int shift_num = 0;
  int top2_bits = 0;
  int left_num = 0;
  int right_num = 0;
  
  shift_num = !(~(x >> 16)) << 4;
  ans = ans + shift_num;
  x = x << shift_num;

  shift_num = !(~(x >> 24)) << 3;
  ans = ans + shift_num;
  x = x << shift_num;

  shift_num = !(~(x >> 28)) << 2;
  ans = ans + shift_num;
  x = x << shift_num;

  shift_num = !(~(x >> 30)) << 1;
  ans = ans + shift_num;
  x = x << shift_num;

  top2_bits = ((x >> 30) & 3);
  left_num = top2_bits >> 1;
  right_num = top2_bits & left_num;

  ans = ans + left_num + right_num;
  
  return ans;
}
/* 
 * counter1To5 - return 1 + x if x < 5, return 1 otherwise, we ensure that 1<=x<=5
 *   Examples counter1To5(2) = 3,  counter1To5(5) = 1
 *   Legal ops: ~ & ! | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int counter1To5(int x) {
  /* If x == 5, right shift x by more than 3, then add x by 1 */
  int is5 = (x + 3) & 0x8;
  return (x >> is5) + 1;
}
/* 
 * sameSign - return 1 if x and y have same sign, and 0 otherwise
 *   Examples sameSign(0x12345678, 0) = 1, sameSign(0xFFFFFFFF,0x1) = 0
 *   Legal ops: ! ~ & ! ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int sameSign(int x, int y) {
  /* Numbers with same sign has same highest bit number */
  return !((x ^ y) >> 31);
}
/*
 * satMul3 - multiplies by 3, saturating to Tmin or Tmax if overflow
 *  Examples: satMul3(0x10000000) = 0x30000000
 *            satMul3(0x30000000) = 0x7FFFFFFF (Saturate to TMax)
 *            satMul3(0x70000000) = 0x7FFFFFFF (Saturate to TMax)
 *            satMul3(0xD0000000) = 0x80000000 (Saturate to TMin)
 *            satMul3(0xA0000000) = 0x80000000 (Saturate to TMin)
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 25
 *  Rating: 3
 */
int satMul3(int x) {
    /* Compare leftmost bit of x, 2x, 3x for overflow judgement
     * No overflow return 3x
     * Overflow return sign(x)=='+' ? Tmax : Tmin
     * Tmin = Tmax ^ -1 is used for N_ops optimization
     */
    int x2 = x << 1;
    int x3 = x + x2;
    int sgnx = x >> 31;
    int overflow = ((x ^ x2) | (x ^ x3)) >> 31;
    return (overflow | x3) ^ ((sgnx ^ (1 << 31)) & overflow);
}
/* 
 * isGreater - if x > y  then return 1, else return 0 
 *   Example: isGreater(4,5) = 0, isGreater(5,4) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isGreater(int x, int y) {
  /* Different signs: return sign(x) == 0
   * Same sign: return (x + ~y + 1) > 0. ie sign(x + ~y) == 0
   */
  int sign_diff = (x ^ y) >> 31;
  int x_sub_y = x + (~(y | sign_diff));
  return !(x_sub_y >> 31);
}
/* 
 * subOK - Determine if can compute x-y without overflow
 *   Example: subOK(0x80000000,0x80000000) = 1,
 *            subOK(0x80000000,0x70000000) = 0, 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3
 */
int subOK(int x, int y) {
  /* Sub not OK only when sign(x) != sign(y) and sign(x) != sign(x-y)*/
  int x_sub_y = x + ~y + 1;
  int overflow = ((x ^ y) & (x ^ x_sub_y)) >> 31;
  return !overflow;
}
/*
 * trueFiveEighths - multiplies by 5/8 rounding toward 0,
 *  avoiding errors due to overflow
 *  Examples: trueFiveEighths(11) = 6
 *            trueFiveEighths(-9) = -5
 *            trueFiveEighths(0x30000000) = 0x1E000000 (no overflow)
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 25
 *  Rating: 4
 */
int trueFiveEighths(int x)
{
    /* Divide by 8 first and then mult by 5 to avoid overflow */
    int x_div_8 = x >> 3;
    int r = x & 7;
    int sgnx = x >> 31;
    return x_div_8 + (x_div_8 << 2) + ((r + (r << 2) + ((sgnx & 7))) >> 3);
}
/* 
 * float_half - Return bit-level equivalent of expression 0.5*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_half(unsigned uf) {
  /* expo case
   * All 1's, ie inf or NaN, return uf
   * 0x01 or 0x00, right shift, round, determine the sign
   * Otherwise, expo = expo - 1
   */
  unsigned expo = (uf >> 23) & 0xFF;
  unsigned round = uf & 3;
  int sgnx = uf >> 31;
  if (expo == 0xFF) return uf;
  if (expo & 0xFE) return (uf - 0x00800000);
  uf = uf >> 1;
  if (round == 3) uf = uf + 1;
  if (sgnx) uf = uf + 0x40000000;
  return uf;
}
/* 
 * float_i2f - Return bit-level equivalent of expression (float) x
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_i2f(int x) {
  /* Convert to positive, do left shift to determine expo
   * Use lower 10 bits (after LS) to determine rounding
   * Finally add sign
   */
  unsigned sgnx = x & 0x80000000;
  unsigned absx = x;
  unsigned left_shift_cnt = 0;
  unsigned expo = 0;
  unsigned round = 0;
  if (x == 0) return 0;
  if (sgnx) absx = -x;
  while (!(absx & 0x80000000)) {
    absx = absx << 1;
    left_shift_cnt += 1;
  }
  absx = absx << 1;
  expo = 158 - left_shift_cnt;
  if ((absx & 0x1ff) > 0x100) round = 1;
  else if ((absx & 0x3ff) == 0x300) round = 1;
  return (sgnx + ((absx >> 9) + round) + (expo << 23));
}
/* 
 * float64_f2i - Return bit-level equivalent of expression (int) f
 *   for 64 bit floating point argument f.
 *   Argument is passed as two unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   double-precision floating point value.
 *   Notice: uf1 contains the lower part of the f64 f
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 20
 *   Rating: 4
 */
int float64_f2i(unsigned uf1, unsigned uf2) {
  /* Calculate sign, expo, frac from uf1, uf2
   * special case: expo < 0 or expo >= 31 (out of range or inf or NaN)
   */
  unsigned sgnx = uf2 >> 31;
  unsigned frac = ((uf2 & 0xFFFFF) << 10) | ((uf1 & 0xFFC00000) >> 22);
  int expo = ((uf2 >> 20) & 0x7FF) - 1023;
  if (expo < 0) return 0;
  if (expo >= 31) return 0x80000000u;
  frac = frac >> (30 - expo);
  frac = frac + (1 << expo);
  if (sgnx) frac = ~frac + 1;
  return frac;
}
/* 
 * float_negpwr2 - Return bit-level equivalent of the expression 2.0^-x
 *   (2.0 raised to the power -x) for any 32-bit integer x.
 *
 *   The unsigned value that is returned should have the identical bit
 *   representation as the single-precision floating-point number 2.0^-x.
 *   If the result is too small to be represented as a denorm, return
 *   0. If too large, return +INF.
 * 
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. Also if, while 
 *   Max ops: 20 
 *   Rating: 4
 */
unsigned float_negpwr2(int x) {
    /* 2.0 ^ x is represented in bits as
     * 0|expo|0...0, if x > -Bias
     * 0|0...0|0...010...0, if x <= -Bias
     * 0, if x < -(22 + Bias)
     * inf, if x > (254 - Bias)
     */
    int expo = 0;
    if (x > 149) return 0;
    if (x < -127) return 0x7F800000;
    expo = -x + 127;
    if (x < 127) return (expo << 23);
    return (1 << (expo + 22));
}
