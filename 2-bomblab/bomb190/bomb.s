
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 5f 00 00 	mov    0x5fd9(%rip),%rax        # 6fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 ba 5e 00 00    	push   0x5eba(%rip)        # 6ee0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 bb 5e 00 00 	bnd jmp *0x5ebb(%rip)        # 6ee8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <.plt>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <.plt>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	push   $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmp 1020 <.plt>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	push   $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmp 1020 <.plt>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	push   $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmp 1020 <.plt>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	push   $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmp 1020 <.plt>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	push   $0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmp 1020 <.plt>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	push   $0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmp 1020 <.plt>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	push   $0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmp 1020 <.plt>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0a 00 00 00       	push   $0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmp 1020 <.plt>
    10df:	90                   	nop
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	68 0b 00 00 00       	push   $0xb
    10e9:	f2 e9 31 ff ff ff    	bnd jmp 1020 <.plt>
    10ef:	90                   	nop
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	68 0c 00 00 00       	push   $0xc
    10f9:	f2 e9 21 ff ff ff    	bnd jmp 1020 <.plt>
    10ff:	90                   	nop
    1100:	f3 0f 1e fa          	endbr64 
    1104:	68 0d 00 00 00       	push   $0xd
    1109:	f2 e9 11 ff ff ff    	bnd jmp 1020 <.plt>
    110f:	90                   	nop
    1110:	f3 0f 1e fa          	endbr64 
    1114:	68 0e 00 00 00       	push   $0xe
    1119:	f2 e9 01 ff ff ff    	bnd jmp 1020 <.plt>
    111f:	90                   	nop
    1120:	f3 0f 1e fa          	endbr64 
    1124:	68 0f 00 00 00       	push   $0xf
    1129:	f2 e9 f1 fe ff ff    	bnd jmp 1020 <.plt>
    112f:	90                   	nop
    1130:	f3 0f 1e fa          	endbr64 
    1134:	68 10 00 00 00       	push   $0x10
    1139:	f2 e9 e1 fe ff ff    	bnd jmp 1020 <.plt>
    113f:	90                   	nop
    1140:	f3 0f 1e fa          	endbr64 
    1144:	68 11 00 00 00       	push   $0x11
    1149:	f2 e9 d1 fe ff ff    	bnd jmp 1020 <.plt>
    114f:	90                   	nop
    1150:	f3 0f 1e fa          	endbr64 
    1154:	68 12 00 00 00       	push   $0x12
    1159:	f2 e9 c1 fe ff ff    	bnd jmp 1020 <.plt>
    115f:	90                   	nop
    1160:	f3 0f 1e fa          	endbr64 
    1164:	68 13 00 00 00       	push   $0x13
    1169:	f2 e9 b1 fe ff ff    	bnd jmp 1020 <.plt>
    116f:	90                   	nop
    1170:	f3 0f 1e fa          	endbr64 
    1174:	68 14 00 00 00       	push   $0x14
    1179:	f2 e9 a1 fe ff ff    	bnd jmp 1020 <.plt>
    117f:	90                   	nop
    1180:	f3 0f 1e fa          	endbr64 
    1184:	68 15 00 00 00       	push   $0x15
    1189:	f2 e9 91 fe ff ff    	bnd jmp 1020 <.plt>
    118f:	90                   	nop
    1190:	f3 0f 1e fa          	endbr64 
    1194:	68 16 00 00 00       	push   $0x16
    1199:	f2 e9 81 fe ff ff    	bnd jmp 1020 <.plt>
    119f:	90                   	nop
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	68 17 00 00 00       	push   $0x17
    11a9:	f2 e9 71 fe ff ff    	bnd jmp 1020 <.plt>
    11af:	90                   	nop
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	68 18 00 00 00       	push   $0x18
    11b9:	f2 e9 61 fe ff ff    	bnd jmp 1020 <.plt>
    11bf:	90                   	nop
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	68 19 00 00 00       	push   $0x19
    11c9:	f2 e9 51 fe ff ff    	bnd jmp 1020 <.plt>
    11cf:	90                   	nop
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	68 1a 00 00 00       	push   $0x1a
    11d9:	f2 e9 41 fe ff ff    	bnd jmp 1020 <.plt>
    11df:	90                   	nop
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	68 1b 00 00 00       	push   $0x1b
    11e9:	f2 e9 31 fe ff ff    	bnd jmp 1020 <.plt>
    11ef:	90                   	nop
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	68 1c 00 00 00       	push   $0x1c
    11f9:	f2 e9 21 fe ff ff    	bnd jmp 1020 <.plt>
    11ff:	90                   	nop

Disassembly of section .plt.got:

0000000000001200 <__cxa_finalize@plt>:
    1200:	f3 0f 1e fa          	endbr64 
    1204:	f2 ff 25 ed 5d 00 00 	bnd jmp *0x5ded(%rip)        # 6ff8 <__cxa_finalize@GLIBC_2.2.5>
    120b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001210 <getenv@plt>:
    1210:	f3 0f 1e fa          	endbr64 
    1214:	f2 ff 25 d5 5c 00 00 	bnd jmp *0x5cd5(%rip)        # 6ef0 <getenv@GLIBC_2.2.5>
    121b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001220 <free@plt>:
    1220:	f3 0f 1e fa          	endbr64 
    1224:	f2 ff 25 cd 5c 00 00 	bnd jmp *0x5ccd(%rip)        # 6ef8 <free@GLIBC_2.2.5>
    122b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001230 <strcasecmp@plt>:
    1230:	f3 0f 1e fa          	endbr64 
    1234:	f2 ff 25 c5 5c 00 00 	bnd jmp *0x5cc5(%rip)        # 6f00 <strcasecmp@GLIBC_2.2.5>
    123b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001240 <__errno_location@plt>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	f2 ff 25 bd 5c 00 00 	bnd jmp *0x5cbd(%rip)        # 6f08 <__errno_location@GLIBC_2.2.5>
    124b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001250 <strcpy@plt>:
    1250:	f3 0f 1e fa          	endbr64 
    1254:	f2 ff 25 b5 5c 00 00 	bnd jmp *0x5cb5(%rip)        # 6f10 <strcpy@GLIBC_2.2.5>
    125b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001260 <puts@plt>:
    1260:	f3 0f 1e fa          	endbr64 
    1264:	f2 ff 25 ad 5c 00 00 	bnd jmp *0x5cad(%rip)        # 6f18 <puts@GLIBC_2.2.5>
    126b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001270 <write@plt>:
    1270:	f3 0f 1e fa          	endbr64 
    1274:	f2 ff 25 a5 5c 00 00 	bnd jmp *0x5ca5(%rip)        # 6f20 <write@GLIBC_2.2.5>
    127b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001280 <__stack_chk_fail@plt>:
    1280:	f3 0f 1e fa          	endbr64 
    1284:	f2 ff 25 9d 5c 00 00 	bnd jmp *0x5c9d(%rip)        # 6f28 <__stack_chk_fail@GLIBC_2.4>
    128b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001290 <alarm@plt>:
    1290:	f3 0f 1e fa          	endbr64 
    1294:	f2 ff 25 95 5c 00 00 	bnd jmp *0x5c95(%rip)        # 6f30 <alarm@GLIBC_2.2.5>
    129b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012a0 <close@plt>:
    12a0:	f3 0f 1e fa          	endbr64 
    12a4:	f2 ff 25 8d 5c 00 00 	bnd jmp *0x5c8d(%rip)        # 6f38 <close@GLIBC_2.2.5>
    12ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012b0 <read@plt>:
    12b0:	f3 0f 1e fa          	endbr64 
    12b4:	f2 ff 25 85 5c 00 00 	bnd jmp *0x5c85(%rip)        # 6f40 <read@GLIBC_2.2.5>
    12bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012c0 <fgets@plt>:
    12c0:	f3 0f 1e fa          	endbr64 
    12c4:	f2 ff 25 7d 5c 00 00 	bnd jmp *0x5c7d(%rip)        # 6f48 <fgets@GLIBC_2.2.5>
    12cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012d0 <signal@plt>:
    12d0:	f3 0f 1e fa          	endbr64 
    12d4:	f2 ff 25 75 5c 00 00 	bnd jmp *0x5c75(%rip)        # 6f50 <signal@GLIBC_2.2.5>
    12db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012e0 <gethostbyname@plt>:
    12e0:	f3 0f 1e fa          	endbr64 
    12e4:	f2 ff 25 6d 5c 00 00 	bnd jmp *0x5c6d(%rip)        # 6f58 <gethostbyname@GLIBC_2.2.5>
    12eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000012f0 <__memmove_chk@plt>:
    12f0:	f3 0f 1e fa          	endbr64 
    12f4:	f2 ff 25 65 5c 00 00 	bnd jmp *0x5c65(%rip)        # 6f60 <__memmove_chk@GLIBC_2.3.4>
    12fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001300 <memcpy@plt>:
    1300:	f3 0f 1e fa          	endbr64 
    1304:	f2 ff 25 5d 5c 00 00 	bnd jmp *0x5c5d(%rip)        # 6f68 <memcpy@GLIBC_2.14>
    130b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001310 <malloc@plt>:
    1310:	f3 0f 1e fa          	endbr64 
    1314:	f2 ff 25 55 5c 00 00 	bnd jmp *0x5c55(%rip)        # 6f70 <malloc@GLIBC_2.2.5>
    131b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001320 <fflush@plt>:
    1320:	f3 0f 1e fa          	endbr64 
    1324:	f2 ff 25 4d 5c 00 00 	bnd jmp *0x5c4d(%rip)        # 6f78 <fflush@GLIBC_2.2.5>
    132b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001330 <__isoc99_sscanf@plt>:
    1330:	f3 0f 1e fa          	endbr64 
    1334:	f2 ff 25 45 5c 00 00 	bnd jmp *0x5c45(%rip)        # 6f80 <__isoc99_sscanf@GLIBC_2.7>
    133b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001340 <__printf_chk@plt>:
    1340:	f3 0f 1e fa          	endbr64 
    1344:	f2 ff 25 3d 5c 00 00 	bnd jmp *0x5c3d(%rip)        # 6f88 <__printf_chk@GLIBC_2.3.4>
    134b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001350 <fopen@plt>:
    1350:	f3 0f 1e fa          	endbr64 
    1354:	f2 ff 25 35 5c 00 00 	bnd jmp *0x5c35(%rip)        # 6f90 <fopen@GLIBC_2.2.5>
    135b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001360 <gethostname@plt>:
    1360:	f3 0f 1e fa          	endbr64 
    1364:	f2 ff 25 2d 5c 00 00 	bnd jmp *0x5c2d(%rip)        # 6f98 <gethostname@GLIBC_2.2.5>
    136b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001370 <exit@plt>:
    1370:	f3 0f 1e fa          	endbr64 
    1374:	f2 ff 25 25 5c 00 00 	bnd jmp *0x5c25(%rip)        # 6fa0 <exit@GLIBC_2.2.5>
    137b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001380 <connect@plt>:
    1380:	f3 0f 1e fa          	endbr64 
    1384:	f2 ff 25 1d 5c 00 00 	bnd jmp *0x5c1d(%rip)        # 6fa8 <connect@GLIBC_2.2.5>
    138b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001390 <__fprintf_chk@plt>:
    1390:	f3 0f 1e fa          	endbr64 
    1394:	f2 ff 25 15 5c 00 00 	bnd jmp *0x5c15(%rip)        # 6fb0 <__fprintf_chk@GLIBC_2.3.4>
    139b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013a0 <sleep@plt>:
    13a0:	f3 0f 1e fa          	endbr64 
    13a4:	f2 ff 25 0d 5c 00 00 	bnd jmp *0x5c0d(%rip)        # 6fb8 <sleep@GLIBC_2.2.5>
    13ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013b0 <__ctype_b_loc@plt>:
    13b0:	f3 0f 1e fa          	endbr64 
    13b4:	f2 ff 25 05 5c 00 00 	bnd jmp *0x5c05(%rip)        # 6fc0 <__ctype_b_loc@GLIBC_2.3>
    13bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013c0 <__sprintf_chk@plt>:
    13c0:	f3 0f 1e fa          	endbr64 
    13c4:	f2 ff 25 fd 5b 00 00 	bnd jmp *0x5bfd(%rip)        # 6fc8 <__sprintf_chk@GLIBC_2.3.4>
    13cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000013d0 <socket@plt>:
    13d0:	f3 0f 1e fa          	endbr64 
    13d4:	f2 ff 25 f5 5b 00 00 	bnd jmp *0x5bf5(%rip)        # 6fd0 <socket@GLIBC_2.2.5>
    13db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000013e0 <_start>:
    13e0:	f3 0f 1e fa          	endbr64 
    13e4:	31 ed                	xor    %ebp,%ebp
    13e6:	49 89 d1             	mov    %rdx,%r9
    13e9:	5e                   	pop    %rsi
    13ea:	48 89 e2             	mov    %rsp,%rdx
    13ed:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    13f1:	50                   	push   %rax
    13f2:	54                   	push   %rsp
    13f3:	4c 8d 05 96 1d 00 00 	lea    0x1d96(%rip),%r8        # 3190 <__libc_csu_fini>
    13fa:	48 8d 0d 1f 1d 00 00 	lea    0x1d1f(%rip),%rcx        # 3120 <__libc_csu_init>
    1401:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 14c9 <main>
    1408:	ff 15 d2 5b 00 00    	call   *0x5bd2(%rip)        # 6fe0 <__libc_start_main@GLIBC_2.2.5>
    140e:	f4                   	hlt    
    140f:	90                   	nop

0000000000001410 <deregister_tm_clones>:
    1410:	48 8d 3d 49 70 00 00 	lea    0x7049(%rip),%rdi        # 8460 <stdout@GLIBC_2.2.5>
    1417:	48 8d 05 42 70 00 00 	lea    0x7042(%rip),%rax        # 8460 <stdout@GLIBC_2.2.5>
    141e:	48 39 f8             	cmp    %rdi,%rax
    1421:	74 15                	je     1438 <deregister_tm_clones+0x28>
    1423:	48 8b 05 ae 5b 00 00 	mov    0x5bae(%rip),%rax        # 6fd8 <_ITM_deregisterTMCloneTable>
    142a:	48 85 c0             	test   %rax,%rax
    142d:	74 09                	je     1438 <deregister_tm_clones+0x28>
    142f:	ff e0                	jmp    *%rax
    1431:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1438:	c3                   	ret    
    1439:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001440 <register_tm_clones>:
    1440:	48 8d 3d 19 70 00 00 	lea    0x7019(%rip),%rdi        # 8460 <stdout@GLIBC_2.2.5>
    1447:	48 8d 35 12 70 00 00 	lea    0x7012(%rip),%rsi        # 8460 <stdout@GLIBC_2.2.5>
    144e:	48 29 fe             	sub    %rdi,%rsi
    1451:	48 89 f0             	mov    %rsi,%rax
    1454:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1458:	48 c1 f8 03          	sar    $0x3,%rax
    145c:	48 01 c6             	add    %rax,%rsi
    145f:	48 d1 fe             	sar    %rsi
    1462:	74 14                	je     1478 <register_tm_clones+0x38>
    1464:	48 8b 05 85 5b 00 00 	mov    0x5b85(%rip),%rax        # 6ff0 <_ITM_registerTMCloneTable>
    146b:	48 85 c0             	test   %rax,%rax
    146e:	74 08                	je     1478 <register_tm_clones+0x38>
    1470:	ff e0                	jmp    *%rax
    1472:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1478:	c3                   	ret    
    1479:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001480 <__do_global_dtors_aux>:
    1480:	f3 0f 1e fa          	endbr64 
    1484:	80 3d fd 6f 00 00 00 	cmpb   $0x0,0x6ffd(%rip)        # 8488 <completed.8060>
    148b:	75 2b                	jne    14b8 <__do_global_dtors_aux+0x38>
    148d:	55                   	push   %rbp
    148e:	48 83 3d 62 5b 00 00 	cmpq   $0x0,0x5b62(%rip)        # 6ff8 <__cxa_finalize@GLIBC_2.2.5>
    1495:	00 
    1496:	48 89 e5             	mov    %rsp,%rbp
    1499:	74 0c                	je     14a7 <__do_global_dtors_aux+0x27>
    149b:	48 8b 3d 66 5b 00 00 	mov    0x5b66(%rip),%rdi        # 7008 <__dso_handle>
    14a2:	e8 59 fd ff ff       	call   1200 <__cxa_finalize@plt>
    14a7:	e8 64 ff ff ff       	call   1410 <deregister_tm_clones>
    14ac:	c6 05 d5 6f 00 00 01 	movb   $0x1,0x6fd5(%rip)        # 8488 <completed.8060>
    14b3:	5d                   	pop    %rbp
    14b4:	c3                   	ret    
    14b5:	0f 1f 00             	nopl   (%rax)
    14b8:	c3                   	ret    
    14b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014c0 <frame_dummy>:
    14c0:	f3 0f 1e fa          	endbr64 
    14c4:	e9 77 ff ff ff       	jmp    1440 <register_tm_clones>

