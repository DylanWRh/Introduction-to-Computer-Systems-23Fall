# Bomblab Writeup

## Preview

<details>

用`gdb`打开炸弹程序
```
gdb -q bomb
```
插入断点
```
(gdb) b explode_bomb
(gdb) b phase_1
```
运行程序
```
(gdb) run
```
随便输入一个字符串，触发在函数`phase_1`所设置的断点
```
Starting program: /home/workspace/2-bomblab/bomb190/bomb

Welcome to Dr. Evil's little bomb. You have 6 phases with
which to blow yourself up. Have a nice day! Mua ha ha ha!
Love ICS!

Breakpoint 2, 0x000055681ebd87ad in phase_1 ()
```
查看对应函数的汇编代码
```
(gdb) disas
```
虽然利用`objdump`也可以进行反汇编，但是实际上有时需要知道寄存器`%rip`中的值，因此需要在运行时查看。利用`objdump`反汇编出的`bomb.s`文件则可用于便携查看不涉及`%rip`的函数，如`phase_1`中所调用的`strings_not_equal`。

</details>

## Phase 1

<details>

`phase_1`的汇编代码如下（略去了指令地址，后同）
```
Dump of assembler code for function phase_1:
   <+0>:     endbr64
   <+4>:     sub    $0x8,%rsp
   <+8>:     lea    0x2a54(%rip),%rsi
   <+15>:    call   <strings_not_equal>
   <+20>:    test   %eax,%eax
   <+22>:    jne    <phase_1+29>
   <+24>:    add    $0x8,%rsp
   <+28>:    ret
   <+29>:    call   <explode_bomb>
   <+34>:    jmp    <phase_1+24>
End of assembler dump.
```
`<phase_1+15>`所调用的`strings_not_equal`函数判断字符串是否相等，相等则返回`0`，否则返回`1`

只需使用`x`指令，并制定显示格式为字符串(`s`)，即可得到答案（此处`x`指令后的地址可由`*<phase_1+15>+0x2a54`计算得到，由于每次运行时均为不同的值，故并无参考价值，在此写出仅仅是为了体现指令的完整性，后面所有使用`x`指令的地方均同理）
```
(gdb) x/s 0x5568f12dc210
0x5568f12dc210: "Now I am become Death,The destroyer of worlds."
```

</details>

## Phase 2

<details>

`phase_2`的汇编代码如下
```
Dump of assembler code for function phase_2:
   <+0>:     endbr64
   <+4>:     push   %rbx
   <+5>:     sub    $0x20,%rsp
   <+9>:     mov    %fs:0x28,%rax
   <+18>:    mov    %rax,0x18(%rsp)
   <+23>:    xor    %eax,%eax
   <+25>:    mov    %rsp,%rsi
   <+28>:    call   <read_six_numbers>
   <+33>:    cmpl   $0x0,(%rsp)
   <+37>:    jne    <phase_2+46>
   <+39>:    cmpl   $0x1,0x4(%rsp)
   <+44>:    je     <phase_2+51>
   <+46>:    call   <explode_bomb>
   <+51>:    mov    $0x2,%ebx
   <+56>:    jmp    <phase_2+66>
   <+58>:    call   <explode_bomb>
   <+63>:    add    $0x1,%ebx
   <+66>:    cmp    $0x5,%ebx
   <+69>:    jg     <phase_2+102>
   <+71>:    movslq %ebx,%rax
   <+74>:    lea    -0x2(%rbx),%edx
   <+77>:    movslq %edx,%rdx
   <+80>:    mov    (%rsp,%rdx,4),%ecx
   <+83>:    lea    -0x1(%rbx),%edx
   <+86>:    movslq %edx,%rdx
   <+89>:    mov    (%rsp,%rdx,4),%edx
   <+92>:    lea    (%rdx,%rcx,2),%edx
   <+95>:    cmp    %edx,(%rsp,%rax,4)
   <+98>:    je     <phase_2+63>
   <+100>:   jmp    <phase_2+58>
   <+102>:   mov    0x18(%rsp),%rax
   <+107>:   xor    %fs:0x28,%rax
   <+116>:   jne    <phase_2+124>
   <+118>:   add    $0x20,%rsp
   <+122>:   pop    %rbx
   <+123>:   ret
   <+124>:   call   0x55c35a871280 <__stack_chk_fail@plt>
End of assembler dump.
```
`<phase_2+28>`所调用的`read_six_numbers`用于读入6个32位整数并存入内存中，地址分别为`(%rsp), 0x4(%rsp), 0x8(%rsp), 0xc(%rsp), 0x10(%rsp), 0x14(%rsp)`，若输入不符合6个整数的格式，则直接引爆炸弹

将这六个整数记为`x[6]`，则
- `<phase_2+33>`说明`x[0] = 0`
- `<phase_2+39>`说明`x[1] = 1`
- `<phase_2+51>~<phase_2+69>`体现了一个`for(int i=2; i<6; ++i)`的循环，`<phase_2+95>~<phase_2+100>`则体现了进入下一次循环或引爆炸弹的条件
- `<phase_2+74>~<phase_2+80>`将`x[i-2]`存入`%ecx`中
- `<phase_2+83>~<phase_2+89>`将`x[i-1]`存入`%edx`中
- `<phase_2+92>~<phase_2+100>`比较`x[i]`和`2 * x[i-2] + x[i-1]`的关系，若不相等则引爆

故答案为
```
0 1 1 3 5 11
```

</details>

## Phase 3

<details>