00000000000014c9 <main>:
    14c9:	f3 0f 1e fa          	endbr64 
    14cd:	53                   	push   %rbx
    14ce:	83 ff 01             	cmp    $0x1,%edi
    14d1:	74 51                	je     1524 <main+0x5b>
    14d3:	48 89 f3             	mov    %rsi,%rbx
    14d6:	83 ff 02             	cmp    $0x2,%edi
    14d9:	75 7b                	jne    1556 <main+0x8d>
    14db:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    14df:	48 8d 35 82 33 00 00 	lea    0x3382(%rip),%rsi        # 4868 <transition_table+0x428>
    14e6:	e8 65 fe ff ff       	call   1350 <fopen@plt>
    14eb:	48 89 05 9e 6f 00 00 	mov    %rax,0x6f9e(%rip)        # 8490 <infile>
    14f2:	48 85 c0             	test   %rax,%rax
    14f5:	74 3d                	je     1534 <main+0x6b>
    14f7:	e8 f8 08 00 00       	call   1df4 <initialize_bomb>
    14fc:	48 89 c3             	mov    %rax,%rbx
    14ff:	81 38 11 fa 23 20    	cmpl   $0x2023fa11,(%rax)
    1505:	74 72                	je     1579 <main+0xb0>
    1507:	48 8d 35 7a 2b 00 00 	lea    0x2b7a(%rip),%rsi        # 4088 <_IO_stdin_used+0x88>
    150e:	bf 01 00 00 00       	mov    $0x1,%edi
    1513:	b8 00 00 00 00       	mov    $0x0,%eax
    1518:	e8 23 fe ff ff       	call   1340 <__printf_chk@plt>
    151d:	b8 00 00 00 00       	mov    $0x0,%eax
    1522:	5b                   	pop    %rbx
    1523:	c3                   	ret    
    1524:	48 8b 05 45 6f 00 00 	mov    0x6f45(%rip),%rax        # 8470 <stdin@GLIBC_2.2.5>
    152b:	48 89 05 5e 6f 00 00 	mov    %rax,0x6f5e(%rip)        # 8490 <infile>
    1532:	eb c3                	jmp    14f7 <main+0x2e>
    1534:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
    1538:	48 8b 13             	mov    (%rbx),%rdx
    153b:	48 8d 35 c2 2a 00 00 	lea    0x2ac2(%rip),%rsi        # 4004 <_IO_stdin_used+0x4>
    1542:	bf 01 00 00 00       	mov    $0x1,%edi
    1547:	e8 f4 fd ff ff       	call   1340 <__printf_chk@plt>
    154c:	bf 08 00 00 00       	mov    $0x8,%edi
    1551:	e8 1a fe ff ff       	call   1370 <exit@plt>
    1556:	48 8b 16             	mov    (%rsi),%rdx
    1559:	48 8d 35 c1 2a 00 00 	lea    0x2ac1(%rip),%rsi        # 4021 <_IO_stdin_used+0x21>
    1560:	bf 01 00 00 00       	mov    $0x1,%edi
    1565:	b8 00 00 00 00       	mov    $0x0,%eax
    156a:	e8 d1 fd ff ff       	call   1340 <__printf_chk@plt>
    156f:	bf 08 00 00 00       	mov    $0x8,%edi
    1574:	e8 f7 fd ff ff       	call   1370 <exit@plt>
    1579:	48 8d 3d 48 2b 00 00 	lea    0x2b48(%rip),%rdi        # 40c8 <_IO_stdin_used+0xc8>
    1580:	e8 db fc ff ff       	call   1260 <puts@plt>
    1585:	48 8d 3d 7c 2b 00 00 	lea    0x2b7c(%rip),%rdi        # 4108 <_IO_stdin_used+0x108>
    158c:	e8 cf fc ff ff       	call   1260 <puts@plt>
    1591:	e8 3b 0c 00 00       	call   21d1 <read_line>
    1596:	48 89 c7             	mov    %rax,%rdi
    1599:	e8 0f 02 00 00       	call   17ad <phase_1>
    159e:	48 89 df             	mov    %rbx,%rdi
    15a1:	e8 76 0d 00 00       	call   231c <phase_defused>
    15a6:	48 8d 3d 9b 2b 00 00 	lea    0x2b9b(%rip),%rdi        # 4148 <_IO_stdin_used+0x148>
    15ad:	e8 ae fc ff ff       	call   1260 <puts@plt>
    15b2:	e8 1a 0c 00 00       	call   21d1 <read_line>
    15b7:	48 89 c7             	mov    %rax,%rdi
    15ba:	e8 12 02 00 00       	call   17d1 <phase_2>
    15bf:	48 89 df             	mov    %rbx,%rdi
    15c2:	e8 55 0d 00 00       	call   231c <phase_defused>
    15c7:	48 8d 3d 6d 2a 00 00 	lea    0x2a6d(%rip),%rdi        # 403b <_IO_stdin_used+0x3b>
    15ce:	e8 8d fc ff ff       	call   1260 <puts@plt>
    15d3:	e8 f9 0b 00 00       	call   21d1 <read_line>
    15d8:	48 89 c7             	mov    %rax,%rdi
    15db:	e8 72 02 00 00       	call   1852 <phase_3>
    15e0:	48 89 df             	mov    %rbx,%rdi
    15e3:	e8 34 0d 00 00       	call   231c <phase_defused>
    15e8:	48 8d 3d 69 2a 00 00 	lea    0x2a69(%rip),%rdi        # 4058 <_IO_stdin_used+0x58>
    15ef:	e8 6c fc ff ff       	call   1260 <puts@plt>
    15f4:	e8 d8 0b 00 00       	call   21d1 <read_line>
    15f9:	48 89 c7             	mov    %rax,%rdi
    15fc:	e8 4e 03 00 00       	call   194f <phase_4>
    1601:	48 89 df             	mov    %rbx,%rdi
    1604:	e8 13 0d 00 00       	call   231c <phase_defused>
    1609:	48 8d 3d 68 2b 00 00 	lea    0x2b68(%rip),%rdi        # 4178 <_IO_stdin_used+0x178>
    1610:	e8 4b fc ff ff       	call   1260 <puts@plt>
    1615:	e8 b7 0b 00 00       	call   21d1 <read_line>
    161a:	48 89 c7             	mov    %rax,%rdi
    161d:	e8 ac 03 00 00       	call   19ce <phase_5>
    1622:	48 89 df             	mov    %rbx,%rdi
    1625:	e8 f2 0c 00 00       	call   231c <phase_defused>
    162a:	48 8d 3d 36 2a 00 00 	lea    0x2a36(%rip),%rdi        # 4067 <_IO_stdin_used+0x67>
    1631:	e8 2a fc ff ff       	call   1260 <puts@plt>
    1636:	e8 96 0b 00 00       	call   21d1 <read_line>
    163b:	48 89 c7             	mov    %rax,%rdi
    163e:	e8 1e 04 00 00       	call   1a61 <phase_6>
    1643:	48 89 df             	mov    %rbx,%rdi
    1646:	e8 d1 0c 00 00       	call   231c <phase_defused>
    164b:	48 89 df             	mov    %rbx,%rdi
    164e:	e8 cd fb ff ff       	call   1220 <free@plt>
    1653:	e9 c5 fe ff ff       	jmp    151d <main+0x54>

0000000000001658 <genshin>:
    1658:	f3 0f 1e fa          	endbr64 
    165c:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
    1663:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    166a:	00 00 
    166c:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
    1673:	00 
    1674:	31 c0                	xor    %eax,%eax
    1676:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
    167b:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    1680:	48 83 ec 08          	sub    $0x8,%rsp
    1684:	48 8d 44 24 28       	lea    0x28(%rsp),%rax
    1689:	50                   	push   %rax
    168a:	48 8d 44 24 2c       	lea    0x2c(%rsp),%rax
    168f:	50                   	push   %rax
    1690:	48 8d 44 24 30       	lea    0x30(%rsp),%rax
    1695:	50                   	push   %rax
    1696:	4c 8d 4c 24 34       	lea    0x34(%rsp),%r9
    169b:	4c 8d 44 24 30       	lea    0x30(%rsp),%r8
    16a0:	48 8d 35 f5 2a 00 00 	lea    0x2af5(%rip),%rsi        # 419c <_IO_stdin_used+0x19c>
    16a7:	48 8d 3d 6a 6e 00 00 	lea    0x6e6a(%rip),%rdi        # 8518 <input_strings+0x78>
    16ae:	b8 00 00 00 00       	mov    $0x0,%eax
    16b3:	e8 78 fc ff ff       	call   1330 <__isoc99_sscanf@plt>
    16b8:	48 83 c4 20          	add    $0x20,%rsp
    16bc:	83 f8 07             	cmp    $0x7,%eax
    16bf:	74 20                	je     16e1 <genshin+0x89>
    16c1:	b8 00 00 00 00       	mov    $0x0,%eax
    16c6:	48 8b b4 24 98 00 00 	mov    0x98(%rsp),%rsi
    16cd:	00 
    16ce:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
    16d5:	00 00 
    16d7:	75 2b                	jne    1704 <genshin+0xac>
    16d9:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
    16e0:	c3                   	ret    
    16e1:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
    16e6:	48 8d 35 db 2a 00 00 	lea    0x2adb(%rip),%rsi        # 41c8 <_IO_stdin_used+0x1c8>
    16ed:	e8 b1 06 00 00       	call   1da3 <strings_not_equal>
    16f2:	85 c0                	test   %eax,%eax
    16f4:	74 07                	je     16fd <genshin+0xa5>
    16f6:	b8 00 00 00 00       	mov    $0x0,%eax
    16fb:	eb c9                	jmp    16c6 <genshin+0x6e>
    16fd:	b8 01 00 00 00       	mov    $0x1,%eax
    1702:	eb c2                	jmp    16c6 <genshin+0x6e>
    1704:	e8 77 fb ff ff       	call   1280 <__stack_chk_fail@plt>

0000000000001709 <qidong>:
    1709:	f3 0f 1e fa          	endbr64 
    170d:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    1714:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    171b:	00 00 
    171d:	48 89 84 24 88 00 00 	mov    %rax,0x88(%rsp)
    1724:	00 
    1725:	31 c0                	xor    %eax,%eax
    1727:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
    172c:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    1731:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
    1736:	48 8d 35 6b 2a 00 00 	lea    0x2a6b(%rip),%rsi        # 41a8 <_IO_stdin_used+0x1a8>
    173d:	48 8d 3d c4 6e 00 00 	lea    0x6ec4(%rip),%rdi        # 8608 <input_strings+0x168>
    1744:	e8 e7 fb ff ff       	call   1330 <__isoc99_sscanf@plt>
    1749:	83 f8 03             	cmp    $0x3,%eax
    174c:	74 20                	je     176e <qidong+0x65>
    174e:	b8 00 00 00 00       	mov    $0x0,%eax
    1753:	48 8b b4 24 88 00 00 	mov    0x88(%rsp),%rsi
    175a:	00 
    175b:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
    1762:	00 00 
    1764:	75 42                	jne    17a8 <qidong+0x9f>
    1766:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    176d:	c3                   	ret    
    176e:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
    1773:	0f b6 02             	movzbl (%rdx),%eax
    1776:	84 c0                	test   %al,%al
    1778:	74 0b                	je     1785 <qidong+0x7c>
    177a:	83 c0 02             	add    $0x2,%eax
    177d:	88 02                	mov    %al,(%rdx)
    177f:	48 83 c2 01          	add    $0x1,%rdx
    1783:	eb ee                	jmp    1773 <qidong+0x6a>
    1785:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    178a:	48 8d 35 57 2a 00 00 	lea    0x2a57(%rip),%rsi        # 41e8 <_IO_stdin_used+0x1e8>
    1791:	e8 0d 06 00 00       	call   1da3 <strings_not_equal>
    1796:	85 c0                	test   %eax,%eax
    1798:	74 07                	je     17a1 <qidong+0x98>
    179a:	b8 00 00 00 00       	mov    $0x0,%eax
    179f:	eb b2                	jmp    1753 <qidong+0x4a>
    17a1:	b8 01 00 00 00       	mov    $0x1,%eax
    17a6:	eb ab                	jmp    1753 <qidong+0x4a>
    17a8:	e8 d3 fa ff ff       	call   1280 <__stack_chk_fail@plt>

00000000000017ad <phase_1>:
    17ad:	f3 0f 1e fa          	endbr64 
    17b1:	48 83 ec 08          	sub    $0x8,%rsp
    17b5:	48 8d 35 54 2a 00 00 	lea    0x2a54(%rip),%rsi        # 4210 <_IO_stdin_used+0x210>
    17bc:	e8 e2 05 00 00       	call   1da3 <strings_not_equal>
    17c1:	85 c0                	test   %eax,%eax
    17c3:	75 05                	jne    17ca <phase_1+0x1d>
    17c5:	48 83 c4 08          	add    $0x8,%rsp
    17c9:	c3                   	ret    
    17ca:	e8 37 09 00 00       	call   2106 <explode_bomb>
    17cf:	eb f4                	jmp    17c5 <phase_1+0x18>

00000000000017d1 <phase_2>:
    17d1:	f3 0f 1e fa          	endbr64 
    17d5:	53                   	push   %rbx
    17d6:	48 83 ec 20          	sub    $0x20,%rsp
    17da:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    17e1:	00 00 
    17e3:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    17e8:	31 c0                	xor    %eax,%eax
    17ea:	48 89 e6             	mov    %rsp,%rsi
    17ed:	e8 9a 09 00 00       	call   218c <read_six_numbers>
    17f2:	83 3c 24 00          	cmpl   $0x0,(%rsp)
    17f6:	75 07                	jne    17ff <phase_2+0x2e>
    17f8:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
    17fd:	74 05                	je     1804 <phase_2+0x33>
    17ff:	e8 02 09 00 00       	call   2106 <explode_bomb>
    1804:	bb 02 00 00 00       	mov    $0x2,%ebx
    1809:	eb 08                	jmp    1813 <phase_2+0x42>
    180b:	e8 f6 08 00 00       	call   2106 <explode_bomb>
    1810:	83 c3 01             	add    $0x1,%ebx
    1813:	83 fb 05             	cmp    $0x5,%ebx
    1816:	7f 1f                	jg     1837 <phase_2+0x66>
    1818:	48 63 c3             	movslq %ebx,%rax
    181b:	8d 53 fe             	lea    -0x2(%rbx),%edx
    181e:	48 63 d2             	movslq %edx,%rdx
    1821:	8b 0c 94             	mov    (%rsp,%rdx,4),%ecx
    1824:	8d 53 ff             	lea    -0x1(%rbx),%edx
    1827:	48 63 d2             	movslq %edx,%rdx
    182a:	8b 14 94             	mov    (%rsp,%rdx,4),%edx
    182d:	8d 14 4a             	lea    (%rdx,%rcx,2),%edx
    1830:	39 14 84             	cmp    %edx,(%rsp,%rax,4)
    1833:	74 db                	je     1810 <phase_2+0x3f>
    1835:	eb d4                	jmp    180b <phase_2+0x3a>
    1837:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    183c:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1843:	00 00 
    1845:	75 06                	jne    184d <phase_2+0x7c>
    1847:	48 83 c4 20          	add    $0x20,%rsp
    184b:	5b                   	pop    %rbx
    184c:	c3                   	ret    
    184d:	e8 2e fa ff ff       	call   1280 <__stack_chk_fail@plt>

0000000000001852 <phase_3>:
    1852:	f3 0f 1e fa          	endbr64 
    1856:	48 83 ec 18          	sub    $0x18,%rsp
    185a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1861:	00 00 
    1863:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1868:	31 c0                	xor    %eax,%eax
    186a:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
    186f:	48 89 e2             	mov    %rsp,%rdx
    1872:	48 8d 35 51 2f 00 00 	lea    0x2f51(%rip),%rsi        # 47ca <transition_table+0x38a>
    1879:	e8 b2 fa ff ff       	call   1330 <__isoc99_sscanf@plt>
    187e:	83 f8 01             	cmp    $0x1,%eax
    1881:	7e 1b                	jle    189e <phase_3+0x4c>
    1883:	8b 04 24             	mov    (%rsp),%eax
    1886:	83 f8 07             	cmp    $0x7,%eax
    1889:	77 64                	ja     18ef <phase_3+0x9d>
    188b:	89 c0                	mov    %eax,%eax
    188d:	48 8d 15 4c 2b 00 00 	lea    0x2b4c(%rip),%rdx        # 43e0 <_IO_stdin_used+0x3e0>
    1894:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
    1898:	48 01 d0             	add    %rdx,%rax
    189b:	3e ff e0             	notrack jmp *%rax
    189e:	e8 63 08 00 00       	call   2106 <explode_bomb>
    18a3:	eb de                	jmp    1883 <phase_3+0x31>
    18a5:	b8 6e 03 00 00       	mov    $0x36e,%eax
    18aa:	39 44 24 04          	cmp    %eax,0x4(%rsp)
    18ae:	75 52                	jne    1902 <phase_3+0xb0>
    18b0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    18b5:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    18bc:	00 00 
    18be:	75 49                	jne    1909 <phase_3+0xb7>
    18c0:	48 83 c4 18          	add    $0x18,%rsp
    18c4:	c3                   	ret    
    18c5:	b8 c1 02 00 00       	mov    $0x2c1,%eax
    18ca:	eb de                	jmp    18aa <phase_3+0x58>
    18cc:	b8 e7 00 00 00       	mov    $0xe7,%eax
    18d1:	eb d7                	jmp    18aa <phase_3+0x58>
    18d3:	b8 90 02 00 00       	mov    $0x290,%eax
    18d8:	eb d0                	jmp    18aa <phase_3+0x58>
    18da:	b8 44 02 00 00       	mov    $0x244,%eax
    18df:	eb c9                	jmp    18aa <phase_3+0x58>
    18e1:	b8 51 02 00 00       	mov    $0x251,%eax
    18e6:	eb c2                	jmp    18aa <phase_3+0x58>
    18e8:	b8 60 02 00 00       	mov    $0x260,%eax
    18ed:	eb bb                	jmp    18aa <phase_3+0x58>
    18ef:	e8 12 08 00 00       	call   2106 <explode_bomb>
    18f4:	b8 00 00 00 00       	mov    $0x0,%eax
    18f9:	eb af                	jmp    18aa <phase_3+0x58>
    18fb:	b8 79 03 00 00       	mov    $0x379,%eax
    1900:	eb a8                	jmp    18aa <phase_3+0x58>
    1902:	e8 ff 07 00 00       	call   2106 <explode_bomb>
    1907:	eb a7                	jmp    18b0 <phase_3+0x5e>
    1909:	e8 72 f9 ff ff       	call   1280 <__stack_chk_fail@plt>

000000000000190e <func4>:
    190e:	f3 0f 1e fa          	endbr64 
    1912:	48 83 ec 08          	sub    $0x8,%rsp
    1916:	89 d1                	mov    %edx,%ecx
    1918:	29 f1                	sub    %esi,%ecx
    191a:	89 c8                	mov    %ecx,%eax
    191c:	c1 e8 1f             	shr    $0x1f,%eax
    191f:	01 c8                	add    %ecx,%eax
    1921:	d1 f8                	sar    %eax
    1923:	01 f0                	add    %esi,%eax
    1925:	39 f8                	cmp    %edi,%eax
    1927:	7f 0c                	jg     1935 <func4+0x27>
    1929:	7c 16                	jl     1941 <func4+0x33>
    192b:	b8 00 00 00 00       	mov    $0x0,%eax
    1930:	48 83 c4 08          	add    $0x8,%rsp
    1934:	c3                   	ret    
    1935:	8d 50 ff             	lea    -0x1(%rax),%edx
    1938:	e8 d1 ff ff ff       	call   190e <func4>
    193d:	01 c0                	add    %eax,%eax
    193f:	eb ef                	jmp    1930 <func4+0x22>
    1941:	8d 70 01             	lea    0x1(%rax),%esi
    1944:	e8 c5 ff ff ff       	call   190e <func4>
    1949:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
    194d:	eb e1                	jmp    1930 <func4+0x22>

000000000000194f <phase_4>:
    194f:	f3 0f 1e fa          	endbr64 
    1953:	48 83 ec 18          	sub    $0x18,%rsp
    1957:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    195e:	00 00 
    1960:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1965:	31 c0                	xor    %eax,%eax
    1967:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
    196c:	48 89 e2             	mov    %rsp,%rdx
    196f:	48 8d 35 54 2e 00 00 	lea    0x2e54(%rip),%rsi        # 47ca <transition_table+0x38a>
    1976:	e8 b5 f9 ff ff       	call   1330 <__isoc99_sscanf@plt>
    197b:	83 f8 02             	cmp    $0x2,%eax
    197e:	75 0c                	jne    198c <phase_4+0x3d>
    1980:	8b 04 24             	mov    (%rsp),%eax
    1983:	85 c0                	test   %eax,%eax
    1985:	78 05                	js     198c <phase_4+0x3d>
    1987:	83 f8 0e             	cmp    $0xe,%eax
    198a:	7e 05                	jle    1991 <phase_4+0x42>
    198c:	e8 75 07 00 00       	call   2106 <explode_bomb>
    1991:	ba 0e 00 00 00       	mov    $0xe,%edx
    1996:	be 00 00 00 00       	mov    $0x0,%esi
    199b:	8b 3c 24             	mov    (%rsp),%edi
    199e:	e8 6b ff ff ff       	call   190e <func4>
    19a3:	83 f8 04             	cmp    $0x4,%eax
    19a6:	75 07                	jne    19af <phase_4+0x60>
    19a8:	83 7c 24 04 04       	cmpl   $0x4,0x4(%rsp)
    19ad:	74 05                	je     19b4 <phase_4+0x65>
    19af:	e8 52 07 00 00       	call   2106 <explode_bomb>
    19b4:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    19b9:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    19c0:	00 00 
    19c2:	75 05                	jne    19c9 <phase_4+0x7a>
    19c4:	48 83 c4 18          	add    $0x18,%rsp
    19c8:	c3                   	ret    
    19c9:	e8 b2 f8 ff ff       	call   1280 <__stack_chk_fail@plt>

00000000000019ce <phase_5>:
    19ce:	f3 0f 1e fa          	endbr64 
    19d2:	48 83 ec 18          	sub    $0x18,%rsp
    19d6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    19dd:	00 00 
    19df:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    19e4:	31 c0                	xor    %eax,%eax
    19e6:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
    19eb:	48 89 e2             	mov    %rsp,%rdx
    19ee:	48 8d 35 d5 2d 00 00 	lea    0x2dd5(%rip),%rsi        # 47ca <transition_table+0x38a>
    19f5:	e8 36 f9 ff ff       	call   1330 <__isoc99_sscanf@plt>
    19fa:	83 f8 01             	cmp    $0x1,%eax
    19fd:	7e 31                	jle    1a30 <phase_5+0x62>
    19ff:	8b 04 24             	mov    (%rsp),%eax
    1a02:	83 e0 0f             	and    $0xf,%eax
    1a05:	89 04 24             	mov    %eax,(%rsp)
    1a08:	b9 00 00 00 00       	mov    $0x0,%ecx
    1a0d:	ba 00 00 00 00       	mov    $0x0,%edx
    1a12:	8b 04 24             	mov    (%rsp),%eax
    1a15:	83 f8 0f             	cmp    $0xf,%eax
    1a18:	74 1d                	je     1a37 <phase_5+0x69>
    1a1a:	83 c2 01             	add    $0x1,%edx
    1a1d:	48 98                	cltq   
    1a1f:	48 8d 35 da 29 00 00 	lea    0x29da(%rip),%rsi        # 4400 <array.3499>
    1a26:	8b 04 86             	mov    (%rsi,%rax,4),%eax
    1a29:	89 04 24             	mov    %eax,(%rsp)
    1a2c:	01 c1                	add    %eax,%ecx
    1a2e:	eb e2                	jmp    1a12 <phase_5+0x44>
    1a30:	e8 d1 06 00 00       	call   2106 <explode_bomb>
    1a35:	eb c8                	jmp    19ff <phase_5+0x31>
    1a37:	83 fa 0f             	cmp    $0xf,%edx
    1a3a:	75 06                	jne    1a42 <phase_5+0x74>
    1a3c:	39 4c 24 04          	cmp    %ecx,0x4(%rsp)
    1a40:	74 05                	je     1a47 <phase_5+0x79>
    1a42:	e8 bf 06 00 00       	call   2106 <explode_bomb>
    1a47:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1a4c:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1a53:	00 00 
    1a55:	75 05                	jne    1a5c <phase_5+0x8e>
    1a57:	48 83 c4 18          	add    $0x18,%rsp
    1a5b:	c3                   	ret    
    1a5c:	e8 1f f8 ff ff       	call   1280 <__stack_chk_fail@plt>

0000000000001a61 <phase_6>:
    1a61:	f3 0f 1e fa          	endbr64 
    1a65:	41 54                	push   %r12
    1a67:	55                   	push   %rbp
    1a68:	53                   	push   %rbx
    1a69:	48 83 ec 60          	sub    $0x60,%rsp
    1a6d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1a74:	00 00 
    1a76:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    1a7b:	31 c0                	xor    %eax,%eax
    1a7d:	48 89 e6             	mov    %rsp,%rsi
    1a80:	e8 07 07 00 00       	call   218c <read_six_numbers>
    1a85:	bd 00 00 00 00       	mov    $0x0,%ebp
    1a8a:	eb 27                	jmp    1ab3 <phase_6+0x52>
    1a8c:	e8 75 06 00 00       	call   2106 <explode_bomb>
    1a91:	eb 33                	jmp    1ac6 <phase_6+0x65>
    1a93:	e8 6e 06 00 00       	call   2106 <explode_bomb>
    1a98:	83 c3 01             	add    $0x1,%ebx
    1a9b:	83 fb 05             	cmp    $0x5,%ebx
    1a9e:	7f 10                	jg     1ab0 <phase_6+0x4f>
    1aa0:	48 63 c5             	movslq %ebp,%rax
    1aa3:	48 63 d3             	movslq %ebx,%rdx
    1aa6:	8b 3c 94             	mov    (%rsp,%rdx,4),%edi
    1aa9:	39 3c 84             	cmp    %edi,(%rsp,%rax,4)
    1aac:	75 ea                	jne    1a98 <phase_6+0x37>
    1aae:	eb e3                	jmp    1a93 <phase_6+0x32>
    1ab0:	44 89 e5             	mov    %r12d,%ebp
    1ab3:	83 fd 05             	cmp    $0x5,%ebp
    1ab6:	7f 17                	jg     1acf <phase_6+0x6e>
    1ab8:	48 63 c5             	movslq %ebp,%rax
    1abb:	8b 04 84             	mov    (%rsp,%rax,4),%eax
    1abe:	83 e8 01             	sub    $0x1,%eax
    1ac1:	83 f8 05             	cmp    $0x5,%eax
    1ac4:	77 c6                	ja     1a8c <phase_6+0x2b>
    1ac6:	44 8d 65 01          	lea    0x1(%rbp),%r12d
    1aca:	44 89 e3             	mov    %r12d,%ebx
    1acd:	eb cc                	jmp    1a9b <phase_6+0x3a>
    1acf:	b8 00 00 00 00       	mov    $0x0,%eax
    1ad4:	eb 11                	jmp    1ae7 <phase_6+0x86>
    1ad6:	48 63 c8             	movslq %eax,%rcx
    1ad9:	ba 07 00 00 00       	mov    $0x7,%edx
    1ade:	2b 14 8c             	sub    (%rsp,%rcx,4),%edx
    1ae1:	89 14 8c             	mov    %edx,(%rsp,%rcx,4)
    1ae4:	83 c0 01             	add    $0x1,%eax
    1ae7:	83 f8 05             	cmp    $0x5,%eax
    1aea:	7e ea                	jle    1ad6 <phase_6+0x75>
    1aec:	be 00 00 00 00       	mov    $0x0,%esi
    1af1:	eb 17                	jmp    1b0a <phase_6+0xa9>
    1af3:	48 8b 52 08          	mov    0x8(%rdx),%rdx
    1af7:	83 c0 01             	add    $0x1,%eax
    1afa:	48 63 ce             	movslq %esi,%rcx
    1afd:	39 04 8c             	cmp    %eax,(%rsp,%rcx,4)
    1b00:	7f f1                	jg     1af3 <phase_6+0x92>
    1b02:	48 89 54 cc 20       	mov    %rdx,0x20(%rsp,%rcx,8)
    1b07:	83 c6 01             	add    $0x1,%esi
    1b0a:	83 fe 05             	cmp    $0x5,%esi
    1b0d:	7f 0e                	jg     1b1d <phase_6+0xbc>
    1b0f:	b8 01 00 00 00       	mov    $0x1,%eax
    1b14:	48 8d 15 35 65 00 00 	lea    0x6535(%rip),%rdx        # 8050 <node1>
    1b1b:	eb dd                	jmp    1afa <phase_6+0x99>
    1b1d:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
    1b22:	48 89 d9             	mov    %rbx,%rcx
    1b25:	b8 01 00 00 00       	mov    $0x1,%eax
    1b2a:	eb 12                	jmp    1b3e <phase_6+0xdd>
    1b2c:	48 63 d0             	movslq %eax,%rdx
    1b2f:	48 8b 54 d4 20       	mov    0x20(%rsp,%rdx,8),%rdx
    1b34:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    1b38:	83 c0 01             	add    $0x1,%eax
    1b3b:	48 89 d1             	mov    %rdx,%rcx
    1b3e:	83 f8 05             	cmp    $0x5,%eax
    1b41:	7e e9                	jle    1b2c <phase_6+0xcb>
    1b43:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
    1b4a:	00 
    1b4b:	bd 00 00 00 00       	mov    $0x0,%ebp
    1b50:	eb 07                	jmp    1b59 <phase_6+0xf8>
    1b52:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
    1b56:	83 c5 01             	add    $0x1,%ebp
    1b59:	83 fd 04             	cmp    $0x4,%ebp
    1b5c:	7f 11                	jg     1b6f <phase_6+0x10e>
    1b5e:	48 8b 43 08          	mov    0x8(%rbx),%rax
    1b62:	8b 00                	mov    (%rax),%eax
    1b64:	39 03                	cmp    %eax,(%rbx)
    1b66:	7e ea                	jle    1b52 <phase_6+0xf1>
    1b68:	e8 99 05 00 00       	call   2106 <explode_bomb>
    1b6d:	eb e3                	jmp    1b52 <phase_6+0xf1>
    1b6f:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
    1b74:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1b7b:	00 00 
    1b7d:	75 09                	jne    1b88 <phase_6+0x127>
    1b7f:	48 83 c4 60          	add    $0x60,%rsp
    1b83:	5b                   	pop    %rbx
    1b84:	5d                   	pop    %rbp
    1b85:	41 5c                	pop    %r12
    1b87:	c3                   	ret    
    1b88:	e8 f3 f6 ff ff       	call   1280 <__stack_chk_fail@plt>

0000000000001b8d <emulate_fsm>:
    1b8d:	f3 0f 1e fa          	endbr64 
    1b91:	55                   	push   %rbp
    1b92:	53                   	push   %rbx
    1b93:	48 83 ec 08          	sub    $0x8,%rsp
    1b97:	89 fd                	mov    %edi,%ebp
    1b99:	48 89 f3             	mov    %rsi,%rbx
    1b9c:	eb 27                	jmp    1bc5 <emulate_fsm+0x38>
    1b9e:	0f be 03             	movsbl (%rbx),%eax
    1ba1:	83 e8 30             	sub    $0x30,%eax
    1ba4:	48 63 ed             	movslq %ebp,%rbp
    1ba7:	48 98                	cltq   
    1ba9:	48 8d 3c c5 00 00 00 	lea    0x0(,%rax,8),%rdi
    1bb0:	00 
    1bb1:	48 29 c7             	sub    %rax,%rdi
    1bb4:	48 01 ef             	add    %rbp,%rdi
    1bb7:	48 8d 05 82 28 00 00 	lea    0x2882(%rip),%rax        # 4440 <transition_table>
    1bbe:	8b 2c b8             	mov    (%rax,%rdi,4),%ebp
    1bc1:	48 83 c3 01          	add    $0x1,%rbx
    1bc5:	0f b6 03             	movzbl (%rbx),%eax
    1bc8:	84 c0                	test   %al,%al
    1bca:	74 0e                	je     1bda <emulate_fsm+0x4d>
    1bcc:	83 e8 30             	sub    $0x30,%eax
    1bcf:	3c 01                	cmp    $0x1,%al
    1bd1:	76 cb                	jbe    1b9e <emulate_fsm+0x11>
    1bd3:	e8 2e 05 00 00       	call   2106 <explode_bomb>
    1bd8:	eb c4                	jmp    1b9e <emulate_fsm+0x11>
    1bda:	89 e8                	mov    %ebp,%eax
    1bdc:	48 83 c4 08          	add    $0x8,%rsp
    1be0:	5b                   	pop    %rbx
    1be1:	5d                   	pop    %rbp
    1be2:	c3                   	ret    