`phase_3`的汇编代码如下
```
Dump of assembler code for function phase_3:
   <+0>:     endbr64
   <+4>:     sub    $0x18,%rsp
   <+8>:     mov    %fs:0x28,%rax
   <+17>:    mov    %rax,0x8(%rsp)
   <+22>:    xor    %eax,%eax
   <+24>:    lea    0x4(%rsp),%rcx
   <+29>:    mov    %rsp,%rdx
   <+32>:    lea    0x2f51(%rip),%rsi
   <+39>:    call   <__isoc99_sscanf@plt>
   <+44>:    cmp    $0x1,%eax
   <+47>:    jle    <phase_3+76>
   <+49>:    mov    (%rsp),%eax
   <+52>:    cmp    $0x7,%eax
   <+55>:    ja     <phase_3+157>
   <+57>:    mov    %eax,%eax
   <+59>:    lea    0x2b4c(%rip),%rdx
   <+66>:    movslq (%rdx,%rax,4),%rax
   <+70>:    add    %rdx,%rax
   <+73>:    notrack jmp *%rax
   <+76>:    call   <explode_bomb>
   <+81>:    jmp    <phase_3+49>
   <+83>:    mov    $0x36e,%eax
   <+88>:    cmp    %eax,0x4(%rsp)
   <+92>:    jne    <phase_3+176>
   <+94>:    mov    0x8(%rsp),%rax
   <+99>:    xor    %fs:0x28,%rax
   <+108>:   jne    <phase_3+183>
   <+110>:   add    $0x18,%rsp
   <+114>:   ret
   <+115>:   mov    $0x2c1,%eax
   <+120>:   jmp    <phase_3+88>
   <+122>:   mov    $0xe7,%eax
   <+127>:   jmp    <phase_3+88>
   <+129>:   mov    $0x290,%eax
   <+134>:   jmp    <phase_3+88>
   <+136>:   mov    $0x244,%eax
   <+141>:   jmp    <phase_3+88>
   <+143>:   mov    $0x251,%eax
   <+148>:   jmp    <phase_3+88>
   <+150>:   mov    $0x260,%eax
   <+155>:   jmp    <phase_3+88>
   <+157>:   call   <explode_bomb>
   <+162>:   mov    $0x0,%eax
   <+167>:   jmp    <phase_3+88>
   <+169>:   mov    $0x379,%eax
   <+174>:   jmp    <phase_3+88>
   <+176>:   call   <explode_bomb>
   <+181>:   jmp    <phase_3+94>
   <+183>:   call   <__stack_chk_fail@plt>
End of assembler dump.
```
查看`<phase_3+32>`处提及的值，由于这个值作为`scanf`的参数，故应查看字符串信息
```
(gdb) x/s 0x55f4ae0687ca
0x55f4ae0687ca: "%d %d"
```
说明程序需要读入两个整数，分别位于`(%rsp)`和`0x4(%rsp)`处，用`x[2]`表示这两个数，则
- `<phase_3+52>~<phase_3+55>`说明`x[0] <= 7`
- `<phase_3+59>~<phase_3+66>`说明可能需要用到`(%rsp)+4*x[0]`处的数，记这个数组为`y[8]`，对应`x[0]`取`0~7`
   ```
   (gdb) x/8xw 0x55f4ae0683e0
   0x55f4ae0683e0: 0xffffd4c5      0xffffd51b      0xffffd4e5      0xffffd4ec
   0x55f4ae0683f0: 0xffffd4f3      0xffffd4fa      0xffffd501      0xffffd508
   ```
- `<phase_3+66>~<phase_3+73>`说明将跳转到`<phase_3+(66+0x2b4c+y[x[0]])>`处继续执行，对应的跳转表如下
   ```
               x[0]   ||  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7
   66+0x2b4c+y[x[0]]  ||  83 | 169 | 115 | 122 | 129 | 136 | 143 | 150
   ```
- 容易得到每一个`x[0]`所应对应的`x[1]`的值，取下面任意一组均可
   ```
   x[0] ||  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7
   x[1] || 878 | 889 | 705 | 231 | 656 | 580 | 593 | 608
   ```

</details>

## Phase 4

<details>

`phase_4`的汇编代码如下
```
Dump of assembler code for function phase_4:
   <+0>:     endbr64
   <+4>:     sub    $0x18,%rsp
   <+8>:     mov    %fs:0x28,%rax
   <+17>:    mov    %rax,0x8(%rsp)
   <+22>:    xor    %eax,%eax
   <+24>:    lea    0x4(%rsp),%rcx
   <+29>:    mov    %rsp,%rdx
   <+32>:    lea    0x2e54(%rip),%rsi
   <+39>:    call   <__isoc99_sscanf@plt>
   <+44>:    cmp    $0x2,%eax
   <+47>:    jne    <phase_4+61>
   <+49>:    mov    (%rsp),%eax
   <+52>:    test   %eax,%eax
   <+54>:    js     <phase_4+61>
   <+56>:    cmp    $0xe,%eax
   <+59>:    jle    <phase_4+66>
   <+61>:    call   <explode_bomb>
   <+66>:    mov    $0xe,%edx
   <+71>:    mov    $0x0,%esi
   <+76>:    mov    (%rsp),%edi
   <+79>:    call   <func4>
   <+84>:    cmp    $0x4,%eax
   <+87>:    jne    <phase_4+96>
   <+89>:    cmpl   $0x4,0x4(%rsp)
   <+94>:    je     <phase_4+101>
   <+96>:    call   <explode_bomb>
   <+101>:   mov    0x8(%rsp),%rax
   <+106>:   xor    %fs:0x28,%rax
   <+115>:   jne    <phase_4+122>
   <+117>:   add    $0x18,%rsp
   <+121>:   ret
   <+122>:   call   <__stack_chk_fail@plt>
End of assembler dump.
```
查看`<phase_4+39>`处所需的输入格式
```
(gdb) x/s 0x55bbd5a037ca
0x55bbd5a037ca: "%d %d"
```
说明程序需要读入两个整数，分别位于`(%rsp)`和`0x4(%rsp)`处，用`x[2]`表示这两个数，则
- `<phase_4+49>~<phase_4+54>`说明`x[0]`为非负数
- `<phase_4+56>`说明`x[0] <= 0xe`
- `<phase_4+66>~<phase_4+84>`说明`func4(x[0], 0, 0xe) = 4`，查看`func4(int t, int m, int n)`的汇编代码
   ```
   Dump of assembler code for function func4:
      <+0>:     endbr64
      <+4>:     sub    $0x8,%rsp
      <+8>:     mov    %edx,%ecx
      <+10>:    sub    %esi,%ecx
      <+12>:    mov    %ecx,%eax
      <+14>:    shr    $0x1f,%eax
      <+17>:    add    %ecx,%eax
      <+19>:    sar    %eax
      <+21>:    add    %esi,%eax
      <+23>:    cmp    %edi,%eax
      <+25>:    jg     <func4+39>
      <+27>:    jl     <func4+51>
      <+29>:    mov    $0x0,%eax
      <+34>:    add    $0x8,%rsp
      <+38>:    ret
      <+39>:    lea    -0x1(%rax),%edx
      <+42>:    call   <func4>
      <+47>:    add    %eax,%eax
      <+49>:    jmp    <func4+34>
      <+51>:    lea    0x1(%rax),%esi
      <+54>:    call   <func4>
      <+59>:    lea    0x1(%rax,%rax,1),%eax
      <+63>:    jmp    <func4+34>
   End of assembler dump.
   ```
- 下面研究`func4`，设符号函数`sgn(x) = x>=0 ? 0: 1`
   - `<func4+4>~<func4+21>`将`((sgn(n - m) + n - m) >> 1) + m`，也即`(m + n + sgn(n - m)) / 2`移入`%eax`中，用`p`来记这个值
   - `<func4+25>`和`<func4+39>~<func4+49>`说明，`p > t`时，函数返回`2 * func4(t, m, p-1)`
   - `<func4+27>`和`<func4+51>~<func4+63>`说明，`p < t`时，函数返回`2 * func4(t, p+1, n) + 1`
   - `<func4+29>`说明，`p = t`时函数返回`0`
   - 总体而言，`func4`是一个与二分查找有类似结构的函数，第一个参数为被查找的参数，后两个参数则是查找范围，设这个函数被递归调用了`q`次，第`i`次的返回值记为`f[i]`，则
      - 若被查找的值在左半边，则`f[i-1] = 2 * f[i]`
      - 若被查找的值在右半边，则`f[i-1] = 2 * f[i] + 1`
      - 若恰好找到，说明`i = q`，且`f[i] = 0`
   - 依照上述规则，利用`f(x[0], 0, 14) = 4`容易推知`x[0] = 2`
- `<phase_4+94>`说明`x[1] = 4`

故最终答案为
```
2 4
```

</details>

## Phase 5

<details>

`phase_5`的汇编代码如下
```
Dump of assembler code for function phase_5:
   <+0>:     endbr64
   <+4>:     sub    $0x18,%rsp
   <+8>:     mov    %fs:0x28,%rax
   <+17>:    mov    %rax,0x8(%rsp)
   <+22>:    xor    %eax,%eax
   <+24>:    lea    0x4(%rsp),%rcx
   <+29>:    mov    %rsp,%rdx
   <+32>:    lea    0x2dd5(%rip),%rsi
   <+39>:    call   <__isoc99_sscanf@plt>
   <+44>:    cmp    $0x1,%eax
   <+47>:    jle    <phase_5+98>
   <+49>:    mov    (%rsp),%eax
   <+52>:    and    $0xf,%eax
   <+55>:    mov    %eax,(%rsp)
   <+58>:    mov    $0x0,%ecx
   <+63>:    mov    $0x0,%edx
   <+68>:    mov    (%rsp),%eax
   <+71>:    cmp    $0xf,%eax
   <+74>:    je     <phase_5+105>
   <+76>:    add    $0x1,%edx
   <+79>:    cltq
   <+81>:    lea    0x29da(%rip),%rsi
   <+88>:    mov    (%rsi,%rax,4),%eax
   <+91>:    mov    %eax,(%rsp)
   <+94>:    add    %eax,%ecx
   <+96>:    jmp    <phase_5+68>
   <+98>:    call   <explode_bomb>
   <+103>:   jmp    <phase_5+49>
   <+105>:   cmp    $0xf,%edx
   <+108>:   jne    <phase_5+116>
   <+110>:   cmp    %ecx,0x4(%rsp)
   <+114>:   je     <phase_5+121>
   <+116>:   call   <explode_bomb>
   <+121>:   mov    0x8(%rsp),%rax
   <+126>:   xor    %fs:0x28,%rax
   <+135>:   jne    <phase_5+142>
   <+137>:   add    $0x18,%rsp
   <+141>:   ret
   <+142>:   call   <__stack_chk_fail@plt>
End of assembler dump.
```
查看`<phase_5+39>`处所需的输入格式
```
(gdb) x/s 0x55a46f7477ca
0x55a46f7477ca: "%d %d"
```
说明程序需要读入两个整数，分别位于`(%rsp)`和`0x4(%rsp)`处，用`x[2]`表示这两个数

从`<phase_5+81>~<phase_5+88>`处可以推测以`*<phase_5+88>+0x29da`为起始地址的整数数组会起到作用，故提前查看以备用（可以用`x/100wx`先查看足够多的数字，再筛选出位于前面的有意义的结果；或直接从代码推知这应该是一个只有前16个元素会被使用的数组），将这个数组记为`arr`
```
(gdb) x/16wx 0x55e49bf17400
0x55e49bf17400 <array.3499>:    0x0000000a      0x00000002      0x0000000e    0x00000007
0x55e49bf17410 <array.3499+16>: 0x00000008      0x0000000c      0x0000000f    0x0000000b
0x55e49bf17420 <array.3499+32>: 0x00000000      0x00000004      0x00000001    0x0000000d
0x55e49bf17430 <array.3499+48>: 0x00000003      0x00000009      0x00000006    0x00000005
```
下面开始求解`x[2]`
- `<phase_5+49>~<phase_5+55>`用`x[0] & 0xf`代替了`x[0]`
- `<phase_5+58>~<phase_5+96>`整体构成一个`for`循环
   - `<phase_5+58>~<phase_5+68>`初始化变量值，记`%ecx, %edx, %eax`对应的变量为`m, n, tmp`
   - `<phase_5+71>~<phase_5+74>`确定了离开循环的条件
   - `<phase_5+76>~<phase_5+94>`是循环主体
   - 将这个循环翻译成C语言得到
      ```C
      int tmp = x[0] & 0xf;
      for (int m=0, n=0; tmp!=0xf; ) {
         n++;
         tmp = arr[tmp];
         m += tmp;
      }
      ```