0000000000001be3 <check_synchronizing_sequence>:
    1be3:	f3 0f 1e fa          	endbr64 
    1be7:	41 54                	push   %r12
    1be9:	55                   	push   %rbp
    1bea:	53                   	push   %rbx
    1beb:	48 89 fd             	mov    %rdi,%rbp
    1bee:	48 89 fe             	mov    %rdi,%rsi
    1bf1:	bf 00 00 00 00       	mov    $0x0,%edi
    1bf6:	e8 92 ff ff ff       	call   1b8d <emulate_fsm>
    1bfb:	41 89 c4             	mov    %eax,%r12d
    1bfe:	bb 01 00 00 00       	mov    $0x1,%ebx
    1c03:	83 fb 06             	cmp    $0x6,%ebx
    1c06:	7f 14                	jg     1c1c <check_synchronizing_sequence+0x39>
    1c08:	48 89 ee             	mov    %rbp,%rsi
    1c0b:	89 df                	mov    %ebx,%edi
    1c0d:	e8 7b ff ff ff       	call   1b8d <emulate_fsm>
    1c12:	44 39 e0             	cmp    %r12d,%eax
    1c15:	75 0f                	jne    1c26 <check_synchronizing_sequence+0x43>
    1c17:	83 c3 01             	add    $0x1,%ebx
    1c1a:	eb e7                	jmp    1c03 <check_synchronizing_sequence+0x20>
    1c1c:	b8 00 00 00 00       	mov    $0x0,%eax
    1c21:	5b                   	pop    %rbx
    1c22:	5d                   	pop    %rbp
    1c23:	41 5c                	pop    %r12
    1c25:	c3                   	ret    
    1c26:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1c2b:	eb f4                	jmp    1c21 <check_synchronizing_sequence+0x3e>

0000000000001c2d <secret_phase>:
    1c2d:	f3 0f 1e fa          	endbr64 
    1c31:	55                   	push   %rbp
    1c32:	53                   	push   %rbx
    1c33:	48 83 ec 18          	sub    $0x18,%rsp
    1c37:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1c3e:	00 00 
    1c40:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1c45:	31 c0                	xor    %eax,%eax
    1c47:	e8 85 05 00 00       	call   21d1 <read_line>
    1c4c:	48 89 c5             	mov    %rax,%rbp
    1c4f:	bb 00 00 00 00       	mov    $0x0,%ebx
    1c54:	eb 08                	jmp    1c5e <secret_phase+0x31>
    1c56:	e8 ab 04 00 00       	call   2106 <explode_bomb>
    1c5b:	83 c3 01             	add    $0x1,%ebx
    1c5e:	48 63 c3             	movslq %ebx,%rax
    1c61:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
    1c66:	74 07                	je     1c6f <secret_phase+0x42>
    1c68:	83 fb 18             	cmp    $0x18,%ebx
    1c6b:	7e ee                	jle    1c5b <secret_phase+0x2e>
    1c6d:	eb e7                	jmp    1c56 <secret_phase+0x29>
    1c6f:	48 89 ef             	mov    %rbp,%rdi
    1c72:	e8 6c ff ff ff       	call   1be3 <check_synchronizing_sequence>
    1c77:	85 c0                	test   %eax,%eax
    1c79:	75 75                	jne    1cf0 <secret_phase+0xc3>
    1c7b:	48 8d 3d be 25 00 00 	lea    0x25be(%rip),%rdi        # 4240 <_IO_stdin_used+0x240>
    1c82:	e8 d9 f5 ff ff       	call   1260 <puts@plt>
    1c87:	48 8d 3d 0a 26 00 00 	lea    0x260a(%rip),%rdi        # 4298 <_IO_stdin_used+0x298>
    1c8e:	e8 cd f5 ff ff       	call   1260 <puts@plt>
    1c93:	48 8d 3d 6e 26 00 00 	lea    0x266e(%rip),%rdi        # 4308 <_IO_stdin_used+0x308>
    1c9a:	e8 c1 f5 ff ff       	call   1260 <puts@plt>
    1c9f:	48 8d 3d a2 26 00 00 	lea    0x26a2(%rip),%rdi        # 4348 <_IO_stdin_used+0x348>
    1ca6:	e8 b5 f5 ff ff       	call   1260 <puts@plt>
    1cab:	48 8d 3d ce 26 00 00 	lea    0x26ce(%rip),%rdi        # 4380 <_IO_stdin_used+0x380>
    1cb2:	e8 a9 f5 ff ff       	call   1260 <puts@plt>
    1cb7:	48 8d 3d 02 27 00 00 	lea    0x2702(%rip),%rdi        # 43c0 <_IO_stdin_used+0x3c0>
    1cbe:	e8 9d f5 ff ff       	call   1260 <puts@plt>
    1cc3:	48 8d 3d e7 24 00 00 	lea    0x24e7(%rip),%rdi        # 41b1 <_IO_stdin_used+0x1b1>
    1cca:	e8 91 f5 ff ff       	call   1260 <puts@plt>
    1ccf:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    1cd4:	e8 43 06 00 00       	call   231c <phase_defused>
    1cd9:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1cde:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1ce5:	00 00 
    1ce7:	75 0e                	jne    1cf7 <secret_phase+0xca>
    1ce9:	48 83 c4 18          	add    $0x18,%rsp
    1ced:	5b                   	pop    %rbx
    1cee:	5d                   	pop    %rbp
    1cef:	c3                   	ret    
    1cf0:	e8 11 04 00 00       	call   2106 <explode_bomb>
    1cf5:	eb 84                	jmp    1c7b <secret_phase+0x4e>
    1cf7:	e8 84 f5 ff ff       	call   1280 <__stack_chk_fail@plt>

0000000000001cfc <sig_handler>:
    1cfc:	f3 0f 1e fa          	endbr64 
    1d00:	50                   	push   %rax
    1d01:	58                   	pop    %rax
    1d02:	48 83 ec 08          	sub    $0x8,%rsp
    1d06:	48 8d 3d 6b 27 00 00 	lea    0x276b(%rip),%rdi        # 4478 <transition_table+0x38>
    1d0d:	e8 4e f5 ff ff       	call   1260 <puts@plt>
    1d12:	bf 03 00 00 00       	mov    $0x3,%edi
    1d17:	e8 84 f6 ff ff       	call   13a0 <sleep@plt>
    1d1c:	48 8d 35 20 2a 00 00 	lea    0x2a20(%rip),%rsi        # 4743 <transition_table+0x303>
    1d23:	bf 01 00 00 00       	mov    $0x1,%edi
    1d28:	b8 00 00 00 00       	mov    $0x0,%eax
    1d2d:	e8 0e f6 ff ff       	call   1340 <__printf_chk@plt>
    1d32:	48 8b 3d 27 67 00 00 	mov    0x6727(%rip),%rdi        # 8460 <stdout@GLIBC_2.2.5>
    1d39:	e8 e2 f5 ff ff       	call   1320 <fflush@plt>
    1d3e:	bf 01 00 00 00       	mov    $0x1,%edi
    1d43:	e8 58 f6 ff ff       	call   13a0 <sleep@plt>
    1d48:	48 8d 3d fc 29 00 00 	lea    0x29fc(%rip),%rdi        # 474b <transition_table+0x30b>
    1d4f:	e8 0c f5 ff ff       	call   1260 <puts@plt>
    1d54:	bf 10 00 00 00       	mov    $0x10,%edi
    1d59:	e8 12 f6 ff ff       	call   1370 <exit@plt>

0000000000001d5e <invalid_phase>:
    1d5e:	f3 0f 1e fa          	endbr64 
    1d62:	50                   	push   %rax
    1d63:	58                   	pop    %rax
    1d64:	48 83 ec 08          	sub    $0x8,%rsp
    1d68:	48 89 fa             	mov    %rdi,%rdx
    1d6b:	48 8d 35 e1 29 00 00 	lea    0x29e1(%rip),%rsi        # 4753 <transition_table+0x313>
    1d72:	bf 01 00 00 00       	mov    $0x1,%edi
    1d77:	b8 00 00 00 00       	mov    $0x0,%eax
    1d7c:	e8 bf f5 ff ff       	call   1340 <__printf_chk@plt>
    1d81:	bf 08 00 00 00       	mov    $0x8,%edi
    1d86:	e8 e5 f5 ff ff       	call   1370 <exit@plt>

0000000000001d8b <string_length>:
    1d8b:	f3 0f 1e fa          	endbr64 
    1d8f:	b8 00 00 00 00       	mov    $0x0,%eax
    1d94:	80 3f 00             	cmpb   $0x0,(%rdi)
    1d97:	74 09                	je     1da2 <string_length+0x17>
    1d99:	48 83 c7 01          	add    $0x1,%rdi
    1d9d:	83 c0 01             	add    $0x1,%eax
    1da0:	eb f2                	jmp    1d94 <string_length+0x9>
    1da2:	c3                   	ret    

0000000000001da3 <strings_not_equal>:
    1da3:	f3 0f 1e fa          	endbr64 
    1da7:	41 54                	push   %r12
    1da9:	55                   	push   %rbp
    1daa:	53                   	push   %rbx
    1dab:	48 89 fb             	mov    %rdi,%rbx
    1dae:	48 89 f5             	mov    %rsi,%rbp
    1db1:	e8 d5 ff ff ff       	call   1d8b <string_length>
    1db6:	41 89 c4             	mov    %eax,%r12d
    1db9:	48 89 ef             	mov    %rbp,%rdi
    1dbc:	e8 ca ff ff ff       	call   1d8b <string_length>
    1dc1:	41 39 c4             	cmp    %eax,%r12d
    1dc4:	75 1d                	jne    1de3 <strings_not_equal+0x40>
    1dc6:	0f b6 03             	movzbl (%rbx),%eax
    1dc9:	84 c0                	test   %al,%al
    1dcb:	74 0f                	je     1ddc <strings_not_equal+0x39>
    1dcd:	38 45 00             	cmp    %al,0x0(%rbp)
    1dd0:	75 1b                	jne    1ded <strings_not_equal+0x4a>
    1dd2:	48 83 c3 01          	add    $0x1,%rbx
    1dd6:	48 83 c5 01          	add    $0x1,%rbp
    1dda:	eb ea                	jmp    1dc6 <strings_not_equal+0x23>
    1ddc:	b8 00 00 00 00       	mov    $0x0,%eax
    1de1:	eb 05                	jmp    1de8 <strings_not_equal+0x45>
    1de3:	b8 01 00 00 00       	mov    $0x1,%eax
    1de8:	5b                   	pop    %rbx
    1de9:	5d                   	pop    %rbp
    1dea:	41 5c                	pop    %r12
    1dec:	c3                   	ret    
    1ded:	b8 01 00 00 00       	mov    $0x1,%eax
    1df2:	eb f4                	jmp    1de8 <strings_not_equal+0x45>

0000000000001df4 <initialize_bomb>:
    1df4:	f3 0f 1e fa          	endbr64 
    1df8:	55                   	push   %rbp
    1df9:	53                   	push   %rbx
    1dfa:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1e01:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1e06:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1e0d:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1e12:	48 83 ec 58          	sub    $0x58,%rsp
    1e16:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1e1d:	00 00 
    1e1f:	48 89 84 24 48 20 00 	mov    %rax,0x2048(%rsp)
    1e26:	00 
    1e27:	31 c0                	xor    %eax,%eax
    1e29:	48 8d 35 cc fe ff ff 	lea    -0x134(%rip),%rsi        # 1cfc <sig_handler>
    1e30:	bf 02 00 00 00       	mov    $0x2,%edi
    1e35:	e8 96 f4 ff ff       	call   12d0 <signal@plt>
    1e3a:	48 89 e7             	mov    %rsp,%rdi
    1e3d:	be 40 00 00 00       	mov    $0x40,%esi
    1e42:	e8 19 f5 ff ff       	call   1360 <gethostname@plt>
    1e47:	85 c0                	test   %eax,%eax
    1e49:	75 06                	jne    1e51 <initialize_bomb+0x5d>
    1e4b:	89 c5                	mov    %eax,%ebp
    1e4d:	89 c3                	mov    %eax,%ebx
    1e4f:	eb 19                	jmp    1e6a <initialize_bomb+0x76>
    1e51:	48 8d 3d 58 26 00 00 	lea    0x2658(%rip),%rdi        # 44b0 <transition_table+0x70>
    1e58:	e8 03 f4 ff ff       	call   1260 <puts@plt>
    1e5d:	bf 08 00 00 00       	mov    $0x8,%edi
    1e62:	e8 09 f5 ff ff       	call   1370 <exit@plt>
    1e67:	83 c3 01             	add    $0x1,%ebx
    1e6a:	48 63 c3             	movslq %ebx,%rax
    1e6d:	48 8d 15 2c 62 00 00 	lea    0x622c(%rip),%rdx        # 80a0 <host_table>
    1e74:	48 8b 3c c2          	mov    (%rdx,%rax,8),%rdi
    1e78:	48 85 ff             	test   %rdi,%rdi
    1e7b:	74 11                	je     1e8e <initialize_bomb+0x9a>
    1e7d:	48 89 e6             	mov    %rsp,%rsi
    1e80:	e8 ab f3 ff ff       	call   1230 <strcasecmp@plt>
    1e85:	85 c0                	test   %eax,%eax
    1e87:	75 de                	jne    1e67 <initialize_bomb+0x73>
    1e89:	bd 01 00 00 00       	mov    $0x1,%ebp
    1e8e:	85 ed                	test   %ebp,%ebp
    1e90:	74 3b                	je     1ecd <initialize_bomb+0xd9>
    1e92:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    1e97:	e8 f1 0f 00 00       	call   2e8d <init_driver>
    1e9c:	85 c0                	test   %eax,%eax
    1e9e:	78 43                	js     1ee3 <initialize_bomb+0xef>
    1ea0:	bf 04 00 00 00       	mov    $0x4,%edi
    1ea5:	e8 66 f4 ff ff       	call   1310 <malloc@plt>
    1eaa:	c7 00 11 fa 23 20    	movl   $0x2023fa11,(%rax)
    1eb0:	48 8b 8c 24 48 20 00 	mov    0x2048(%rsp),%rcx
    1eb7:	00 
    1eb8:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    1ebf:	00 00 
    1ec1:	75 45                	jne    1f08 <initialize_bomb+0x114>
    1ec3:	48 81 c4 58 20 00 00 	add    $0x2058,%rsp
    1eca:	5b                   	pop    %rbx
    1ecb:	5d                   	pop    %rbp
    1ecc:	c3                   	ret    
    1ecd:	48 8d 3d 14 26 00 00 	lea    0x2614(%rip),%rdi        # 44e8 <transition_table+0xa8>
    1ed4:	e8 87 f3 ff ff       	call   1260 <puts@plt>
    1ed9:	bf 08 00 00 00       	mov    $0x8,%edi
    1ede:	e8 8d f4 ff ff       	call   1370 <exit@plt>
    1ee3:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
    1ee8:	48 8d 35 75 28 00 00 	lea    0x2875(%rip),%rsi        # 4764 <transition_table+0x324>
    1eef:	bf 01 00 00 00       	mov    $0x1,%edi
    1ef4:	b8 00 00 00 00       	mov    $0x0,%eax
    1ef9:	e8 42 f4 ff ff       	call   1340 <__printf_chk@plt>
    1efe:	bf 08 00 00 00       	mov    $0x8,%edi
    1f03:	e8 68 f4 ff ff       	call   1370 <exit@plt>
    1f08:	e8 73 f3 ff ff       	call   1280 <__stack_chk_fail@plt>

0000000000001f0d <initialize_bomb_solve>:
    1f0d:	f3 0f 1e fa          	endbr64 
    1f11:	c3                   	ret    

0000000000001f12 <blank_line>:
    1f12:	f3 0f 1e fa          	endbr64 
    1f16:	55                   	push   %rbp
    1f17:	53                   	push   %rbx
    1f18:	48 83 ec 08          	sub    $0x8,%rsp
    1f1c:	48 89 fd             	mov    %rdi,%rbp
    1f1f:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    1f23:	84 db                	test   %bl,%bl
    1f25:	74 1e                	je     1f45 <blank_line+0x33>
    1f27:	e8 84 f4 ff ff       	call   13b0 <__ctype_b_loc@plt>
    1f2c:	48 8b 00             	mov    (%rax),%rax
    1f2f:	48 83 c5 01          	add    $0x1,%rbp
    1f33:	48 0f be db          	movsbq %bl,%rbx
    1f37:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
    1f3c:	75 e1                	jne    1f1f <blank_line+0xd>
    1f3e:	b8 00 00 00 00       	mov    $0x0,%eax
    1f43:	eb 05                	jmp    1f4a <blank_line+0x38>
    1f45:	b8 01 00 00 00       	mov    $0x1,%eax
    1f4a:	48 83 c4 08          	add    $0x8,%rsp
    1f4e:	5b                   	pop    %rbx
    1f4f:	5d                   	pop    %rbp
    1f50:	c3                   	ret    