- `<phase_5+105>~<phase_5+108>`表明`n = 0xf`，也即`tmp = arr[tmp]`这一语句运行了15次后，首次达到`tmp = 0xf`，可推得`x[0] & 0xf = 5`
- `<phase_5+110>~<phase_5+114>`表明`x[1] = m`

故答案为
```
5 115
```
当然，前一个数也可以是`21, 37, ...`等与`0xf`做按位与运算后的结果为`5`的整数

</details>

## Phase 6

<details>

`phase_6`的汇编代码如下
```
Dump of assembler code for function phase_6:
   <+0>:     endbr64
   <+4>:     push   %r12
   <+6>:     push   %rbp
   <+7>:     push   %rbx
   <+8>:     sub    $0x60,%rsp
   <+12>:    mov    %fs:0x28,%rax
   <+21>:    mov    %rax,0x58(%rsp)
   <+26>:    xor    %eax,%eax
   <+28>:    mov    %rsp,%rsi
   <+31>:    call   <read_six_numbers>
   <+36>:    mov    $0x0,%ebp
   <+41>:    jmp    <phase_6+82>
   <+43>:    call   <explode_bomb>
   <+48>:    jmp    <phase_6+101>
   <+50>:    call   <explode_bomb>
   <+55>:    add    $0x1,%ebx
   <+58>:    cmp    $0x5,%ebx
   <+61>:    jg     <phase_6+79>
   <+63>:    movslq %ebp,%rax
   <+66>:    movslq %ebx,%rdx
   <+69>:    mov    (%rsp,%rdx,4),%edi
   <+72>:    cmp    %edi,(%rsp,%rax,4)
   <+75>:    jne    <phase_6+55>
   <+77>:    jmp    <phase_6+50>
   <+79>:    mov    %r12d,%ebp
   <+82>:    cmp    $0x5,%ebp
   <+85>:    jg     <phase_6+110>
   <+87>:    movslq %ebp,%rax
   <+90>:    mov    (%rsp,%rax,4),%eax
   <+93>:    sub    $0x1,%eax
   <+96>:    cmp    $0x5,%eax
   <+99>:    ja     <phase_6+43>
   <+101>:   lea    0x1(%rbp),%r12d
   <+105>:   mov    %r12d,%ebx
   <+108>:   jmp    <phase_6+58>
   <+110>:   mov    $0x0,%eax
   <+115>:   jmp    <phase_6+134>
   <+117>:   movslq %eax,%rcx
   <+120>:   mov    $0x7,%edx
   <+125>:   sub    (%rsp,%rcx,4),%edx
   <+128>:   mov    %edx,(%rsp,%rcx,4)
   <+131>:   add    $0x1,%eax
   <+134>:   cmp    $0x5,%eax
   <+137>:   jle    <phase_6+117>
   <+139>:   mov    $0x0,%esi
   <+144>:   jmp    <phase_6+169>
   <+146>:   mov    0x8(%rdx),%rdx
   <+150>:   add    $0x1,%eax
   <+153>:   movslq %esi,%rcx
   <+156>:   cmp    %eax,(%rsp,%rcx,4)
   <+159>:   jg     <phase_6+146>
   <+161>:   mov    %rdx,0x20(%rsp,%rcx,8)
   <+166>:   add    $0x1,%esi
   <+169>:   cmp    $0x5,%esi
   <+172>:   jg     <phase_6+188>
   <+174>:   mov    $0x1,%eax
   <+179>:   lea    0x6535(%rip),%rdx
   <+186>:   jmp    <phase_6+153>
   <+188>:   mov    0x20(%rsp),%rbx
   <+193>:   mov    %rbx,%rcx
   <+196>:   mov    $0x1,%eax
   <+201>:   jmp    <phase_6+221>
   <+203>:   movslq %eax,%rdx
   <+206>:   mov    0x20(%rsp,%rdx,8),%rdx
   <+211>:   mov    %rdx,0x8(%rcx)
   <+215>:   add    $0x1,%eax
   <+218>:   mov    %rdx,%rcx
   <+221>:   cmp    $0x5,%eax
   <+224>:   jle    <phase_6+203>
   <+226>:   movq   $0x0,0x8(%rcx)
   <+234>:   mov    $0x0,%ebp
   <+239>:   jmp    <phase_6+248>
   <+241>:   mov    0x8(%rbx),%rbx
   <+245>:   add    $0x1,%ebp
   <+248>:   cmp    $0x4,%ebp
   <+251>:   jg     <phase_6+270>
   <+253>:   mov    0x8(%rbx),%rax
   <+257>:   mov    (%rax),%eax
   <+259>:   cmp    %eax,(%rbx)
   <+261>:   jle    <phase_6+241>
   <+263>:   call   <explode_bomb>
   <+268>:   jmp    <phase_6+241>
   <+270>:   mov    0x58(%rsp),%rax
   <+275>:   xor    %fs:0x28,%rax
   <+284>:   jne    <phase_6+295>
   <+286>:   add    $0x60,%rsp
   <+290>:   pop    %rbx
   <+291>:   pop    %rbp
   <+292>:   pop    %r12
   <+294>:   ret
   <+295>:   call   <__stack_chk_fail@plt>
End of assembler dump.
```
`<phase_6+31>`说明要读入6个整数，存放地址分别为`(%rsp), 0x4(%rsp), 0x8(%rsp), 0xc(%rsp), 0x10(%rsp), 0x14(%rsp)`，记这6个数为`x[6]`

查看`<phase_6+179>`涉及的内存空间存储的内容
```
(gdb) x/20wx 0x5571ee210050
0x5571ee210050 <node1>: 0x00000379      0x00000001      0xee210060      0x00005571
0x5571ee210060 <node2>: 0x00000185      0x00000002      0xee210070      0x00005571
0x5571ee210070 <node3>: 0x000001d0      0x00000003      0xee210080      0x00005571
0x5571ee210080 <node4>: 0x000002fe      0x00000004      0xee210090      0x00005571
0x5571ee210090 <node5>: 0x00000274      0x00000005      0xee20f020      0x00005571
```
可以发现，前四个`<node>`的后64位恰好是下一个`<node>`的地址，推测结构体`<node>`代表链表的一个节点，查看最后一个`<node>`指向的位置
```
(gdb) x/4wx 0x5571ee20f020
0x5571ee20f020 <node6>: 0x00000213      0x00000006      0x00000000      0x00000000
```
此外，也可以用C代码写出`Node`结构体
```C
struct Node {
   int val;          // 32-bit
   int index;        // 32-bit
   Node* nextNode;   // 64-bit
};
```

下面求解`x[6]`
- `<phase_6+36>~<phase_6+41>`提示应当先从`<phase_6+82>`之后的语句入手，`<phase_6+85>`则表明可以先关注`<phase_110>`之前的代码。对于`<phase_6+36>~<phase_6+108>`这个整体，唯一可以不引爆炸弹而离开的方法位于`<phase_6+85>`处，而在`<phase_6+110>`之后，无法再回到这一部分，所以可以先单独分析这个整体
   - 这一块代码可以理解成一个大的`for`循环，伪代码如下
      ```C
      int ebx; // prepare for <+105>
      for (int ebp = 0; ebp <= 5; /*unknown*/) {

         PART_I:
         if (x[ebp] > 6) { // <+87>~<+96>
            // <+99> explode
         } else {
            ebx = ebp + 1; // <+101>~<+105>
         }

         PART_II:
         // after <+58>
      }
      ```
   - `<phase_6+55>~<phase_6+75>`显然构成一个`while`循环的结构，故补全上面的伪代码可得
      ```C
      int ebx; // prepare for <+105>
      for (int ebp = 0; ebp <= 5; ) {
         
         PART_I:
         if ((unsigned)(x[ebp] - 1) > 5) { // <+87>~<+96>
            // <+99> explode
         } else {
            ebx = ebp + 1; // <+101>~<+105>
         }

         PART_II:
         while (ebx <= 5) { // <+58>~<+61>
            if (x[ebx] != x[ebp]) { // <+63>~<+75>
               ebx += 1; // <+55>
            } else { // <+77>
               // <+50> explode
            }
         }
         ebp += 1; // <+79>
      }
      ```
   - `PART_I`表明`1 <= x[i] <= 6`，`PART_II`表明`x[i]`互不相同，由此可知`x[i]`构成`1, 2, 3, 4, 5, 6`的一个排列
   - ~~接下来只需要720次枚举即可~~
- `<phase_6+110>~<phase_6+137>`又是一个相对独立的`for`循环，改写成C代码得到
   ```C
   for (int eax = 0; eax <= 5; ++eax) {
      x[eax] = 7 - x[eax];
   }
   ```
   也即将所有的`x[i]`变为`7 - x[i]`，把这些新的数仍记为`x[i]`，此时它们仍是`1, 2, 3, 4, 5, 6`的全排列，但在后续推断出`x[i]`后应当注意变换回来
- `<phase_6+139>~<phase_6+186>`是第三个相对独立的部分，这也是一个`for`循环，内部有一个`while`循环，改写为C代码
   ```C
   Node* node_ptr[6] = {NULL}; // prepare for <+161>
   for (int esi = 0; esi <= 5; ++esi) {
      int eax = 1; // <+174>
      Node* rdx = &node[1]; // <+179>
      // Here we let index of node start from 1 
      while (x[esi] > eax) { // <+153>~<+159>
         rdx = rdx->nextNode; // <+146>
         eax += 1; // <+150>
      }
      node_ptr[esi] = rdx; // <+161>
   }
   ```
   此时，`node_ptr[i]`实际上存储在`0x20(%rsp, i, 8)`中（寻址写法仅为方便，并不正确），并且`node_ptr[i] = &node[x[i]]`
- `<phase_6+188>~<phase_6+226>`是第四个相对独立的部分，内含一个`while`循环，改写为C代码
   ```C
   Node* rcx = node_ptr[0];
   int eax = 1; // <+196>
   while (eax <= 5) { // <+221>~<+224>
      rcx->nextNode = node_ptr[eax]; // <+203>~<+211>
      eax += 1; // <+215>
      rcx = rcx->nextNode; // <+218>
   }
   rcx->nextNode = NULL; // <+226>
   ```
   这段代码使得`node_ptr[i]->nextNode = node_ptr[i+1]`，第三、第四两部分的作用是按照`x[i]`重排链表，使得
   ```
   node[1] -> node[2] -> ... -> node[6]
   ```
   变化为
   ```
   node[x[0]] -> node[x[1]] -> ... -> node[x[5]]
   ```
- `<phase_6+234>~<phase_6+268>`是最后一个需要分析的部分，这部分也很清晰地体现出`for`循环的结构，改写成C代码
   ```C
   Node* rbx = node_ptr[0]; // find at <+188> 
   for (int ebp = 0; ebp <= 4; ++ebp) {
      int eax = rbx->nextNode->val; // <+253>~<+257>
      if (rbx->val <= eax) { // <+259>
         rbx = rbx->nextNode; // <+241>
      } else {
         // <+263> explode
      }
   }
   ```
   这段代码说明重拍后`<node>`的`val`需要按照升序排序，结合之前所检查到的`node`的内容，可知`x[6]`的值为
   ```
      i  || 0 | 1 | 2 | 3 | 4 | 5
    x[i] || 2 | 3 | 6 | 5 | 4 | 1
   ```
   再利用`x[i] = 7 - x[i]`做逆变换得到最终答案
   ```
   5 4 1 2 3 6
   ```

</details>

## Secret Phase

### 进入Secret Phase

<details>