0000000000001f51 <skip>:
    1f51:	f3 0f 1e fa          	endbr64 
    1f55:	53                   	push   %rbx
    1f56:	48 63 15 2f 65 00 00 	movslq 0x652f(%rip),%rdx        # 848c <num_input_strings>
    1f5d:	48 89 d0             	mov    %rdx,%rax
    1f60:	48 c1 e0 04          	shl    $0x4,%rax
    1f64:	48 29 d0             	sub    %rdx,%rax
    1f67:	48 8d 15 32 65 00 00 	lea    0x6532(%rip),%rdx        # 84a0 <input_strings>
    1f6e:	48 8d 3c c2          	lea    (%rdx,%rax,8),%rdi
    1f72:	48 8b 15 17 65 00 00 	mov    0x6517(%rip),%rdx        # 8490 <infile>
    1f79:	be 78 00 00 00       	mov    $0x78,%esi
    1f7e:	e8 3d f3 ff ff       	call   12c0 <fgets@plt>
    1f83:	48 89 c3             	mov    %rax,%rbx
    1f86:	48 85 c0             	test   %rax,%rax
    1f89:	74 0c                	je     1f97 <skip+0x46>
    1f8b:	48 89 c7             	mov    %rax,%rdi
    1f8e:	e8 7f ff ff ff       	call   1f12 <blank_line>
    1f93:	85 c0                	test   %eax,%eax
    1f95:	75 bf                	jne    1f56 <skip+0x5>
    1f97:	48 89 d8             	mov    %rbx,%rax
    1f9a:	5b                   	pop    %rbx
    1f9b:	c3                   	ret    

0000000000001f9c <send_msg>:
    1f9c:	f3 0f 1e fa          	endbr64 
    1fa0:	55                   	push   %rbp
    1fa1:	53                   	push   %rbx
    1fa2:	4c 8d 9c 24 00 c0 ff 	lea    -0x4000(%rsp),%r11
    1fa9:	ff 
    1faa:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    1fb1:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    1fb6:	4c 39 dc             	cmp    %r11,%rsp
    1fb9:	75 ef                	jne    1faa <send_msg+0xe>
    1fbb:	48 83 ec 18          	sub    $0x18,%rsp
    1fbf:	41 89 f8             	mov    %edi,%r8d
    1fc2:	48 89 f3             	mov    %rsi,%rbx
    1fc5:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1fcc:	00 00 
    1fce:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
    1fd5:	00 
    1fd6:	31 c0                	xor    %eax,%eax
    1fd8:	8b 35 ae 64 00 00    	mov    0x64ae(%rip),%esi        # 848c <num_input_strings>
    1fde:	8d 46 ff             	lea    -0x1(%rsi),%eax
    1fe1:	48 98                	cltq   
    1fe3:	48 89 c2             	mov    %rax,%rdx
    1fe6:	48 c1 e2 04          	shl    $0x4,%rdx
    1fea:	48 29 c2             	sub    %rax,%rdx
    1fed:	48 89 d0             	mov    %rdx,%rax
    1ff0:	48 8d 15 a9 64 00 00 	lea    0x64a9(%rip),%rdx        # 84a0 <input_strings>
    1ff7:	48 8d 14 c2          	lea    (%rdx,%rax,8),%rdx
    1ffb:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    2002:	b8 00 00 00 00       	mov    $0x0,%eax
    2007:	48 89 d7             	mov    %rdx,%rdi
    200a:	f2 ae                	repnz scas %es:(%rdi),%al
    200c:	48 89 c8             	mov    %rcx,%rax
    200f:	48 f7 d0             	not    %rax
    2012:	48 83 c0 63          	add    $0x63,%rax
    2016:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    201c:	0f 87 9c 00 00 00    	ja     20be <send_msg+0x122>
    2022:	45 85 c0             	test   %r8d,%r8d
    2025:	0f 84 b3 00 00 00    	je     20de <send_msg+0x142>
    202b:	48 8d 05 55 27 00 00 	lea    0x2755(%rip),%rax        # 4787 <transition_table+0x347>
    2032:	48 89 e5             	mov    %rsp,%rbp
    2035:	48 83 ec 08          	sub    $0x8,%rsp
    2039:	52                   	push   %rdx
    203a:	56                   	push   %rsi
    203b:	50                   	push   %rax
    203c:	4c 8d 0d fd 57 00 00 	lea    0x57fd(%rip),%r9        # 7840 <authkey>
    2043:	44 8b 05 f6 5f 00 00 	mov    0x5ff6(%rip),%r8d        # 8040 <bomb_id>
    204a:	48 8d 0d 3e 27 00 00 	lea    0x273e(%rip),%rcx        # 478f <transition_table+0x34f>
    2051:	ba 00 20 00 00       	mov    $0x2000,%edx
    2056:	be 01 00 00 00       	mov    $0x1,%esi
    205b:	48 89 ef             	mov    %rbp,%rdi
    205e:	b8 00 00 00 00       	mov    $0x0,%eax
    2063:	e8 58 f3 ff ff       	call   13c0 <__sprintf_chk@plt>
    2068:	48 83 c4 20          	add    $0x20,%rsp
    206c:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
    2073:	00 
    2074:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    207a:	48 89 e9             	mov    %rbp,%rcx
    207d:	48 8d 15 bc 4f 00 00 	lea    0x4fbc(%rip),%rdx        # 7040 <lab>
    2084:	48 8d 35 b5 53 00 00 	lea    0x53b5(%rip),%rsi        # 7440 <course>
    208b:	48 8d 3d ae 5b 00 00 	lea    0x5bae(%rip),%rdi        # 7c40 <userid>
    2092:	e8 06 10 00 00       	call   309d <driver_post>
    2097:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
    209d:	85 c0                	test   %eax,%eax
    209f:	78 49                	js     20ea <send_msg+0x14e>
    20a1:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
    20a8:	00 
    20a9:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    20b0:	00 00 
    20b2:	75 4d                	jne    2101 <send_msg+0x165>
    20b4:	48 81 c4 18 40 00 00 	add    $0x4018,%rsp
    20bb:	5b                   	pop    %rbx
    20bc:	5d                   	pop    %rbp
    20bd:	c3                   	ret    
    20be:	48 8d 35 5b 24 00 00 	lea    0x245b(%rip),%rsi        # 4520 <transition_table+0xe0>
    20c5:	bf 01 00 00 00       	mov    $0x1,%edi
    20ca:	b8 00 00 00 00       	mov    $0x0,%eax
    20cf:	e8 6c f2 ff ff       	call   1340 <__printf_chk@plt>
    20d4:	bf 08 00 00 00       	mov    $0x8,%edi
    20d9:	e8 92 f2 ff ff       	call   1370 <exit@plt>
    20de:	48 8d 05 99 26 00 00 	lea    0x2699(%rip),%rax        # 477e <transition_table+0x33e>
    20e5:	e9 48 ff ff ff       	jmp    2032 <send_msg+0x96>
    20ea:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
    20f1:	00 
    20f2:	e8 69 f1 ff ff       	call   1260 <puts@plt>
    20f7:	bf 00 00 00 00       	mov    $0x0,%edi
    20fc:	e8 6f f2 ff ff       	call   1370 <exit@plt>
    2101:	e8 7a f1 ff ff       	call   1280 <__stack_chk_fail@plt>

0000000000002106 <explode_bomb>:
    2106:	f3 0f 1e fa          	endbr64 
    210a:	50                   	push   %rax
    210b:	58                   	pop    %rax
    210c:	48 83 ec 18          	sub    $0x18,%rsp
    2110:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2117:	00 00 
    2119:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    211e:	31 c0                	xor    %eax,%eax
    2120:	48 8d 3d 77 26 00 00 	lea    0x2677(%rip),%rdi        # 479e <transition_table+0x35e>
    2127:	e8 34 f1 ff ff       	call   1260 <puts@plt>
    212c:	48 8d 3d 74 26 00 00 	lea    0x2674(%rip),%rdi        # 47a7 <transition_table+0x367>
    2133:	e8 28 f1 ff ff       	call   1260 <puts@plt>
    2138:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%rsp)
    213f:	00 
    2140:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
    2145:	bf 00 00 00 00       	mov    $0x0,%edi
    214a:	e8 4d fe ff ff       	call   1f9c <send_msg>
    214f:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
    2154:	74 20                	je     2176 <explode_bomb+0x70>
    2156:	48 8d 35 eb 23 00 00 	lea    0x23eb(%rip),%rsi        # 4548 <transition_table+0x108>
    215d:	bf 01 00 00 00       	mov    $0x1,%edi
    2162:	b8 00 00 00 00       	mov    $0x0,%eax
    2167:	e8 d4 f1 ff ff       	call   1340 <__printf_chk@plt>
    216c:	bf 08 00 00 00       	mov    $0x8,%edi
    2171:	e8 fa f1 ff ff       	call   1370 <exit@plt>
    2176:	48 8d 3d 13 24 00 00 	lea    0x2413(%rip),%rdi        # 4590 <transition_table+0x150>
    217d:	e8 de f0 ff ff       	call   1260 <puts@plt>
    2182:	bf 08 00 00 00       	mov    $0x8,%edi
    2187:	e8 e4 f1 ff ff       	call   1370 <exit@plt>

000000000000218c <read_six_numbers>:
    218c:	f3 0f 1e fa          	endbr64 
    2190:	48 83 ec 08          	sub    $0x8,%rsp
    2194:	48 89 f2             	mov    %rsi,%rdx
    2197:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
    219b:	48 8d 46 14          	lea    0x14(%rsi),%rax
    219f:	50                   	push   %rax
    21a0:	48 8d 46 10          	lea    0x10(%rsi),%rax
    21a4:	50                   	push   %rax
    21a5:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
    21a9:	4c 8d 46 08          	lea    0x8(%rsi),%r8
    21ad:	48 8d 35 0a 26 00 00 	lea    0x260a(%rip),%rsi        # 47be <transition_table+0x37e>
    21b4:	b8 00 00 00 00       	mov    $0x0,%eax
    21b9:	e8 72 f1 ff ff       	call   1330 <__isoc99_sscanf@plt>
    21be:	48 83 c4 10          	add    $0x10,%rsp
    21c2:	83 f8 05             	cmp    $0x5,%eax
    21c5:	7e 05                	jle    21cc <read_six_numbers+0x40>
    21c7:	48 83 c4 08          	add    $0x8,%rsp
    21cb:	c3                   	ret    
    21cc:	e8 35 ff ff ff       	call   2106 <explode_bomb>

00000000000021d1 <read_line>:
    21d1:	f3 0f 1e fa          	endbr64 
    21d5:	48 83 ec 08          	sub    $0x8,%rsp
    21d9:	b8 00 00 00 00       	mov    $0x0,%eax
    21de:	e8 6e fd ff ff       	call   1f51 <skip>
    21e3:	48 85 c0             	test   %rax,%rax
    21e6:	74 72                	je     225a <read_line+0x89>
    21e8:	8b 15 9e 62 00 00    	mov    0x629e(%rip),%edx        # 848c <num_input_strings>
    21ee:	48 63 ca             	movslq %edx,%rcx
    21f1:	48 89 c8             	mov    %rcx,%rax
    21f4:	48 c1 e0 04          	shl    $0x4,%rax
    21f8:	48 29 c8             	sub    %rcx,%rax
    21fb:	48 8d 0d 9e 62 00 00 	lea    0x629e(%rip),%rcx        # 84a0 <input_strings>
    2202:	48 8d 34 c1          	lea    (%rcx,%rax,8),%rsi
    2206:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    220d:	b8 00 00 00 00       	mov    $0x0,%eax
    2212:	48 89 f7             	mov    %rsi,%rdi
    2215:	f2 ae                	repnz scas %es:(%rdi),%al
    2217:	48 f7 d1             	not    %rcx
    221a:	48 83 e9 01          	sub    $0x1,%rcx
    221e:	83 f9 76             	cmp    $0x76,%ecx
    2221:	0f 8f ab 00 00 00    	jg     22d2 <read_line+0x101>
    2227:	83 e9 01             	sub    $0x1,%ecx
    222a:	48 63 c9             	movslq %ecx,%rcx
    222d:	48 63 fa             	movslq %edx,%rdi
    2230:	48 89 f8             	mov    %rdi,%rax
    2233:	48 c1 e0 04          	shl    $0x4,%rax
    2237:	48 29 f8             	sub    %rdi,%rax
    223a:	48 8d 3d 5f 62 00 00 	lea    0x625f(%rip),%rdi        # 84a0 <input_strings>
    2241:	48 8d 04 c7          	lea    (%rdi,%rax,8),%rax
    2245:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    2249:	83 c2 01             	add    $0x1,%edx
    224c:	89 15 3a 62 00 00    	mov    %edx,0x623a(%rip)        # 848c <num_input_strings>
    2252:	48 89 f0             	mov    %rsi,%rax
    2255:	48 83 c4 08          	add    $0x8,%rsp
    2259:	c3                   	ret    
    225a:	48 8b 05 0f 62 00 00 	mov    0x620f(%rip),%rax        # 8470 <stdin@GLIBC_2.2.5>
    2261:	48 39 05 28 62 00 00 	cmp    %rax,0x6228(%rip)        # 8490 <infile>
    2268:	74 1b                	je     2285 <read_line+0xb4>
    226a:	48 8d 3d 7d 25 00 00 	lea    0x257d(%rip),%rdi        # 47ee <transition_table+0x3ae>
    2271:	e8 9a ef ff ff       	call   1210 <getenv@plt>
    2276:	48 85 c0             	test   %rax,%rax
    2279:	74 20                	je     229b <read_line+0xca>
    227b:	bf 00 00 00 00       	mov    $0x0,%edi
    2280:	e8 eb f0 ff ff       	call   1370 <exit@plt>
    2285:	48 8d 3d 44 25 00 00 	lea    0x2544(%rip),%rdi        # 47d0 <transition_table+0x390>
    228c:	e8 cf ef ff ff       	call   1260 <puts@plt>
    2291:	bf 08 00 00 00       	mov    $0x8,%edi
    2296:	e8 d5 f0 ff ff       	call   1370 <exit@plt>
    229b:	48 8b 05 ce 61 00 00 	mov    0x61ce(%rip),%rax        # 8470 <stdin@GLIBC_2.2.5>
    22a2:	48 89 05 e7 61 00 00 	mov    %rax,0x61e7(%rip)        # 8490 <infile>
    22a9:	b8 00 00 00 00       	mov    $0x0,%eax
    22ae:	e8 9e fc ff ff       	call   1f51 <skip>
    22b3:	48 85 c0             	test   %rax,%rax
    22b6:	0f 85 2c ff ff ff    	jne    21e8 <read_line+0x17>
    22bc:	48 8d 3d 0d 25 00 00 	lea    0x250d(%rip),%rdi        # 47d0 <transition_table+0x390>
    22c3:	e8 98 ef ff ff       	call   1260 <puts@plt>
    22c8:	bf 00 00 00 00       	mov    $0x0,%edi
    22cd:	e8 9e f0 ff ff       	call   1370 <exit@plt>
    22d2:	48 8d 3d 20 25 00 00 	lea    0x2520(%rip),%rdi        # 47f9 <transition_table+0x3b9>
    22d9:	e8 82 ef ff ff       	call   1260 <puts@plt>
    22de:	8b 05 a8 61 00 00    	mov    0x61a8(%rip),%eax        # 848c <num_input_strings>
    22e4:	8d 50 01             	lea    0x1(%rax),%edx
    22e7:	89 15 9f 61 00 00    	mov    %edx,0x619f(%rip)        # 848c <num_input_strings>
    22ed:	48 98                	cltq   
    22ef:	48 6b c0 78          	imul   $0x78,%rax,%rax
    22f3:	48 8d 15 a6 61 00 00 	lea    0x61a6(%rip),%rdx        # 84a0 <input_strings>
    22fa:	48 be 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rsi
    2301:	75 6e 63 
    2304:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
    230b:	2a 2a 00 
    230e:	48 89 34 02          	mov    %rsi,(%rdx,%rax,1)
    2312:	48 89 7c 02 08       	mov    %rdi,0x8(%rdx,%rax,1)
    2317:	e8 ea fd ff ff       	call   2106 <explode_bomb>