查看`main`函数时，可以发现，每一次调用`phase_i`后，总会调用一个名为`phase_defused`的函数，查看其汇编代码
```
Dump of assembler code for function phase_defused:
   <+0>:     endbr64
   <+4>:     push   %rbx
   <+5>:     mov    %rdi,%rbx
   <+8>:     movl   $0x0,(%rdi)
   <+14>:    mov    %rdi,%rsi
   <+17>:    mov    $0x1,%edi
   <+22>:    call   <send_msg>
   <+27>:    cmpl   $0x1,(%rbx)
   <+30>:    jne    <phase_defused+43>
   <+32>:    cmpl   $0x6,0x6149(%rip)
   <+39>:    je     <phase_defused+75>
   <+41>:    pop    %rbx
   <+42>:    ret
   <+43>:    lea    0x21fa(%rip),%rsi
   <+50>:    mov    $0x1,%edi
   <+55>:    mov    $0x0,%eax
   <+60>:    call   <__printf_chk@plt>
   <+65>:    mov    $0x8,%edi
   <+70>:    call   <exit@plt>
   <+75>:    call   <genshin>
   <+80>:    test   %eax,%eax
   <+82>:    jne    <phase_defused+122>
   <+84>:    lea    0x22f9(%rip),%rdi
   <+91>:    call   <puts@plt>
   <+96>:    lea    0x232d(%rip),%rdi
   <+103>:   call   <puts@plt>
   <+108>:   lea    0x2369(%rip),%rdi
   <+115>:   call   <puts@plt>
   <+120>:   jmp    <phase_defused+41>
   <+122>:   call   <qidong>
   <+127>:   test   %eax,%eax
   <+129>:   je     <phase_defused+167>
   <+131>:   lea    0x2212(%rip),%rdi
   <+138>:   call   <puts@plt>
   <+143>:   lea    0x222e(%rip),%rdi
   <+150>:   call   <puts@plt>
   <+155>:   mov    $0x0,%eax
   <+160>:   call   <secret_phase>
   <+165>:   jmp    <phase_defused+84>
   <+167>:   lea    0x2256(%rip),%rdi
   <+174>:   call   <puts@plt>
   <+179>:   jmp    <phase_defused+84>
End of assembler dump.
```
在`<phase_defused+32>`将`0x6`与内存中的某个值做了比较
```
(gdb) x/x 0x56091cf8948c
0x56091cf8948c <num_input_strings>:     0x00000001
```
通过测试可以发现，这个值的含义是成功读取的字符串数目，由于每个phase都只读取一个字符串，因此只有成功通过`phase_6`之后，才可能继续进行`phase_defused`

`<phase_defused+75>`和`<phase_defused+122>`涉及`genshin`和`qidong`两个函数，对它们分别进行反汇编
```
Dump of assembler code for function genshin:
   <+0>:     endbr64
   <+4>:     sub    $0xa8,%rsp
   <+11>:    mov    %fs:0x28,%rax
   <+20>:    mov    %rax,0x98(%rsp)
   <+28>:    xor    %eax,%eax
   <+30>:    lea    0xc(%rsp),%rcx
   <+35>:    lea    0x8(%rsp),%rdx
   <+40>:    sub    $0x8,%rsp
   <+44>:    lea    0x28(%rsp),%rax
   <+49>:    push   %rax
   <+50>:    lea    0x2c(%rsp),%rax
   <+55>:    push   %rax
   <+56>:    lea    0x30(%rsp),%rax
   <+61>:    push   %rax
   <+62>:    lea    0x34(%rsp),%r9
   <+67>:    lea    0x30(%rsp),%r8
   <+72>:    lea    0x2af5(%rip),%rsi
   <+79>:    lea    0x6e6a(%rip),%rdi
   <+86>:    mov    $0x0,%eax
   <+91>:    call   <__isoc99_sscanf@plt>
   <+96>:    add    $0x20,%rsp
   <+100>:   cmp    $0x7,%eax
   <+103>:   je     <genshin+137>
   <+105>:   mov    $0x0,%eax
   <+110>:   mov    0x98(%rsp),%rsi
   <+118>:   xor    %fs:0x28,%rsi
   <+127>:   jne    <genshin+172>
   <+129>:   add    $0xa8,%rsp
   <+136>:   ret
   <+137>:   lea    0x20(%rsp),%rdi
   <+142>:   lea    0x2adb(%rip),%rsi
   <+149>:   call   <strings_not_equal>
   <+154>:   test   %eax,%eax
   <+156>:   je     <genshin+165>
   <+158>:   mov    $0x0,%eax
   <+163>:   jmp    <genshin+110>
   <+165>:   mov    $0x1,%eax
   <+170>:   jmp    <genshin+110>
   <+172>:   call   <__stack_chk_fail@plt>
End of assembler dump.

Dump of assembler code for function qidong:
   <+0>:     endbr64
   <+4>:     sub    $0x98,%rsp
   <+11>:    mov    %fs:0x28,%rax
   <+20>:    mov    %rax,0x88(%rsp)
   <+28>:    xor    %eax,%eax
   <+30>:    lea    0xc(%rsp),%rcx
   <+35>:    lea    0x8(%rsp),%rdx
   <+40>:    lea    0x10(%rsp),%r8
   <+45>:    lea    0x2a6b(%rip),%rsi
   <+52>:    lea    0x6ec4(%rip),%rdi
   <+59>:    call   <__isoc99_sscanf@plt>
   <+64>:    cmp    $0x3,%eax
   <+67>:    je     <qidong+101>
   <+69>:    mov    $0x0,%eax
   <+74>:    mov    0x88(%rsp),%rsi
   <+82>:    xor    %fs:0x28,%rsi
   <+91>:    jne    <qidong+159>
   <+93>:    add    $0x98,%rsp
   <+100>:   ret
   <+101>:   lea    0x10(%rsp),%rdx
   <+106>:   movzbl (%rdx),%eax
   <+109>:   test   %al,%al
   <+111>:   je     <qidong+124>
   <+113>:   add    $0x2,%eax
   <+116>:   mov    %al,(%rdx)
   <+118>:   add    $0x1,%rdx
   <+122>:   jmp    <qidong+106>
   <+124>:   lea    0x10(%rsp),%rdi
   <+129>:   lea    0x2a57(%rip),%rsi
   <+136>:   call   <strings_not_equal>
   <+141>:   test   %eax,%eax
   <+143>:   je     <qidong+152>
   <+145>:   mov    $0x0,%eax
   <+150>:   jmp    <qidong+74>
   <+152>:   mov    $0x1,%eax
   <+157>:   jmp    <qidong+74>
   <+159>:   call   <__stack_chk_fail@plt>
End of assembler dump.
```
事实上并不需要完全看懂这两个函数，只需注意到
- `<genshin+91>`和`<qidong+59>`均调用了`<__isoc99_sscanf@plt>`
- `<genshin+149>`和`<qidong+136>`均调用了`<strings_not_equal>`