000000000000231c <phase_defused>:
    231c:	f3 0f 1e fa          	endbr64 
    2320:	53                   	push   %rbx
    2321:	48 89 fb             	mov    %rdi,%rbx
    2324:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
    232a:	48 89 fe             	mov    %rdi,%rsi
    232d:	bf 01 00 00 00       	mov    $0x1,%edi
    2332:	e8 65 fc ff ff       	call   1f9c <send_msg>
    2337:	83 3b 01             	cmpl   $0x1,(%rbx)
    233a:	75 0b                	jne    2347 <phase_defused+0x2b>
    233c:	83 3d 49 61 00 00 06 	cmpl   $0x6,0x6149(%rip)        # 848c <num_input_strings>
    2343:	74 22                	je     2367 <phase_defused+0x4b>
    2345:	5b                   	pop    %rbx
    2346:	c3                   	ret    
    2347:	48 8d 35 fa 21 00 00 	lea    0x21fa(%rip),%rsi        # 4548 <transition_table+0x108>
    234e:	bf 01 00 00 00       	mov    $0x1,%edi
    2353:	b8 00 00 00 00       	mov    $0x0,%eax
    2358:	e8 e3 ef ff ff       	call   1340 <__printf_chk@plt>
    235d:	bf 08 00 00 00       	mov    $0x8,%edi
    2362:	e8 09 f0 ff ff       	call   1370 <exit@plt>
    2367:	e8 ec f2 ff ff       	call   1658 <genshin>
    236c:	85 c0                	test   %eax,%eax
    236e:	75 26                	jne    2396 <phase_defused+0x7a>
    2370:	48 8d 3d f9 22 00 00 	lea    0x22f9(%rip),%rdi        # 4670 <transition_table+0x230>
    2377:	e8 e4 ee ff ff       	call   1260 <puts@plt>
    237c:	48 8d 3d 2d 23 00 00 	lea    0x232d(%rip),%rdi        # 46b0 <transition_table+0x270>
    2383:	e8 d8 ee ff ff       	call   1260 <puts@plt>
    2388:	48 8d 3d 69 23 00 00 	lea    0x2369(%rip),%rdi        # 46f8 <transition_table+0x2b8>
    238f:	e8 cc ee ff ff       	call   1260 <puts@plt>
    2394:	eb af                	jmp    2345 <phase_defused+0x29>
    2396:	e8 6e f3 ff ff       	call   1709 <qidong>
    239b:	85 c0                	test   %eax,%eax
    239d:	74 24                	je     23c3 <phase_defused+0xa7>
    239f:	48 8d 3d 12 22 00 00 	lea    0x2212(%rip),%rdi        # 45b8 <transition_table+0x178>
    23a6:	e8 b5 ee ff ff       	call   1260 <puts@plt>
    23ab:	48 8d 3d 2e 22 00 00 	lea    0x222e(%rip),%rdi        # 45e0 <transition_table+0x1a0>
    23b2:	e8 a9 ee ff ff       	call   1260 <puts@plt>
    23b7:	b8 00 00 00 00       	mov    $0x0,%eax
    23bc:	e8 6c f8 ff ff       	call   1c2d <secret_phase>
    23c1:	eb ad                	jmp    2370 <phase_defused+0x54>
    23c3:	48 8d 3d 56 22 00 00 	lea    0x2256(%rip),%rdi        # 4620 <transition_table+0x1e0>
    23ca:	e8 91 ee ff ff       	call   1260 <puts@plt>
    23cf:	eb 9f                	jmp    2370 <phase_defused+0x54>

00000000000023d1 <rio_readinitb>:
    23d1:	89 37                	mov    %esi,(%rdi)
    23d3:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
    23da:	48 8d 47 10          	lea    0x10(%rdi),%rax
    23de:	48 89 47 08          	mov    %rax,0x8(%rdi)
    23e2:	c3                   	ret    

00000000000023e3 <sigalrm_handler>:
    23e3:	f3 0f 1e fa          	endbr64 
    23e7:	50                   	push   %rax
    23e8:	58                   	pop    %rax
    23e9:	48 83 ec 08          	sub    $0x8,%rsp
    23ed:	b9 00 00 00 00       	mov    $0x0,%ecx
    23f2:	48 8d 15 77 24 00 00 	lea    0x2477(%rip),%rdx        # 4870 <transition_table+0x430>
    23f9:	be 01 00 00 00       	mov    $0x1,%esi
    23fe:	48 8b 3d 7b 60 00 00 	mov    0x607b(%rip),%rdi        # 8480 <stderr@GLIBC_2.2.5>
    2405:	b8 00 00 00 00       	mov    $0x0,%eax
    240a:	e8 81 ef ff ff       	call   1390 <__fprintf_chk@plt>
    240f:	bf 01 00 00 00       	mov    $0x1,%edi
    2414:	e8 57 ef ff ff       	call   1370 <exit@plt>

0000000000002419 <rio_writen>:
    2419:	41 55                	push   %r13
    241b:	41 54                	push   %r12
    241d:	55                   	push   %rbp
    241e:	53                   	push   %rbx
    241f:	48 83 ec 08          	sub    $0x8,%rsp
    2423:	41 89 fc             	mov    %edi,%r12d
    2426:	48 89 f5             	mov    %rsi,%rbp
    2429:	49 89 d5             	mov    %rdx,%r13
    242c:	48 89 d3             	mov    %rdx,%rbx
    242f:	eb 06                	jmp    2437 <rio_writen+0x1e>
    2431:	48 29 c3             	sub    %rax,%rbx
    2434:	48 01 c5             	add    %rax,%rbp
    2437:	48 85 db             	test   %rbx,%rbx
    243a:	74 24                	je     2460 <rio_writen+0x47>
    243c:	48 89 da             	mov    %rbx,%rdx
    243f:	48 89 ee             	mov    %rbp,%rsi
    2442:	44 89 e7             	mov    %r12d,%edi
    2445:	e8 26 ee ff ff       	call   1270 <write@plt>
    244a:	48 85 c0             	test   %rax,%rax
    244d:	7f e2                	jg     2431 <rio_writen+0x18>
    244f:	e8 ec ed ff ff       	call   1240 <__errno_location@plt>
    2454:	83 38 04             	cmpl   $0x4,(%rax)
    2457:	75 15                	jne    246e <rio_writen+0x55>
    2459:	b8 00 00 00 00       	mov    $0x0,%eax
    245e:	eb d1                	jmp    2431 <rio_writen+0x18>
    2460:	4c 89 e8             	mov    %r13,%rax
    2463:	48 83 c4 08          	add    $0x8,%rsp
    2467:	5b                   	pop    %rbx
    2468:	5d                   	pop    %rbp
    2469:	41 5c                	pop    %r12
    246b:	41 5d                	pop    %r13
    246d:	c3                   	ret    
    246e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    2475:	eb ec                	jmp    2463 <rio_writen+0x4a>

0000000000002477 <rio_read>:
    2477:	41 55                	push   %r13
    2479:	41 54                	push   %r12
    247b:	55                   	push   %rbp
    247c:	53                   	push   %rbx
    247d:	48 83 ec 08          	sub    $0x8,%rsp
    2481:	48 89 fb             	mov    %rdi,%rbx
    2484:	49 89 f5             	mov    %rsi,%r13
    2487:	49 89 d4             	mov    %rdx,%r12
    248a:	eb 17                	jmp    24a3 <rio_read+0x2c>
    248c:	e8 af ed ff ff       	call   1240 <__errno_location@plt>
    2491:	83 38 04             	cmpl   $0x4,(%rax)
    2494:	74 0d                	je     24a3 <rio_read+0x2c>
    2496:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    249d:	eb 54                	jmp    24f3 <rio_read+0x7c>
    249f:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    24a3:	8b 6b 04             	mov    0x4(%rbx),%ebp
    24a6:	85 ed                	test   %ebp,%ebp
    24a8:	7f 23                	jg     24cd <rio_read+0x56>
    24aa:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
    24ae:	8b 3b                	mov    (%rbx),%edi
    24b0:	ba 00 20 00 00       	mov    $0x2000,%edx
    24b5:	48 89 ee             	mov    %rbp,%rsi
    24b8:	e8 f3 ed ff ff       	call   12b0 <read@plt>
    24bd:	89 43 04             	mov    %eax,0x4(%rbx)
    24c0:	85 c0                	test   %eax,%eax
    24c2:	78 c8                	js     248c <rio_read+0x15>
    24c4:	75 d9                	jne    249f <rio_read+0x28>
    24c6:	b8 00 00 00 00       	mov    $0x0,%eax
    24cb:	eb 26                	jmp    24f3 <rio_read+0x7c>
    24cd:	89 e8                	mov    %ebp,%eax
    24cf:	4c 39 e0             	cmp    %r12,%rax
    24d2:	72 03                	jb     24d7 <rio_read+0x60>
    24d4:	44 89 e5             	mov    %r12d,%ebp
    24d7:	4c 63 e5             	movslq %ebp,%r12
    24da:	48 8b 73 08          	mov    0x8(%rbx),%rsi
    24de:	4c 89 e2             	mov    %r12,%rdx
    24e1:	4c 89 ef             	mov    %r13,%rdi
    24e4:	e8 17 ee ff ff       	call   1300 <memcpy@plt>
    24e9:	4c 01 63 08          	add    %r12,0x8(%rbx)
    24ed:	29 6b 04             	sub    %ebp,0x4(%rbx)
    24f0:	4c 89 e0             	mov    %r12,%rax
    24f3:	48 83 c4 08          	add    $0x8,%rsp
    24f7:	5b                   	pop    %rbx
    24f8:	5d                   	pop    %rbp
    24f9:	41 5c                	pop    %r12
    24fb:	41 5d                	pop    %r13
    24fd:	c3                   	ret    

00000000000024fe <rio_readlineb>:
    24fe:	41 55                	push   %r13
    2500:	41 54                	push   %r12
    2502:	55                   	push   %rbp
    2503:	53                   	push   %rbx
    2504:	48 83 ec 18          	sub    $0x18,%rsp
    2508:	49 89 fd             	mov    %rdi,%r13
    250b:	48 89 f5             	mov    %rsi,%rbp
    250e:	49 89 d4             	mov    %rdx,%r12
    2511:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2518:	00 00 
    251a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    251f:	31 c0                	xor    %eax,%eax
    2521:	bb 01 00 00 00       	mov    $0x1,%ebx
    2526:	eb 18                	jmp    2540 <rio_readlineb+0x42>
    2528:	85 c0                	test   %eax,%eax
    252a:	75 65                	jne    2591 <rio_readlineb+0x93>
    252c:	48 83 fb 01          	cmp    $0x1,%rbx
    2530:	75 3d                	jne    256f <rio_readlineb+0x71>
    2532:	b8 00 00 00 00       	mov    $0x0,%eax
    2537:	eb 3d                	jmp    2576 <rio_readlineb+0x78>
    2539:	48 83 c3 01          	add    $0x1,%rbx
    253d:	48 89 d5             	mov    %rdx,%rbp
    2540:	4c 39 e3             	cmp    %r12,%rbx
    2543:	73 2a                	jae    256f <rio_readlineb+0x71>
    2545:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
    254a:	ba 01 00 00 00       	mov    $0x1,%edx
    254f:	4c 89 ef             	mov    %r13,%rdi
    2552:	e8 20 ff ff ff       	call   2477 <rio_read>
    2557:	83 f8 01             	cmp    $0x1,%eax
    255a:	75 cc                	jne    2528 <rio_readlineb+0x2a>
    255c:	48 8d 55 01          	lea    0x1(%rbp),%rdx
    2560:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
    2565:	88 45 00             	mov    %al,0x0(%rbp)
    2568:	3c 0a                	cmp    $0xa,%al
    256a:	75 cd                	jne    2539 <rio_readlineb+0x3b>
    256c:	48 89 d5             	mov    %rdx,%rbp
    256f:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
    2573:	48 89 d8             	mov    %rbx,%rax
    2576:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    257b:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    2582:	00 00 
    2584:	75 14                	jne    259a <rio_readlineb+0x9c>
    2586:	48 83 c4 18          	add    $0x18,%rsp
    258a:	5b                   	pop    %rbx
    258b:	5d                   	pop    %rbp
    258c:	41 5c                	pop    %r12
    258e:	41 5d                	pop    %r13
    2590:	c3                   	ret    
    2591:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    2598:	eb dc                	jmp    2576 <rio_readlineb+0x78>
    259a:	e8 e1 ec ff ff       	call   1280 <__stack_chk_fail@plt>

000000000000259f <urlencode>:
    259f:	41 54                	push   %r12
    25a1:	55                   	push   %rbp
    25a2:	53                   	push   %rbx
    25a3:	48 83 ec 10          	sub    $0x10,%rsp
    25a7:	48 89 fb             	mov    %rdi,%rbx
    25aa:	48 89 f5             	mov    %rsi,%rbp
    25ad:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    25b4:	00 00 
    25b6:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    25bb:	31 c0                	xor    %eax,%eax
    25bd:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    25c4:	f2 ae                	repnz scas %es:(%rdi),%al
    25c6:	48 f7 d1             	not    %rcx
    25c9:	8d 41 ff             	lea    -0x1(%rcx),%eax
    25cc:	eb 0f                	jmp    25dd <urlencode+0x3e>
    25ce:	44 88 45 00          	mov    %r8b,0x0(%rbp)
    25d2:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    25d6:	48 83 c3 01          	add    $0x1,%rbx
    25da:	44 89 e0             	mov    %r12d,%eax
    25dd:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
    25e1:	85 c0                	test   %eax,%eax
    25e3:	0f 84 a8 00 00 00    	je     2691 <urlencode+0xf2>
    25e9:	44 0f b6 03          	movzbl (%rbx),%r8d
    25ed:	41 80 f8 2a          	cmp    $0x2a,%r8b
    25f1:	0f 94 c2             	sete   %dl
    25f4:	41 80 f8 2d          	cmp    $0x2d,%r8b
    25f8:	0f 94 c0             	sete   %al
    25fb:	08 c2                	or     %al,%dl
    25fd:	75 cf                	jne    25ce <urlencode+0x2f>
    25ff:	41 80 f8 2e          	cmp    $0x2e,%r8b
    2603:	74 c9                	je     25ce <urlencode+0x2f>
    2605:	41 80 f8 5f          	cmp    $0x5f,%r8b
    2609:	74 c3                	je     25ce <urlencode+0x2f>
    260b:	41 8d 40 d0          	lea    -0x30(%r8),%eax
    260f:	3c 09                	cmp    $0x9,%al
    2611:	76 bb                	jbe    25ce <urlencode+0x2f>
    2613:	41 8d 40 bf          	lea    -0x41(%r8),%eax
    2617:	3c 19                	cmp    $0x19,%al
    2619:	76 b3                	jbe    25ce <urlencode+0x2f>
    261b:	41 8d 40 9f          	lea    -0x61(%r8),%eax
    261f:	3c 19                	cmp    $0x19,%al
    2621:	76 ab                	jbe    25ce <urlencode+0x2f>
    2623:	41 80 f8 20          	cmp    $0x20,%r8b
    2627:	74 56                	je     267f <urlencode+0xe0>
    2629:	41 8d 40 e0          	lea    -0x20(%r8),%eax
    262d:	3c 5f                	cmp    $0x5f,%al
    262f:	0f 96 c2             	setbe  %dl
    2632:	41 80 f8 09          	cmp    $0x9,%r8b
    2636:	0f 94 c0             	sete   %al
    2639:	08 c2                	or     %al,%dl
    263b:	74 4f                	je     268c <urlencode+0xed>
    263d:	48 89 e7             	mov    %rsp,%rdi
    2640:	45 0f b6 c0          	movzbl %r8b,%r8d
    2644:	48 8d 0d da 22 00 00 	lea    0x22da(%rip),%rcx        # 4925 <transition_table+0x4e5>
    264b:	ba 08 00 00 00       	mov    $0x8,%edx
    2650:	be 01 00 00 00       	mov    $0x1,%esi
    2655:	b8 00 00 00 00       	mov    $0x0,%eax
    265a:	e8 61 ed ff ff       	call   13c0 <__sprintf_chk@plt>
    265f:	0f b6 04 24          	movzbl (%rsp),%eax
    2663:	88 45 00             	mov    %al,0x0(%rbp)
    2666:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
    266b:	88 45 01             	mov    %al,0x1(%rbp)
    266e:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
    2673:	88 45 02             	mov    %al,0x2(%rbp)
    2676:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
    267a:	e9 57 ff ff ff       	jmp    25d6 <urlencode+0x37>
    267f:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
    2683:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    2687:	e9 4a ff ff ff       	jmp    25d6 <urlencode+0x37>
    268c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2691:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    2696:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
    269d:	00 00 
    269f:	75 09                	jne    26aa <urlencode+0x10b>
    26a1:	48 83 c4 10          	add    $0x10,%rsp
    26a5:	5b                   	pop    %rbx
    26a6:	5d                   	pop    %rbp
    26a7:	41 5c                	pop    %r12
    26a9:	c3                   	ret    
    26aa:	e8 d1 eb ff ff       	call   1280 <__stack_chk_fail@plt>