即可知道需要在解答前面的`phase`时额外输入一些内容（因为`phase_6`结束后不再有输入内容的机会）

接下来打上断点，输入正常的答案后，查看两个函数中涉及`%rip`的几行
- `<genshin+72>`
   ```
   (gdb) x/s 0x55ede42e119c
   0x55ede42e119c: "%d %d %d %d %d %d %s"
   ```
- `<genshin+79>`
   ```
   (gdb) x/s 0x55ede42e5518
   0x55ede42e5518 <input_strings+120>:     "0 1 1 3 5 11"
   ```
   这是在`phase_2`中输入的内容
- `<genshin+142>`
   ```
   (gdb) x/s 0x55ede42e11c8
   0x55ede42e11c8: "NothingThatHasMeaning1sEasy..."
   ```
   这应该是需要在`phase_2`中需要额外匹配的内容，并且由`<genshin+72>`的匹配格式可知这应当放在数字的后面
- `<qidong+45>`
   ```
   (gdb) x/s 0x55ede42e11a8
   0x55ede42e11a8: "%d %d %s"
   ```
- `<qidong+52>`
   ```
   (gdb) x/s 0x55ede42e5608
   0x55ede42e5608 <input_strings+360>:     "2 4"
   ```
   这是在`phase_4`中输入的内容
- `<qidong+129>`
   ```
   (gdb) x/s 0x55ede42e11e8
   0x55ede42e11e8: "000Gcu{FqgupvGpvgt3pvqItqypWrNkhg0"
   ```
   这应该是需要在`phase_4`中需要额外匹配的内容，并且由`<qidong+45>`的匹配格式可知这应当放在数字的后面
   
   但是需要注意的是`<qidong+106>~<qidong+122>`处的代码，这部分将我们输入的字符串的每个字符加上了2，因此实际需要输入的字符是`000Gcu{FqgupvGpvgt3pvqItqypWrNkhg0`的每一个字符减去2，也即`...EasyDoesntEnter1ntoGrownUpLife.`

   事实上也可以由这个字符串根本读不通来猜测需要对它额外做手脚，最简单的想法便是Caesar cipher，只需用以下几行Python代码进行测试即可迅速找到实际上应该输入的值
   ```python
   for i in range(-20, 20):
	   print(''.join([chr(ord(t)+i) for t in '000Gcu{FqgupvGpvgt3pvqItqypWrNkhg0']))
   ```

在`<phase_defused+160>`处调用了`secret_phase`函数，打上断点后运行程序，依次输入
```
Now I am become Death,The destroyer of worlds.
0 1 1 3 5 11 NothingThatHasMeaning1sEasy...
4 656
2 4 ...EasyDoesntEnter1ntoGrownUpLife.
37 115
5 4 1 2 3 6
```
即可发现程序顺利执行到`secret_phase`处

</details>

### 破解Secret Phase

<details>