00000000000026af <submitr>:
    26af:	f3 0f 1e fa          	endbr64 
    26b3:	41 57                	push   %r15
    26b5:	41 56                	push   %r14
    26b7:	41 55                	push   %r13
    26b9:	41 54                	push   %r12
    26bb:	55                   	push   %rbp
    26bc:	53                   	push   %rbx
    26bd:	4c 8d 9c 24 00 60 ff 	lea    -0xa000(%rsp),%r11
    26c4:	ff 
    26c5:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    26cc:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    26d1:	4c 39 dc             	cmp    %r11,%rsp
    26d4:	75 ef                	jne    26c5 <submitr+0x16>
    26d6:	48 83 ec 68          	sub    $0x68,%rsp
    26da:	49 89 fc             	mov    %rdi,%r12
    26dd:	89 74 24 1c          	mov    %esi,0x1c(%rsp)
    26e1:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    26e6:	49 89 cd             	mov    %rcx,%r13
    26e9:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
    26ee:	4d 89 ce             	mov    %r9,%r14
    26f1:	48 8b ac 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbp
    26f8:	00 
    26f9:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2700:	00 00 
    2702:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
    2709:	00 
    270a:	31 c0                	xor    %eax,%eax
    270c:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
    2713:	00 
    2714:	ba 00 00 00 00       	mov    $0x0,%edx
    2719:	be 01 00 00 00       	mov    $0x1,%esi
    271e:	bf 02 00 00 00       	mov    $0x2,%edi
    2723:	e8 a8 ec ff ff       	call   13d0 <socket@plt>
    2728:	85 c0                	test   %eax,%eax
    272a:	0f 88 a5 02 00 00    	js     29d5 <submitr+0x326>
    2730:	89 c3                	mov    %eax,%ebx
    2732:	4c 89 e7             	mov    %r12,%rdi
    2735:	e8 a6 eb ff ff       	call   12e0 <gethostbyname@plt>
    273a:	48 85 c0             	test   %rax,%rax
    273d:	0f 84 de 02 00 00    	je     2a21 <submitr+0x372>
    2743:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
    2748:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
    274f:	00 00 
    2751:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    2758:	00 00 
    275a:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
    2761:	48 63 50 14          	movslq 0x14(%rax),%rdx
    2765:	48 8b 40 18          	mov    0x18(%rax),%rax
    2769:	48 8b 30             	mov    (%rax),%rsi
    276c:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
    2771:	b9 0c 00 00 00       	mov    $0xc,%ecx
    2776:	e8 75 eb ff ff       	call   12f0 <__memmove_chk@plt>
    277b:	0f b7 74 24 1c       	movzwl 0x1c(%rsp),%esi
    2780:	66 c1 c6 08          	rol    $0x8,%si
    2784:	66 89 74 24 32       	mov    %si,0x32(%rsp)
    2789:	ba 10 00 00 00       	mov    $0x10,%edx
    278e:	4c 89 fe             	mov    %r15,%rsi
    2791:	89 df                	mov    %ebx,%edi
    2793:	e8 e8 eb ff ff       	call   1380 <connect@plt>
    2798:	85 c0                	test   %eax,%eax
    279a:	0f 88 f7 02 00 00    	js     2a97 <submitr+0x3e8>
    27a0:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    27a7:	b8 00 00 00 00       	mov    $0x0,%eax
    27ac:	48 89 f1             	mov    %rsi,%rcx
    27af:	4c 89 f7             	mov    %r14,%rdi
    27b2:	f2 ae                	repnz scas %es:(%rdi),%al
    27b4:	48 89 ca             	mov    %rcx,%rdx
    27b7:	48 f7 d2             	not    %rdx
    27ba:	48 89 f1             	mov    %rsi,%rcx
    27bd:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    27c2:	f2 ae                	repnz scas %es:(%rdi),%al
    27c4:	48 f7 d1             	not    %rcx
    27c7:	49 89 c8             	mov    %rcx,%r8
    27ca:	48 89 f1             	mov    %rsi,%rcx
    27cd:	4c 89 ef             	mov    %r13,%rdi
    27d0:	f2 ae                	repnz scas %es:(%rdi),%al
    27d2:	48 f7 d1             	not    %rcx
    27d5:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
    27da:	48 89 f1             	mov    %rsi,%rcx
    27dd:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    27e2:	f2 ae                	repnz scas %es:(%rdi),%al
    27e4:	48 89 c8             	mov    %rcx,%rax
    27e7:	48 f7 d0             	not    %rax
    27ea:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
    27ef:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
    27f4:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
    27fb:	00 
    27fc:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    2802:	0f 87 f7 02 00 00    	ja     2aff <submitr+0x450>
    2808:	48 8d b4 24 50 40 00 	lea    0x4050(%rsp),%rsi
    280f:	00 
    2810:	b9 00 04 00 00       	mov    $0x400,%ecx
    2815:	b8 00 00 00 00       	mov    $0x0,%eax
    281a:	48 89 f7             	mov    %rsi,%rdi
    281d:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    2820:	4c 89 f7             	mov    %r14,%rdi
    2823:	e8 77 fd ff ff       	call   259f <urlencode>
    2828:	85 c0                	test   %eax,%eax
    282a:	0f 88 42 03 00 00    	js     2b72 <submitr+0x4c3>
    2830:	4c 8d bc 24 50 20 00 	lea    0x2050(%rsp),%r15
    2837:	00 
    2838:	48 83 ec 08          	sub    $0x8,%rsp
    283c:	41 54                	push   %r12
    283e:	48 8d 84 24 60 40 00 	lea    0x4060(%rsp),%rax
    2845:	00 
    2846:	50                   	push   %rax
    2847:	41 55                	push   %r13
    2849:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    284e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    2853:	48 8d 0d 3e 20 00 00 	lea    0x203e(%rip),%rcx        # 4898 <transition_table+0x458>
    285a:	ba 00 20 00 00       	mov    $0x2000,%edx
    285f:	be 01 00 00 00       	mov    $0x1,%esi
    2864:	4c 89 ff             	mov    %r15,%rdi
    2867:	b8 00 00 00 00       	mov    $0x0,%eax
    286c:	e8 4f eb ff ff       	call   13c0 <__sprintf_chk@plt>
    2871:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    2878:	b8 00 00 00 00       	mov    $0x0,%eax
    287d:	4c 89 ff             	mov    %r15,%rdi
    2880:	f2 ae                	repnz scas %es:(%rdi),%al
    2882:	48 f7 d1             	not    %rcx
    2885:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
    2889:	48 83 c4 20          	add    $0x20,%rsp
    288d:	4c 89 fe             	mov    %r15,%rsi
    2890:	89 df                	mov    %ebx,%edi
    2892:	e8 82 fb ff ff       	call   2419 <rio_writen>
    2897:	48 85 c0             	test   %rax,%rax
    289a:	0f 88 5d 03 00 00    	js     2bfd <submitr+0x54e>
    28a0:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
    28a5:	89 de                	mov    %ebx,%esi
    28a7:	4c 89 e7             	mov    %r12,%rdi
    28aa:	e8 22 fb ff ff       	call   23d1 <rio_readinitb>
    28af:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    28b6:	00 
    28b7:	ba 00 20 00 00       	mov    $0x2000,%edx
    28bc:	4c 89 e7             	mov    %r12,%rdi
    28bf:	e8 3a fc ff ff       	call   24fe <rio_readlineb>
    28c4:	48 85 c0             	test   %rax,%rax
    28c7:	0f 8e 9c 03 00 00    	jle    2c69 <submitr+0x5ba>
    28cd:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
    28d2:	48 8d 94 24 50 60 00 	lea    0x6050(%rsp),%rdx
    28d9:	00 
    28da:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
    28e1:	00 
    28e2:	4c 8d 84 24 50 80 00 	lea    0x8050(%rsp),%r8
    28e9:	00 
    28ea:	48 8d 35 3b 20 00 00 	lea    0x203b(%rip),%rsi        # 492c <transition_table+0x4ec>
    28f1:	b8 00 00 00 00       	mov    $0x0,%eax
    28f6:	e8 35 ea ff ff       	call   1330 <__isoc99_sscanf@plt>
    28fb:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2902:	00 
    2903:	b9 03 00 00 00       	mov    $0x3,%ecx
    2908:	48 8d 3d 34 20 00 00 	lea    0x2034(%rip),%rdi        # 4943 <transition_table+0x503>
    290f:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    2911:	0f 97 c0             	seta   %al
    2914:	1c 00                	sbb    $0x0,%al
    2916:	84 c0                	test   %al,%al
    2918:	0f 84 cb 03 00 00    	je     2ce9 <submitr+0x63a>
    291e:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2925:	00 
    2926:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    292b:	ba 00 20 00 00       	mov    $0x2000,%edx
    2930:	e8 c9 fb ff ff       	call   24fe <rio_readlineb>
    2935:	48 85 c0             	test   %rax,%rax
    2938:	7f c1                	jg     28fb <submitr+0x24c>
    293a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2941:	3a 20 43 
    2944:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    294b:	20 75 6e 
    294e:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2952:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2956:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    295d:	74 6f 20 
    2960:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
    2967:	68 65 61 
    296a:	48 89 45 10          	mov    %rax,0x10(%rbp)
    296e:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2972:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
    2979:	66 72 6f 
    297c:	48 ba 6d 20 41 75 74 	movabs $0x616c6f747541206d,%rdx
    2983:	6f 6c 61 
    2986:	48 89 45 20          	mov    %rax,0x20(%rbp)
    298a:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    298e:	48 b8 62 20 73 65 72 	movabs $0x7265767265732062,%rax
    2995:	76 65 72 
    2998:	48 89 45 30          	mov    %rax,0x30(%rbp)
    299c:	c6 45 38 00          	movb   $0x0,0x38(%rbp)
    29a0:	89 df                	mov    %ebx,%edi
    29a2:	e8 f9 e8 ff ff       	call   12a0 <close@plt>
    29a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    29ac:	48 8b 9c 24 58 a0 00 	mov    0xa058(%rsp),%rbx
    29b3:	00 
    29b4:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
    29bb:	00 00 
    29bd:	0f 85 96 04 00 00    	jne    2e59 <submitr+0x7aa>
    29c3:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
    29ca:	5b                   	pop    %rbx
    29cb:	5d                   	pop    %rbp
    29cc:	41 5c                	pop    %r12
    29ce:	41 5d                	pop    %r13
    29d0:	41 5e                	pop    %r14
    29d2:	41 5f                	pop    %r15
    29d4:	c3                   	ret    
    29d5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    29dc:	3a 20 43 
    29df:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    29e6:	20 75 6e 
    29e9:	48 89 45 00          	mov    %rax,0x0(%rbp)
    29ed:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    29f1:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    29f8:	74 6f 20 
    29fb:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    2a02:	65 20 73 
    2a05:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2a09:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2a0d:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    2a14:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    2a1a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2a1f:	eb 8b                	jmp    29ac <submitr+0x2fd>
    2a21:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    2a28:	3a 20 44 
    2a2b:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    2a32:	20 75 6e 
    2a35:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2a39:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2a3d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2a44:	74 6f 20 
    2a47:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    2a4e:	76 65 20 
    2a51:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2a55:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2a59:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
    2a60:	61 62 20 
    2a63:	48 ba 73 65 72 76 65 	movabs $0x6120726576726573,%rdx
    2a6a:	72 20 61 
    2a6d:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2a71:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    2a75:	c7 45 30 64 64 72 65 	movl   $0x65726464,0x30(%rbp)
    2a7c:	66 c7 45 34 73 73    	movw   $0x7373,0x34(%rbp)
    2a82:	c6 45 36 00          	movb   $0x0,0x36(%rbp)
    2a86:	89 df                	mov    %ebx,%edi
    2a88:	e8 13 e8 ff ff       	call   12a0 <close@plt>
    2a8d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2a92:	e9 15 ff ff ff       	jmp    29ac <submitr+0x2fd>
    2a97:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    2a9e:	3a 20 55 
    2aa1:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    2aa8:	20 74 6f 
    2aab:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2aaf:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2ab3:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    2aba:	65 63 74 
    2abd:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
    2ac4:	68 65 20 
    2ac7:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2acb:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2acf:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
    2ad6:	61 62 20 
    2ad9:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2add:	c7 45 28 73 65 72 76 	movl   $0x76726573,0x28(%rbp)
    2ae4:	66 c7 45 2c 65 72    	movw   $0x7265,0x2c(%rbp)
    2aea:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    2aee:	89 df                	mov    %ebx,%edi
    2af0:	e8 ab e7 ff ff       	call   12a0 <close@plt>
    2af5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2afa:	e9 ad fe ff ff       	jmp    29ac <submitr+0x2fd>
    2aff:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    2b06:	3a 20 52 
    2b09:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    2b10:	20 73 74 
    2b13:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2b17:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2b1b:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
    2b22:	74 6f 6f 
    2b25:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
    2b2c:	65 2e 20 
    2b2f:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2b33:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2b37:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
    2b3e:	61 73 65 
    2b41:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
    2b48:	49 54 52 
    2b4b:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2b4f:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    2b53:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
    2b5a:	55 46 00 
    2b5d:	48 89 45 30          	mov    %rax,0x30(%rbp)
    2b61:	89 df                	mov    %ebx,%edi
    2b63:	e8 38 e7 ff ff       	call   12a0 <close@plt>
    2b68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2b6d:	e9 3a fe ff ff       	jmp    29ac <submitr+0x2fd>
    2b72:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    2b79:	3a 20 52 
    2b7c:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    2b83:	20 73 74 
    2b86:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2b8a:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2b8e:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
    2b95:	63 6f 6e 
    2b98:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
    2b9f:	20 61 6e 
    2ba2:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2ba6:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2baa:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
    2bb1:	67 61 6c 
    2bb4:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
    2bbb:	6e 70 72 
    2bbe:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2bc2:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    2bc6:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
    2bcd:	6c 65 20 
    2bd0:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
    2bd7:	63 74 65 
    2bda:	48 89 45 30          	mov    %rax,0x30(%rbp)
    2bde:	48 89 55 38          	mov    %rdx,0x38(%rbp)
    2be2:	66 c7 45 40 72 2e    	movw   $0x2e72,0x40(%rbp)
    2be8:	c6 45 42 00          	movb   $0x0,0x42(%rbp)
    2bec:	89 df                	mov    %ebx,%edi
    2bee:	e8 ad e6 ff ff       	call   12a0 <close@plt>
    2bf3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2bf8:	e9 af fd ff ff       	jmp    29ac <submitr+0x2fd>
    2bfd:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2c04:	3a 20 43 
    2c07:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2c0e:	20 75 6e 
    2c11:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2c15:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2c19:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2c20:	74 6f 20 
    2c23:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
    2c2a:	20 74 6f 
    2c2d:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2c31:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2c35:	48 b8 20 74 68 65 20 	movabs $0x7475412065687420,%rax
    2c3c:	41 75 74 
    2c3f:	48 ba 6f 6c 61 62 20 	movabs $0x7265732062616c6f,%rdx
    2c46:	73 65 72 
    2c49:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2c4d:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    2c51:	c7 45 30 76 65 72 00 	movl   $0x726576,0x30(%rbp)
    2c58:	89 df                	mov    %ebx,%edi
    2c5a:	e8 41 e6 ff ff       	call   12a0 <close@plt>
    2c5f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2c64:	e9 43 fd ff ff       	jmp    29ac <submitr+0x2fd>
    2c69:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2c70:	3a 20 43 
    2c73:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2c7a:	20 75 6e 
    2c7d:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2c81:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2c85:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2c8c:	74 6f 20 
    2c8f:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
    2c96:	66 69 72 
    2c99:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2c9d:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2ca1:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
    2ca8:	61 64 65 
    2cab:	48 ba 72 20 66 72 6f 	movabs $0x41206d6f72662072,%rdx
    2cb2:	6d 20 41 
    2cb5:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2cb9:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    2cbd:	48 b8 75 74 6f 6c 61 	movabs $0x732062616c6f7475,%rax
    2cc4:	62 20 73 
    2cc7:	48 89 45 30          	mov    %rax,0x30(%rbp)
    2ccb:	c7 45 38 65 72 76 65 	movl   $0x65767265,0x38(%rbp)
    2cd2:	66 c7 45 3c 72 00    	movw   $0x72,0x3c(%rbp)
    2cd8:	89 df                	mov    %ebx,%edi
    2cda:	e8 c1 e5 ff ff       	call   12a0 <close@plt>
    2cdf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2ce4:	e9 c3 fc ff ff       	jmp    29ac <submitr+0x2fd>
    2ce9:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2cf0:	00 
    2cf1:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    2cf6:	ba 00 20 00 00       	mov    $0x2000,%edx
    2cfb:	e8 fe f7 ff ff       	call   24fe <rio_readlineb>
    2d00:	48 85 c0             	test   %rax,%rax
    2d03:	0f 8e 96 00 00 00    	jle    2d9f <submitr+0x6f0>
    2d09:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
    2d0e:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
    2d15:	0f 85 05 01 00 00    	jne    2e20 <submitr+0x771>
    2d1b:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    2d22:	00 
    2d23:	48 89 ef             	mov    %rbp,%rdi
    2d26:	e8 25 e5 ff ff       	call   1250 <strcpy@plt>
    2d2b:	89 df                	mov    %ebx,%edi
    2d2d:	e8 6e e5 ff ff       	call   12a0 <close@plt>
    2d32:	b9 04 00 00 00       	mov    $0x4,%ecx
    2d37:	48 8d 3d ff 1b 00 00 	lea    0x1bff(%rip),%rdi        # 493d <transition_table+0x4fd>
    2d3e:	48 89 ee             	mov    %rbp,%rsi
    2d41:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    2d43:	0f 97 c0             	seta   %al
    2d46:	1c 00                	sbb    $0x0,%al
    2d48:	0f be c0             	movsbl %al,%eax
    2d4b:	85 c0                	test   %eax,%eax
    2d4d:	0f 84 59 fc ff ff    	je     29ac <submitr+0x2fd>
    2d53:	b9 05 00 00 00       	mov    $0x5,%ecx
    2d58:	48 8d 3d e2 1b 00 00 	lea    0x1be2(%rip),%rdi        # 4941 <transition_table+0x501>
    2d5f:	48 89 ee             	mov    %rbp,%rsi
    2d62:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    2d64:	0f 97 c0             	seta   %al
    2d67:	1c 00                	sbb    $0x0,%al
    2d69:	0f be c0             	movsbl %al,%eax
    2d6c:	85 c0                	test   %eax,%eax
    2d6e:	0f 84 38 fc ff ff    	je     29ac <submitr+0x2fd>
    2d74:	b9 03 00 00 00       	mov    $0x3,%ecx
    2d79:	48 8d 3d c6 1b 00 00 	lea    0x1bc6(%rip),%rdi        # 4946 <transition_table+0x506>
    2d80:	48 89 ee             	mov    %rbp,%rsi
    2d83:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    2d85:	0f 97 c0             	seta   %al
    2d88:	1c 00                	sbb    $0x0,%al
    2d8a:	0f be c0             	movsbl %al,%eax
    2d8d:	85 c0                	test   %eax,%eax
    2d8f:	0f 84 17 fc ff ff    	je     29ac <submitr+0x2fd>
    2d95:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2d9a:	e9 0d fc ff ff       	jmp    29ac <submitr+0x2fd>
    2d9f:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2da6:	3a 20 43 
    2da9:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2db0:	20 75 6e 
    2db3:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2db7:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2dbb:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2dc2:	74 6f 20 
    2dc5:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
    2dcc:	73 74 61 
    2dcf:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2dd3:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2dd7:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
    2dde:	65 73 73 
    2de1:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
    2de8:	72 6f 6d 
    2deb:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2def:	48 89 55 28          	mov    %rdx,0x28(%rbp)
    2df3:	48 b8 20 41 75 74 6f 	movabs $0x62616c6f74754120,%rax
    2dfa:	6c 61 62 
    2dfd:	48 ba 20 73 65 72 76 	movabs $0x72657672657320,%rdx
    2e04:	65 72 00 
    2e07:	48 89 45 30          	mov    %rax,0x30(%rbp)
    2e0b:	48 89 55 38          	mov    %rdx,0x38(%rbp)
    2e0f:	89 df                	mov    %ebx,%edi
    2e11:	e8 8a e4 ff ff       	call   12a0 <close@plt>
    2e16:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2e1b:	e9 8c fb ff ff       	jmp    29ac <submitr+0x2fd>
    2e20:	4c 8d 8c 24 50 80 00 	lea    0x8050(%rsp),%r9
    2e27:	00 
    2e28:	48 8d 0d c9 1a 00 00 	lea    0x1ac9(%rip),%rcx        # 48f8 <transition_table+0x4b8>
    2e2f:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    2e36:	be 01 00 00 00       	mov    $0x1,%esi
    2e3b:	48 89 ef             	mov    %rbp,%rdi
    2e3e:	b8 00 00 00 00       	mov    $0x0,%eax
    2e43:	e8 78 e5 ff ff       	call   13c0 <__sprintf_chk@plt>
    2e48:	89 df                	mov    %ebx,%edi
    2e4a:	e8 51 e4 ff ff       	call   12a0 <close@plt>
    2e4f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2e54:	e9 53 fb ff ff       	jmp    29ac <submitr+0x2fd>
    2e59:	e8 22 e4 ff ff       	call   1280 <__stack_chk_fail@plt>

0000000000002e5e <init_timeout>:
    2e5e:	f3 0f 1e fa          	endbr64 
    2e62:	85 ff                	test   %edi,%edi
    2e64:	74 26                	je     2e8c <init_timeout+0x2e>
    2e66:	53                   	push   %rbx
    2e67:	89 fb                	mov    %edi,%ebx
    2e69:	78 1a                	js     2e85 <init_timeout+0x27>
    2e6b:	48 8d 35 71 f5 ff ff 	lea    -0xa8f(%rip),%rsi        # 23e3 <sigalrm_handler>
    2e72:	bf 0e 00 00 00       	mov    $0xe,%edi
    2e77:	e8 54 e4 ff ff       	call   12d0 <signal@plt>
    2e7c:	89 df                	mov    %ebx,%edi
    2e7e:	e8 0d e4 ff ff       	call   1290 <alarm@plt>
    2e83:	5b                   	pop    %rbx
    2e84:	c3                   	ret    
    2e85:	bb 00 00 00 00       	mov    $0x0,%ebx
    2e8a:	eb df                	jmp    2e6b <init_timeout+0xd>
    2e8c:	c3                   	ret    

0000000000002e8d <init_driver>:
    2e8d:	f3 0f 1e fa          	endbr64 
    2e91:	41 54                	push   %r12
    2e93:	55                   	push   %rbp
    2e94:	53                   	push   %rbx
    2e95:	48 83 ec 20          	sub    $0x20,%rsp
    2e99:	48 89 fd             	mov    %rdi,%rbp
    2e9c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2ea3:	00 00 
    2ea5:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    2eaa:	31 c0                	xor    %eax,%eax
    2eac:	be 01 00 00 00       	mov    $0x1,%esi
    2eb1:	bf 0d 00 00 00       	mov    $0xd,%edi
    2eb6:	e8 15 e4 ff ff       	call   12d0 <signal@plt>
    2ebb:	be 01 00 00 00       	mov    $0x1,%esi
    2ec0:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2ec5:	e8 06 e4 ff ff       	call   12d0 <signal@plt>
    2eca:	be 01 00 00 00       	mov    $0x1,%esi
    2ecf:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2ed4:	e8 f7 e3 ff ff       	call   12d0 <signal@plt>
    2ed9:	ba 00 00 00 00       	mov    $0x0,%edx
    2ede:	be 01 00 00 00       	mov    $0x1,%esi
    2ee3:	bf 02 00 00 00       	mov    $0x2,%edi
    2ee8:	e8 e3 e4 ff ff       	call   13d0 <socket@plt>
    2eed:	85 c0                	test   %eax,%eax
    2eef:	0f 88 9c 00 00 00    	js     2f91 <init_driver+0x104>
    2ef5:	89 c3                	mov    %eax,%ebx
    2ef7:	48 8d 3d 4b 1a 00 00 	lea    0x1a4b(%rip),%rdi        # 4949 <transition_table+0x509>
    2efe:	e8 dd e3 ff ff       	call   12e0 <gethostbyname@plt>
    2f03:	48 85 c0             	test   %rax,%rax
    2f06:	0f 84 d1 00 00 00    	je     2fdd <init_driver+0x150>
    2f0c:	49 89 e4             	mov    %rsp,%r12
    2f0f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    2f16:	00 
    2f17:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    2f1e:	00 00 
    2f20:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
    2f26:	48 63 50 14          	movslq 0x14(%rax),%rdx
    2f2a:	48 8b 40 18          	mov    0x18(%rax),%rax
    2f2e:	48 8b 30             	mov    (%rax),%rsi
    2f31:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    2f36:	b9 0c 00 00 00       	mov    $0xc,%ecx
    2f3b:	e8 b0 e3 ff ff       	call   12f0 <__memmove_chk@plt>
    2f40:	66 c7 44 24 02 30 39 	movw   $0x3930,0x2(%rsp)
    2f47:	ba 10 00 00 00       	mov    $0x10,%edx
    2f4c:	4c 89 e6             	mov    %r12,%rsi
    2f4f:	89 df                	mov    %ebx,%edi
    2f51:	e8 2a e4 ff ff       	call   1380 <connect@plt>
    2f56:	85 c0                	test   %eax,%eax
    2f58:	0f 88 e7 00 00 00    	js     3045 <init_driver+0x1b8>
    2f5e:	89 df                	mov    %ebx,%edi
    2f60:	e8 3b e3 ff ff       	call   12a0 <close@plt>
    2f65:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
    2f6b:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
    2f6f:	b8 00 00 00 00       	mov    $0x0,%eax
    2f74:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    2f79:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    2f80:	00 00 
    2f82:	0f 85 10 01 00 00    	jne    3098 <init_driver+0x20b>
    2f88:	48 83 c4 20          	add    $0x20,%rsp
    2f8c:	5b                   	pop    %rbx
    2f8d:	5d                   	pop    %rbp
    2f8e:	41 5c                	pop    %r12
    2f90:	c3                   	ret    
    2f91:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2f98:	3a 20 43 
    2f9b:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2fa2:	20 75 6e 
    2fa5:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2fa9:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2fad:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2fb4:	74 6f 20 
    2fb7:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    2fbe:	65 20 73 
    2fc1:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2fc5:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2fc9:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    2fd0:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    2fd6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2fdb:	eb 97                	jmp    2f74 <init_driver+0xe7>
    2fdd:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    2fe4:	3a 20 44 
    2fe7:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    2fee:	20 75 6e 
    2ff1:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2ff5:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2ff9:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    3000:	74 6f 20 
    3003:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    300a:	76 65 20 
    300d:	48 89 45 10          	mov    %rax,0x10(%rbp)
    3011:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    3015:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    301c:	72 20 61 
    301f:	48 89 45 20          	mov    %rax,0x20(%rbp)
    3023:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
    302a:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
    3030:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    3034:	89 df                	mov    %ebx,%edi
    3036:	e8 65 e2 ff ff       	call   12a0 <close@plt>
    303b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3040:	e9 2f ff ff ff       	jmp    2f74 <init_driver+0xe7>
    3045:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    304c:	3a 20 55 
    304f:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    3056:	20 74 6f 
    3059:	48 89 45 00          	mov    %rax,0x0(%rbp)
    305d:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    3061:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    3068:	65 63 74 
    306b:	48 ba 20 74 6f 20 73 	movabs $0x76726573206f7420,%rdx
    3072:	65 72 76 
    3075:	48 89 45 10          	mov    %rax,0x10(%rbp)
    3079:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    307d:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
    3083:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
    3087:	89 df                	mov    %ebx,%edi
    3089:	e8 12 e2 ff ff       	call   12a0 <close@plt>
    308e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3093:	e9 dc fe ff ff       	jmp    2f74 <init_driver+0xe7>
    3098:	e8 e3 e1 ff ff       	call   1280 <__stack_chk_fail@plt>

000000000000309d <driver_post>:
    309d:	f3 0f 1e fa          	endbr64 
    30a1:	53                   	push   %rbx
    30a2:	4c 89 cb             	mov    %r9,%rbx
    30a5:	45 85 c0             	test   %r8d,%r8d
    30a8:	75 18                	jne    30c2 <driver_post+0x25>
    30aa:	48 85 ff             	test   %rdi,%rdi
    30ad:	74 05                	je     30b4 <driver_post+0x17>
    30af:	80 3f 00             	cmpb   $0x0,(%rdi)
    30b2:	75 37                	jne    30eb <driver_post+0x4e>
    30b4:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    30b9:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    30bd:	44 89 c0             	mov    %r8d,%eax
    30c0:	5b                   	pop    %rbx
    30c1:	c3                   	ret    
    30c2:	48 89 ca             	mov    %rcx,%rdx
    30c5:	48 8d 35 8d 18 00 00 	lea    0x188d(%rip),%rsi        # 4959 <transition_table+0x519>
    30cc:	bf 01 00 00 00       	mov    $0x1,%edi
    30d1:	b8 00 00 00 00       	mov    $0x0,%eax
    30d6:	e8 65 e2 ff ff       	call   1340 <__printf_chk@plt>
    30db:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    30e0:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    30e4:	b8 00 00 00 00       	mov    $0x0,%eax
    30e9:	eb d5                	jmp    30c0 <driver_post+0x23>
    30eb:	48 83 ec 08          	sub    $0x8,%rsp
    30ef:	41 51                	push   %r9
    30f1:	49 89 c9             	mov    %rcx,%r9
    30f4:	49 89 d0             	mov    %rdx,%r8
    30f7:	48 89 f9             	mov    %rdi,%rcx
    30fa:	48 89 f2             	mov    %rsi,%rdx
    30fd:	be 39 30 00 00       	mov    $0x3039,%esi
    3102:	48 8d 3d 40 18 00 00 	lea    0x1840(%rip),%rdi        # 4949 <transition_table+0x509>
    3109:	e8 a1 f5 ff ff       	call   26af <submitr>
    310e:	48 83 c4 10          	add    $0x10,%rsp
    3112:	eb ac                	jmp    30c0 <driver_post+0x23>
    3114:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    311b:	00 00 00 
    311e:	66 90                	xchg   %ax,%ax

0000000000003120 <__libc_csu_init>:
    3120:	f3 0f 1e fa          	endbr64 
    3124:	41 57                	push   %r15
    3126:	4c 8d 3d 9b 3b 00 00 	lea    0x3b9b(%rip),%r15        # 6cc8 <__frame_dummy_init_array_entry>
    312d:	41 56                	push   %r14
    312f:	49 89 d6             	mov    %rdx,%r14
    3132:	41 55                	push   %r13
    3134:	49 89 f5             	mov    %rsi,%r13
    3137:	41 54                	push   %r12
    3139:	41 89 fc             	mov    %edi,%r12d
    313c:	55                   	push   %rbp
    313d:	48 8d 2d 8c 3b 00 00 	lea    0x3b8c(%rip),%rbp        # 6cd0 <__do_global_dtors_aux_fini_array_entry>
    3144:	53                   	push   %rbx
    3145:	4c 29 fd             	sub    %r15,%rbp
    3148:	48 83 ec 08          	sub    $0x8,%rsp
    314c:	e8 af de ff ff       	call   1000 <_init>
    3151:	48 c1 fd 03          	sar    $0x3,%rbp
    3155:	74 1f                	je     3176 <__libc_csu_init+0x56>
    3157:	31 db                	xor    %ebx,%ebx
    3159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3160:	4c 89 f2             	mov    %r14,%rdx
    3163:	4c 89 ee             	mov    %r13,%rsi
    3166:	44 89 e7             	mov    %r12d,%edi
    3169:	41 ff 14 df          	call   *(%r15,%rbx,8)
    316d:	48 83 c3 01          	add    $0x1,%rbx
    3171:	48 39 dd             	cmp    %rbx,%rbp
    3174:	75 ea                	jne    3160 <__libc_csu_init+0x40>
    3176:	48 83 c4 08          	add    $0x8,%rsp
    317a:	5b                   	pop    %rbx
    317b:	5d                   	pop    %rbp
    317c:	41 5c                	pop    %r12
    317e:	41 5d                	pop    %r13
    3180:	41 5e                	pop    %r14
    3182:	41 5f                	pop    %r15
    3184:	c3                   	ret    
    3185:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    318c:	00 00 00 00 

0000000000003190 <__libc_csu_fini>:
    3190:	f3 0f 1e fa          	endbr64 
    3194:	c3                   	ret    

Disassembly of section .fini:

0000000000003198 <_fini>:
    3198:	f3 0f 1e fa          	endbr64 
    319c:	48 83 ec 08          	sub    $0x8,%rsp
    31a0:	48 83 c4 08          	add    $0x8,%rsp
    31a4:	c3                   	ret    