函数`secret_phase`的汇编代码如下
```
Dump of assembler code for function secret_phase:
   <+0>:     endbr64
   <+4>:     push   %rbp
   <+5>:     push   %rbx
   <+6>:     sub    $0x18,%rsp
   <+10>:    mov    %fs:0x28,%rax
   <+19>:    mov    %rax,0x8(%rsp)
   <+24>:    xor    %eax,%eax
   <+26>:    call   <read_line>
   <+31>:    mov    %rax,%rbp
   <+34>:    mov    $0x0,%ebx
   <+39>:    jmp    <secret_phase+49>
   <+41>:    call   <explode_bomb>
   <+46>:    add    $0x1,%ebx
   <+49>:    movslq %ebx,%rax
   <+52>:    cmpb   $0x0,0x0(%rbp,%rax,1)
   <+57>:    je     <secret_phase+66>
   <+59>:    cmp    $0x18,%ebx
   <+62>:    jle    <secret_phase+46>
   <+64>:    jmp    <secret_phase+41>
   <+66>:    mov    %rbp,%rdi
   <+69>:    call   <check_synchronizing_sequence>
   <+74>:    test   %eax,%eax
   <+76>:    jne    <secret_phase+195>
   <+78>:    lea    0x25be(%rip),%rdi
   <+85>:    call   <puts@plt>
   <+90>:    lea    0x260a(%rip),%rdi
   <+97>:    call   <puts@plt>
   <+102>:   lea    0x266e(%rip),%rdi
   <+109>:   call   <puts@plt>
   <+114>:   lea    0x26a2(%rip),%rdi
   <+121>:   call   <puts@plt>
   <+126>:   lea    0x26ce(%rip),%rdi
   <+133>:   call   <puts@plt>
   <+138>:   lea    0x2702(%rip),%rdi
   <+145>:   call   <puts@plt>
   <+150>:   lea    0x24e7(%rip),%rdi
   <+157>:   call   <puts@plt>
   <+162>:   lea    0x4(%rsp),%rdi
   <+167>:   call   <phase_defused>
   <+172>:   mov    0x8(%rsp),%rax
   <+177>:   xor    %fs:0x28,%rax
   <+186>:   jne    <secret_phase+202>
   <+188>:   add    $0x18,%rsp
   <+192>:   pop    %rbx
   <+193>:   pop    %rbp
   <+194>:   ret
   <+195>:   call   <explode_bomb>
   <+200>:   jmp    <secret_phase+78>
   <+202>:   call   <__stack_chk_fail@plt>
End of assembler dump.
```
在`<secret_phase+69>`处调用了`check_synchronizing_sequence`函数，且这个函数的返回结果直接决定了是否会爆炸，因此需要重点研究该函数，反汇编得到
```
Dump of assembler code for function check_synchronizing_sequence:
   <+0>:     endbr64
   <+4>:     push   %r12
   <+6>:     push   %rbp
   <+7>:     push   %rbx
   <+8>:     mov    %rdi,%rbp
   <+11>:    mov    %rdi,%rsi
   <+14>:    mov    $0x0,%edi
   <+19>:    call   <emulate_fsm>
   <+24>:    mov    %eax,%r12d
   <+27>:    mov    $0x1,%ebx
   <+32>:    cmp    $0x6,%ebx
   <+35>:    jg     <check_synchronizing_sequence+57>
   <+37>:    mov    %rbp,%rsi
   <+40>:    mov    %ebx,%edi
   <+42>:    call   <emulate_fsm>
   <+47>:    cmp    %r12d,%eax
   <+50>:    jne    <check_synchronizing_sequence+67>
   <+52>:    add    $0x1,%ebx
   <+55>:    jmp    <check_synchronizing_sequence+32>
   <+57>:    mov    $0x0,%eax
   <+62>:    pop    %rbx
   <+63>:    pop    %rbp
   <+64>:    pop    %r12
   <+66>:    ret
   <+67>:    mov    $0xffffffff,%eax
   <+72>:    jmp    <check_synchronizing_sequence+62>
End of assembler dump.
```
在`<check_check_synchronizing_sequence+19>`和`<check_synchronizing_sequence+42>`处均调用了函数`emulate_fsm`，再次反汇编得到
```
Dump of assembler code for function emulate_fsm:
   <+0>:     endbr64
   <+4>:     push   %rbp
   <+5>:     push   %rbx
   <+6>:     sub    $0x8,%rsp
   <+10>:    mov    %edi,%ebp
   <+12>:    mov    %rsi,%rbx
   <+15>:    jmp    <emulate_fsm+56>
   <+17>:    movsbl (%rbx),%eax
   <+20>:    sub    $0x30,%eax
   <+23>:    movslq %ebp,%rbp
   <+26>:    cltq
   <+28>:    lea    0x0(,%rax,8),%rdi
   <+36>:    sub    %rax,%rdi
   <+39>:    add    %rbp,%rdi
   <+42>:    lea    0x2882(%rip),%rax
   <+49>:    mov    (%rax,%rdi,4),%ebp
   <+52>:    add    $0x1,%rbx
   <+56>:    movzbl (%rbx),%eax
   <+59>:    test   %al,%al
   <+61>:    je     <emulate_fsm+77>
   <+63>:    sub    $0x30,%eax
   <+66>:    cmp    $0x1,%al
   <+68>:    jbe    <emulate_fsm+17>
   <+70>:    call   <explode_bomb>
   <+75>:    jmp    <emulate_fsm+17>
   <+77>:    mov    %ebp,%eax
   <+79>:    add    $0x8,%rsp
   <+83>:    pop    %rbx
   <+84>:    pop    %rbp
   <+85>:    ret
End of assembler dump.
```
查看`<emulate_fsm+42>`处涉及的`0x2882(%rip)`的内存内容，记为`table[14]`
```
(gdb) x/14wx 0x55b7acdef440
0x55b7acdef440 <transition_table>:      0x00000005      0x00000000      0x00000001      0x00000002
0x55b7acdef450 <transition_table+16>:   0x00000004      0x00000006      0x00000003      0x00000004
0x55b7acdef460 <transition_table+32>:   0x00000004      0x00000002      0x00000003      0x00000000
0x55b7acdef470 <transition_table+48>:   0x00000005      0x00000006
```
将主体部分`<emulate_fsm+10>~<emulate_fsm+77>`改写成C代码，通过`<secret_phase+26>`和`<check_check_synchronizing_sequence+27>~<check_check_synchronizing_sequence+40>`可推知该函数有两个参数，分别记为`int a`和`char* ptr`
```C
int ebp = a; // <+10>
int eax; // prepare for <+56>
while (ptr && eax = (int)(*ptr)) { // <+59>~<+61>
   if (eax > 0x31 || eax < 0x30) explode; // <+63>~<+70>
   eax -= 0x30; // <+20>
   ebp = table[7 * eax + ebp]; // <+23>~<+49>
   ptr++; // <+52>
}
return ebp; // <+77>
```
可以看出，输入的字符串是仅由`'0'`和`'1'`组成的，由于`table`的长度为14，故应有`0 <= a <= 6`，`<check_synchronizing_sequence+32>`也证明了这一断言是正确的

接下来将`<check_synchronizing_sequence+8>~<check_synchronizing_sequence+72>`改写为C语言，它只接受一个参数`char* ptr`
```C
int r12d = emulate_fsm(0, ptr); // <+8>~<+24>
for (int ebx = 1; ebx <= 6; ++ebx) {
   int eax = emulate_fsm(ebx, ptr); // <+37>~<+47>
   if (eax != r12d) { // <+50>
      return -1; // <+67>~<+72>
   }
}
return 0; // <+57>
```
根据`<secret_phase+74>~<secret_phase+76>`可知需要让返回值为零，也即对任意的`0 <= a <= 6`，函数`emulate_fsm(a, ptr)`的返回值应相等，由此即可推导出答案

如果不想折腾数学，也可以交给Python，至少结果不算太长，是可以在数分钟之内跑出来的
```python
table = [5, 0, 1, 2, 4, 6, 3, 4, 4, 2, 3, 0, 5, 6]

def emulate_fsm(a, s):
   # s is a list containing 0 and 1
   ebp = a
   for i in s:
      ebp = table[7*i+ebp]
   return ebp

def check_synchronizing_sequence(x):
   # x is a number
   s = [int(i) for i in bin(x)[2:]]
   lst = [emulate_fsm(i, s) for i in range(7)]
   if (
        (lst[0] == lst[6]) 
    and (lst[0] == lst[5])
    and (lst[0] == lst[4])
    and (lst[0] == lst[3])
    and (lst[0] == lst[2])
   ):
      return bin(x), lst
   return 0

for i in range(10000000, 100000000):
   res = check_synchronizing_sequence(i)
   if res:
      print(res)
      break
```
得到答案
```
1000100101001000101000001
```

</details>
