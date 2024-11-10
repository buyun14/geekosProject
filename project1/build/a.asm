
geekos/kernel.exe:     file format elf32-i386


Disassembly of section .text:

00010000 <Init_Interrupt_Gate>:
   10000:	55                   	push   %ebp
   10001:	89 e5                	mov    %esp,%ebp
   10003:	53                   	push   %ebx
   10004:	8b 45 08             	mov    0x8(%ebp),%eax
   10007:	8b 55 0c             	mov    0xc(%ebp),%edx
   1000a:	66 89 10             	mov    %dx,(%eax)
   1000d:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
   10013:	80 60 04 e0          	andb   $0xe0,0x4(%eax)
   10017:	0f b7 48 04          	movzwl 0x4(%eax),%ecx
   1001b:	66 81 e1 1f e0       	and    $0xe01f,%cx
   10020:	80 cd 0e             	or     $0xe,%ch
   10023:	66 89 48 04          	mov    %cx,0x4(%eax)
   10027:	8b 5d 10             	mov    0x10(%ebp),%ebx
   1002a:	83 e3 03             	and    $0x3,%ebx
   1002d:	c1 e3 05             	shl    $0x5,%ebx
   10030:	66 c1 e9 08          	shr    $0x8,%cx
   10034:	83 e1 9f             	and    $0xffffff9f,%ecx
   10037:	09 d9                	or     %ebx,%ecx
   10039:	83 c9 80             	or     $0xffffff80,%ecx
   1003c:	88 48 05             	mov    %cl,0x5(%eax)
   1003f:	c1 ea 10             	shr    $0x10,%edx
   10042:	66 89 50 06          	mov    %dx,0x6(%eax)
   10046:	5b                   	pop    %ebx
   10047:	5d                   	pop    %ebp
   10048:	c3                   	ret    

00010049 <Install_Interrupt_Handler>:
   10049:	55                   	push   %ebp
   1004a:	89 e5                	mov    %esp,%ebp
   1004c:	83 ec 28             	sub    $0x28,%esp
   1004f:	8b 45 08             	mov    0x8(%ebp),%eax
   10052:	3d ff 00 00 00       	cmp    $0xff,%eax
   10057:	76 4a                	jbe    100a3 <Install_Interrupt_Handler+0x5a>
   10059:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10060:	e8 8e 10 00 00       	call   110f3 <Set_Current_Attr>
   10065:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1006a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1006e:	8b 45 04             	mov    0x4(%ebp),%eax
   10071:	89 44 24 14          	mov    %eax,0x14(%esp)
   10075:	c7 44 24 10 75 00 00 	movl   $0x75,0x10(%esp)
   1007c:	00 
   1007d:	c7 44 24 0c c0 cb 01 	movl   $0x1cbc0,0xc(%esp)
   10084:	00 
   10085:	c7 44 24 08 ec cb 01 	movl   $0x1cbec,0x8(%esp)
   1008c:	00 
   1008d:	c7 44 24 04 de cc 01 	movl   $0x1ccde,0x4(%esp)
   10094:	00 
   10095:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1009c:	e8 1b 0f 00 00       	call   10fbc <Print>
   100a1:	eb fe                	jmp    100a1 <Install_Interrupt_Handler+0x58>
   100a3:	8b 55 0c             	mov    0xc(%ebp),%edx
   100a6:	89 14 85 c0 03 02 00 	mov    %edx,0x203c0(,%eax,4)
   100ad:	c9                   	leave  
   100ae:	c3                   	ret    

000100af <Init_IDT>:
   100af:	55                   	push   %ebp
   100b0:	89 e5                	mov    %esp,%ebp
   100b2:	57                   	push   %edi
   100b3:	56                   	push   %esi
   100b4:	53                   	push   %ebx
   100b5:	83 ec 3c             	sub    $0x3c,%esp
   100b8:	c7 04 24 d4 cb 01 00 	movl   $0x1cbd4,(%esp)
   100bf:	e8 f8 0e 00 00       	call   10fbc <Print>
   100c4:	a1 20 f1 01 00       	mov    0x1f120,%eax
   100c9:	3b 05 24 f1 01 00    	cmp    0x1f124,%eax
   100cf:	74 4a                	je     1011b <Init_IDT+0x6c>
   100d1:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   100d8:	e8 16 10 00 00       	call   110f3 <Set_Current_Attr>
   100dd:	a1 d0 07 02 00       	mov    0x207d0,%eax
   100e2:	89 44 24 18          	mov    %eax,0x18(%esp)
   100e6:	8b 45 04             	mov    0x4(%ebp),%eax
   100e9:	89 44 24 14          	mov    %eax,0x14(%esp)
   100ed:	c7 44 24 10 3d 00 00 	movl   $0x3d,0x10(%esp)
   100f4:	00 
   100f5:	c7 44 24 0c c0 cb 01 	movl   $0x1cbc0,0xc(%esp)
   100fc:	00 
   100fd:	c7 44 24 08 5c cc 01 	movl   $0x1cc5c,0x8(%esp)
   10104:	00 
   10105:	c7 44 24 04 f8 cc 01 	movl   $0x1ccf8,0x4(%esp)
   1010c:	00 
   1010d:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   10114:	e8 a3 0e 00 00       	call   10fbc <Print>
   10119:	eb fe                	jmp    10119 <Init_IDT+0x6a>
   1011b:	c1 e0 08             	shl    $0x8,%eax
   1011e:	ba 88 be 01 00       	mov    $0x1be88,%edx
   10123:	81 ea 88 ae 01 00    	sub    $0x1ae88,%edx
   10129:	39 d0                	cmp    %edx,%eax
   1012b:	74 4a                	je     10177 <Init_IDT+0xc8>
   1012d:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10134:	e8 ba 0f 00 00       	call   110f3 <Set_Current_Attr>
   10139:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1013e:	89 44 24 18          	mov    %eax,0x18(%esp)
   10142:	8b 45 04             	mov    0x4(%ebp),%eax
   10145:	89 44 24 14          	mov    %eax,0x14(%esp)
   10149:	c7 44 24 10 3f 00 00 	movl   $0x3f,0x10(%esp)
   10150:	00 
   10151:	c7 44 24 0c c0 cb 01 	movl   $0x1cbc0,0xc(%esp)
   10158:	00 
   10159:	c7 44 24 08 84 cc 01 	movl   $0x1cc84,0x8(%esp)
   10160:	00 
   10161:	c7 44 24 04 f8 cc 01 	movl   $0x1ccf8,0x4(%esp)
   10168:	00 
   10169:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   10170:	e8 47 0e 00 00       	call   10fbc <Print>
   10175:	eb fe                	jmp    10175 <Init_IDT+0xc6>
   10177:	bf 40 f1 01 00       	mov    $0x1f140,%edi
   1017c:	be 88 ae 01 00       	mov    $0x1ae88,%esi
   10181:	bb 01 00 00 00       	mov    $0x1,%ebx
   10186:	eb 06                	jmp    1018e <Init_IDT+0xdf>
   10188:	83 c3 01             	add    $0x1,%ebx
   1018b:	83 c7 08             	add    $0x8,%edi
   1018e:	81 fb 91 00 00 00    	cmp    $0x91,%ebx
   10194:	74 4e                	je     101e4 <Init_IDT+0x135>
   10196:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
   1019d:	00 
   1019e:	89 74 24 04          	mov    %esi,0x4(%esp)
   101a2:	89 3c 24             	mov    %edi,(%esp)
   101a5:	e8 56 fe ff ff       	call   10000 <Init_Interrupt_Gate>
   101aa:	a1 20 f1 01 00       	mov    0x1f120,%eax
   101af:	81 fb ff 00 00 00    	cmp    $0xff,%ebx
   101b5:	7f 04                	jg     101bb <Init_IDT+0x10c>
   101b7:	01 c6                	add    %eax,%esi
   101b9:	eb cd                	jmp    10188 <Init_IDT+0xd9>
   101bb:	66 c7 45 e2 00 08    	movw   $0x800,-0x1e(%ebp)
   101c1:	b8 40 f1 01 00       	mov    $0x1f140,%eax
   101c6:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
   101ca:	c1 e8 10             	shr    $0x10,%eax
   101cd:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
   101d1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
   101d4:	89 04 24             	mov    %eax,(%esp)
   101d7:	e8 74 ab 00 00       	call   1ad50 <Load_IDTR>
   101dc:	83 c4 3c             	add    $0x3c,%esp
   101df:	5b                   	pop    %ebx
   101e0:	5e                   	pop    %esi
   101e1:	5f                   	pop    %edi
   101e2:	5d                   	pop    %ebp
   101e3:	c3                   	ret    
   101e4:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
   101eb:	00 
   101ec:	89 74 24 04          	mov    %esi,0x4(%esp)
   101f0:	89 3c 24             	mov    %edi,(%esp)
   101f3:	e8 08 fe ff ff       	call   10000 <Init_Interrupt_Gate>
   101f8:	03 35 20 f1 01 00    	add    0x1f120,%esi
   101fe:	eb 88                	jmp    10188 <Init_IDT+0xd9>

00010200 <Print_Selector>:
   10200:	55                   	push   %ebp
   10201:	89 e5                	mov    %esp,%ebp
   10203:	83 ec 28             	sub    $0x28,%esp
   10206:	89 d1                	mov    %edx,%ecx
   10208:	83 e1 03             	and    $0x3,%ecx
   1020b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
   1020f:	89 d1                	mov    %edx,%ecx
   10211:	c1 e9 02             	shr    $0x2,%ecx
   10214:	83 e1 01             	and    $0x1,%ecx
   10217:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
   1021b:	c1 ea 03             	shr    $0x3,%edx
   1021e:	89 54 24 08          	mov    %edx,0x8(%esp)
   10222:	89 44 24 04          	mov    %eax,0x4(%esp)
   10226:	c7 04 24 01 cd 01 00 	movl   $0x1cd01,(%esp)
   1022d:	e8 8a 0d 00 00       	call   10fbc <Print>
   10232:	c9                   	leave  
   10233:	c3                   	ret    

00010234 <Dump_Interrupt_State>:
   10234:	55                   	push   %ebp
   10235:	89 e5                	mov    %esp,%ebp
   10237:	53                   	push   %ebx
   10238:	83 ec 54             	sub    $0x54,%esp
   1023b:	8b 5d 08             	mov    0x8(%ebp),%ebx
   1023e:	8b 43 30             	mov    0x30(%ebx),%eax
   10241:	89 c2                	mov    %eax,%edx
   10243:	83 e2 01             	and    $0x1,%edx
   10246:	89 54 24 40          	mov    %edx,0x40(%esp)
   1024a:	89 c2                	mov    %eax,%edx
   1024c:	d1 ea                	shr    %edx
   1024e:	83 e2 01             	and    $0x1,%edx
   10251:	89 54 24 3c          	mov    %edx,0x3c(%esp)
   10255:	89 c2                	mov    %eax,%edx
   10257:	c1 ea 02             	shr    $0x2,%edx
   1025a:	83 e2 01             	and    $0x1,%edx
   1025d:	89 54 24 38          	mov    %edx,0x38(%esp)
   10261:	89 c2                	mov    %eax,%edx
   10263:	c1 ea 03             	shr    $0x3,%edx
   10266:	89 54 24 34          	mov    %edx,0x34(%esp)
   1026a:	89 44 24 30          	mov    %eax,0x30(%esp)
   1026e:	8b 43 2c             	mov    0x2c(%ebx),%eax
   10271:	89 44 24 2c          	mov    %eax,0x2c(%esp)
   10275:	8b 43 3c             	mov    0x3c(%ebx),%eax
   10278:	89 44 24 28          	mov    %eax,0x28(%esp)
   1027c:	8b 43 38             	mov    0x38(%ebx),%eax
   1027f:	89 44 24 24          	mov    %eax,0x24(%esp)
   10283:	8b 43 34             	mov    0x34(%ebx),%eax
   10286:	89 44 24 20          	mov    %eax,0x20(%esp)
   1028a:	8b 43 10             	mov    0x10(%ebx),%eax
   1028d:	89 44 24 1c          	mov    %eax,0x1c(%esp)
   10291:	8b 43 14             	mov    0x14(%ebx),%eax
   10294:	89 44 24 18          	mov    %eax,0x18(%esp)
   10298:	8b 43 18             	mov    0x18(%ebx),%eax
   1029b:	89 44 24 14          	mov    %eax,0x14(%esp)
   1029f:	8b 43 1c             	mov    0x1c(%ebx),%eax
   102a2:	89 44 24 10          	mov    %eax,0x10(%esp)
   102a6:	8b 43 20             	mov    0x20(%ebx),%eax
   102a9:	89 44 24 0c          	mov    %eax,0xc(%esp)
   102ad:	8b 43 24             	mov    0x24(%ebx),%eax
   102b0:	89 44 24 08          	mov    %eax,0x8(%esp)
   102b4:	8b 43 28             	mov    0x28(%ebx),%eax
   102b7:	89 44 24 04          	mov    %eax,0x4(%esp)
   102bb:	c7 04 24 74 cd 01 00 	movl   $0x1cd74,(%esp)
   102c2:	e8 f5 0c 00 00       	call   10fbc <Print>
   102c7:	8b 43 38             	mov    0x38(%ebx),%eax
   102ca:	83 e0 03             	and    $0x3,%eax
   102cd:	83 f8 03             	cmp    $0x3,%eax
   102d0:	75 1a                	jne    102ec <Dump_Interrupt_State+0xb8>
   102d2:	8b 43 44             	mov    0x44(%ebx),%eax
   102d5:	89 44 24 08          	mov    %eax,0x8(%esp)
   102d9:	8b 43 40             	mov    0x40(%ebx),%eax
   102dc:	89 44 24 04          	mov    %eax,0x4(%esp)
   102e0:	c7 04 24 1e cd 01 00 	movl   $0x1cd1e,(%esp)
   102e7:	e8 d0 0c 00 00       	call   10fbc <Print>
   102ec:	8b 53 38             	mov    0x38(%ebx),%edx
   102ef:	b8 3b cd 01 00       	mov    $0x1cd3b,%eax
   102f4:	e8 07 ff ff ff       	call   10200 <Print_Selector>
   102f9:	8b 53 0c             	mov    0xc(%ebx),%edx
   102fc:	b8 3e cd 01 00       	mov    $0x1cd3e,%eax
   10301:	e8 fa fe ff ff       	call   10200 <Print_Selector>
   10306:	8b 53 08             	mov    0x8(%ebx),%edx
   10309:	b8 41 cd 01 00       	mov    $0x1cd41,%eax
   1030e:	e8 ed fe ff ff       	call   10200 <Print_Selector>
   10313:	8b 53 04             	mov    0x4(%ebx),%edx
   10316:	b8 44 cd 01 00       	mov    $0x1cd44,%eax
   1031b:	e8 e0 fe ff ff       	call   10200 <Print_Selector>
   10320:	8b 13                	mov    (%ebx),%edx
   10322:	b8 47 cd 01 00       	mov    $0x1cd47,%eax
   10327:	e8 d4 fe ff ff       	call   10200 <Print_Selector>
   1032c:	83 c4 54             	add    $0x54,%esp
   1032f:	5b                   	pop    %ebx
   10330:	5d                   	pop    %ebp
   10331:	c3                   	ret    

00010332 <Dummy_Interrupt_Handler>:
   10332:	55                   	push   %ebp
   10333:	89 e5                	mov    %esp,%ebp
   10335:	83 ec 18             	sub    $0x18,%esp
   10338:	c7 04 24 14 ce 01 00 	movl   $0x1ce14,(%esp)
   1033f:	e8 78 0c 00 00       	call   10fbc <Print>
   10344:	8b 45 08             	mov    0x8(%ebp),%eax
   10347:	89 04 24             	mov    %eax,(%esp)
   1034a:	e8 e5 fe ff ff       	call   10234 <Dump_Interrupt_State>
   1034f:	eb fe                	jmp    1034f <Dummy_Interrupt_Handler+0x1d>

00010351 <Interrupts_Enabled>:
   10351:	55                   	push   %ebp
   10352:	89 e5                	mov    %esp,%ebp
   10354:	83 ec 08             	sub    $0x8,%esp
   10357:	e8 24 ab 00 00       	call   1ae80 <Get_Current_EFLAGS>
   1035c:	c1 e8 09             	shr    $0x9,%eax
   1035f:	83 e0 01             	and    $0x1,%eax
   10362:	c9                   	leave  
   10363:	c3                   	ret    

00010364 <Init_Interrupts>:
   10364:	55                   	push   %ebp
   10365:	89 e5                	mov    %esp,%ebp
   10367:	53                   	push   %ebx
   10368:	83 ec 24             	sub    $0x24,%esp
   1036b:	e8 3f fd ff ff       	call   100af <Init_IDT>
   10370:	bb 00 00 00 00       	mov    $0x0,%ebx
   10375:	c7 44 24 04 32 03 01 	movl   $0x10332,0x4(%esp)
   1037c:	00 
   1037d:	89 1c 24             	mov    %ebx,(%esp)
   10380:	e8 c4 fc ff ff       	call   10049 <Install_Interrupt_Handler>
   10385:	83 c3 01             	add    $0x1,%ebx
   10388:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
   1038e:	75 e5                	jne    10375 <Init_Interrupts+0x11>
   10390:	e8 bc ff ff ff       	call   10351 <Interrupts_Enabled>
   10395:	84 c0                	test   %al,%al
   10397:	74 4a                	je     103e3 <Init_Interrupts+0x7f>
   10399:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   103a0:	e8 4e 0d 00 00       	call   110f3 <Set_Current_Attr>
   103a5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   103aa:	89 44 24 18          	mov    %eax,0x18(%esp)
   103ae:	8b 45 04             	mov    0x4(%ebp),%eax
   103b1:	89 44 24 14          	mov    %eax,0x14(%esp)
   103b5:	c7 44 24 10 41 00 00 	movl   $0x41,0x10(%esp)
   103bc:	00 
   103bd:	c7 44 24 0c 4a cd 01 	movl   $0x1cd4a,0xc(%esp)
   103c4:	00 
   103c5:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   103cc:	00 
   103cd:	c7 44 24 04 33 ce 01 	movl   $0x1ce33,0x4(%esp)
   103d4:	00 
   103d5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   103dc:	e8 db 0b 00 00       	call   10fbc <Print>
   103e1:	eb fe                	jmp    103e1 <Init_Interrupts+0x7d>
   103e3:	fb                   	sti    
   103e4:	83 c4 24             	add    $0x24,%esp
   103e7:	5b                   	pop    %ebx
   103e8:	5d                   	pop    %ebp
   103e9:	c3                   	ret    
   103ea:	90                   	nop
   103eb:	90                   	nop

000103ec <Init_Traps>:
   103ec:	55                   	push   %ebp
   103ed:	89 e5                	mov    %esp,%ebp
   103ef:	83 ec 18             	sub    $0x18,%esp
   103f2:	c7 44 24 04 1c 04 01 	movl   $0x1041c,0x4(%esp)
   103f9:	00 
   103fa:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
   10401:	e8 43 fc ff ff       	call   10049 <Install_Interrupt_Handler>
   10406:	c7 44 24 04 1c 04 01 	movl   $0x1041c,0x4(%esp)
   1040d:	00 
   1040e:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
   10415:	e8 2f fc ff ff       	call   10049 <Install_Interrupt_Handler>
   1041a:	c9                   	leave  
   1041b:	c3                   	ret    

0001041c <GPF_Handler>:
   1041c:	55                   	push   %ebp
   1041d:	89 e5                	mov    %esp,%ebp
   1041f:	53                   	push   %ebx
   10420:	83 ec 14             	sub    $0x14,%esp
   10423:	8b 5d 08             	mov    0x8(%ebp),%ebx
   10426:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1042b:	89 44 24 08          	mov    %eax,0x8(%esp)
   1042f:	8b 43 2c             	mov    0x2c(%ebx),%eax
   10432:	89 44 24 04          	mov    %eax,0x4(%esp)
   10436:	c7 04 24 44 ce 01 00 	movl   $0x1ce44,(%esp)
   1043d:	e8 7a 0b 00 00       	call   10fbc <Print>
   10442:	89 1c 24             	mov    %ebx,(%esp)
   10445:	e8 ea fd ff ff       	call   10234 <Dump_Interrupt_State>
   1044a:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
   10451:	e8 cc 52 00 00       	call   15722 <Exit>
   10456:	90                   	nop
   10457:	90                   	nop
   10458:	90                   	nop
   10459:	90                   	nop
   1045a:	90                   	nop
   1045b:	90                   	nop
   1045c:	90                   	nop
   1045d:	90                   	nop
   1045e:	90                   	nop
   1045f:	90                   	nop

00010460 <Get_IRQ_Mask>:
   10460:	55                   	push   %ebp
   10461:	89 e5                	mov    %esp,%ebp
   10463:	0f b7 05 00 f0 01 00 	movzwl 0x1f000,%eax
   1046a:	5d                   	pop    %ebp
   1046b:	c3                   	ret    

0001046c <Begin_IRQ>:
   1046c:	55                   	push   %ebp
   1046d:	89 e5                	mov    %esp,%ebp
   1046f:	5d                   	pop    %ebp
   10470:	c3                   	ret    

00010471 <End_IRQ>:
   10471:	55                   	push   %ebp
   10472:	89 e5                	mov    %esp,%ebp
   10474:	83 ec 18             	sub    $0x18,%esp
   10477:	8b 45 08             	mov    0x8(%ebp),%eax
   1047a:	8b 40 2c             	mov    0x2c(%eax),%eax
   1047d:	83 e8 20             	sub    $0x20,%eax
   10480:	89 c2                	mov    %eax,%edx
   10482:	83 e2 07             	and    $0x7,%edx
   10485:	83 ca 60             	or     $0x60,%edx
   10488:	83 f8 07             	cmp    $0x7,%eax
   1048b:	7f 15                	jg     104a2 <End_IRQ+0x31>
   1048d:	0f b6 d2             	movzbl %dl,%edx
   10490:	89 54 24 04          	mov    %edx,0x4(%esp)
   10494:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
   1049b:	e8 bc 03 00 00       	call   1085c <Out_Byte>
   104a0:	eb 27                	jmp    104c9 <End_IRQ+0x58>
   104a2:	0f b6 d2             	movzbl %dl,%edx
   104a5:	89 54 24 04          	mov    %edx,0x4(%esp)
   104a9:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
   104b0:	e8 a7 03 00 00       	call   1085c <Out_Byte>
   104b5:	c7 44 24 04 62 00 00 	movl   $0x62,0x4(%esp)
   104bc:	00 
   104bd:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
   104c4:	e8 93 03 00 00       	call   1085c <Out_Byte>
   104c9:	c9                   	leave  
   104ca:	c3                   	ret    

000104cb <Set_IRQ_Mask>:
   104cb:	55                   	push   %ebp
   104cc:	89 e5                	mov    %esp,%ebp
   104ce:	53                   	push   %ebx
   104cf:	83 ec 14             	sub    $0x14,%esp
   104d2:	0f b7 5d 08          	movzwl 0x8(%ebp),%ebx
   104d6:	3a 1d 00 f0 01 00    	cmp    0x1f000,%bl
   104dc:	74 13                	je     104f1 <Set_IRQ_Mask+0x26>
   104de:	0f b6 c3             	movzbl %bl,%eax
   104e1:	89 44 24 04          	mov    %eax,0x4(%esp)
   104e5:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
   104ec:	e8 6b 03 00 00       	call   1085c <Out_Byte>
   104f1:	89 d8                	mov    %ebx,%eax
   104f3:	66 c1 e8 08          	shr    $0x8,%ax
   104f7:	3a 05 01 f0 01 00    	cmp    0x1f001,%al
   104fd:	74 13                	je     10512 <Set_IRQ_Mask+0x47>
   104ff:	0f b6 c0             	movzbl %al,%eax
   10502:	89 44 24 04          	mov    %eax,0x4(%esp)
   10506:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
   1050d:	e8 4a 03 00 00       	call   1085c <Out_Byte>
   10512:	66 89 1d 00 f0 01 00 	mov    %bx,0x1f000
   10519:	83 c4 14             	add    $0x14,%esp
   1051c:	5b                   	pop    %ebx
   1051d:	5d                   	pop    %ebp
   1051e:	c3                   	ret    

0001051f <Install_IRQ>:
   1051f:	55                   	push   %ebp
   10520:	89 e5                	mov    %esp,%ebp
   10522:	83 ec 18             	sub    $0x18,%esp
   10525:	8b 45 0c             	mov    0xc(%ebp),%eax
   10528:	89 44 24 04          	mov    %eax,0x4(%esp)
   1052c:	8b 45 08             	mov    0x8(%ebp),%eax
   1052f:	83 c0 20             	add    $0x20,%eax
   10532:	89 04 24             	mov    %eax,(%esp)
   10535:	e8 0f fb ff ff       	call   10049 <Install_Interrupt_Handler>
   1053a:	c9                   	leave  
   1053b:	c3                   	ret    

0001053c <Enable_IRQ>:
   1053c:	55                   	push   %ebp
   1053d:	89 e5                	mov    %esp,%ebp
   1053f:	53                   	push   %ebx
   10540:	83 ec 24             	sub    $0x24,%esp
   10543:	e8 09 fe ff ff       	call   10351 <Interrupts_Enabled>
   10548:	89 c3                	mov    %eax,%ebx
   1054a:	84 c0                	test   %al,%al
   1054c:	74 54                	je     105a2 <Enable_IRQ+0x66>
   1054e:	e8 fe fd ff ff       	call   10351 <Interrupts_Enabled>
   10553:	84 c0                	test   %al,%al
   10555:	75 4a                	jne    105a1 <Enable_IRQ+0x65>
   10557:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1055e:	e8 90 0b 00 00       	call   110f3 <Set_Current_Attr>
   10563:	a1 d0 07 02 00       	mov    0x207d0,%eax
   10568:	89 44 24 18          	mov    %eax,0x18(%esp)
   1056c:	8b 45 04             	mov    0x4(%ebp),%eax
   1056f:	89 44 24 14          	mov    %eax,0x14(%esp)
   10573:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   1057a:	00 
   1057b:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   10582:	00 
   10583:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1058a:	00 
   1058b:	c7 44 24 04 bb ce 01 	movl   $0x1cebb,0x4(%esp)
   10592:	00 
   10593:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1059a:	e8 1d 0a 00 00       	call   10fbc <Print>
   1059f:	eb fe                	jmp    1059f <Enable_IRQ+0x63>
   105a1:	fa                   	cli    
   105a2:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
   105a6:	76 4b                	jbe    105f3 <Enable_IRQ+0xb7>
   105a8:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   105af:	90                   	nop
   105b0:	e8 3e 0b 00 00       	call   110f3 <Set_Current_Attr>
   105b5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   105ba:	89 44 24 18          	mov    %eax,0x18(%esp)
   105be:	8b 45 04             	mov    0x4(%ebp),%eax
   105c1:	89 44 24 14          	mov    %eax,0x14(%esp)
   105c5:	c7 44 24 10 54 00 00 	movl   $0x54,0x10(%esp)
   105cc:	00 
   105cd:	c7 44 24 0c 86 ce 01 	movl   $0x1ce86,0xc(%esp)
   105d4:	00 
   105d5:	c7 44 24 08 9a ce 01 	movl   $0x1ce9a,0x8(%esp)
   105dc:	00 
   105dd:	c7 44 24 04 db ce 01 	movl   $0x1cedb,0x4(%esp)
   105e4:	00 
   105e5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   105ec:	e8 cb 09 00 00       	call   10fbc <Print>
   105f1:	eb fe                	jmp    105f1 <Enable_IRQ+0xb5>
   105f3:	e8 68 fe ff ff       	call   10460 <Get_IRQ_Mask>
   105f8:	ba fe ff ff ff       	mov    $0xfffffffe,%edx
   105fd:	0f b6 4d 08          	movzbl 0x8(%ebp),%ecx
   10601:	d3 c2                	rol    %cl,%edx
   10603:	21 d0                	and    %edx,%eax
   10605:	0f b7 c0             	movzwl %ax,%eax
   10608:	89 04 24             	mov    %eax,(%esp)
   1060b:	e8 bb fe ff ff       	call   104cb <Set_IRQ_Mask>
   10610:	e8 3c fd ff ff       	call   10351 <Interrupts_Enabled>
   10615:	84 c0                	test   %al,%al
   10617:	74 4a                	je     10663 <Enable_IRQ+0x127>
   10619:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10620:	e8 ce 0a 00 00       	call   110f3 <Set_Current_Attr>
   10625:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1062a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1062e:	8b 45 04             	mov    0x4(%ebp),%eax
   10631:	89 44 24 14          	mov    %eax,0x14(%esp)
   10635:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   1063c:	00 
   1063d:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   10644:	00 
   10645:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1064c:	00 
   1064d:	c7 44 24 04 cc ce 01 	movl   $0x1cecc,0x4(%esp)
   10654:	00 
   10655:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1065c:	e8 5b 09 00 00       	call   10fbc <Print>
   10661:	eb fe                	jmp    10661 <Enable_IRQ+0x125>
   10663:	84 db                	test   %bl,%bl
   10665:	74 5d                	je     106c4 <Enable_IRQ+0x188>
   10667:	89 f6                	mov    %esi,%esi
   10669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
   10670:	e8 dc fc ff ff       	call   10351 <Interrupts_Enabled>
   10675:	84 c0                	test   %al,%al
   10677:	74 4a                	je     106c3 <Enable_IRQ+0x187>
   10679:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10680:	e8 6e 0a 00 00       	call   110f3 <Set_Current_Attr>
   10685:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1068a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1068e:	8b 45 04             	mov    0x4(%ebp),%eax
   10691:	89 44 24 14          	mov    %eax,0x14(%esp)
   10695:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   1069c:	00 
   1069d:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   106a4:	00 
   106a5:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   106ac:	00 
   106ad:	c7 44 24 04 cc ce 01 	movl   $0x1cecc,0x4(%esp)
   106b4:	00 
   106b5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   106bc:	e8 fb 08 00 00       	call   10fbc <Print>
   106c1:	eb fe                	jmp    106c1 <Enable_IRQ+0x185>
   106c3:	fb                   	sti    
   106c4:	83 c4 24             	add    $0x24,%esp
   106c7:	5b                   	pop    %ebx
   106c8:	5d                   	pop    %ebp
   106c9:	c3                   	ret    

000106ca <Disable_IRQ>:
   106ca:	55                   	push   %ebp
   106cb:	89 e5                	mov    %esp,%ebp
   106cd:	53                   	push   %ebx
   106ce:	83 ec 24             	sub    $0x24,%esp
   106d1:	e8 7b fc ff ff       	call   10351 <Interrupts_Enabled>
   106d6:	89 c3                	mov    %eax,%ebx
   106d8:	84 c0                	test   %al,%al
   106da:	74 54                	je     10730 <Disable_IRQ+0x66>
   106dc:	e8 70 fc ff ff       	call   10351 <Interrupts_Enabled>
   106e1:	84 c0                	test   %al,%al
   106e3:	75 4a                	jne    1072f <Disable_IRQ+0x65>
   106e5:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   106ec:	e8 02 0a 00 00       	call   110f3 <Set_Current_Attr>
   106f1:	a1 d0 07 02 00       	mov    0x207d0,%eax
   106f6:	89 44 24 18          	mov    %eax,0x18(%esp)
   106fa:	8b 45 04             	mov    0x4(%ebp),%eax
   106fd:	89 44 24 14          	mov    %eax,0x14(%esp)
   10701:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   10708:	00 
   10709:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   10710:	00 
   10711:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   10718:	00 
   10719:	c7 44 24 04 bb ce 01 	movl   $0x1cebb,0x4(%esp)
   10720:	00 
   10721:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   10728:	e8 8f 08 00 00       	call   10fbc <Print>
   1072d:	eb fe                	jmp    1072d <Disable_IRQ+0x63>
   1072f:	fa                   	cli    
   10730:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
   10734:	76 4d                	jbe    10783 <Disable_IRQ+0xb9>
   10736:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1073d:	8d 76 00             	lea    0x0(%esi),%esi
   10740:	e8 ae 09 00 00       	call   110f3 <Set_Current_Attr>
   10745:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1074a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1074e:	8b 45 04             	mov    0x4(%ebp),%eax
   10751:	89 44 24 14          	mov    %eax,0x14(%esp)
   10755:	c7 44 24 10 63 00 00 	movl   $0x63,0x10(%esp)
   1075c:	00 
   1075d:	c7 44 24 0c 86 ce 01 	movl   $0x1ce86,0xc(%esp)
   10764:	00 
   10765:	c7 44 24 08 9a ce 01 	movl   $0x1ce9a,0x8(%esp)
   1076c:	00 
   1076d:	c7 44 24 04 af ce 01 	movl   $0x1ceaf,0x4(%esp)
   10774:	00 
   10775:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1077c:	e8 3b 08 00 00       	call   10fbc <Print>
   10781:	eb fe                	jmp    10781 <Disable_IRQ+0xb7>
   10783:	e8 d8 fc ff ff       	call   10460 <Get_IRQ_Mask>
   10788:	ba 01 00 00 00       	mov    $0x1,%edx
   1078d:	0f b6 4d 08          	movzbl 0x8(%ebp),%ecx
   10791:	d3 e2                	shl    %cl,%edx
   10793:	09 d0                	or     %edx,%eax
   10795:	0f b7 c0             	movzwl %ax,%eax
   10798:	89 04 24             	mov    %eax,(%esp)
   1079b:	e8 2b fd ff ff       	call   104cb <Set_IRQ_Mask>
   107a0:	e8 ac fb ff ff       	call   10351 <Interrupts_Enabled>
   107a5:	84 c0                	test   %al,%al
   107a7:	74 4a                	je     107f3 <Disable_IRQ+0x129>
   107a9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   107b0:	e8 3e 09 00 00       	call   110f3 <Set_Current_Attr>
   107b5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   107ba:	89 44 24 18          	mov    %eax,0x18(%esp)
   107be:	8b 45 04             	mov    0x4(%ebp),%eax
   107c1:	89 44 24 14          	mov    %eax,0x14(%esp)
   107c5:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   107cc:	00 
   107cd:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   107d4:	00 
   107d5:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   107dc:	00 
   107dd:	c7 44 24 04 cc ce 01 	movl   $0x1cecc,0x4(%esp)
   107e4:	00 
   107e5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   107ec:	e8 cb 07 00 00       	call   10fbc <Print>
   107f1:	eb fe                	jmp    107f1 <Disable_IRQ+0x127>
   107f3:	84 db                	test   %bl,%bl
   107f5:	74 5d                	je     10854 <Disable_IRQ+0x18a>
   107f7:	89 f6                	mov    %esi,%esi
   107f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
   10800:	e8 4c fb ff ff       	call   10351 <Interrupts_Enabled>
   10805:	84 c0                	test   %al,%al
   10807:	74 4a                	je     10853 <Disable_IRQ+0x189>
   10809:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10810:	e8 de 08 00 00       	call   110f3 <Set_Current_Attr>
   10815:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1081a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1081e:	8b 45 04             	mov    0x4(%ebp),%eax
   10821:	89 44 24 14          	mov    %eax,0x14(%esp)
   10825:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   1082c:	00 
   1082d:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   10834:	00 
   10835:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1083c:	00 
   1083d:	c7 44 24 04 cc ce 01 	movl   $0x1cecc,0x4(%esp)
   10844:	00 
   10845:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1084c:	e8 6b 07 00 00       	call   10fbc <Print>
   10851:	eb fe                	jmp    10851 <Disable_IRQ+0x187>
   10853:	fb                   	sti    
   10854:	83 c4 24             	add    $0x24,%esp
   10857:	5b                   	pop    %ebx
   10858:	5d                   	pop    %ebp
   10859:	c3                   	ret    
   1085a:	90                   	nop
   1085b:	90                   	nop

0001085c <Out_Byte>:
   1085c:	55                   	push   %ebp
   1085d:	89 e5                	mov    %esp,%ebp
   1085f:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
   10863:	0f b7 55 08          	movzwl 0x8(%ebp),%edx
   10867:	ee                   	out    %al,(%dx)
   10868:	5d                   	pop    %ebp
   10869:	c3                   	ret    

0001086a <In_Byte>:
   1086a:	55                   	push   %ebp
   1086b:	89 e5                	mov    %esp,%ebp
   1086d:	0f b7 55 08          	movzwl 0x8(%ebp),%edx
   10871:	ec                   	in     (%dx),%al
   10872:	5d                   	pop    %ebp
   10873:	c3                   	ret    

00010874 <Out_Word>:
   10874:	55                   	push   %ebp
   10875:	89 e5                	mov    %esp,%ebp
   10877:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
   1087b:	0f b7 55 08          	movzwl 0x8(%ebp),%edx
   1087f:	66 ef                	out    %ax,(%dx)
   10881:	5d                   	pop    %ebp
   10882:	c3                   	ret    

00010883 <In_Word>:
   10883:	55                   	push   %ebp
   10884:	89 e5                	mov    %esp,%ebp
   10886:	0f b7 55 08          	movzwl 0x8(%ebp),%edx
   1088a:	66 ed                	in     (%dx),%ax
   1088c:	5d                   	pop    %ebp
   1088d:	c3                   	ret    

0001088e <IO_Delay>:
   1088e:	55                   	push   %ebp
   1088f:	89 e5                	mov    %esp,%ebp
   10891:	b8 00 00 00 00       	mov    $0x0,%eax
   10896:	e6 80                	out    %al,$0x80
   10898:	5d                   	pop    %ebp
   10899:	c3                   	ret    
   1089a:	90                   	nop
   1089b:	90                   	nop
   1089c:	90                   	nop
   1089d:	90                   	nop
   1089e:	90                   	nop
   1089f:	90                   	nop

000108a0 <Read_Key>:
   108a0:	55                   	push   %ebp
   108a1:	89 e5                	mov    %esp,%ebp
   108a3:	53                   	push   %ebx
   108a4:	83 ec 34             	sub    $0x34,%esp
   108a7:	e8 a5 fa ff ff       	call   10351 <Interrupts_Enabled>
   108ac:	89 c3                	mov    %eax,%ebx
   108ae:	84 c0                	test   %al,%al
   108b0:	74 54                	je     10906 <Read_Key+0x66>
   108b2:	e8 9a fa ff ff       	call   10351 <Interrupts_Enabled>
   108b7:	84 c0                	test   %al,%al
   108b9:	75 4a                	jne    10905 <Read_Key+0x65>
   108bb:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   108c2:	e8 2c 08 00 00       	call   110f3 <Set_Current_Attr>
   108c7:	a1 d0 07 02 00       	mov    0x207d0,%eax
   108cc:	89 44 24 18          	mov    %eax,0x18(%esp)
   108d0:	8b 45 04             	mov    0x4(%ebp),%eax
   108d3:	89 44 24 14          	mov    %eax,0x14(%esp)
   108d7:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   108de:	00 
   108df:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   108e6:	00 
   108e7:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   108ee:	00 
   108ef:	c7 44 24 04 78 cf 01 	movl   $0x1cf78,0x4(%esp)
   108f6:	00 
   108f7:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   108fe:	e8 b9 06 00 00       	call   10fbc <Print>
   10903:	eb fe                	jmp    10903 <Read_Key+0x63>
   10905:	fa                   	cli    
   10906:	a1 60 fb 01 00       	mov    0x1fb60,%eax
   1090b:	8b 15 64 fb 01 00    	mov    0x1fb64,%edx
   10911:	39 d0                	cmp    %edx,%eax
   10913:	0f 95 45 f7          	setne  -0x9(%ebp)
   10917:	74 67                	je     10980 <Read_Key+0xe0>
   10919:	75 4a                	jne    10965 <Read_Key+0xc5>
   1091b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10922:	e8 cc 07 00 00       	call   110f3 <Set_Current_Attr>
   10927:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1092c:	89 44 24 18          	mov    %eax,0x18(%esp)
   10930:	8b 45 04             	mov    0x4(%ebp),%eax
   10933:	89 44 24 14          	mov    %eax,0x14(%esp)
   10937:	c7 44 24 10 97 00 00 	movl   $0x97,0x10(%esp)
   1093e:	00 
   1093f:	c7 44 24 0c e6 ce 01 	movl   $0x1cee6,0xc(%esp)
   10946:	00 
   10947:	c7 44 24 08 ff ce 01 	movl   $0x1ceff,0x8(%esp)
   1094e:	00 
   1094f:	c7 44 24 04 89 cf 01 	movl   $0x1cf89,0x4(%esp)
   10956:	00 
   10957:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1095e:	e8 59 06 00 00       	call   10fbc <Print>
   10963:	eb fe                	jmp    10963 <Read_Key+0xc3>
   10965:	0f b7 94 00 60 f9 01 	movzwl 0x1f960(%eax,%eax,1),%edx
   1096c:	00 
   1096d:	83 c0 01             	add    $0x1,%eax
   10970:	25 ff 00 00 00       	and    $0xff,%eax
   10975:	a3 60 fb 01 00       	mov    %eax,0x1fb60
   1097a:	8b 45 08             	mov    0x8(%ebp),%eax
   1097d:	66 89 10             	mov    %dx,(%eax)
   10980:	e8 cc f9 ff ff       	call   10351 <Interrupts_Enabled>
   10985:	84 c0                	test   %al,%al
   10987:	74 4a                	je     109d3 <Read_Key+0x133>
   10989:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10990:	e8 5e 07 00 00       	call   110f3 <Set_Current_Attr>
   10995:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1099a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1099e:	8b 45 04             	mov    0x4(%ebp),%eax
   109a1:	89 44 24 14          	mov    %eax,0x14(%esp)
   109a5:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   109ac:	00 
   109ad:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   109b4:	00 
   109b5:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   109bc:	00 
   109bd:	c7 44 24 04 99 cf 01 	movl   $0x1cf99,0x4(%esp)
   109c4:	00 
   109c5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   109cc:	e8 eb 05 00 00       	call   10fbc <Print>
   109d1:	eb fe                	jmp    109d1 <Read_Key+0x131>
   109d3:	84 db                	test   %bl,%bl
   109d5:	74 5d                	je     10a34 <Read_Key+0x194>
   109d7:	89 f6                	mov    %esi,%esi
   109d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
   109e0:	e8 6c f9 ff ff       	call   10351 <Interrupts_Enabled>
   109e5:	84 c0                	test   %al,%al
   109e7:	74 4a                	je     10a33 <Read_Key+0x193>
   109e9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   109f0:	e8 fe 06 00 00       	call   110f3 <Set_Current_Attr>
   109f5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   109fa:	89 44 24 18          	mov    %eax,0x18(%esp)
   109fe:	8b 45 04             	mov    0x4(%ebp),%eax
   10a01:	89 44 24 14          	mov    %eax,0x14(%esp)
   10a05:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   10a0c:	00 
   10a0d:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   10a14:	00 
   10a15:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   10a1c:	00 
   10a1d:	c7 44 24 04 99 cf 01 	movl   $0x1cf99,0x4(%esp)
   10a24:	00 
   10a25:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   10a2c:	e8 8b 05 00 00       	call   10fbc <Print>
   10a31:	eb fe                	jmp    10a31 <Read_Key+0x191>
   10a33:	fb                   	sti    
   10a34:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   10a38:	83 c4 34             	add    $0x34,%esp
   10a3b:	5b                   	pop    %ebx
   10a3c:	5d                   	pop    %ebp
   10a3d:	c3                   	ret    

00010a3e <Init_Keyboard>:
   10a3e:	55                   	push   %ebp
   10a3f:	89 e5                	mov    %esp,%ebp
   10a41:	83 ec 18             	sub    $0x18,%esp
   10a44:	c7 04 24 11 cf 01 00 	movl   $0x1cf11,(%esp)
   10a4b:	e8 6c 05 00 00       	call   10fbc <Print>
   10a50:	c7 05 40 f9 01 00 00 	movl   $0x0,0x1f940
   10a57:	00 00 00 
   10a5a:	c7 05 64 fb 01 00 00 	movl   $0x0,0x1fb64
   10a61:	00 00 00 
   10a64:	c7 05 60 fb 01 00 00 	movl   $0x0,0x1fb60
   10a6b:	00 00 00 
   10a6e:	c7 44 24 04 96 0a 01 	movl   $0x10a96,0x4(%esp)
   10a75:	00 
   10a76:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   10a7d:	e8 9d fa ff ff       	call   1051f <Install_IRQ>
   10a82:	e8 d9 f9 ff ff       	call   10460 <Get_IRQ_Mask>
   10a87:	25 fd ff 00 00       	and    $0xfffd,%eax
   10a8c:	89 04 24             	mov    %eax,(%esp)
   10a8f:	e8 37 fa ff ff       	call   104cb <Set_IRQ_Mask>
   10a94:	c9                   	leave  
   10a95:	c3                   	ret    

00010a96 <Keyboard_Interrupt_Handler>:
   10a96:	55                   	push   %ebp
   10a97:	89 e5                	mov    %esp,%ebp
   10a99:	83 ec 28             	sub    $0x28,%esp
   10a9c:	89 5d f4             	mov    %ebx,-0xc(%ebp)
   10a9f:	89 75 f8             	mov    %esi,-0x8(%ebp)
   10aa2:	89 7d fc             	mov    %edi,-0x4(%ebp)
   10aa5:	8b 75 08             	mov    0x8(%ebp),%esi
   10aa8:	89 34 24             	mov    %esi,(%esp)
   10aab:	e8 bc f9 ff ff       	call   1046c <Begin_IRQ>
   10ab0:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
   10ab7:	e8 ae fd ff ff       	call   1086a <In_Byte>
   10abc:	89 c3                	mov    %eax,%ebx
   10abe:	e8 cb fd ff ff       	call   1088e <IO_Delay>
   10ac3:	f6 c3 01             	test   $0x1,%bl
   10ac6:	0f 84 1c 01 00 00    	je     10be8 <Keyboard_Interrupt_Handler+0x152>
   10acc:	c7 04 24 60 00 00 00 	movl   $0x60,(%esp)
   10ad3:	e8 92 fd ff ff       	call   1086a <In_Byte>
   10ad8:	89 c3                	mov    %eax,%ebx
   10ada:	e8 af fd ff ff       	call   1088e <IO_Delay>
   10adf:	b9 00 00 00 00       	mov    $0x0,%ecx
   10ae4:	84 db                	test   %bl,%bl
   10ae6:	79 08                	jns    10af0 <Keyboard_Interrupt_Handler+0x5a>
   10ae8:	83 e3 7f             	and    $0x7f,%ebx
   10aeb:	b9 01 00 00 00       	mov    $0x1,%ecx
   10af0:	80 fb 57             	cmp    $0x57,%bl
   10af3:	76 18                	jbe    10b0d <Keyboard_Interrupt_Handler+0x77>
   10af5:	0f b6 db             	movzbl %bl,%ebx
   10af8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
   10afc:	c7 04 24 2b cf 01 00 	movl   $0x1cf2b,(%esp)
   10b03:	e8 b4 04 00 00       	call   10fbc <Print>
   10b08:	e9 db 00 00 00       	jmp    10be8 <Keyboard_Interrupt_Handler+0x152>
   10b0d:	a1 40 f9 01 00       	mov    0x1f940,%eax
   10b12:	a8 03                	test   $0x3,%al
   10b14:	0f 95 c2             	setne  %dl
   10b17:	89 d7                	mov    %edx,%edi
   10b19:	74 0d                	je     10b28 <Keyboard_Interrupt_Handler+0x92>
   10b1b:	0f b6 db             	movzbl %bl,%ebx
   10b1e:	0f b7 94 1b c0 cf 01 	movzwl 0x1cfc0(%ebx,%ebx,1),%edx
   10b25:	00 
   10b26:	eb 0b                	jmp    10b33 <Keyboard_Interrupt_Handler+0x9d>
   10b28:	0f b6 db             	movzbl %bl,%ebx
   10b2b:	0f b7 94 1b 80 d0 01 	movzwl 0x1d080(%ebx,%ebx,1),%edx
   10b32:	00 
   10b33:	8d 9a f3 fe ff ff    	lea    -0x10d(%edx),%ebx
   10b39:	66 83 fb 05          	cmp    $0x5,%bx
   10b3d:	77 50                	ja     10b8f <Keyboard_Interrupt_Handler+0xf9>
   10b3f:	0f b7 db             	movzwl %bx,%ebx
   10b42:	ff 24 9d 60 cf 01 00 	jmp    *0x1cf60(,%ebx,4)
   10b49:	ba 02 00 00 00       	mov    $0x2,%edx
   10b4e:	eb 27                	jmp    10b77 <Keyboard_Interrupt_Handler+0xe1>
   10b50:	ba 01 00 00 00       	mov    $0x1,%edx
   10b55:	eb 20                	jmp    10b77 <Keyboard_Interrupt_Handler+0xe1>
   10b57:	ba 04 00 00 00       	mov    $0x4,%edx
   10b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   10b60:	eb 15                	jmp    10b77 <Keyboard_Interrupt_Handler+0xe1>
   10b62:	ba 08 00 00 00       	mov    $0x8,%edx
   10b67:	eb 0e                	jmp    10b77 <Keyboard_Interrupt_Handler+0xe1>
   10b69:	ba 10 00 00 00       	mov    $0x10,%edx
   10b6e:	66 90                	xchg   %ax,%ax
   10b70:	eb 05                	jmp    10b77 <Keyboard_Interrupt_Handler+0xe1>
   10b72:	ba 20 00 00 00       	mov    $0x20,%edx
   10b77:	84 c9                	test   %cl,%cl
   10b79:	74 0b                	je     10b86 <Keyboard_Interrupt_Handler+0xf0>
   10b7b:	f7 d2                	not    %edx
   10b7d:	21 d0                	and    %edx,%eax
   10b7f:	a3 40 f9 01 00       	mov    %eax,0x1f940
   10b84:	eb 62                	jmp    10be8 <Keyboard_Interrupt_Handler+0x152>
   10b86:	09 d0                	or     %edx,%eax
   10b88:	a3 40 f9 01 00       	mov    %eax,0x1f940
   10b8d:	eb 59                	jmp    10be8 <Keyboard_Interrupt_Handler+0x152>
   10b8f:	89 fb                	mov    %edi,%ebx
   10b91:	84 db                	test   %bl,%bl
   10b93:	74 03                	je     10b98 <Keyboard_Interrupt_Handler+0x102>
   10b95:	80 ce 10             	or     $0x10,%dh
   10b98:	a8 0c                	test   $0xc,%al
   10b9a:	74 03                	je     10b9f <Keyboard_Interrupt_Handler+0x109>
   10b9c:	80 ce 40             	or     $0x40,%dh
   10b9f:	a8 30                	test   $0x30,%al
   10ba1:	74 03                	je     10ba6 <Keyboard_Interrupt_Handler+0x110>
   10ba3:	80 ce 20             	or     $0x20,%dh
   10ba6:	84 c9                	test   %cl,%cl
   10ba8:	74 05                	je     10baf <Keyboard_Interrupt_Handler+0x119>
   10baa:	66 81 ca 00 80       	or     $0x8000,%dx
   10baf:	8b 0d 64 fb 01 00    	mov    0x1fb64,%ecx
   10bb5:	8d 41 01             	lea    0x1(%ecx),%eax
   10bb8:	25 ff 00 00 00       	and    $0xff,%eax
   10bbd:	3b 05 60 fb 01 00    	cmp    0x1fb60,%eax
   10bc3:	74 0d                	je     10bd2 <Keyboard_Interrupt_Handler+0x13c>
   10bc5:	66 89 94 09 60 f9 01 	mov    %dx,0x1f960(%ecx,%ecx,1)
   10bcc:	00 
   10bcd:	a3 64 fb 01 00       	mov    %eax,0x1fb64
   10bd2:	c7 04 24 68 fb 01 00 	movl   $0x1fb68,(%esp)
   10bd9:	e8 71 47 00 00       	call   1534f <Wake_Up>
   10bde:	c7 05 d4 07 02 00 01 	movl   $0x1,0x207d4
   10be5:	00 00 00 
   10be8:	89 34 24             	mov    %esi,(%esp)
   10beb:	e8 81 f8 ff ff       	call   10471 <End_IRQ>
   10bf0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
   10bf3:	8b 75 f8             	mov    -0x8(%ebp),%esi
   10bf6:	8b 7d fc             	mov    -0x4(%ebp),%edi
   10bf9:	89 ec                	mov    %ebp,%esp
   10bfb:	5d                   	pop    %ebp
   10bfc:	c3                   	ret    

00010bfd <Wait_For_Key>:
   10bfd:	55                   	push   %ebp
   10bfe:	89 e5                	mov    %esp,%ebp
   10c00:	56                   	push   %esi
   10c01:	53                   	push   %ebx
   10c02:	83 ec 20             	sub    $0x20,%esp
   10c05:	e8 47 f7 ff ff       	call   10351 <Interrupts_Enabled>
   10c0a:	89 c3                	mov    %eax,%ebx
   10c0c:	84 c0                	test   %al,%al
   10c0e:	74 54                	je     10c64 <Wait_For_Key+0x67>
   10c10:	e8 3c f7 ff ff       	call   10351 <Interrupts_Enabled>
   10c15:	84 c0                	test   %al,%al
   10c17:	75 4a                	jne    10c63 <Wait_For_Key+0x66>
   10c19:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10c20:	e8 ce 04 00 00       	call   110f3 <Set_Current_Attr>
   10c25:	a1 d0 07 02 00       	mov    0x207d0,%eax
   10c2a:	89 44 24 18          	mov    %eax,0x18(%esp)
   10c2e:	8b 45 04             	mov    0x4(%ebp),%eax
   10c31:	89 44 24 14          	mov    %eax,0x14(%esp)
   10c35:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   10c3c:	00 
   10c3d:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   10c44:	00 
   10c45:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   10c4c:	00 
   10c4d:	c7 44 24 04 78 cf 01 	movl   $0x1cf78,0x4(%esp)
   10c54:	00 
   10c55:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   10c5c:	e8 5b 03 00 00       	call   10fbc <Print>
   10c61:	eb fe                	jmp    10c61 <Wait_For_Key+0x64>
   10c63:	fa                   	cli    
   10c64:	a1 60 fb 01 00       	mov    0x1fb60,%eax
   10c69:	8b 15 64 fb 01 00    	mov    0x1fb64,%edx
   10c6f:	39 d0                	cmp    %edx,%eax
   10c71:	74 6c                	je     10cdf <Wait_For_Key+0xe2>
   10c73:	75 4a                	jne    10cbf <Wait_For_Key+0xc2>
   10c75:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10c7c:	e8 72 04 00 00       	call   110f3 <Set_Current_Attr>
   10c81:	a1 d0 07 02 00       	mov    0x207d0,%eax
   10c86:	89 44 24 18          	mov    %eax,0x18(%esp)
   10c8a:	8b 45 04             	mov    0x4(%ebp),%eax
   10c8d:	89 44 24 14          	mov    %eax,0x14(%esp)
   10c91:	c7 44 24 10 97 00 00 	movl   $0x97,0x10(%esp)
   10c98:	00 
   10c99:	c7 44 24 0c e6 ce 01 	movl   $0x1cee6,0xc(%esp)
   10ca0:	00 
   10ca1:	c7 44 24 08 ff ce 01 	movl   $0x1ceff,0x8(%esp)
   10ca8:	00 
   10ca9:	c7 44 24 04 89 cf 01 	movl   $0x1cf89,0x4(%esp)
   10cb0:	00 
   10cb1:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   10cb8:	e8 ff 02 00 00       	call   10fbc <Print>
   10cbd:	eb fe                	jmp    10cbd <Wait_For_Key+0xc0>
   10cbf:	0f b7 b4 00 60 f9 01 	movzwl 0x1f960(%eax,%eax,1),%esi
   10cc6:	00 
   10cc7:	83 c0 01             	add    $0x1,%eax
   10cca:	25 ff 00 00 00       	and    $0xff,%eax
   10ccf:	a3 60 fb 01 00       	mov    %eax,0x1fb60
   10cd4:	e8 78 f6 ff ff       	call   10351 <Interrupts_Enabled>
   10cd9:	84 c0                	test   %al,%al
   10cdb:	74 5d                	je     10d3a <Wait_For_Key+0x13d>
   10cdd:	eb 11                	jmp    10cf0 <Wait_For_Key+0xf3>
   10cdf:	c7 04 24 68 fb 01 00 	movl   $0x1fb68,(%esp)
   10ce6:	e8 34 43 00 00       	call   1501f <Wait>
   10ceb:	e9 74 ff ff ff       	jmp    10c64 <Wait_For_Key+0x67>
   10cf0:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10cf7:	e8 f7 03 00 00       	call   110f3 <Set_Current_Attr>
   10cfc:	a1 d0 07 02 00       	mov    0x207d0,%eax
   10d01:	89 44 24 18          	mov    %eax,0x18(%esp)
   10d05:	8b 45 04             	mov    0x4(%ebp),%eax
   10d08:	89 44 24 14          	mov    %eax,0x14(%esp)
   10d0c:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   10d13:	00 
   10d14:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   10d1b:	00 
   10d1c:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   10d23:	00 
   10d24:	c7 44 24 04 99 cf 01 	movl   $0x1cf99,0x4(%esp)
   10d2b:	00 
   10d2c:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   10d33:	e8 84 02 00 00       	call   10fbc <Print>
   10d38:	eb fe                	jmp    10d38 <Wait_For_Key+0x13b>
   10d3a:	84 db                	test   %bl,%bl
   10d3c:	74 56                	je     10d94 <Wait_For_Key+0x197>
   10d3e:	66 90                	xchg   %ax,%ax
   10d40:	e8 0c f6 ff ff       	call   10351 <Interrupts_Enabled>
   10d45:	84 c0                	test   %al,%al
   10d47:	74 4a                	je     10d93 <Wait_For_Key+0x196>
   10d49:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10d50:	e8 9e 03 00 00       	call   110f3 <Set_Current_Attr>
   10d55:	a1 d0 07 02 00       	mov    0x207d0,%eax
   10d5a:	89 44 24 18          	mov    %eax,0x18(%esp)
   10d5e:	8b 45 04             	mov    0x4(%ebp),%eax
   10d61:	89 44 24 14          	mov    %eax,0x14(%esp)
   10d65:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   10d6c:	00 
   10d6d:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   10d74:	00 
   10d75:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   10d7c:	00 
   10d7d:	c7 44 24 04 99 cf 01 	movl   $0x1cf99,0x4(%esp)
   10d84:	00 
   10d85:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   10d8c:	e8 2b 02 00 00       	call   10fbc <Print>
   10d91:	eb fe                	jmp    10d91 <Wait_For_Key+0x194>
   10d93:	fb                   	sti    
   10d94:	89 f0                	mov    %esi,%eax
   10d96:	83 c4 20             	add    $0x20,%esp
   10d99:	5b                   	pop    %ebx
   10d9a:	5e                   	pop    %esi
   10d9b:	5d                   	pop    %ebp
   10d9c:	c3                   	ret    
   10d9d:	90                   	nop
   10d9e:	90                   	nop
   10d9f:	90                   	nop

00010da0 <Clear_To_EOL>:
   10da0:	55                   	push   %ebp
   10da1:	89 e5                	mov    %esp,%ebp
   10da3:	53                   	push   %ebx
   10da4:	a1 84 fb 01 00       	mov    0x1fb84,%eax
   10da9:	b9 50 00 00 00       	mov    $0x50,%ecx
   10dae:	29 c1                	sub    %eax,%ecx
   10db0:	8b 15 80 fb 01 00    	mov    0x1fb80,%edx
   10db6:	85 c9                	test   %ecx,%ecx
   10db8:	7e 2c                	jle    10de6 <Clear_To_EOL+0x46>
   10dba:	8d 14 92             	lea    (%edx,%edx,4),%edx
   10dbd:	c1 e2 04             	shl    $0x4,%edx
   10dc0:	8d 04 02             	lea    (%edx,%eax,1),%eax
   10dc3:	8d 84 00 00 80 0b 00 	lea    0xb8000(%eax,%eax,1),%eax
   10dca:	0f b6 1d 90 fb 01 00 	movzbl 0x1fb90,%ebx
   10dd1:	ba 00 00 00 00       	mov    $0x0,%edx
   10dd6:	c6 00 20             	movb   $0x20,(%eax)
   10dd9:	88 58 01             	mov    %bl,0x1(%eax)
   10ddc:	83 c0 02             	add    $0x2,%eax
   10ddf:	83 c2 01             	add    $0x1,%edx
   10de2:	39 ca                	cmp    %ecx,%edx
   10de4:	75 f0                	jne    10dd6 <Clear_To_EOL+0x36>
   10de6:	5b                   	pop    %ebx
   10de7:	5d                   	pop    %ebp
   10de8:	c3                   	ret    

00010de9 <Newline>:
   10de9:	55                   	push   %ebp
   10dea:	89 e5                	mov    %esp,%ebp
   10dec:	ba 80 fb 01 00       	mov    $0x1fb80,%edx
   10df1:	8b 02                	mov    (%edx),%eax
   10df3:	83 c0 01             	add    $0x1,%eax
   10df6:	89 02                	mov    %eax,(%edx)
   10df8:	c7 05 84 fb 01 00 00 	movl   $0x0,0x1fb84
   10dff:	00 00 00 
   10e02:	83 f8 19             	cmp    $0x19,%eax
   10e05:	75 44                	jne    10e4b <Newline+0x62>
   10e07:	0f b6 05 90 fb 01 00 	movzbl 0x1fb90,%eax
   10e0e:	89 c1                	mov    %eax,%ecx
   10e10:	c1 e1 18             	shl    $0x18,%ecx
   10e13:	c1 e0 08             	shl    $0x8,%eax
   10e16:	09 c1                	or     %eax,%ecx
   10e18:	81 c9 20 00 20 00    	or     $0x200020,%ecx
   10e1e:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   10e23:	8b 90 a0 00 00 00    	mov    0xa0(%eax),%edx
   10e29:	89 10                	mov    %edx,(%eax)
   10e2b:	83 c0 04             	add    $0x4,%eax
   10e2e:	3d 00 8f 0b 00       	cmp    $0xb8f00,%eax
   10e33:	75 ee                	jne    10e23 <Newline+0x3a>
   10e35:	89 08                	mov    %ecx,(%eax)
   10e37:	83 c0 04             	add    $0x4,%eax
   10e3a:	3d a0 8f 0b 00       	cmp    $0xb8fa0,%eax
   10e3f:	75 f4                	jne    10e35 <Newline+0x4c>
   10e41:	c7 05 80 fb 01 00 18 	movl   $0x18,0x1fb80
   10e48:	00 00 00 
   10e4b:	5d                   	pop    %ebp
   10e4c:	c3                   	ret    

00010e4d <Put_Graphic_Char>:
   10e4d:	55                   	push   %ebp
   10e4e:	89 e5                	mov    %esp,%ebp
   10e50:	8b 15 84 fb 01 00    	mov    0x1fb84,%edx
   10e56:	8b 0d 80 fb 01 00    	mov    0x1fb80,%ecx
   10e5c:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
   10e5f:	c1 e1 04             	shl    $0x4,%ecx
   10e62:	01 d1                	add    %edx,%ecx
   10e64:	8d 8c 09 00 80 0b 00 	lea    0xb8000(%ecx,%ecx,1),%ecx
   10e6b:	88 01                	mov    %al,(%ecx)
   10e6d:	0f b6 05 90 fb 01 00 	movzbl 0x1fb90,%eax
   10e74:	88 41 01             	mov    %al,0x1(%ecx)
   10e77:	83 fa 4e             	cmp    $0x4e,%edx
   10e7a:	7f 0b                	jg     10e87 <Put_Graphic_Char+0x3a>
   10e7c:	83 c2 01             	add    $0x1,%edx
   10e7f:	89 15 84 fb 01 00    	mov    %edx,0x1fb84
   10e85:	eb 05                	jmp    10e8c <Put_Graphic_Char+0x3f>
   10e87:	e8 5d ff ff ff       	call   10de9 <Newline>
   10e8c:	5d                   	pop    %ebp
   10e8d:	c3                   	ret    

00010e8e <Move_Cursor>:
   10e8e:	55                   	push   %ebp
   10e8f:	89 e5                	mov    %esp,%ebp
   10e91:	83 f8 18             	cmp    $0x18,%eax
   10e94:	7e 05                	jle    10e9b <Move_Cursor+0xd>
   10e96:	b8 18 00 00 00       	mov    $0x18,%eax
   10e9b:	83 fa 4f             	cmp    $0x4f,%edx
   10e9e:	7e 05                	jle    10ea5 <Move_Cursor+0x17>
   10ea0:	ba 4f 00 00 00       	mov    $0x4f,%edx
   10ea5:	89 c1                	mov    %eax,%ecx
   10ea7:	c1 f9 1f             	sar    $0x1f,%ecx
   10eaa:	f7 d1                	not    %ecx
   10eac:	21 c8                	and    %ecx,%eax
   10eae:	a3 80 fb 01 00       	mov    %eax,0x1fb80
   10eb3:	89 d0                	mov    %edx,%eax
   10eb5:	c1 f8 1f             	sar    $0x1f,%eax
   10eb8:	f7 d0                	not    %eax
   10eba:	21 c2                	and    %eax,%edx
   10ebc:	89 15 84 fb 01 00    	mov    %edx,0x1fb84
   10ec2:	5d                   	pop    %ebp
   10ec3:	c3                   	ret    

00010ec4 <Reset>:
   10ec4:	55                   	push   %ebp
   10ec5:	89 e5                	mov    %esp,%ebp
   10ec7:	c7 05 94 fb 01 00 00 	movl   $0x0,0x1fb94
   10ece:	00 00 00 
   10ed1:	c7 05 b8 fb 01 00 00 	movl   $0x0,0x1fbb8
   10ed8:	00 00 00 
   10edb:	5d                   	pop    %ebp
   10edc:	c3                   	ret    

00010edd <Get_Arg>:
   10edd:	55                   	push   %ebp
   10ede:	89 e5                	mov    %esp,%ebp
   10ee0:	89 c2                	mov    %eax,%edx
   10ee2:	b8 00 00 00 00       	mov    $0x0,%eax
   10ee7:	39 15 b8 fb 01 00    	cmp    %edx,0x1fbb8
   10eed:	7e 07                	jle    10ef6 <Get_Arg+0x19>
   10eef:	8b 04 95 98 fb 01 00 	mov    0x1fb98(,%edx,4),%eax
   10ef6:	5d                   	pop    %ebp
   10ef7:	c3                   	ret    

00010ef8 <Get_Current_Attr>:
   10ef8:	55                   	push   %ebp
   10ef9:	89 e5                	mov    %esp,%ebp
   10efb:	0f b6 05 90 fb 01 00 	movzbl 0x1fb90,%eax
   10f02:	5d                   	pop    %ebp
   10f03:	c3                   	ret    

00010f04 <Update_Cursor>:
   10f04:	55                   	push   %ebp
   10f05:	89 e5                	mov    %esp,%ebp
   10f07:	56                   	push   %esi
   10f08:	53                   	push   %ebx
   10f09:	83 ec 10             	sub    $0x10,%esp
   10f0c:	a1 80 fb 01 00       	mov    0x1fb80,%eax
   10f11:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
   10f14:	c1 e3 04             	shl    $0x4,%ebx
   10f17:	03 1d 84 fb 01 00    	add    0x1fb84,%ebx
   10f1d:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
   10f24:	e8 41 f9 ff ff       	call   1086a <In_Byte>
   10f29:	89 c6                	mov    %eax,%esi
   10f2b:	e8 5e f9 ff ff       	call   1088e <IO_Delay>
   10f30:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
   10f37:	00 
   10f38:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
   10f3f:	e8 18 f9 ff ff       	call   1085c <Out_Byte>
   10f44:	e8 45 f9 ff ff       	call   1088e <IO_Delay>
   10f49:	0f b6 c7             	movzbl %bh,%eax
   10f4c:	89 44 24 04          	mov    %eax,0x4(%esp)
   10f50:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
   10f57:	e8 00 f9 ff ff       	call   1085c <Out_Byte>
   10f5c:	e8 2d f9 ff ff       	call   1088e <IO_Delay>
   10f61:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
   10f68:	00 
   10f69:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
   10f70:	e8 e7 f8 ff ff       	call   1085c <Out_Byte>
   10f75:	e8 14 f9 ff ff       	call   1088e <IO_Delay>
   10f7a:	0f b6 db             	movzbl %bl,%ebx
   10f7d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
   10f81:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
   10f88:	e8 cf f8 ff ff       	call   1085c <Out_Byte>
   10f8d:	e8 fc f8 ff ff       	call   1088e <IO_Delay>
   10f92:	81 e6 ff 00 00 00    	and    $0xff,%esi
   10f98:	89 74 24 04          	mov    %esi,0x4(%esp)
   10f9c:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
   10fa3:	e8 b4 f8 ff ff       	call   1085c <Out_Byte>
   10fa8:	83 c4 10             	add    $0x10,%esp
   10fab:	5b                   	pop    %ebx
   10fac:	5e                   	pop    %esi
   10fad:	5d                   	pop    %ebp
   10fae:	c3                   	ret    

00010faf <Print_Finish>:
   10faf:	55                   	push   %ebp
   10fb0:	89 e5                	mov    %esp,%ebp
   10fb2:	83 ec 08             	sub    $0x8,%esp
   10fb5:	e8 4a ff ff ff       	call   10f04 <Update_Cursor>
   10fba:	c9                   	leave  
   10fbb:	c3                   	ret    

00010fbc <Print>:
   10fbc:	55                   	push   %ebp
   10fbd:	89 e5                	mov    %esp,%ebp
   10fbf:	53                   	push   %ebx
   10fc0:	83 ec 24             	sub    $0x24,%esp
   10fc3:	e8 89 f3 ff ff       	call   10351 <Interrupts_Enabled>
   10fc8:	89 c3                	mov    %eax,%ebx
   10fca:	84 c0                	test   %al,%al
   10fcc:	74 54                	je     11022 <Print+0x66>
   10fce:	e8 7e f3 ff ff       	call   10351 <Interrupts_Enabled>
   10fd3:	84 c0                	test   %al,%al
   10fd5:	75 4a                	jne    11021 <Print+0x65>
   10fd7:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   10fde:	e8 10 01 00 00       	call   110f3 <Set_Current_Attr>
   10fe3:	a1 d0 07 02 00       	mov    0x207d0,%eax
   10fe8:	89 44 24 18          	mov    %eax,0x18(%esp)
   10fec:	8b 45 04             	mov    0x4(%ebp),%eax
   10fef:	89 44 24 14          	mov    %eax,0x14(%esp)
   10ff3:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   10ffa:	00 
   10ffb:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11002:	00 
   11003:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1100a:	00 
   1100b:	c7 44 24 04 b1 d1 01 	movl   $0x1d1b1,0x4(%esp)
   11012:	00 
   11013:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1101a:	e8 9d ff ff ff       	call   10fbc <Print>
   1101f:	eb fe                	jmp    1101f <Print+0x63>
   11021:	fa                   	cli    
   11022:	8d 45 0c             	lea    0xc(%ebp),%eax
   11025:	89 44 24 08          	mov    %eax,0x8(%esp)
   11029:	8b 45 08             	mov    0x8(%ebp),%eax
   1102c:	89 44 24 04          	mov    %eax,0x4(%esp)
   11030:	c7 04 24 04 f0 01 00 	movl   $0x1f004,(%esp)
   11037:	e8 84 ae 00 00       	call   1bec0 <Format_Output>
   1103c:	e8 10 f3 ff ff       	call   10351 <Interrupts_Enabled>
   11041:	84 c0                	test   %al,%al
   11043:	74 4a                	je     1108f <Print+0xd3>
   11045:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1104c:	e8 a2 00 00 00       	call   110f3 <Set_Current_Attr>
   11051:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11056:	89 44 24 18          	mov    %eax,0x18(%esp)
   1105a:	8b 45 04             	mov    0x4(%ebp),%eax
   1105d:	89 44 24 14          	mov    %eax,0x14(%esp)
   11061:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   11068:	00 
   11069:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11070:	00 
   11071:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11078:	00 
   11079:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   11080:	00 
   11081:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11088:	e8 2f ff ff ff       	call   10fbc <Print>
   1108d:	eb fe                	jmp    1108d <Print+0xd1>
   1108f:	84 db                	test   %bl,%bl
   11091:	74 5a                	je     110ed <Print+0x131>
   11093:	90                   	nop
   11094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   11098:	e8 b4 f2 ff ff       	call   10351 <Interrupts_Enabled>
   1109d:	84 c0                	test   %al,%al
   1109f:	90                   	nop
   110a0:	74 4a                	je     110ec <Print+0x130>
   110a2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   110a9:	e8 45 00 00 00       	call   110f3 <Set_Current_Attr>
   110ae:	a1 d0 07 02 00       	mov    0x207d0,%eax
   110b3:	89 44 24 18          	mov    %eax,0x18(%esp)
   110b7:	8b 45 04             	mov    0x4(%ebp),%eax
   110ba:	89 44 24 14          	mov    %eax,0x14(%esp)
   110be:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   110c5:	00 
   110c6:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   110cd:	00 
   110ce:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   110d5:	00 
   110d6:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   110dd:	00 
   110de:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   110e5:	e8 d2 fe ff ff       	call   10fbc <Print>
   110ea:	eb fe                	jmp    110ea <Print+0x12e>
   110ec:	fb                   	sti    
   110ed:	83 c4 24             	add    $0x24,%esp
   110f0:	5b                   	pop    %ebx
   110f1:	5d                   	pop    %ebp
   110f2:	c3                   	ret    

000110f3 <Set_Current_Attr>:
   110f3:	55                   	push   %ebp
   110f4:	89 e5                	mov    %esp,%ebp
   110f6:	53                   	push   %ebx
   110f7:	83 ec 34             	sub    $0x34,%esp
   110fa:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
   110fe:	88 45 f7             	mov    %al,-0x9(%ebp)
   11101:	e8 4b f2 ff ff       	call   10351 <Interrupts_Enabled>
   11106:	89 c3                	mov    %eax,%ebx
   11108:	84 c0                	test   %al,%al
   1110a:	74 54                	je     11160 <Set_Current_Attr+0x6d>
   1110c:	e8 40 f2 ff ff       	call   10351 <Interrupts_Enabled>
   11111:	84 c0                	test   %al,%al
   11113:	75 4a                	jne    1115f <Set_Current_Attr+0x6c>
   11115:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1111c:	e8 d2 ff ff ff       	call   110f3 <Set_Current_Attr>
   11121:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11126:	89 44 24 18          	mov    %eax,0x18(%esp)
   1112a:	8b 45 04             	mov    0x4(%ebp),%eax
   1112d:	89 44 24 14          	mov    %eax,0x14(%esp)
   11131:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   11138:	00 
   11139:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11140:	00 
   11141:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   11148:	00 
   11149:	c7 44 24 04 b1 d1 01 	movl   $0x1d1b1,0x4(%esp)
   11150:	00 
   11151:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11158:	e8 5f fe ff ff       	call   10fbc <Print>
   1115d:	eb fe                	jmp    1115d <Set_Current_Attr+0x6a>
   1115f:	fa                   	cli    
   11160:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   11164:	a2 90 fb 01 00       	mov    %al,0x1fb90
   11169:	e8 e3 f1 ff ff       	call   10351 <Interrupts_Enabled>
   1116e:	84 c0                	test   %al,%al
   11170:	74 4a                	je     111bc <Set_Current_Attr+0xc9>
   11172:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11179:	e8 75 ff ff ff       	call   110f3 <Set_Current_Attr>
   1117e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11183:	89 44 24 18          	mov    %eax,0x18(%esp)
   11187:	8b 45 04             	mov    0x4(%ebp),%eax
   1118a:	89 44 24 14          	mov    %eax,0x14(%esp)
   1118e:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   11195:	00 
   11196:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   1119d:	00 
   1119e:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   111a5:	00 
   111a6:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   111ad:	00 
   111ae:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   111b5:	e8 02 fe ff ff       	call   10fbc <Print>
   111ba:	eb fe                	jmp    111ba <Set_Current_Attr+0xc7>
   111bc:	84 db                	test   %bl,%bl
   111be:	74 54                	je     11214 <Set_Current_Attr+0x121>
   111c0:	e8 8c f1 ff ff       	call   10351 <Interrupts_Enabled>
   111c5:	84 c0                	test   %al,%al
   111c7:	74 4a                	je     11213 <Set_Current_Attr+0x120>
   111c9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   111d0:	e8 1e ff ff ff       	call   110f3 <Set_Current_Attr>
   111d5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   111da:	89 44 24 18          	mov    %eax,0x18(%esp)
   111de:	8b 45 04             	mov    0x4(%ebp),%eax
   111e1:	89 44 24 14          	mov    %eax,0x14(%esp)
   111e5:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   111ec:	00 
   111ed:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   111f4:	00 
   111f5:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   111fc:	00 
   111fd:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   11204:	00 
   11205:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1120c:	e8 ab fd ff ff       	call   10fbc <Print>
   11211:	eb fe                	jmp    11211 <Set_Current_Attr+0x11e>
   11213:	fb                   	sti    
   11214:	83 c4 34             	add    $0x34,%esp
   11217:	5b                   	pop    %ebx
   11218:	5d                   	pop    %ebp
   11219:	c3                   	ret    

0001121a <Put_Cursor>:
   1121a:	55                   	push   %ebp
   1121b:	89 e5                	mov    %esp,%ebp
   1121d:	57                   	push   %edi
   1121e:	56                   	push   %esi
   1121f:	53                   	push   %ebx
   11220:	83 ec 2c             	sub    $0x2c,%esp
   11223:	8b 7d 08             	mov    0x8(%ebp),%edi
   11226:	8b 75 0c             	mov    0xc(%ebp),%esi
   11229:	83 ff 18             	cmp    $0x18,%edi
   1122c:	0f 87 42 01 00 00    	ja     11374 <Put_Cursor+0x15a>
   11232:	85 f6                	test   %esi,%esi
   11234:	0f 88 3a 01 00 00    	js     11374 <Put_Cursor+0x15a>
   1123a:	83 fe 4f             	cmp    $0x4f,%esi
   1123d:	0f 8f 31 01 00 00    	jg     11374 <Put_Cursor+0x15a>
   11243:	90                   	nop
   11244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   11248:	e8 04 f1 ff ff       	call   10351 <Interrupts_Enabled>
   1124d:	89 c3                	mov    %eax,%ebx
   1124f:	84 c0                	test   %al,%al
   11251:	74 54                	je     112a7 <Put_Cursor+0x8d>
   11253:	e8 f9 f0 ff ff       	call   10351 <Interrupts_Enabled>
   11258:	84 c0                	test   %al,%al
   1125a:	75 4a                	jne    112a6 <Put_Cursor+0x8c>
   1125c:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11263:	e8 8b fe ff ff       	call   110f3 <Set_Current_Attr>
   11268:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1126d:	89 44 24 18          	mov    %eax,0x18(%esp)
   11271:	8b 45 04             	mov    0x4(%ebp),%eax
   11274:	89 44 24 14          	mov    %eax,0x14(%esp)
   11278:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   1127f:	00 
   11280:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11287:	00 
   11288:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1128f:	00 
   11290:	c7 44 24 04 b1 d1 01 	movl   $0x1d1b1,0x4(%esp)
   11297:	00 
   11298:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1129f:	e8 18 fd ff ff       	call   10fbc <Print>
   112a4:	eb fe                	jmp    112a4 <Put_Cursor+0x8a>
   112a6:	fa                   	cli    
   112a7:	89 3d 80 fb 01 00    	mov    %edi,0x1fb80
   112ad:	89 35 84 fb 01 00    	mov    %esi,0x1fb84
   112b3:	e8 4c fc ff ff       	call   10f04 <Update_Cursor>
   112b8:	e8 94 f0 ff ff       	call   10351 <Interrupts_Enabled>
   112bd:	84 c0                	test   %al,%al
   112bf:	74 4a                	je     1130b <Put_Cursor+0xf1>
   112c1:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   112c8:	e8 26 fe ff ff       	call   110f3 <Set_Current_Attr>
   112cd:	a1 d0 07 02 00       	mov    0x207d0,%eax
   112d2:	89 44 24 18          	mov    %eax,0x18(%esp)
   112d6:	8b 45 04             	mov    0x4(%ebp),%eax
   112d9:	89 44 24 14          	mov    %eax,0x14(%esp)
   112dd:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   112e4:	00 
   112e5:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   112ec:	00 
   112ed:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   112f4:	00 
   112f5:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   112fc:	00 
   112fd:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11304:	e8 b3 fc ff ff       	call   10fbc <Print>
   11309:	eb fe                	jmp    11309 <Put_Cursor+0xef>
   1130b:	b8 01 00 00 00       	mov    $0x1,%eax
   11310:	84 db                	test   %bl,%bl
   11312:	74 65                	je     11379 <Put_Cursor+0x15f>
   11314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   11318:	e8 34 f0 ff ff       	call   10351 <Interrupts_Enabled>
   1131d:	84 c0                	test   %al,%al
   1131f:	90                   	nop
   11320:	74 4a                	je     1136c <Put_Cursor+0x152>
   11322:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11329:	e8 c5 fd ff ff       	call   110f3 <Set_Current_Attr>
   1132e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11333:	89 44 24 18          	mov    %eax,0x18(%esp)
   11337:	8b 45 04             	mov    0x4(%ebp),%eax
   1133a:	89 44 24 14          	mov    %eax,0x14(%esp)
   1133e:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   11345:	00 
   11346:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   1134d:	00 
   1134e:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11355:	00 
   11356:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   1135d:	00 
   1135e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11365:	e8 52 fc ff ff       	call   10fbc <Print>
   1136a:	eb fe                	jmp    1136a <Put_Cursor+0x150>
   1136c:	fb                   	sti    
   1136d:	b8 01 00 00 00       	mov    $0x1,%eax
   11372:	eb 05                	jmp    11379 <Put_Cursor+0x15f>
   11374:	b8 00 00 00 00       	mov    $0x0,%eax
   11379:	83 c4 2c             	add    $0x2c,%esp
   1137c:	5b                   	pop    %ebx
   1137d:	5e                   	pop    %esi
   1137e:	5f                   	pop    %edi
   1137f:	5d                   	pop    %ebp
   11380:	c3                   	ret    

00011381 <Add_Digit>:
   11381:	55                   	push   %ebp
   11382:	89 e5                	mov    %esp,%ebp
   11384:	53                   	push   %ebx
   11385:	83 ec 24             	sub    $0x24,%esp
   11388:	8d 50 d0             	lea    -0x30(%eax),%edx
   1138b:	83 fa 09             	cmp    $0x9,%edx
   1138e:	76 4a                	jbe    113da <Add_Digit+0x59>
   11390:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11397:	e8 57 fd ff ff       	call   110f3 <Set_Current_Attr>
   1139c:	a1 d0 07 02 00       	mov    0x207d0,%eax
   113a1:	89 44 24 18          	mov    %eax,0x18(%esp)
   113a5:	8b 45 04             	mov    0x4(%ebp),%eax
   113a8:	89 44 24 14          	mov    %eax,0x14(%esp)
   113ac:	c7 44 24 10 ff 00 00 	movl   $0xff,0x10(%esp)
   113b3:	00 
   113b4:	c7 44 24 0c 30 d1 01 	movl   $0x1d130,0xc(%esp)
   113bb:	00 
   113bc:	c7 44 24 08 47 d1 01 	movl   $0x1d147,0x8(%esp)
   113c3:	00 
   113c4:	c7 44 24 04 95 d1 01 	movl   $0x1d195,0x4(%esp)
   113cb:	00 
   113cc:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   113d3:	e8 e4 fb ff ff       	call   10fbc <Print>
   113d8:	eb fe                	jmp    113d8 <Add_Digit+0x57>
   113da:	8b 0d b8 fb 01 00    	mov    0x1fbb8,%ecx
   113e0:	83 f9 07             	cmp    $0x7,%ecx
   113e3:	7f 15                	jg     113fa <Add_Digit+0x79>
   113e5:	83 c1 03             	add    $0x3,%ecx
   113e8:	ba 80 fb 01 00       	mov    $0x1fb80,%edx
   113ed:	6b 5c 8a 08 0a       	imul   $0xa,0x8(%edx,%ecx,4),%ebx
   113f2:	8d 44 18 d0          	lea    -0x30(%eax,%ebx,1),%eax
   113f6:	89 44 8a 08          	mov    %eax,0x8(%edx,%ecx,4)
   113fa:	83 c4 24             	add    $0x24,%esp
   113fd:	5b                   	pop    %ebx
   113fe:	5d                   	pop    %ebp
   113ff:	c3                   	ret    

00011400 <Start_Arg>:
   11400:	55                   	push   %ebp
   11401:	89 e5                	mov    %esp,%ebp
   11403:	83 ec 28             	sub    $0x28,%esp
   11406:	8b 15 b8 fb 01 00    	mov    0x1fbb8,%edx
   1140c:	39 c2                	cmp    %eax,%edx
   1140e:	74 4a                	je     1145a <Start_Arg+0x5a>
   11410:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11417:	e8 d7 fc ff ff       	call   110f3 <Set_Current_Attr>
   1141c:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11421:	89 44 24 18          	mov    %eax,0x18(%esp)
   11425:	8b 45 04             	mov    0x4(%ebp),%eax
   11428:	89 44 24 14          	mov    %eax,0x14(%esp)
   1142c:	c7 44 24 10 e7 00 00 	movl   $0xe7,0x10(%esp)
   11433:	00 
   11434:	c7 44 24 0c 30 d1 01 	movl   $0x1d130,0xc(%esp)
   1143b:	00 
   1143c:	c7 44 24 08 52 d1 01 	movl   $0x1d152,0x8(%esp)
   11443:	00 
   11444:	c7 44 24 04 9f d1 01 	movl   $0x1d19f,0x4(%esp)
   1144b:	00 
   1144c:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11453:	e8 64 fb ff ff       	call   10fbc <Print>
   11458:	eb fe                	jmp    11458 <Start_Arg+0x58>
   1145a:	8d 42 01             	lea    0x1(%edx),%eax
   1145d:	a3 b8 fb 01 00       	mov    %eax,0x1fbb8
   11462:	c7 05 94 fb 01 00 03 	movl   $0x3,0x1fb94
   11469:	00 00 00 
   1146c:	83 fa 07             	cmp    $0x7,%edx
   1146f:	7f 0b                	jg     1147c <Start_Arg+0x7c>
   11471:	c7 04 95 98 fb 01 00 	movl   $0x0,0x1fb98(,%edx,4)
   11478:	00 00 00 00 
   1147c:	c9                   	leave  
   1147d:	c3                   	ret    

0001147e <Get_Cursor>:
   1147e:	55                   	push   %ebp
   1147f:	89 e5                	mov    %esp,%ebp
   11481:	53                   	push   %ebx
   11482:	83 ec 24             	sub    $0x24,%esp
   11485:	e8 c7 ee ff ff       	call   10351 <Interrupts_Enabled>
   1148a:	89 c3                	mov    %eax,%ebx
   1148c:	84 c0                	test   %al,%al
   1148e:	74 54                	je     114e4 <Get_Cursor+0x66>
   11490:	e8 bc ee ff ff       	call   10351 <Interrupts_Enabled>
   11495:	84 c0                	test   %al,%al
   11497:	75 4a                	jne    114e3 <Get_Cursor+0x65>
   11499:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   114a0:	e8 4e fc ff ff       	call   110f3 <Set_Current_Attr>
   114a5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   114aa:	89 44 24 18          	mov    %eax,0x18(%esp)
   114ae:	8b 45 04             	mov    0x4(%ebp),%eax
   114b1:	89 44 24 14          	mov    %eax,0x14(%esp)
   114b5:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   114bc:	00 
   114bd:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   114c4:	00 
   114c5:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   114cc:	00 
   114cd:	c7 44 24 04 b1 d1 01 	movl   $0x1d1b1,0x4(%esp)
   114d4:	00 
   114d5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   114dc:	e8 db fa ff ff       	call   10fbc <Print>
   114e1:	eb fe                	jmp    114e1 <Get_Cursor+0x63>
   114e3:	fa                   	cli    
   114e4:	8b 15 80 fb 01 00    	mov    0x1fb80,%edx
   114ea:	8b 45 08             	mov    0x8(%ebp),%eax
   114ed:	89 10                	mov    %edx,(%eax)
   114ef:	8b 15 84 fb 01 00    	mov    0x1fb84,%edx
   114f5:	8b 45 0c             	mov    0xc(%ebp),%eax
   114f8:	89 10                	mov    %edx,(%eax)
   114fa:	e8 52 ee ff ff       	call   10351 <Interrupts_Enabled>
   114ff:	84 c0                	test   %al,%al
   11501:	74 4a                	je     1154d <Get_Cursor+0xcf>
   11503:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1150a:	e8 e4 fb ff ff       	call   110f3 <Set_Current_Attr>
   1150f:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11514:	89 44 24 18          	mov    %eax,0x18(%esp)
   11518:	8b 45 04             	mov    0x4(%ebp),%eax
   1151b:	89 44 24 14          	mov    %eax,0x14(%esp)
   1151f:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   11526:	00 
   11527:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   1152e:	00 
   1152f:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11536:	00 
   11537:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   1153e:	00 
   1153f:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11546:	e8 71 fa ff ff       	call   10fbc <Print>
   1154b:	eb fe                	jmp    1154b <Get_Cursor+0xcd>
   1154d:	84 db                	test   %bl,%bl
   1154f:	74 5c                	je     115ad <Get_Cursor+0x12f>
   11551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   11558:	e8 f4 ed ff ff       	call   10351 <Interrupts_Enabled>
   1155d:	84 c0                	test   %al,%al
   1155f:	90                   	nop
   11560:	74 4a                	je     115ac <Get_Cursor+0x12e>
   11562:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11569:	e8 85 fb ff ff       	call   110f3 <Set_Current_Attr>
   1156e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11573:	89 44 24 18          	mov    %eax,0x18(%esp)
   11577:	8b 45 04             	mov    0x4(%ebp),%eax
   1157a:	89 44 24 14          	mov    %eax,0x14(%esp)
   1157e:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   11585:	00 
   11586:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   1158d:	00 
   1158e:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11595:	00 
   11596:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   1159d:	00 
   1159e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   115a5:	e8 12 fa ff ff       	call   10fbc <Print>
   115aa:	eb fe                	jmp    115aa <Get_Cursor+0x12c>
   115ac:	fb                   	sti    
   115ad:	83 c4 24             	add    $0x24,%esp
   115b0:	5b                   	pop    %ebx
   115b1:	5d                   	pop    %ebp
   115b2:	c3                   	ret    

000115b3 <Clear_Screen>:
   115b3:	55                   	push   %ebp
   115b4:	89 e5                	mov    %esp,%ebp
   115b6:	53                   	push   %ebx
   115b7:	83 ec 34             	sub    $0x34,%esp
   115ba:	0f b6 05 90 fb 01 00 	movzbl 0x1fb90,%eax
   115c1:	89 c3                	mov    %eax,%ebx
   115c3:	c1 e3 18             	shl    $0x18,%ebx
   115c6:	c1 e0 08             	shl    $0x8,%eax
   115c9:	09 c3                	or     %eax,%ebx
   115cb:	81 cb 20 00 20 00    	or     $0x200020,%ebx
   115d1:	e8 7b ed ff ff       	call   10351 <Interrupts_Enabled>
   115d6:	88 45 f7             	mov    %al,-0x9(%ebp)
   115d9:	84 c0                	test   %al,%al
   115db:	74 54                	je     11631 <Clear_Screen+0x7e>
   115dd:	e8 6f ed ff ff       	call   10351 <Interrupts_Enabled>
   115e2:	84 c0                	test   %al,%al
   115e4:	75 4a                	jne    11630 <Clear_Screen+0x7d>
   115e6:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   115ed:	e8 01 fb ff ff       	call   110f3 <Set_Current_Attr>
   115f2:	a1 d0 07 02 00       	mov    0x207d0,%eax
   115f7:	89 44 24 18          	mov    %eax,0x18(%esp)
   115fb:	8b 45 04             	mov    0x4(%ebp),%eax
   115fe:	89 44 24 14          	mov    %eax,0x14(%esp)
   11602:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   11609:	00 
   1160a:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11611:	00 
   11612:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   11619:	00 
   1161a:	c7 44 24 04 b1 d1 01 	movl   $0x1d1b1,0x4(%esp)
   11621:	00 
   11622:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11629:	e8 8e f9 ff ff       	call   10fbc <Print>
   1162e:	eb fe                	jmp    1162e <Clear_Screen+0x7b>
   11630:	fa                   	cli    
   11631:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   11636:	89 18                	mov    %ebx,(%eax)
   11638:	83 c0 04             	add    $0x4,%eax
   1163b:	3d a0 8f 0b 00       	cmp    $0xb8fa0,%eax
   11640:	75 f4                	jne    11636 <Clear_Screen+0x83>
   11642:	e8 0a ed ff ff       	call   10351 <Interrupts_Enabled>
   11647:	84 c0                	test   %al,%al
   11649:	74 4a                	je     11695 <Clear_Screen+0xe2>
   1164b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11652:	e8 9c fa ff ff       	call   110f3 <Set_Current_Attr>
   11657:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1165c:	89 44 24 18          	mov    %eax,0x18(%esp)
   11660:	8b 45 04             	mov    0x4(%ebp),%eax
   11663:	89 44 24 14          	mov    %eax,0x14(%esp)
   11667:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   1166e:	00 
   1166f:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11676:	00 
   11677:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1167e:	00 
   1167f:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   11686:	00 
   11687:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1168e:	e8 29 f9 ff ff       	call   10fbc <Print>
   11693:	eb fe                	jmp    11693 <Clear_Screen+0xe0>
   11695:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
   11699:	74 59                	je     116f4 <Clear_Screen+0x141>
   1169b:	90                   	nop
   1169c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   116a0:	e8 ac ec ff ff       	call   10351 <Interrupts_Enabled>
   116a5:	84 c0                	test   %al,%al
   116a7:	74 4a                	je     116f3 <Clear_Screen+0x140>
   116a9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   116b0:	e8 3e fa ff ff       	call   110f3 <Set_Current_Attr>
   116b5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   116ba:	89 44 24 18          	mov    %eax,0x18(%esp)
   116be:	8b 45 04             	mov    0x4(%ebp),%eax
   116c1:	89 44 24 14          	mov    %eax,0x14(%esp)
   116c5:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   116cc:	00 
   116cd:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   116d4:	00 
   116d5:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   116dc:	00 
   116dd:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   116e4:	00 
   116e5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   116ec:	e8 cb f8 ff ff       	call   10fbc <Print>
   116f1:	eb fe                	jmp    116f1 <Clear_Screen+0x13e>
   116f3:	fb                   	sti    
   116f4:	83 c4 34             	add    $0x34,%esp
   116f7:	5b                   	pop    %ebx
   116f8:	5d                   	pop    %ebp
   116f9:	c3                   	ret    

000116fa <Put_Char_Imp>:
   116fa:	55                   	push   %ebp
   116fb:	89 e5                	mov    %esp,%ebp
   116fd:	57                   	push   %edi
   116fe:	56                   	push   %esi
   116ff:	53                   	push   %ebx
   11700:	83 ec 3c             	sub    $0x3c,%esp
   11703:	89 c3                	mov    %eax,%ebx
   11705:	be 94 fb 01 00       	mov    $0x1fb94,%esi
   1170a:	8d 78 d0             	lea    -0x30(%eax),%edi
   1170d:	83 3e 04             	cmpl   $0x4,(%esi)
   11710:	0f 87 7e 03 00 00    	ja     11a94 <Put_Char_Imp+0x39a>
   11716:	8b 06                	mov    (%esi),%eax
   11718:	ff 24 85 74 d1 01 00 	jmp    *0x1d174(,%eax,4)
   1171f:	83 fb 1b             	cmp    $0x1b,%ebx
   11722:	75 19                	jne    1173d <Put_Char_Imp+0x43>
   11724:	c7 05 94 fb 01 00 01 	movl   $0x1,0x1fb94
   1172b:	00 00 00 
   1172e:	c7 05 b8 fb 01 00 00 	movl   $0x0,0x1fbb8
   11735:	00 00 00 
   11738:	e9 a6 03 00 00       	jmp    11ae3 <Put_Char_Imp+0x3e9>
   1173d:	83 fb 09             	cmp    $0x9,%ebx
   11740:	74 15                	je     11757 <Put_Char_Imp+0x5d>
   11742:	83 fb 0a             	cmp    $0xa,%ebx
   11745:	75 3b                	jne    11782 <Put_Char_Imp+0x88>
   11747:	90                   	nop
   11748:	e8 53 f6 ff ff       	call   10da0 <Clear_To_EOL>
   1174d:	8d 76 00             	lea    0x0(%esi),%esi
   11750:	e8 94 f6 ff ff       	call   10de9 <Newline>
   11755:	eb 32                	jmp    11789 <Put_Char_Imp+0x8f>
   11757:	8b 15 84 fb 01 00    	mov    0x1fb84,%edx
   1175d:	b9 08 00 00 00       	mov    $0x8,%ecx
   11762:	89 d0                	mov    %edx,%eax
   11764:	c1 fa 1f             	sar    $0x1f,%edx
   11767:	f7 f9                	idiv   %ecx
   11769:	89 ce                	mov    %ecx,%esi
   1176b:	29 d6                	sub    %edx,%esi
   1176d:	eb 0d                	jmp    1177c <Put_Char_Imp+0x82>
   1176f:	b8 20 00 00 00       	mov    $0x20,%eax
   11774:	e8 d4 f6 ff ff       	call   10e4d <Put_Graphic_Char>
   11779:	83 ee 01             	sub    $0x1,%esi
   1177c:	85 f6                	test   %esi,%esi
   1177e:	7f ef                	jg     1176f <Put_Char_Imp+0x75>
   11780:	eb 07                	jmp    11789 <Put_Char_Imp+0x8f>
   11782:	89 d8                	mov    %ebx,%eax
   11784:	e8 c4 f6 ff ff       	call   10e4d <Put_Graphic_Char>
   11789:	0f b6 db             	movzbl %bl,%ebx
   1178c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
   11790:	c7 04 24 e9 00 00 00 	movl   $0xe9,(%esp)
   11797:	e8 c0 f0 ff ff       	call   1085c <Out_Byte>
   1179c:	e9 42 03 00 00       	jmp    11ae3 <Put_Char_Imp+0x3e9>
   117a1:	83 fb 5b             	cmp    $0x5b,%ebx
   117a4:	75 0f                	jne    117b5 <Put_Char_Imp+0xbb>
   117a6:	c7 05 94 fb 01 00 02 	movl   $0x2,0x1fb94
   117ad:	00 00 00 
   117b0:	e9 2e 03 00 00       	jmp    11ae3 <Put_Char_Imp+0x3e9>
   117b5:	e8 0a f7 ff ff       	call   10ec4 <Reset>
   117ba:	e9 24 03 00 00       	jmp    11ae3 <Put_Char_Imp+0x3e9>
   117bf:	83 ff 09             	cmp    $0x9,%edi
   117c2:	77 16                	ja     117da <Put_Char_Imp+0xe0>
   117c4:	b8 00 00 00 00       	mov    $0x0,%eax
   117c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   117d0:	e8 2b fc ff ff       	call   11400 <Start_Arg>
   117d5:	e9 33 ff ff ff       	jmp    1170d <Put_Char_Imp+0x13>
   117da:	83 fb 3b             	cmp    $0x3b,%ebx
   117dd:	8d 76 00             	lea    0x0(%esi),%esi
   117e0:	75 24                	jne    11806 <Put_Char_Imp+0x10c>
   117e2:	b8 00 00 00 00       	mov    $0x0,%eax
   117e7:	90                   	nop
   117e8:	e8 13 fc ff ff       	call   11400 <Start_Arg>
   117ed:	b8 31 00 00 00       	mov    $0x31,%eax
   117f2:	e8 8a fb ff ff       	call   11381 <Add_Digit>
   117f7:	b8 01 00 00 00       	mov    $0x1,%eax
   117fc:	e8 ff fb ff ff       	call   11400 <Start_Arg>
   11801:	e9 dd 02 00 00       	jmp    11ae3 <Put_Char_Imp+0x3e9>
   11806:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
   1180c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   11810:	e9 f8 fe ff ff       	jmp    1170d <Put_Char_Imp+0x13>
   11815:	83 ff 09             	cmp    $0x9,%edi
   11818:	77 10                	ja     1182a <Put_Char_Imp+0x130>
   1181a:	89 d8                	mov    %ebx,%eax
   1181c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   11820:	e8 5c fb ff ff       	call   11381 <Add_Digit>
   11825:	e9 b9 02 00 00       	jmp    11ae3 <Put_Char_Imp+0x3e9>
   1182a:	83 fb 3b             	cmp    $0x3b,%ebx
   1182d:	8d 76 00             	lea    0x0(%esi),%esi
   11830:	75 0f                	jne    11841 <Put_Char_Imp+0x147>
   11832:	a1 b8 fb 01 00       	mov    0x1fbb8,%eax
   11837:	e8 c4 fb ff ff       	call   11400 <Start_Arg>
   1183c:	e9 a2 02 00 00       	jmp    11ae3 <Put_Char_Imp+0x3e9>
   11841:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
   11847:	e9 c1 fe ff ff       	jmp    1170d <Put_Char_Imp+0x13>
   1184c:	83 fb 4a             	cmp    $0x4a,%ebx
   1184f:	90                   	nop
   11850:	0f 84 06 02 00 00    	je     11a5c <Put_Char_Imp+0x362>
   11856:	83 fb 4a             	cmp    $0x4a,%ebx
   11859:	7f 4a                	jg     118a5 <Put_Char_Imp+0x1ab>
   1185b:	83 fb 43             	cmp    $0x43,%ebx
   1185e:	66 90                	xchg   %ax,%ax
   11860:	0f 84 0d 01 00 00    	je     11973 <Put_Char_Imp+0x279>
   11866:	83 fb 43             	cmp    $0x43,%ebx
   11869:	7f 1a                	jg     11885 <Put_Char_Imp+0x18b>
   1186b:	83 fb 41             	cmp    $0x41,%ebx
   1186e:	66 90                	xchg   %ax,%ax
   11870:	0f 84 b9 00 00 00    	je     1192f <Put_Char_Imp+0x235>
   11876:	83 fb 42             	cmp    $0x42,%ebx
   11879:	0f 85 0e 02 00 00    	jne    11a8d <Put_Char_Imp+0x393>
   1187f:	90                   	nop
   11880:	e9 ce 00 00 00       	jmp    11953 <Put_Char_Imp+0x259>
   11885:	83 fb 44             	cmp    $0x44,%ebx
   11888:	0f 84 06 01 00 00    	je     11994 <Put_Char_Imp+0x29a>
   1188e:	83 fb 48             	cmp    $0x48,%ebx
   11891:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   11898:	0f 85 ef 01 00 00    	jne    11a8d <Put_Char_Imp+0x393>
   1189e:	66 90                	xchg   %ax,%ax
   118a0:	e9 8b 01 00 00       	jmp    11a30 <Put_Char_Imp+0x336>
   118a5:	83 fb 6d             	cmp    $0x6d,%ebx
   118a8:	0f 84 07 01 00 00    	je     119b5 <Put_Char_Imp+0x2bb>
   118ae:	83 fb 6d             	cmp    $0x6d,%ebx
   118b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   118b8:	7f 1b                	jg     118d5 <Put_Char_Imp+0x1db>
   118ba:	83 fb 4b             	cmp    $0x4b,%ebx
   118bd:	8d 76 00             	lea    0x0(%esi),%esi
   118c0:	74 28                	je     118ea <Put_Char_Imp+0x1f0>
   118c2:	83 fb 66             	cmp    $0x66,%ebx
   118c5:	0f 85 c2 01 00 00    	jne    11a8d <Put_Char_Imp+0x393>
   118cb:	90                   	nop
   118cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   118d0:	e9 5b 01 00 00       	jmp    11a30 <Put_Char_Imp+0x336>
   118d5:	83 fb 73             	cmp    $0x73,%ebx
   118d8:	74 23                	je     118fd <Put_Char_Imp+0x203>
   118da:	83 fb 75             	cmp    $0x75,%ebx
   118dd:	8d 76 00             	lea    0x0(%esi),%esi
   118e0:	0f 85 a7 01 00 00    	jne    11a8d <Put_Char_Imp+0x393>
   118e6:	66 90                	xchg   %ax,%ax
   118e8:	eb 2c                	jmp    11916 <Put_Char_Imp+0x21c>
   118ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   118f0:	e8 ab f4 ff ff       	call   10da0 <Clear_To_EOL>
   118f5:	8d 76 00             	lea    0x0(%esi),%esi
   118f8:	e9 90 01 00 00       	jmp    11a8d <Put_Char_Imp+0x393>
   118fd:	a1 80 fb 01 00       	mov    0x1fb80,%eax
   11902:	a3 88 fb 01 00       	mov    %eax,0x1fb88
   11907:	a1 84 fb 01 00       	mov    0x1fb84,%eax
   1190c:	a3 8c fb 01 00       	mov    %eax,0x1fb8c
   11911:	e9 77 01 00 00       	jmp    11a8d <Put_Char_Imp+0x393>
   11916:	a1 88 fb 01 00       	mov    0x1fb88,%eax
   1191b:	a3 80 fb 01 00       	mov    %eax,0x1fb80
   11920:	a1 8c fb 01 00       	mov    0x1fb8c,%eax
   11925:	a3 84 fb 01 00       	mov    %eax,0x1fb84
   1192a:	e9 5e 01 00 00       	jmp    11a8d <Put_Char_Imp+0x393>
   1192f:	b8 00 00 00 00       	mov    $0x0,%eax
   11934:	e8 a4 f5 ff ff       	call   10edd <Get_Arg>
   11939:	8b 15 80 fb 01 00    	mov    0x1fb80,%edx
   1193f:	29 c2                	sub    %eax,%edx
   11941:	89 d0                	mov    %edx,%eax
   11943:	8b 15 84 fb 01 00    	mov    0x1fb84,%edx
   11949:	e8 40 f5 ff ff       	call   10e8e <Move_Cursor>
   1194e:	e9 3a 01 00 00       	jmp    11a8d <Put_Char_Imp+0x393>
   11953:	b8 00 00 00 00       	mov    $0x0,%eax
   11958:	e8 80 f5 ff ff       	call   10edd <Get_Arg>
   1195d:	03 05 80 fb 01 00    	add    0x1fb80,%eax
   11963:	8b 15 84 fb 01 00    	mov    0x1fb84,%edx
   11969:	e8 20 f5 ff ff       	call   10e8e <Move_Cursor>
   1196e:	e9 1a 01 00 00       	jmp    11a8d <Put_Char_Imp+0x393>
   11973:	b8 00 00 00 00       	mov    $0x0,%eax
   11978:	e8 60 f5 ff ff       	call   10edd <Get_Arg>
   1197d:	89 c2                	mov    %eax,%edx
   1197f:	03 15 84 fb 01 00    	add    0x1fb84,%edx
   11985:	a1 80 fb 01 00       	mov    0x1fb80,%eax
   1198a:	e8 ff f4 ff ff       	call   10e8e <Move_Cursor>
   1198f:	e9 f9 00 00 00       	jmp    11a8d <Put_Char_Imp+0x393>
   11994:	b8 00 00 00 00       	mov    $0x0,%eax
   11999:	e8 3f f5 ff ff       	call   10edd <Get_Arg>
   1199e:	8b 15 84 fb 01 00    	mov    0x1fb84,%edx
   119a4:	29 c2                	sub    %eax,%edx
   119a6:	a1 80 fb 01 00       	mov    0x1fb80,%eax
   119ab:	e8 de f4 ff ff       	call   10e8e <Move_Cursor>
   119b0:	e9 d8 00 00 00       	jmp    11a8d <Put_Char_Imp+0x393>
   119b5:	0f b6 05 90 fb 01 00 	movzbl 0x1fb90,%eax
   119bc:	83 e0 f7             	and    $0xfffffff7,%eax
   119bf:	8b 15 b8 fb 01 00    	mov    0x1fbb8,%edx
   119c5:	89 55 e0             	mov    %edx,-0x20(%ebp)
   119c8:	b9 00 00 00 00       	mov    $0x0,%ecx
   119cd:	be 98 fb 01 00       	mov    $0x1fb98,%esi
   119d2:	bb a9 d1 01 00       	mov    $0x1d1a9,%ebx
   119d7:	eb 4b                	jmp    11a24 <Put_Char_Imp+0x32a>
   119d9:	8b 14 8e             	mov    (%esi,%ecx,4),%edx
   119dc:	85 d2                	test   %edx,%edx
   119de:	75 07                	jne    119e7 <Put_Char_Imp+0x2ed>
   119e0:	b8 07 00 00 00       	mov    $0x7,%eax
   119e5:	eb 3a                	jmp    11a21 <Put_Char_Imp+0x327>
   119e7:	83 fa 01             	cmp    $0x1,%edx
   119ea:	75 06                	jne    119f2 <Put_Char_Imp+0x2f8>
   119ec:	83 c8 08             	or     $0x8,%eax
   119ef:	90                   	nop
   119f0:	eb 2f                	jmp    11a21 <Put_Char_Imp+0x327>
   119f2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
   119f5:	8d 7a e2             	lea    -0x1e(%edx),%edi
   119f8:	83 ff 07             	cmp    $0x7,%edi
   119fb:	77 0c                	ja     11a09 <Put_Char_Imp+0x30f>
   119fd:	83 e0 f8             	and    $0xfffffff8,%eax
   11a00:	0f b6 54 13 e2       	movzbl -0x1e(%ebx,%edx,1),%edx
   11a05:	09 d0                	or     %edx,%eax
   11a07:	eb 18                	jmp    11a21 <Put_Char_Imp+0x327>
   11a09:	8b 7d e4             	mov    -0x1c(%ebp),%edi
   11a0c:	83 ef 28             	sub    $0x28,%edi
   11a0f:	83 ff 07             	cmp    $0x7,%edi
   11a12:	77 0d                	ja     11a21 <Put_Char_Imp+0x327>
   11a14:	83 e0 8f             	and    $0xffffff8f,%eax
   11a17:	0f b6 54 13 d8       	movzbl -0x28(%ebx,%edx,1),%edx
   11a1c:	c1 e2 04             	shl    $0x4,%edx
   11a1f:	09 d0                	or     %edx,%eax
   11a21:	83 c1 01             	add    $0x1,%ecx
   11a24:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
   11a27:	7c b0                	jl     119d9 <Put_Char_Imp+0x2df>
   11a29:	a2 90 fb 01 00       	mov    %al,0x1fb90
   11a2e:	eb 5d                	jmp    11a8d <Put_Char_Imp+0x393>
   11a30:	83 3d b8 fb 01 00 02 	cmpl   $0x2,0x1fbb8
   11a37:	75 54                	jne    11a8d <Put_Char_Imp+0x393>
   11a39:	b8 01 00 00 00       	mov    $0x1,%eax
   11a3e:	e8 9a f4 ff ff       	call   10edd <Get_Arg>
   11a43:	89 c3                	mov    %eax,%ebx
   11a45:	b8 00 00 00 00       	mov    $0x0,%eax
   11a4a:	e8 8e f4 ff ff       	call   10edd <Get_Arg>
   11a4f:	8d 53 ff             	lea    -0x1(%ebx),%edx
   11a52:	83 e8 01             	sub    $0x1,%eax
   11a55:	e8 34 f4 ff ff       	call   10e8e <Move_Cursor>
   11a5a:	eb 31                	jmp    11a8d <Put_Char_Imp+0x393>
   11a5c:	83 3d b8 fb 01 00 01 	cmpl   $0x1,0x1fbb8
   11a63:	75 28                	jne    11a8d <Put_Char_Imp+0x393>
   11a65:	b8 00 00 00 00       	mov    $0x0,%eax
   11a6a:	e8 6e f4 ff ff       	call   10edd <Get_Arg>
   11a6f:	83 f8 02             	cmp    $0x2,%eax
   11a72:	75 19                	jne    11a8d <Put_Char_Imp+0x393>
   11a74:	e8 3a fb ff ff       	call   115b3 <Clear_Screen>
   11a79:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   11a80:	00 
   11a81:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   11a88:	e8 8d f7 ff ff       	call   1121a <Put_Cursor>
   11a8d:	e8 32 f4 ff ff       	call   10ec4 <Reset>
   11a92:	eb 4f                	jmp    11ae3 <Put_Char_Imp+0x3e9>
   11a94:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11a9b:	90                   	nop
   11a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   11aa0:	e8 4e f6 ff ff       	call   110f3 <Set_Current_Attr>
   11aa5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11aaa:	89 44 24 18          	mov    %eax,0x18(%esp)
   11aae:	8b 45 04             	mov    0x4(%ebp),%eax
   11ab1:	89 44 24 14          	mov    %eax,0x14(%esp)
   11ab5:	c7 44 24 10 5a 01 00 	movl   $0x15a,0x10(%esp)
   11abc:	00 
   11abd:	c7 44 24 0c 30 d1 01 	movl   $0x1d130,0xc(%esp)
   11ac4:	00 
   11ac5:	c7 44 24 08 6b d1 01 	movl   $0x1d16b,0x8(%esp)
   11acc:	00 
   11acd:	c7 44 24 04 88 d1 01 	movl   $0x1d188,0x4(%esp)
   11ad4:	00 
   11ad5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11adc:	e8 db f4 ff ff       	call   10fbc <Print>
   11ae1:	eb fe                	jmp    11ae1 <Put_Char_Imp+0x3e7>
   11ae3:	83 c4 3c             	add    $0x3c,%esp
   11ae6:	5b                   	pop    %ebx
   11ae7:	5e                   	pop    %esi
   11ae8:	5f                   	pop    %edi
   11ae9:	5d                   	pop    %ebp
   11aea:	c3                   	ret    

00011aeb <Print_Emit>:
   11aeb:	55                   	push   %ebp
   11aec:	89 e5                	mov    %esp,%ebp
   11aee:	83 ec 08             	sub    $0x8,%esp
   11af1:	8b 45 0c             	mov    0xc(%ebp),%eax
   11af4:	e8 01 fc ff ff       	call   116fa <Put_Char_Imp>
   11af9:	c9                   	leave  
   11afa:	c3                   	ret    

00011afb <Put_Buf>:
   11afb:	55                   	push   %ebp
   11afc:	89 e5                	mov    %esp,%ebp
   11afe:	57                   	push   %edi
   11aff:	56                   	push   %esi
   11b00:	53                   	push   %ebx
   11b01:	83 ec 3c             	sub    $0x3c,%esp
   11b04:	8b 7d 08             	mov    0x8(%ebp),%edi
   11b07:	8b 75 0c             	mov    0xc(%ebp),%esi
   11b0a:	e8 42 e8 ff ff       	call   10351 <Interrupts_Enabled>
   11b0f:	88 45 e7             	mov    %al,-0x19(%ebp)
   11b12:	84 c0                	test   %al,%al
   11b14:	74 54                	je     11b6a <Put_Buf+0x6f>
   11b16:	e8 36 e8 ff ff       	call   10351 <Interrupts_Enabled>
   11b1b:	84 c0                	test   %al,%al
   11b1d:	75 4a                	jne    11b69 <Put_Buf+0x6e>
   11b1f:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11b26:	e8 c8 f5 ff ff       	call   110f3 <Set_Current_Attr>
   11b2b:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11b30:	89 44 24 18          	mov    %eax,0x18(%esp)
   11b34:	8b 45 04             	mov    0x4(%ebp),%eax
   11b37:	89 44 24 14          	mov    %eax,0x14(%esp)
   11b3b:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   11b42:	00 
   11b43:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11b4a:	00 
   11b4b:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   11b52:	00 
   11b53:	c7 44 24 04 b1 d1 01 	movl   $0x1d1b1,0x4(%esp)
   11b5a:	00 
   11b5b:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11b62:	e8 55 f4 ff ff       	call   10fbc <Print>
   11b67:	eb fe                	jmp    11b67 <Put_Buf+0x6c>
   11b69:	fa                   	cli    
   11b6a:	85 f6                	test   %esi,%esi
   11b6c:	74 15                	je     11b83 <Put_Buf+0x88>
   11b6e:	bb 00 00 00 00       	mov    $0x0,%ebx
   11b73:	0f be 04 1f          	movsbl (%edi,%ebx,1),%eax
   11b77:	e8 7e fb ff ff       	call   116fa <Put_Char_Imp>
   11b7c:	83 c3 01             	add    $0x1,%ebx
   11b7f:	39 f3                	cmp    %esi,%ebx
   11b81:	75 f0                	jne    11b73 <Put_Buf+0x78>
   11b83:	e8 7c f3 ff ff       	call   10f04 <Update_Cursor>
   11b88:	e8 c4 e7 ff ff       	call   10351 <Interrupts_Enabled>
   11b8d:	84 c0                	test   %al,%al
   11b8f:	90                   	nop
   11b90:	74 4a                	je     11bdc <Put_Buf+0xe1>
   11b92:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11b99:	e8 55 f5 ff ff       	call   110f3 <Set_Current_Attr>
   11b9e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11ba3:	89 44 24 18          	mov    %eax,0x18(%esp)
   11ba7:	8b 45 04             	mov    0x4(%ebp),%eax
   11baa:	89 44 24 14          	mov    %eax,0x14(%esp)
   11bae:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   11bb5:	00 
   11bb6:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11bbd:	00 
   11bbe:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11bc5:	00 
   11bc6:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   11bcd:	00 
   11bce:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11bd5:	e8 e2 f3 ff ff       	call   10fbc <Print>
   11bda:	eb fe                	jmp    11bda <Put_Buf+0xdf>
   11bdc:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
   11be0:	74 5b                	je     11c3d <Put_Buf+0x142>
   11be2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   11be8:	e8 64 e7 ff ff       	call   10351 <Interrupts_Enabled>
   11bed:	84 c0                	test   %al,%al
   11bef:	90                   	nop
   11bf0:	74 4a                	je     11c3c <Put_Buf+0x141>
   11bf2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11bf9:	e8 f5 f4 ff ff       	call   110f3 <Set_Current_Attr>
   11bfe:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11c03:	89 44 24 18          	mov    %eax,0x18(%esp)
   11c07:	8b 45 04             	mov    0x4(%ebp),%eax
   11c0a:	89 44 24 14          	mov    %eax,0x14(%esp)
   11c0e:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   11c15:	00 
   11c16:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11c1d:	00 
   11c1e:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11c25:	00 
   11c26:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   11c2d:	00 
   11c2e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11c35:	e8 82 f3 ff ff       	call   10fbc <Print>
   11c3a:	eb fe                	jmp    11c3a <Put_Buf+0x13f>
   11c3c:	fb                   	sti    
   11c3d:	83 c4 3c             	add    $0x3c,%esp
   11c40:	5b                   	pop    %ebx
   11c41:	5e                   	pop    %esi
   11c42:	5f                   	pop    %edi
   11c43:	5d                   	pop    %ebp
   11c44:	c3                   	ret    

00011c45 <Put_String>:
   11c45:	55                   	push   %ebp
   11c46:	89 e5                	mov    %esp,%ebp
   11c48:	53                   	push   %ebx
   11c49:	83 ec 34             	sub    $0x34,%esp
   11c4c:	8b 5d 08             	mov    0x8(%ebp),%ebx
   11c4f:	e8 fd e6 ff ff       	call   10351 <Interrupts_Enabled>
   11c54:	88 45 f7             	mov    %al,-0x9(%ebp)
   11c57:	84 c0                	test   %al,%al
   11c59:	74 54                	je     11caf <Put_String+0x6a>
   11c5b:	e8 f1 e6 ff ff       	call   10351 <Interrupts_Enabled>
   11c60:	84 c0                	test   %al,%al
   11c62:	75 4a                	jne    11cae <Put_String+0x69>
   11c64:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11c6b:	e8 83 f4 ff ff       	call   110f3 <Set_Current_Attr>
   11c70:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11c75:	89 44 24 18          	mov    %eax,0x18(%esp)
   11c79:	8b 45 04             	mov    0x4(%ebp),%eax
   11c7c:	89 44 24 14          	mov    %eax,0x14(%esp)
   11c80:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   11c87:	00 
   11c88:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11c8f:	00 
   11c90:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   11c97:	00 
   11c98:	c7 44 24 04 b1 d1 01 	movl   $0x1d1b1,0x4(%esp)
   11c9f:	00 
   11ca0:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11ca7:	e8 10 f3 ff ff       	call   10fbc <Print>
   11cac:	eb fe                	jmp    11cac <Put_String+0x67>
   11cae:	fa                   	cli    
   11caf:	0f b6 03             	movzbl (%ebx),%eax
   11cb2:	84 c0                	test   %al,%al
   11cb4:	74 12                	je     11cc8 <Put_String+0x83>
   11cb6:	83 c3 01             	add    $0x1,%ebx
   11cb9:	0f be c0             	movsbl %al,%eax
   11cbc:	e8 39 fa ff ff       	call   116fa <Put_Char_Imp>
   11cc1:	0f b6 03             	movzbl (%ebx),%eax
   11cc4:	84 c0                	test   %al,%al
   11cc6:	75 ee                	jne    11cb6 <Put_String+0x71>
   11cc8:	e8 37 f2 ff ff       	call   10f04 <Update_Cursor>
   11ccd:	e8 7f e6 ff ff       	call   10351 <Interrupts_Enabled>
   11cd2:	84 c0                	test   %al,%al
   11cd4:	74 4a                	je     11d20 <Put_String+0xdb>
   11cd6:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11cdd:	e8 11 f4 ff ff       	call   110f3 <Set_Current_Attr>
   11ce2:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11ce7:	89 44 24 18          	mov    %eax,0x18(%esp)
   11ceb:	8b 45 04             	mov    0x4(%ebp),%eax
   11cee:	89 44 24 14          	mov    %eax,0x14(%esp)
   11cf2:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   11cf9:	00 
   11cfa:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11d01:	00 
   11d02:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11d09:	00 
   11d0a:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   11d11:	00 
   11d12:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11d19:	e8 9e f2 ff ff       	call   10fbc <Print>
   11d1e:	eb fe                	jmp    11d1e <Put_String+0xd9>
   11d20:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
   11d24:	74 57                	je     11d7d <Put_String+0x138>
   11d26:	66 90                	xchg   %ax,%ax
   11d28:	e8 24 e6 ff ff       	call   10351 <Interrupts_Enabled>
   11d2d:	84 c0                	test   %al,%al
   11d2f:	90                   	nop
   11d30:	74 4a                	je     11d7c <Put_String+0x137>
   11d32:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11d39:	e8 b5 f3 ff ff       	call   110f3 <Set_Current_Attr>
   11d3e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11d43:	89 44 24 18          	mov    %eax,0x18(%esp)
   11d47:	8b 45 04             	mov    0x4(%ebp),%eax
   11d4a:	89 44 24 14          	mov    %eax,0x14(%esp)
   11d4e:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   11d55:	00 
   11d56:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11d5d:	00 
   11d5e:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11d65:	00 
   11d66:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   11d6d:	00 
   11d6e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11d75:	e8 42 f2 ff ff       	call   10fbc <Print>
   11d7a:	eb fe                	jmp    11d7a <Put_String+0x135>
   11d7c:	fb                   	sti    
   11d7d:	83 c4 34             	add    $0x34,%esp
   11d80:	5b                   	pop    %ebx
   11d81:	5d                   	pop    %ebp
   11d82:	c3                   	ret    

00011d83 <Put_Char>:
   11d83:	55                   	push   %ebp
   11d84:	89 e5                	mov    %esp,%ebp
   11d86:	53                   	push   %ebx
   11d87:	83 ec 24             	sub    $0x24,%esp
   11d8a:	e8 c2 e5 ff ff       	call   10351 <Interrupts_Enabled>
   11d8f:	89 c3                	mov    %eax,%ebx
   11d91:	84 c0                	test   %al,%al
   11d93:	74 54                	je     11de9 <Put_Char+0x66>
   11d95:	e8 b7 e5 ff ff       	call   10351 <Interrupts_Enabled>
   11d9a:	84 c0                	test   %al,%al
   11d9c:	75 4a                	jne    11de8 <Put_Char+0x65>
   11d9e:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11da5:	e8 49 f3 ff ff       	call   110f3 <Set_Current_Attr>
   11daa:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11daf:	89 44 24 18          	mov    %eax,0x18(%esp)
   11db3:	8b 45 04             	mov    0x4(%ebp),%eax
   11db6:	89 44 24 14          	mov    %eax,0x14(%esp)
   11dba:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   11dc1:	00 
   11dc2:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11dc9:	00 
   11dca:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   11dd1:	00 
   11dd2:	c7 44 24 04 b1 d1 01 	movl   $0x1d1b1,0x4(%esp)
   11dd9:	00 
   11dda:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11de1:	e8 d6 f1 ff ff       	call   10fbc <Print>
   11de6:	eb fe                	jmp    11de6 <Put_Char+0x63>
   11de8:	fa                   	cli    
   11de9:	8b 45 08             	mov    0x8(%ebp),%eax
   11dec:	e8 09 f9 ff ff       	call   116fa <Put_Char_Imp>
   11df1:	e8 0e f1 ff ff       	call   10f04 <Update_Cursor>
   11df6:	e8 56 e5 ff ff       	call   10351 <Interrupts_Enabled>
   11dfb:	84 c0                	test   %al,%al
   11dfd:	8d 76 00             	lea    0x0(%esi),%esi
   11e00:	74 4a                	je     11e4c <Put_Char+0xc9>
   11e02:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11e09:	e8 e5 f2 ff ff       	call   110f3 <Set_Current_Attr>
   11e0e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11e13:	89 44 24 18          	mov    %eax,0x18(%esp)
   11e17:	8b 45 04             	mov    0x4(%ebp),%eax
   11e1a:	89 44 24 14          	mov    %eax,0x14(%esp)
   11e1e:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   11e25:	00 
   11e26:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11e2d:	00 
   11e2e:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11e35:	00 
   11e36:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   11e3d:	00 
   11e3e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11e45:	e8 72 f1 ff ff       	call   10fbc <Print>
   11e4a:	eb fe                	jmp    11e4a <Put_Char+0xc7>
   11e4c:	84 db                	test   %bl,%bl
   11e4e:	74 54                	je     11ea4 <Put_Char+0x121>
   11e50:	e8 fc e4 ff ff       	call   10351 <Interrupts_Enabled>
   11e55:	84 c0                	test   %al,%al
   11e57:	74 4a                	je     11ea3 <Put_Char+0x120>
   11e59:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11e60:	e8 8e f2 ff ff       	call   110f3 <Set_Current_Attr>
   11e65:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11e6a:	89 44 24 18          	mov    %eax,0x18(%esp)
   11e6e:	8b 45 04             	mov    0x4(%ebp),%eax
   11e71:	89 44 24 14          	mov    %eax,0x14(%esp)
   11e75:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   11e7c:	00 
   11e7d:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11e84:	00 
   11e85:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11e8c:	00 
   11e8d:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   11e94:	00 
   11e95:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11e9c:	e8 1b f1 ff ff       	call   10fbc <Print>
   11ea1:	eb fe                	jmp    11ea1 <Put_Char+0x11e>
   11ea3:	fb                   	sti    
   11ea4:	83 c4 24             	add    $0x24,%esp
   11ea7:	5b                   	pop    %ebx
   11ea8:	5d                   	pop    %ebp
   11ea9:	c3                   	ret    

00011eaa <Init_Screen>:
   11eaa:	55                   	push   %ebp
   11eab:	89 e5                	mov    %esp,%ebp
   11ead:	53                   	push   %ebx
   11eae:	83 ec 24             	sub    $0x24,%esp
   11eb1:	e8 9b e4 ff ff       	call   10351 <Interrupts_Enabled>
   11eb6:	89 c3                	mov    %eax,%ebx
   11eb8:	84 c0                	test   %al,%al
   11eba:	74 54                	je     11f10 <Init_Screen+0x66>
   11ebc:	e8 90 e4 ff ff       	call   10351 <Interrupts_Enabled>
   11ec1:	84 c0                	test   %al,%al
   11ec3:	75 4a                	jne    11f0f <Init_Screen+0x65>
   11ec5:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11ecc:	e8 22 f2 ff ff       	call   110f3 <Set_Current_Attr>
   11ed1:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11ed6:	89 44 24 18          	mov    %eax,0x18(%esp)
   11eda:	8b 45 04             	mov    0x4(%ebp),%eax
   11edd:	89 44 24 14          	mov    %eax,0x14(%esp)
   11ee1:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   11ee8:	00 
   11ee9:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11ef0:	00 
   11ef1:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   11ef8:	00 
   11ef9:	c7 44 24 04 b1 d1 01 	movl   $0x1d1b1,0x4(%esp)
   11f00:	00 
   11f01:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11f08:	e8 af f0 ff ff       	call   10fbc <Print>
   11f0d:	eb fe                	jmp    11f0d <Init_Screen+0x63>
   11f0f:	fa                   	cli    
   11f10:	c7 05 84 fb 01 00 00 	movl   $0x0,0x1fb84
   11f17:	00 00 00 
   11f1a:	c7 05 80 fb 01 00 00 	movl   $0x0,0x1fb80
   11f21:	00 00 00 
   11f24:	c6 05 90 fb 01 00 07 	movb   $0x7,0x1fb90
   11f2b:	e8 83 f6 ff ff       	call   115b3 <Clear_Screen>
   11f30:	e8 1c e4 ff ff       	call   10351 <Interrupts_Enabled>
   11f35:	84 c0                	test   %al,%al
   11f37:	74 4a                	je     11f83 <Init_Screen+0xd9>
   11f39:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11f40:	e8 ae f1 ff ff       	call   110f3 <Set_Current_Attr>
   11f45:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11f4a:	89 44 24 18          	mov    %eax,0x18(%esp)
   11f4e:	8b 45 04             	mov    0x4(%ebp),%eax
   11f51:	89 44 24 14          	mov    %eax,0x14(%esp)
   11f55:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   11f5c:	00 
   11f5d:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11f64:	00 
   11f65:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11f6c:	00 
   11f6d:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   11f74:	00 
   11f75:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11f7c:	e8 3b f0 ff ff       	call   10fbc <Print>
   11f81:	eb fe                	jmp    11f81 <Init_Screen+0xd7>
   11f83:	84 db                	test   %bl,%bl
   11f85:	74 5d                	je     11fe4 <Init_Screen+0x13a>
   11f87:	89 f6                	mov    %esi,%esi
   11f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
   11f90:	e8 bc e3 ff ff       	call   10351 <Interrupts_Enabled>
   11f95:	84 c0                	test   %al,%al
   11f97:	74 4a                	je     11fe3 <Init_Screen+0x139>
   11f99:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   11fa0:	e8 4e f1 ff ff       	call   110f3 <Set_Current_Attr>
   11fa5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   11faa:	89 44 24 18          	mov    %eax,0x18(%esp)
   11fae:	8b 45 04             	mov    0x4(%ebp),%eax
   11fb1:	89 44 24 14          	mov    %eax,0x14(%esp)
   11fb5:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   11fbc:	00 
   11fbd:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   11fc4:	00 
   11fc5:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   11fcc:	00 
   11fcd:	c7 44 24 04 c2 d1 01 	movl   $0x1d1c2,0x4(%esp)
   11fd4:	00 
   11fd5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   11fdc:	e8 db ef ff ff       	call   10fbc <Print>
   11fe1:	eb fe                	jmp    11fe1 <Init_Screen+0x137>
   11fe3:	fb                   	sti    
   11fe4:	83 c4 24             	add    $0x24,%esp
   11fe7:	5b                   	pop    %ebx
   11fe8:	5d                   	pop    %ebp
   11fe9:	c3                   	ret    
   11fea:	90                   	nop
   11feb:	90                   	nop

00011fec <Spin>:
   11fec:	55                   	push   %ebp
   11fed:	89 e5                	mov    %esp,%ebp
   11fef:	48                   	dec    %eax
   11ff0:	83 f8 00             	cmp    $0x0,%eax
   11ff3:	90                   	nop
   11ff4:	90                   	nop
   11ff5:	90                   	nop
   11ff6:	90                   	nop
   11ff7:	90                   	nop
   11ff8:	90                   	nop
   11ff9:	90                   	nop
   11ffa:	90                   	nop
   11ffb:	90                   	nop
   11ffc:	90                   	nop
   11ffd:	90                   	nop
   11ffe:	90                   	nop
   11fff:	7f ee                	jg     11fef <Spin+0x3>
   12001:	5d                   	pop    %ebp
   12002:	c3                   	ret    

00012003 <Micro_Delay>:
   12003:	55                   	push   %ebp
   12004:	89 e5                	mov    %esp,%ebp
   12006:	53                   	push   %ebx
   12007:	8b 4d 08             	mov    0x8(%ebp),%ecx
   1200a:	0f af 0d bc fb 01 00 	imul   0x1fbbc,%ecx
   12011:	ba 5b fd 4d 77       	mov    $0x774dfd5b,%edx
   12016:	89 c8                	mov    %ecx,%eax
   12018:	f7 ea                	imul   %edx
   1201a:	c1 fa 17             	sar    $0x17,%edx
   1201d:	89 cb                	mov    %ecx,%ebx
   1201f:	c1 fb 1f             	sar    $0x1f,%ebx
   12022:	89 d0                	mov    %edx,%eax
   12024:	29 d8                	sub    %ebx,%eax
   12026:	69 d0 80 a8 12 01    	imul   $0x112a880,%eax,%edx
   1202c:	29 d1                	sub    %edx,%ecx
   1202e:	85 c9                	test   %ecx,%ecx
   12030:	0f 9f c2             	setg   %dl
   12033:	0f b6 d2             	movzbl %dl,%edx
   12036:	01 d0                	add    %edx,%eax
   12038:	e8 af ff ff ff       	call   11fec <Spin>
   1203d:	5b                   	pop    %ebx
   1203e:	5d                   	pop    %ebp
   1203f:	c3                   	ret    

00012040 <Init_Timer>:
   12040:	55                   	push   %ebp
   12041:	89 e5                	mov    %esp,%ebp
   12043:	83 ec 28             	sub    $0x28,%esp
   12046:	c7 04 24 d1 d1 01 00 	movl   $0x1d1d1,(%esp)
   1204d:	e8 6a ef ff ff       	call   10fbc <Print>
   12052:	e8 fa e2 ff ff       	call   10351 <Interrupts_Enabled>
   12057:	84 c0                	test   %al,%al
   12059:	75 4a                	jne    120a5 <Init_Timer+0x65>
   1205b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12062:	e8 8c f0 ff ff       	call   110f3 <Set_Current_Attr>
   12067:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1206c:	89 44 24 18          	mov    %eax,0x18(%esp)
   12070:	8b 45 04             	mov    0x4(%ebp),%eax
   12073:	89 44 24 14          	mov    %eax,0x14(%esp)
   12077:	c7 44 24 10 8a 00 00 	movl   $0x8a,0x10(%esp)
   1207e:	00 
   1207f:	c7 44 24 0c e8 d1 01 	movl   $0x1d1e8,0xc(%esp)
   12086:	00 
   12087:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1208e:	00 
   1208f:	c7 44 24 04 24 d2 01 	movl   $0x1d224,0x4(%esp)
   12096:	00 
   12097:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1209e:	e8 19 ef ff ff       	call   10fbc <Print>
   120a3:	eb fe                	jmp    120a3 <Init_Timer+0x63>
   120a5:	fa                   	cli    
   120a6:	c7 44 24 04 19 22 01 	movl   $0x12219,0x4(%esp)
   120ad:	00 
   120ae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   120b5:	e8 65 e4 ff ff       	call   1051f <Install_IRQ>
   120ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   120c1:	e8 76 e4 ff ff       	call   1053c <Enable_IRQ>
   120c6:	e8 86 e2 ff ff       	call   10351 <Interrupts_Enabled>
   120cb:	84 c0                	test   %al,%al
   120cd:	74 4a                	je     12119 <Init_Timer+0xd9>
   120cf:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   120d6:	e8 18 f0 ff ff       	call   110f3 <Set_Current_Attr>
   120db:	a1 d0 07 02 00       	mov    0x207d0,%eax
   120e0:	89 44 24 18          	mov    %eax,0x18(%esp)
   120e4:	8b 45 04             	mov    0x4(%ebp),%eax
   120e7:	89 44 24 14          	mov    %eax,0x14(%esp)
   120eb:	c7 44 24 10 90 00 00 	movl   $0x90,0x10(%esp)
   120f2:	00 
   120f3:	c7 44 24 0c e8 d1 01 	movl   $0x1d1e8,0xc(%esp)
   120fa:	00 
   120fb:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   12102:	00 
   12103:	c7 44 24 04 24 d2 01 	movl   $0x1d224,0x4(%esp)
   1210a:	00 
   1210b:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12112:	e8 a5 ee ff ff       	call   10fbc <Print>
   12117:	eb fe                	jmp    12117 <Init_Timer+0xd7>
   12119:	fb                   	sti    
   1211a:	a1 c0 07 02 00       	mov    0x207c0,%eax
   1211f:	83 f8 02             	cmp    $0x2,%eax
   12122:	76 f6                	jbe    1211a <Init_Timer+0xda>
   12124:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
   12129:	e8 be fe ff ff       	call   11fec <Spin>
   1212e:	e8 1e e2 ff ff       	call   10351 <Interrupts_Enabled>
   12133:	84 c0                	test   %al,%al
   12135:	75 4a                	jne    12181 <Init_Timer+0x141>
   12137:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1213e:	e8 b0 ef ff ff       	call   110f3 <Set_Current_Attr>
   12143:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12148:	89 44 24 18          	mov    %eax,0x18(%esp)
   1214c:	8b 45 04             	mov    0x4(%ebp),%eax
   1214f:	89 44 24 14          	mov    %eax,0x14(%esp)
   12153:	c7 44 24 10 9d 00 00 	movl   $0x9d,0x10(%esp)
   1215a:	00 
   1215b:	c7 44 24 0c e8 d1 01 	movl   $0x1d1e8,0xc(%esp)
   12162:	00 
   12163:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1216a:	00 
   1216b:	c7 44 24 04 24 d2 01 	movl   $0x1d224,0x4(%esp)
   12172:	00 
   12173:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1217a:	e8 3d ee ff ff       	call   10fbc <Print>
   1217f:	eb fe                	jmp    1217f <Init_Timer+0x13f>
   12181:	fa                   	cli    
   12182:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   12189:	e8 3c e5 ff ff       	call   106ca <Disable_IRQ>
   1218e:	e8 be e1 ff ff       	call   10351 <Interrupts_Enabled>
   12193:	84 c0                	test   %al,%al
   12195:	74 4a                	je     121e1 <Init_Timer+0x1a1>
   12197:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1219e:	e8 50 ef ff ff       	call   110f3 <Set_Current_Attr>
   121a3:	a1 d0 07 02 00       	mov    0x207d0,%eax
   121a8:	89 44 24 18          	mov    %eax,0x18(%esp)
   121ac:	8b 45 04             	mov    0x4(%ebp),%eax
   121af:	89 44 24 14          	mov    %eax,0x14(%esp)
   121b3:	c7 44 24 10 a4 00 00 	movl   $0xa4,0x10(%esp)
   121ba:	00 
   121bb:	c7 44 24 0c e8 d1 01 	movl   $0x1d1e8,0xc(%esp)
   121c2:	00 
   121c3:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   121ca:	00 
   121cb:	c7 44 24 04 24 d2 01 	movl   $0x1d224,0x4(%esp)
   121d2:	00 
   121d3:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   121da:	e8 dd ed ff ff       	call   10fbc <Print>
   121df:	eb fe                	jmp    121df <Init_Timer+0x19f>
   121e1:	fb                   	sti    
   121e2:	a1 bc fb 01 00       	mov    0x1fbbc,%eax
   121e7:	89 44 24 04          	mov    %eax,0x4(%esp)
   121eb:	c7 04 24 00 d2 01 00 	movl   $0x1d200,(%esp)
   121f2:	e8 c5 ed ff ff       	call   10fbc <Print>
   121f7:	c7 44 24 04 66 22 01 	movl   $0x12266,0x4(%esp)
   121fe:	00 
   121ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   12206:	e8 14 e3 ff ff       	call   1051f <Install_IRQ>
   1220b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   12212:	e8 25 e3 ff ff       	call   1053c <Enable_IRQ>
   12217:	c9                   	leave  
   12218:	c3                   	ret    

00012219 <Timer_Calibrate>:
   12219:	55                   	push   %ebp
   1221a:	89 e5                	mov    %esp,%ebp
   1221c:	53                   	push   %ebx
   1221d:	83 ec 14             	sub    $0x14,%esp
   12220:	8b 5d 08             	mov    0x8(%ebp),%ebx
   12223:	89 1c 24             	mov    %ebx,(%esp)
   12226:	e8 41 e2 ff ff       	call   1046c <Begin_IRQ>
   1222b:	a1 c0 07 02 00       	mov    0x207c0,%eax
   12230:	83 f8 02             	cmp    $0x2,%eax
   12233:	77 0f                	ja     12244 <Timer_Calibrate+0x2b>
   12235:	a1 c0 07 02 00       	mov    0x207c0,%eax
   1223a:	83 c0 01             	add    $0x1,%eax
   1223d:	a3 c0 07 02 00       	mov    %eax,0x207c0
   12242:	eb 14                	jmp    12258 <Timer_Calibrate+0x3f>
   12244:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
   12249:	2b 43 28             	sub    0x28(%ebx),%eax
   1224c:	a3 bc fb 01 00       	mov    %eax,0x1fbbc
   12251:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
   12258:	89 1c 24             	mov    %ebx,(%esp)
   1225b:	e8 11 e2 ff ff       	call   10471 <End_IRQ>
   12260:	83 c4 14             	add    $0x14,%esp
   12263:	5b                   	pop    %ebx
   12264:	5d                   	pop    %ebp
   12265:	c3                   	ret    

00012266 <Timer_Interrupt_Handler>:
   12266:	55                   	push   %ebp
   12267:	89 e5                	mov    %esp,%ebp
   12269:	83 ec 18             	sub    $0x18,%esp
   1226c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
   1226f:	89 75 fc             	mov    %esi,-0x4(%ebp)
   12272:	8b 75 08             	mov    0x8(%ebp),%esi
   12275:	8b 1d d0 07 02 00    	mov    0x207d0,%ebx
   1227b:	89 34 24             	mov    %esi,(%esp)
   1227e:	e8 e9 e1 ff ff       	call   1046c <Begin_IRQ>
   12283:	a1 c0 07 02 00       	mov    0x207c0,%eax
   12288:	83 c0 01             	add    $0x1,%eax
   1228b:	a3 c0 07 02 00       	mov    %eax,0x207c0
   12290:	8b 43 04             	mov    0x4(%ebx),%eax
   12293:	83 c0 01             	add    $0x1,%eax
   12296:	89 43 04             	mov    %eax,0x4(%ebx)
   12299:	8b 43 04             	mov    0x4(%ebx),%eax
   1229c:	3b 05 0c f0 01 00    	cmp    0x1f00c,%eax
   122a2:	72 0a                	jb     122ae <Timer_Interrupt_Handler+0x48>
   122a4:	c7 05 d4 07 02 00 01 	movl   $0x1,0x207d4
   122ab:	00 00 00 
   122ae:	89 34 24             	mov    %esi,(%esp)
   122b1:	e8 bb e1 ff ff       	call   10471 <End_IRQ>
   122b6:	8b 5d f8             	mov    -0x8(%ebp),%ebx
   122b9:	8b 75 fc             	mov    -0x4(%ebp),%esi
   122bc:	89 ec                	mov    %ebp,%esp
   122be:	5d                   	pop    %ebp
   122bf:	c3                   	ret    

000122c0 <Free_Page>:
   122c0:	55                   	push   %ebp
   122c1:	89 e5                	mov    %esp,%ebp
   122c3:	53                   	push   %ebx
   122c4:	83 ec 24             	sub    $0x24,%esp
   122c7:	e8 85 e0 ff ff       	call   10351 <Interrupts_Enabled>
   122cc:	89 c3                	mov    %eax,%ebx
   122ce:	84 c0                	test   %al,%al
   122d0:	74 54                	je     12326 <Free_Page+0x66>
   122d2:	e8 7a e0 ff ff       	call   10351 <Interrupts_Enabled>
   122d7:	84 c0                	test   %al,%al
   122d9:	75 4a                	jne    12325 <Free_Page+0x65>
   122db:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   122e2:	e8 0c ee ff ff       	call   110f3 <Set_Current_Attr>
   122e7:	a1 d0 07 02 00       	mov    0x207d0,%eax
   122ec:	89 44 24 18          	mov    %eax,0x18(%esp)
   122f0:	8b 45 04             	mov    0x4(%ebp),%eax
   122f3:	89 44 24 14          	mov    %eax,0x14(%esp)
   122f7:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   122fe:	00 
   122ff:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   12306:	00 
   12307:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1230e:	00 
   1230f:	c7 44 24 04 92 d3 01 	movl   $0x1d392,0x4(%esp)
   12316:	00 
   12317:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1231e:	e8 99 ec ff ff       	call   10fbc <Print>
   12323:	eb fe                	jmp    12323 <Free_Page+0x63>
   12325:	fa                   	cli    
   12326:	8b 45 08             	mov    0x8(%ebp),%eax
   12329:	89 c2                	mov    %eax,%edx
   1232b:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
   12331:	39 d0                	cmp    %edx,%eax
   12333:	74 4a                	je     1237f <Free_Page+0xbf>
   12335:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1233c:	e8 b2 ed ff ff       	call   110f3 <Set_Current_Attr>
   12341:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12346:	89 44 24 18          	mov    %eax,0x18(%esp)
   1234a:	8b 45 04             	mov    0x4(%ebp),%eax
   1234d:	89 44 24 14          	mov    %eax,0x14(%esp)
   12351:	c7 44 24 10 d4 00 00 	movl   $0xd4,0x10(%esp)
   12358:	00 
   12359:	c7 44 24 0c 34 d2 01 	movl   $0x1d234,0xc(%esp)
   12360:	00 
   12361:	c7 44 24 08 48 d2 01 	movl   $0x1d248,0x8(%esp)
   12368:	00 
   12369:	c7 44 24 04 88 d3 01 	movl   $0x1d388,0x4(%esp)
   12370:	00 
   12371:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12378:	e8 3f ec ff ff       	call   10fbc <Print>
   1237d:	eb fe                	jmp    1237d <Free_Page+0xbd>
   1237f:	c1 e8 0c             	shr    $0xc,%eax
   12382:	6b c0 0c             	imul   $0xc,%eax,%eax
   12385:	03 05 c4 07 02 00    	add    0x207c4,%eax
   1238b:	8b 10                	mov    (%eax),%edx
   1238d:	f6 c2 04             	test   $0x4,%dl
   12390:	75 4a                	jne    123dc <Free_Page+0x11c>
   12392:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12399:	e8 55 ed ff ff       	call   110f3 <Set_Current_Attr>
   1239e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   123a3:	89 44 24 18          	mov    %eax,0x18(%esp)
   123a7:	8b 45 04             	mov    0x4(%ebp),%eax
   123aa:	89 44 24 14          	mov    %eax,0x14(%esp)
   123ae:	c7 44 24 10 d8 00 00 	movl   $0xd8,0x10(%esp)
   123b5:	00 
   123b6:	c7 44 24 0c 34 d2 01 	movl   $0x1d234,0xc(%esp)
   123bd:	00 
   123be:	c7 44 24 08 cc d2 01 	movl   $0x1d2cc,0x8(%esp)
   123c5:	00 
   123c6:	c7 44 24 04 88 d3 01 	movl   $0x1d388,0x4(%esp)
   123cd:	00 
   123ce:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   123d5:	e8 e2 eb ff ff       	call   10fbc <Print>
   123da:	eb fe                	jmp    123da <Free_Page+0x11a>
   123dc:	83 e2 fb             	and    $0xfffffffb,%edx
   123df:	89 10                	mov    %edx,(%eax)
   123e1:	8b 15 c4 fb 01 00    	mov    0x1fbc4,%edx
   123e7:	eb 07                	jmp    123f0 <Free_Page+0x130>
   123e9:	39 d0                	cmp    %edx,%eax
   123eb:	74 0c                	je     123f9 <Free_Page+0x139>
   123ed:	8b 52 08             	mov    0x8(%edx),%edx
   123f0:	85 d2                	test   %edx,%edx
   123f2:	75 f5                	jne    123e9 <Free_Page+0x129>
   123f4:	e9 26 01 00 00       	jmp    1251f <Free_Page+0x25f>
   123f9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12400:	e8 ee ec ff ff       	call   110f3 <Set_Current_Attr>
   12405:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1240a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1240e:	8b 45 04             	mov    0x4(%ebp),%eax
   12411:	89 44 24 14          	mov    %eax,0x14(%esp)
   12415:	c7 44 24 10 3f 00 00 	movl   $0x3f,0x10(%esp)
   1241c:	00 
   1241d:	c7 44 24 0c 5f d2 01 	movl   $0x1d25f,0xc(%esp)
   12424:	00 
   12425:	c7 44 24 08 f0 d2 01 	movl   $0x1d2f0,0x8(%esp)
   1242c:	00 
   1242d:	c7 44 24 04 a3 d3 01 	movl   $0x1d3a3,0x4(%esp)
   12434:	00 
   12435:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1243c:	e8 7b eb ff ff       	call   10fbc <Print>
   12441:	eb fe                	jmp    12441 <Free_Page+0x181>
   12443:	a3 c8 fb 01 00       	mov    %eax,0x1fbc8
   12448:	a3 c4 fb 01 00       	mov    %eax,0x1fbc4
   1244d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   12454:	eb 0f                	jmp    12465 <Free_Page+0x1a5>
   12456:	89 42 08             	mov    %eax,0x8(%edx)
   12459:	ba c8 fb 01 00       	mov    $0x1fbc8,%edx
   1245e:	8b 0a                	mov    (%edx),%ecx
   12460:	89 48 04             	mov    %ecx,0x4(%eax)
   12463:	89 02                	mov    %eax,(%edx)
   12465:	83 05 c0 fb 01 00 01 	addl   $0x1,0x1fbc0
   1246c:	e8 e0 de ff ff       	call   10351 <Interrupts_Enabled>
   12471:	84 c0                	test   %al,%al
   12473:	74 4a                	je     124bf <Free_Page+0x1ff>
   12475:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1247c:	e8 72 ec ff ff       	call   110f3 <Set_Current_Attr>
   12481:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12486:	89 44 24 18          	mov    %eax,0x18(%esp)
   1248a:	8b 45 04             	mov    0x4(%ebp),%eax
   1248d:	89 44 24 14          	mov    %eax,0x14(%esp)
   12491:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   12498:	00 
   12499:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   124a0:	00 
   124a1:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   124a8:	00 
   124a9:	c7 44 24 04 bc d3 01 	movl   $0x1d3bc,0x4(%esp)
   124b0:	00 
   124b1:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   124b8:	e8 ff ea ff ff       	call   10fbc <Print>
   124bd:	eb fe                	jmp    124bd <Free_Page+0x1fd>
   124bf:	84 db                	test   %bl,%bl
   124c1:	74 76                	je     12539 <Free_Page+0x279>
   124c3:	90                   	nop
   124c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   124c8:	e8 84 de ff ff       	call   10351 <Interrupts_Enabled>
   124cd:	84 c0                	test   %al,%al
   124cf:	90                   	nop
   124d0:	74 4a                	je     1251c <Free_Page+0x25c>
   124d2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   124d9:	e8 15 ec ff ff       	call   110f3 <Set_Current_Attr>
   124de:	a1 d0 07 02 00       	mov    0x207d0,%eax
   124e3:	89 44 24 18          	mov    %eax,0x18(%esp)
   124e7:	8b 45 04             	mov    0x4(%ebp),%eax
   124ea:	89 44 24 14          	mov    %eax,0x14(%esp)
   124ee:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   124f5:	00 
   124f6:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   124fd:	00 
   124fe:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   12505:	00 
   12506:	c7 44 24 04 bc d3 01 	movl   $0x1d3bc,0x4(%esp)
   1250d:	00 
   1250e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12515:	e8 a2 ea ff ff       	call   10fbc <Print>
   1251a:	eb fe                	jmp    1251a <Free_Page+0x25a>
   1251c:	fb                   	sti    
   1251d:	eb 1a                	jmp    12539 <Free_Page+0x279>
   1251f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
   12526:	8b 15 c8 fb 01 00    	mov    0x1fbc8,%edx
   1252c:	85 d2                	test   %edx,%edx
   1252e:	0f 85 22 ff ff ff    	jne    12456 <Free_Page+0x196>
   12534:	e9 0a ff ff ff       	jmp    12443 <Free_Page+0x183>
   12539:	83 c4 24             	add    $0x24,%esp
   1253c:	5b                   	pop    %ebx
   1253d:	5d                   	pop    %ebp
   1253e:	c3                   	ret    

0001253f <Init_BSS>:
   1253f:	55                   	push   %ebp
   12540:	89 e5                	mov    %esp,%ebp
   12542:	83 ec 18             	sub    $0x18,%esp
   12545:	b8 f0 07 02 00       	mov    $0x207f0,%eax
   1254a:	2d 28 f1 01 00       	sub    $0x1f128,%eax
   1254f:	89 44 24 08          	mov    %eax,0x8(%esp)
   12553:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   1255a:	00 
   1255b:	c7 04 24 28 f1 01 00 	movl   $0x1f128,(%esp)
   12562:	e8 a9 a1 00 00       	call   1c710 <memset>
   12567:	c9                   	leave  
   12568:	c3                   	ret    

00012569 <Add_Page_Range>:
   12569:	55                   	push   %ebp
   1256a:	89 e5                	mov    %esp,%ebp
   1256c:	57                   	push   %edi
   1256d:	56                   	push   %esi
   1256e:	53                   	push   %ebx
   1256f:	83 ec 3c             	sub    $0x3c,%esp
   12572:	89 ce                	mov    %ecx,%esi
   12574:	89 c1                	mov    %eax,%ecx
   12576:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
   1257c:	39 c8                	cmp    %ecx,%eax
   1257e:	74 4a                	je     125ca <Add_Page_Range+0x61>
   12580:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12587:	e8 67 eb ff ff       	call   110f3 <Set_Current_Attr>
   1258c:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12591:	89 44 24 18          	mov    %eax,0x18(%esp)
   12595:	8b 45 04             	mov    0x4(%ebp),%eax
   12598:	89 44 24 14          	mov    %eax,0x14(%esp)
   1259c:	c7 44 24 10 3f 00 00 	movl   $0x3f,0x10(%esp)
   125a3:	00 
   125a4:	c7 44 24 0c 34 d2 01 	movl   $0x1d234,0xc(%esp)
   125ab:	00 
   125ac:	c7 44 24 08 77 d2 01 	movl   $0x1d277,0x8(%esp)
   125b3:	00 
   125b4:	c7 44 24 04 df d3 01 	movl   $0x1d3df,0x4(%esp)
   125bb:	00 
   125bc:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   125c3:	e8 f4 e9 ff ff       	call   10fbc <Print>
   125c8:	eb fe                	jmp    125c8 <Add_Page_Range+0x5f>
   125ca:	89 d1                	mov    %edx,%ecx
   125cc:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
   125d2:	39 ca                	cmp    %ecx,%edx
   125d4:	74 4a                	je     12620 <Add_Page_Range+0xb7>
   125d6:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   125dd:	e8 11 eb ff ff       	call   110f3 <Set_Current_Attr>
   125e2:	a1 d0 07 02 00       	mov    0x207d0,%eax
   125e7:	89 44 24 18          	mov    %eax,0x18(%esp)
   125eb:	8b 45 04             	mov    0x4(%ebp),%eax
   125ee:	89 44 24 14          	mov    %eax,0x14(%esp)
   125f2:	c7 44 24 10 40 00 00 	movl   $0x40,0x10(%esp)
   125f9:	00 
   125fa:	c7 44 24 0c 34 d2 01 	movl   $0x1d234,0xc(%esp)
   12601:	00 
   12602:	c7 44 24 08 8f d2 01 	movl   $0x1d28f,0x8(%esp)
   12609:	00 
   1260a:	c7 44 24 04 df d3 01 	movl   $0x1d3df,0x4(%esp)
   12611:	00 
   12612:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12619:	e8 9e e9 ff ff       	call   10fbc <Print>
   1261e:	eb fe                	jmp    1261e <Add_Page_Range+0xb5>
   12620:	89 c3                	mov    %eax,%ebx
   12622:	b9 c8 fb 01 00       	mov    $0x1fbc8,%ecx
   12627:	39 d0                	cmp    %edx,%eax
   12629:	72 4a                	jb     12675 <Add_Page_Range+0x10c>
   1262b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12632:	e8 bc ea ff ff       	call   110f3 <Set_Current_Attr>
   12637:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1263c:	89 44 24 18          	mov    %eax,0x18(%esp)
   12640:	8b 45 04             	mov    0x4(%ebp),%eax
   12643:	89 44 24 14          	mov    %eax,0x14(%esp)
   12647:	c7 44 24 10 41 00 00 	movl   $0x41,0x10(%esp)
   1264e:	00 
   1264f:	c7 44 24 0c 34 d2 01 	movl   $0x1d234,0xc(%esp)
   12656:	00 
   12657:	c7 44 24 08 a5 d2 01 	movl   $0x1d2a5,0x8(%esp)
   1265e:	00 
   1265f:	c7 44 24 04 df d3 01 	movl   $0x1d3df,0x4(%esp)
   12666:	00 
   12667:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1266e:	e8 49 e9 ff ff       	call   10fbc <Print>
   12673:	eb fe                	jmp    12673 <Add_Page_Range+0x10a>
   12675:	89 d8                	mov    %ebx,%eax
   12677:	c1 e8 0c             	shr    $0xc,%eax
   1267a:	6b c0 0c             	imul   $0xc,%eax,%eax
   1267d:	03 05 c4 07 02 00    	add    0x207c4,%eax
   12683:	89 30                	mov    %esi,(%eax)
   12685:	85 f6                	test   %esi,%esi
   12687:	0f 85 8b 00 00 00    	jne    12718 <Add_Page_Range+0x1af>
   1268d:	bf c4 fb 01 00       	mov    $0x1fbc4,%edi
   12692:	8b 3f                	mov    (%edi),%edi
   12694:	89 7d e4             	mov    %edi,-0x1c(%ebp)
   12697:	eb 07                	jmp    126a0 <Add_Page_Range+0x137>
   12699:	39 f8                	cmp    %edi,%eax
   1269b:	74 0c                	je     126a9 <Add_Page_Range+0x140>
   1269d:	8b 7f 08             	mov    0x8(%edi),%edi
   126a0:	85 ff                	test   %edi,%edi
   126a2:	75 f5                	jne    12699 <Add_Page_Range+0x130>
   126a4:	e9 8d 00 00 00       	jmp    12736 <Add_Page_Range+0x1cd>
   126a9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   126b0:	e8 3e ea ff ff       	call   110f3 <Set_Current_Attr>
   126b5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   126ba:	89 44 24 18          	mov    %eax,0x18(%esp)
   126be:	8b 45 04             	mov    0x4(%ebp),%eax
   126c1:	89 44 24 14          	mov    %eax,0x14(%esp)
   126c5:	c7 44 24 10 3f 00 00 	movl   $0x3f,0x10(%esp)
   126cc:	00 
   126cd:	c7 44 24 0c 5f d2 01 	movl   $0x1d25f,0xc(%esp)
   126d4:	00 
   126d5:	c7 44 24 08 f0 d2 01 	movl   $0x1d2f0,0x8(%esp)
   126dc:	00 
   126dd:	c7 44 24 04 a3 d3 01 	movl   $0x1d3a3,0x4(%esp)
   126e4:	00 
   126e5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   126ec:	e8 cb e8 ff ff       	call   10fbc <Print>
   126f1:	eb fe                	jmp    126f1 <Add_Page_Range+0x188>
   126f3:	89 01                	mov    %eax,(%ecx)
   126f5:	bf c4 fb 01 00       	mov    $0x1fbc4,%edi
   126fa:	89 07                	mov    %eax,(%edi)
   126fc:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   12703:	eb 0a                	jmp    1270f <Add_Page_Range+0x1a6>
   12705:	89 47 08             	mov    %eax,0x8(%edi)
   12708:	8b 39                	mov    (%ecx),%edi
   1270a:	89 78 04             	mov    %edi,0x4(%eax)
   1270d:	89 01                	mov    %eax,(%ecx)
   1270f:	83 05 c0 fb 01 00 01 	addl   $0x1,0x1fbc0
   12716:	eb 0e                	jmp    12726 <Add_Page_Range+0x1bd>
   12718:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
   1271f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   12726:	81 c3 00 10 00 00    	add    $0x1000,%ebx
   1272c:	39 da                	cmp    %ebx,%edx
   1272e:	0f 87 41 ff ff ff    	ja     12675 <Add_Page_Range+0x10c>
   12734:	eb 0f                	jmp    12745 <Add_Page_Range+0x1dc>
   12736:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
   1273d:	8b 39                	mov    (%ecx),%edi
   1273f:	85 ff                	test   %edi,%edi
   12741:	75 c2                	jne    12705 <Add_Page_Range+0x19c>
   12743:	eb ae                	jmp    126f3 <Add_Page_Range+0x18a>
   12745:	83 c4 3c             	add    $0x3c,%esp
   12748:	5b                   	pop    %ebx
   12749:	5e                   	pop    %esi
   1274a:	5f                   	pop    %edi
   1274b:	5d                   	pop    %ebp
   1274c:	c3                   	ret    

0001274d <Init_Mem>:
   1274d:	55                   	push   %ebp
   1274e:	89 e5                	mov    %esp,%ebp
   12750:	57                   	push   %edi
   12751:	56                   	push   %esi
   12752:	53                   	push   %ebx
   12753:	83 ec 2c             	sub    $0x2c,%esp
   12756:	8b 7d 08             	mov    0x8(%ebp),%edi
   12759:	8b 77 04             	mov    0x4(%edi),%esi
   1275c:	85 f6                	test   %esi,%esi
   1275e:	7f 4a                	jg     127aa <Init_Mem+0x5d>
   12760:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12767:	e8 87 e9 ff ff       	call   110f3 <Set_Current_Attr>
   1276c:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12771:	89 44 24 18          	mov    %eax,0x18(%esp)
   12775:	8b 45 04             	mov    0x4(%ebp),%eax
   12778:	89 44 24 14          	mov    %eax,0x14(%esp)
   1277c:	c7 44 24 10 6c 00 00 	movl   $0x6c,0x10(%esp)
   12783:	00 
   12784:	c7 44 24 0c 34 d2 01 	movl   $0x1d234,0xc(%esp)
   1278b:	00 
   1278c:	c7 44 24 08 b1 d2 01 	movl   $0x1d2b1,0x8(%esp)
   12793:	00 
   12794:	c7 44 24 04 d6 d3 01 	movl   $0x1d3d6,0x4(%esp)
   1279b:	00 
   1279c:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   127a3:	e8 14 e8 ff ff       	call   10fbc <Print>
   127a8:	eb fe                	jmp    127a8 <Init_Mem+0x5b>
   127aa:	e8 ee 06 00 00       	call   12e9d <Init_GDT>
   127af:	b8 f0 07 02 00       	mov    $0x207f0,%eax
   127b4:	a9 ff 0f 00 00       	test   $0xfff,%eax
   127b9:	74 0a                	je     127c5 <Init_Mem+0x78>
   127bb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
   127c0:	05 00 10 00 00       	add    $0x1000,%eax
   127c5:	c1 fe 02             	sar    $0x2,%esi
   127c8:	a3 c4 07 02 00       	mov    %eax,0x207c4
   127cd:	6b de 0c             	imul   $0xc,%esi,%ebx
   127d0:	8d 1c 18             	lea    (%eax,%ebx,1),%ebx
   127d3:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
   127d9:	74 0c                	je     127e7 <Init_Mem+0x9a>
   127db:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
   127e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
   127e7:	89 35 c8 07 02 00    	mov    %esi,0x207c8
   127ed:	b9 08 00 00 00       	mov    $0x8,%ecx
   127f2:	ba 00 10 00 00       	mov    $0x1000,%edx
   127f7:	b8 00 00 00 00       	mov    $0x0,%eax
   127fc:	e8 68 fd ff ff       	call   12569 <Add_Page_Range>
   12801:	b9 00 00 00 00       	mov    $0x0,%ecx
   12806:	ba 00 00 01 00       	mov    $0x10000,%edx
   1280b:	b8 00 10 00 00       	mov    $0x1000,%eax
   12810:	e8 54 fd ff ff       	call   12569 <Add_Page_Range>
   12815:	b9 01 00 00 00       	mov    $0x1,%ecx
   1281a:	89 da                	mov    %ebx,%edx
   1281c:	b8 00 00 01 00       	mov    $0x10000,%eax
   12821:	e8 43 fd ff ff       	call   12569 <Add_Page_Range>
   12826:	b9 00 00 00 00       	mov    $0x0,%ecx
   1282b:	ba 00 00 0a 00       	mov    $0xa0000,%edx
   12830:	89 d8                	mov    %ebx,%eax
   12832:	e8 32 fd ff ff       	call   12569 <Add_Page_Range>
   12837:	b9 02 00 00 00       	mov    $0x2,%ecx
   1283c:	ba 00 00 10 00       	mov    $0x100000,%edx
   12841:	b8 00 00 0a 00       	mov    $0xa0000,%eax
   12846:	e8 1e fd ff ff       	call   12569 <Add_Page_Range>
   1284b:	b9 04 00 00 00       	mov    $0x4,%ecx
   12850:	ba 00 20 10 00       	mov    $0x102000,%edx
   12855:	b8 00 00 10 00       	mov    $0x100000,%eax
   1285a:	e8 0a fd ff ff       	call   12569 <Add_Page_Range>
   1285f:	b9 10 00 00 00       	mov    $0x10,%ecx
   12864:	ba 00 20 20 00       	mov    $0x202000,%edx
   12869:	b8 00 20 10 00       	mov    $0x102000,%eax
   1286e:	e8 f6 fc ff ff       	call   12569 <Add_Page_Range>
   12873:	89 f2                	mov    %esi,%edx
   12875:	c1 e2 0c             	shl    $0xc,%edx
   12878:	b9 00 00 00 00       	mov    $0x0,%ecx
   1287d:	b8 00 20 20 00       	mov    $0x202000,%eax
   12882:	e8 e2 fc ff ff       	call   12569 <Add_Page_Range>
   12887:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
   1288e:	00 
   1288f:	c7 04 24 00 20 10 00 	movl   $0x102000,(%esp)
   12896:	e8 52 15 00 00       	call   13ded <Init_Heap>
   1289b:	c7 44 24 0c 00 00 10 	movl   $0x100000,0xc(%esp)
   128a2:	00 
   128a3:	a1 c0 fb 01 00       	mov    0x1fbc0,%eax
   128a8:	89 44 24 08          	mov    %eax,0x8(%esp)
   128ac:	8b 47 04             	mov    0x4(%edi),%eax
   128af:	89 44 24 04          	mov    %eax,0x4(%esp)
   128b3:	c7 04 24 1c d3 01 00 	movl   $0x1d31c,(%esp)
   128ba:	e8 fd e6 ff ff       	call   10fbc <Print>
   128bf:	83 c4 2c             	add    $0x2c,%esp
   128c2:	5b                   	pop    %ebx
   128c3:	5e                   	pop    %esi
   128c4:	5f                   	pop    %edi
   128c5:	5d                   	pop    %ebp
   128c6:	c3                   	ret    

000128c7 <Alloc_Page>:
   128c7:	55                   	push   %ebp
   128c8:	89 e5                	mov    %esp,%ebp
   128ca:	56                   	push   %esi
   128cb:	53                   	push   %ebx
   128cc:	83 ec 20             	sub    $0x20,%esp
   128cf:	e8 7d da ff ff       	call   10351 <Interrupts_Enabled>
   128d4:	89 c3                	mov    %eax,%ebx
   128d6:	84 c0                	test   %al,%al
   128d8:	74 54                	je     1292e <Alloc_Page+0x67>
   128da:	e8 72 da ff ff       	call   10351 <Interrupts_Enabled>
   128df:	84 c0                	test   %al,%al
   128e1:	75 4a                	jne    1292d <Alloc_Page+0x66>
   128e3:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   128ea:	e8 04 e8 ff ff       	call   110f3 <Set_Current_Attr>
   128ef:	a1 d0 07 02 00       	mov    0x207d0,%eax
   128f4:	89 44 24 18          	mov    %eax,0x18(%esp)
   128f8:	8b 45 04             	mov    0x4(%ebp),%eax
   128fb:	89 44 24 14          	mov    %eax,0x14(%esp)
   128ff:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   12906:	00 
   12907:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   1290e:	00 
   1290f:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   12916:	00 
   12917:	c7 44 24 04 92 d3 01 	movl   $0x1d392,0x4(%esp)
   1291e:	00 
   1291f:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12926:	e8 91 e6 ff ff       	call   10fbc <Print>
   1292b:	eb fe                	jmp    1292b <Alloc_Page+0x64>
   1292d:	fa                   	cli    
   1292e:	a1 c4 fb 01 00       	mov    0x1fbc4,%eax
   12933:	be 00 00 00 00       	mov    $0x0,%esi
   12938:	85 c0                	test   %eax,%eax
   1293a:	0f 84 8d 00 00 00    	je     129cd <Alloc_Page+0x106>
   12940:	f6 00 04             	testb  $0x4,(%eax)
   12943:	74 4a                	je     1298f <Alloc_Page+0xc8>
   12945:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1294c:	e8 a2 e7 ff ff       	call   110f3 <Set_Current_Attr>
   12951:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12956:	89 44 24 18          	mov    %eax,0x18(%esp)
   1295a:	8b 45 04             	mov    0x4(%ebp),%eax
   1295d:	89 44 24 14          	mov    %eax,0x14(%esp)
   12961:	c7 44 24 10 bb 00 00 	movl   $0xbb,0x10(%esp)
   12968:	00 
   12969:	c7 44 24 0c 34 d2 01 	movl   $0x1d234,0xc(%esp)
   12970:	00 
   12971:	c7 44 24 08 64 d3 01 	movl   $0x1d364,0x8(%esp)
   12978:	00 
   12979:	c7 44 24 04 cb d3 01 	movl   $0x1d3cb,0x4(%esp)
   12980:	00 
   12981:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12988:	e8 2f e6 ff ff       	call   10fbc <Print>
   1298d:	eb fe                	jmp    1298d <Alloc_Page+0xc6>
   1298f:	8b 50 08             	mov    0x8(%eax),%edx
   12992:	89 15 c4 fb 01 00    	mov    %edx,0x1fbc4
   12998:	85 d2                	test   %edx,%edx
   1299a:	75 0c                	jne    129a8 <Alloc_Page+0xe1>
   1299c:	c7 05 c8 fb 01 00 00 	movl   $0x0,0x1fbc8
   129a3:	00 00 00 
   129a6:	eb 07                	jmp    129af <Alloc_Page+0xe8>
   129a8:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
   129af:	83 08 04             	orl    $0x4,(%eax)
   129b2:	83 2d c0 fb 01 00 01 	subl   $0x1,0x1fbc0
   129b9:	2b 05 c4 07 02 00    	sub    0x207c4,%eax
   129bf:	89 c6                	mov    %eax,%esi
   129c1:	c1 fe 02             	sar    $0x2,%esi
   129c4:	69 f6 ab aa aa aa    	imul   $0xaaaaaaab,%esi,%esi
   129ca:	c1 e6 0c             	shl    $0xc,%esi
   129cd:	e8 7f d9 ff ff       	call   10351 <Interrupts_Enabled>
   129d2:	84 c0                	test   %al,%al
   129d4:	74 4a                	je     12a20 <Alloc_Page+0x159>
   129d6:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   129dd:	e8 11 e7 ff ff       	call   110f3 <Set_Current_Attr>
   129e2:	a1 d0 07 02 00       	mov    0x207d0,%eax
   129e7:	89 44 24 18          	mov    %eax,0x18(%esp)
   129eb:	8b 45 04             	mov    0x4(%ebp),%eax
   129ee:	89 44 24 14          	mov    %eax,0x14(%esp)
   129f2:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   129f9:	00 
   129fa:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   12a01:	00 
   12a02:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   12a09:	00 
   12a0a:	c7 44 24 04 bc d3 01 	movl   $0x1d3bc,0x4(%esp)
   12a11:	00 
   12a12:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12a19:	e8 9e e5 ff ff       	call   10fbc <Print>
   12a1e:	eb fe                	jmp    12a1e <Alloc_Page+0x157>
   12a20:	84 db                	test   %bl,%bl
   12a22:	74 59                	je     12a7d <Alloc_Page+0x1b6>
   12a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   12a28:	e8 24 d9 ff ff       	call   10351 <Interrupts_Enabled>
   12a2d:	84 c0                	test   %al,%al
   12a2f:	90                   	nop
   12a30:	74 4a                	je     12a7c <Alloc_Page+0x1b5>
   12a32:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12a39:	e8 b5 e6 ff ff       	call   110f3 <Set_Current_Attr>
   12a3e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12a43:	89 44 24 18          	mov    %eax,0x18(%esp)
   12a47:	8b 45 04             	mov    0x4(%ebp),%eax
   12a4a:	89 44 24 14          	mov    %eax,0x14(%esp)
   12a4e:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   12a55:	00 
   12a56:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   12a5d:	00 
   12a5e:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   12a65:	00 
   12a66:	c7 44 24 04 bc d3 01 	movl   $0x1d3bc,0x4(%esp)
   12a6d:	00 
   12a6e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12a75:	e8 42 e5 ff ff       	call   10fbc <Print>
   12a7a:	eb fe                	jmp    12a7a <Alloc_Page+0x1b3>
   12a7c:	fb                   	sti    
   12a7d:	89 f0                	mov    %esi,%eax
   12a7f:	83 c4 20             	add    $0x20,%esp
   12a82:	5b                   	pop    %ebx
   12a83:	5e                   	pop    %esi
   12a84:	5d                   	pop    %ebp
   12a85:	c3                   	ret    
   12a86:	90                   	nop
   12a87:	90                   	nop

00012a88 <Init_CRC32>:
   12a88:	55                   	push   %ebp
   12a89:	89 e5                	mov    %esp,%ebp
   12a8b:	57                   	push   %edi
   12a8c:	56                   	push   %esi
   12a8d:	53                   	push   %ebx
   12a8e:	83 ec 0c             	sub    $0xc,%esp
   12a91:	c7 05 e0 fb 01 00 00 	movl   $0x0,0x1fbe0
   12a98:	00 00 00 
   12a9b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   12aa2:	c7 45 ec 80 00 00 00 	movl   $0x80,-0x14(%ebp)
   12aa9:	bb 00 00 00 00       	mov    $0x0,%ebx
   12aae:	b8 20 83 b8 ed       	mov    $0xedb88320,%eax
   12ab3:	bf e0 fb 01 00       	mov    $0x1fbe0,%edi
   12ab8:	eb 12                	jmp    12acc <Init_CRC32+0x44>
   12aba:	89 d8                	mov    %ebx,%eax
   12abc:	83 e0 01             	and    $0x1,%eax
   12abf:	f7 d8                	neg    %eax
   12ac1:	25 20 83 b8 ed       	and    $0xedb88320,%eax
   12ac6:	d1 eb                	shr    %ebx
   12ac8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
   12acc:	31 c3                	xor    %eax,%ebx
   12ace:	8b 75 ec             	mov    -0x14(%ebp),%esi
   12ad1:	01 f6                	add    %esi,%esi
   12ad3:	8b 45 ec             	mov    -0x14(%ebp),%eax
   12ad6:	c1 e0 03             	shl    $0x3,%eax
   12ad9:	89 45 f0             	mov    %eax,-0x10(%ebp)
   12adc:	8b 45 ec             	mov    -0x14(%ebp),%eax
   12adf:	8d 14 85 e0 fb 01 00 	lea    0x1fbe0(,%eax,4),%edx
   12ae6:	b8 00 00 00 00       	mov    $0x0,%eax
   12aeb:	89 d9                	mov    %ebx,%ecx
   12aed:	33 0c 87             	xor    (%edi,%eax,4),%ecx
   12af0:	89 0a                	mov    %ecx,(%edx)
   12af2:	01 f0                	add    %esi,%eax
   12af4:	03 55 f0             	add    -0x10(%ebp),%edx
   12af7:	3d ff 00 00 00       	cmp    $0xff,%eax
   12afc:	76 ed                	jbe    12aeb <Init_CRC32+0x63>
   12afe:	d1 6d ec             	shrl   -0x14(%ebp)
   12b01:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
   12b05:	75 b3                	jne    12aba <Init_CRC32+0x32>
   12b07:	83 c4 0c             	add    $0xc,%esp
   12b0a:	5b                   	pop    %ebx
   12b0b:	5e                   	pop    %esi
   12b0c:	5f                   	pop    %edi
   12b0d:	5d                   	pop    %ebp
   12b0e:	c3                   	ret    

00012b0f <crc32>:
   12b0f:	55                   	push   %ebp
   12b10:	89 e5                	mov    %esp,%ebp
   12b12:	57                   	push   %edi
   12b13:	56                   	push   %esi
   12b14:	53                   	push   %ebx
   12b15:	83 ec 2c             	sub    $0x2c,%esp
   12b18:	8b 7d 0c             	mov    0xc(%ebp),%edi
   12b1b:	8b 4d 10             	mov    0x10(%ebp),%ecx
   12b1e:	83 3d dc ff 01 00 00 	cmpl   $0x0,0x1ffdc
   12b25:	75 4a                	jne    12b71 <crc32+0x62>
   12b27:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12b2e:	e8 c0 e5 ff ff       	call   110f3 <Set_Current_Attr>
   12b33:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12b38:	89 44 24 18          	mov    %eax,0x18(%esp)
   12b3c:	8b 45 04             	mov    0x4(%ebp),%eax
   12b3f:	89 44 24 14          	mov    %eax,0x14(%esp)
   12b43:	c7 44 24 10 2b 00 00 	movl   $0x2b,0x10(%esp)
   12b4a:	00 
   12b4b:	c7 44 24 0c ee d3 01 	movl   $0x1d3ee,0xc(%esp)
   12b52:	00 
   12b53:	c7 44 24 08 04 d4 01 	movl   $0x1d404,0x8(%esp)
   12b5a:	00 
   12b5b:	c7 44 24 04 18 d4 01 	movl   $0x1d418,0x4(%esp)
   12b62:	00 
   12b63:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12b6a:	e8 4d e4 ff ff       	call   10fbc <Print>
   12b6f:	eb fe                	jmp    12b6f <crc32+0x60>
   12b71:	8b 55 08             	mov    0x8(%ebp),%edx
   12b74:	f7 d2                	not    %edx
   12b76:	85 c9                	test   %ecx,%ecx
   12b78:	74 21                	je     12b9b <crc32+0x8c>
   12b7a:	b8 00 00 00 00       	mov    $0x0,%eax
   12b7f:	be e0 fb 01 00       	mov    $0x1fbe0,%esi
   12b84:	89 d3                	mov    %edx,%ebx
   12b86:	c1 eb 08             	shr    $0x8,%ebx
   12b89:	32 14 07             	xor    (%edi,%eax,1),%dl
   12b8c:	0f b6 d2             	movzbl %dl,%edx
   12b8f:	8b 14 96             	mov    (%esi,%edx,4),%edx
   12b92:	31 da                	xor    %ebx,%edx
   12b94:	83 c0 01             	add    $0x1,%eax
   12b97:	39 c8                	cmp    %ecx,%eax
   12b99:	75 e9                	jne    12b84 <crc32+0x75>
   12b9b:	89 d0                	mov    %edx,%eax
   12b9d:	f7 d0                	not    %eax
   12b9f:	83 c4 2c             	add    $0x2c,%esp
   12ba2:	5b                   	pop    %ebx
   12ba3:	5e                   	pop    %esi
   12ba4:	5f                   	pop    %edi
   12ba5:	5d                   	pop    %ebp
   12ba6:	c3                   	ret    
   12ba7:	90                   	nop
   12ba8:	90                   	nop
   12ba9:	90                   	nop
   12baa:	90                   	nop
   12bab:	90                   	nop
   12bac:	90                   	nop
   12bad:	90                   	nop
   12bae:	90                   	nop
   12baf:	90                   	nop

00012bb0 <Get_Descriptor_Index>:
   12bb0:	55                   	push   %ebp
   12bb1:	89 e5                	mov    %esp,%ebp
   12bb3:	8b 45 08             	mov    0x8(%ebp),%eax
   12bb6:	2d 00 00 02 00       	sub    $0x20000,%eax
   12bbb:	c1 f8 03             	sar    $0x3,%eax
   12bbe:	5d                   	pop    %ebp
   12bbf:	c3                   	ret    

00012bc0 <Free_Segment_Descriptor>:
   12bc0:	55                   	push   %ebp
   12bc1:	89 e5                	mov    %esp,%ebp
   12bc3:	53                   	push   %ebx
   12bc4:	83 ec 34             	sub    $0x34,%esp
   12bc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
   12bca:	e8 82 d7 ff ff       	call   10351 <Interrupts_Enabled>
   12bcf:	88 45 f7             	mov    %al,-0x9(%ebp)
   12bd2:	84 c0                	test   %al,%al
   12bd4:	74 54                	je     12c2a <Free_Segment_Descriptor+0x6a>
   12bd6:	e8 76 d7 ff ff       	call   10351 <Interrupts_Enabled>
   12bdb:	84 c0                	test   %al,%al
   12bdd:	75 4a                	jne    12c29 <Free_Segment_Descriptor+0x69>
   12bdf:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12be6:	e8 08 e5 ff ff       	call   110f3 <Set_Current_Attr>
   12beb:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12bf0:	89 44 24 18          	mov    %eax,0x18(%esp)
   12bf4:	8b 45 04             	mov    0x4(%ebp),%eax
   12bf7:	89 44 24 14          	mov    %eax,0x14(%esp)
   12bfb:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   12c02:	00 
   12c03:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   12c0a:	00 
   12c0b:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   12c12:	00 
   12c13:	c7 44 24 04 c0 d4 01 	movl   $0x1d4c0,0x4(%esp)
   12c1a:	00 
   12c1b:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12c22:	e8 95 e3 ff ff       	call   10fbc <Print>
   12c27:	eb fe                	jmp    12c27 <Free_Segment_Descriptor+0x67>
   12c29:	fa                   	cli    
   12c2a:	f6 43 06 10          	testb  $0x10,0x6(%ebx)
   12c2e:	74 4a                	je     12c7a <Free_Segment_Descriptor+0xba>
   12c30:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12c37:	e8 b7 e4 ff ff       	call   110f3 <Set_Current_Attr>
   12c3c:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12c41:	89 44 24 18          	mov    %eax,0x18(%esp)
   12c45:	8b 45 04             	mov    0x4(%ebp),%eax
   12c48:	89 44 24 14          	mov    %eax,0x14(%esp)
   12c4c:	c7 44 24 10 4f 00 00 	movl   $0x4f,0x10(%esp)
   12c53:	00 
   12c54:	c7 44 24 0c 1e d4 01 	movl   $0x1d41e,0xc(%esp)
   12c5b:	00 
   12c5c:	c7 44 24 08 32 d4 01 	movl   $0x1d432,0x8(%esp)
   12c63:	00 
   12c64:	c7 44 24 04 a8 d4 01 	movl   $0x1d4a8,0x4(%esp)
   12c6b:	00 
   12c6c:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12c73:	e8 44 e3 ff ff       	call   10fbc <Print>
   12c78:	eb fe                	jmp    12c78 <Free_Segment_Descriptor+0xb8>
   12c7a:	89 1c 24             	mov    %ebx,(%esp)
   12c7d:	e8 42 06 00 00       	call   132c4 <Init_Null_Segment_Descriptor>
   12c82:	80 4b 06 10          	orb    $0x10,0x6(%ebx)
   12c86:	83 2d e0 ff 01 00 01 	subl   $0x1,0x1ffe0
   12c8d:	e8 bf d6 ff ff       	call   10351 <Interrupts_Enabled>
   12c92:	84 c0                	test   %al,%al
   12c94:	74 4a                	je     12ce0 <Free_Segment_Descriptor+0x120>
   12c96:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12c9d:	e8 51 e4 ff ff       	call   110f3 <Set_Current_Attr>
   12ca2:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12ca7:	89 44 24 18          	mov    %eax,0x18(%esp)
   12cab:	8b 45 04             	mov    0x4(%ebp),%eax
   12cae:	89 44 24 14          	mov    %eax,0x14(%esp)
   12cb2:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   12cb9:	00 
   12cba:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   12cc1:	00 
   12cc2:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   12cc9:	00 
   12cca:	c7 44 24 04 d1 d4 01 	movl   $0x1d4d1,0x4(%esp)
   12cd1:	00 
   12cd2:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12cd9:	e8 de e2 ff ff       	call   10fbc <Print>
   12cde:	eb fe                	jmp    12cde <Free_Segment_Descriptor+0x11e>
   12ce0:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
   12ce4:	74 57                	je     12d3d <Free_Segment_Descriptor+0x17d>
   12ce6:	66 90                	xchg   %ax,%ax
   12ce8:	e8 64 d6 ff ff       	call   10351 <Interrupts_Enabled>
   12ced:	84 c0                	test   %al,%al
   12cef:	90                   	nop
   12cf0:	74 4a                	je     12d3c <Free_Segment_Descriptor+0x17c>
   12cf2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12cf9:	e8 f5 e3 ff ff       	call   110f3 <Set_Current_Attr>
   12cfe:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12d03:	89 44 24 18          	mov    %eax,0x18(%esp)
   12d07:	8b 45 04             	mov    0x4(%ebp),%eax
   12d0a:	89 44 24 14          	mov    %eax,0x14(%esp)
   12d0e:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   12d15:	00 
   12d16:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   12d1d:	00 
   12d1e:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   12d25:	00 
   12d26:	c7 44 24 04 d1 d4 01 	movl   $0x1d4d1,0x4(%esp)
   12d2d:	00 
   12d2e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12d35:	e8 82 e2 ff ff       	call   10fbc <Print>
   12d3a:	eb fe                	jmp    12d3a <Free_Segment_Descriptor+0x17a>
   12d3c:	fb                   	sti    
   12d3d:	83 c4 34             	add    $0x34,%esp
   12d40:	5b                   	pop    %ebx
   12d41:	5d                   	pop    %ebp
   12d42:	c3                   	ret    

00012d43 <Allocate_Segment_Descriptor>:
   12d43:	55                   	push   %ebp
   12d44:	89 e5                	mov    %esp,%ebp
   12d46:	56                   	push   %esi
   12d47:	53                   	push   %ebx
   12d48:	83 ec 20             	sub    $0x20,%esp
   12d4b:	e8 01 d6 ff ff       	call   10351 <Interrupts_Enabled>
   12d50:	89 c3                	mov    %eax,%ebx
   12d52:	84 c0                	test   %al,%al
   12d54:	74 54                	je     12daa <Allocate_Segment_Descriptor+0x67>
   12d56:	e8 f6 d5 ff ff       	call   10351 <Interrupts_Enabled>
   12d5b:	84 c0                	test   %al,%al
   12d5d:	75 4a                	jne    12da9 <Allocate_Segment_Descriptor+0x66>
   12d5f:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12d66:	e8 88 e3 ff ff       	call   110f3 <Set_Current_Attr>
   12d6b:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12d70:	89 44 24 18          	mov    %eax,0x18(%esp)
   12d74:	8b 45 04             	mov    0x4(%ebp),%eax
   12d77:	89 44 24 14          	mov    %eax,0x14(%esp)
   12d7b:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   12d82:	00 
   12d83:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   12d8a:	00 
   12d8b:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   12d92:	00 
   12d93:	c7 44 24 04 c0 d4 01 	movl   $0x1d4c0,0x4(%esp)
   12d9a:	00 
   12d9b:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12da2:	e8 15 e2 ff ff       	call   10fbc <Print>
   12da7:	eb fe                	jmp    12da7 <Allocate_Segment_Descriptor+0x64>
   12da9:	fa                   	cli    
   12daa:	be 08 00 02 00       	mov    $0x20008,%esi
   12daf:	f6 05 0e 00 02 00 10 	testb  $0x10,0x2000e
   12db6:	75 12                	jne    12dca <Allocate_Segment_Descriptor+0x87>
   12db8:	b8 10 00 02 00       	mov    $0x20010,%eax
   12dbd:	ba 80 00 02 00       	mov    $0x20080,%edx
   12dc2:	89 c6                	mov    %eax,%esi
   12dc4:	f6 40 06 10          	testb  $0x10,0x6(%eax)
   12dc8:	74 0d                	je     12dd7 <Allocate_Segment_Descriptor+0x94>
   12dca:	83 05 e0 ff 01 00 01 	addl   $0x1,0x1ffe0
   12dd1:	80 66 06 ef          	andb   $0xef,0x6(%esi)
   12dd5:	eb 0c                	jmp    12de3 <Allocate_Segment_Descriptor+0xa0>
   12dd7:	83 c0 08             	add    $0x8,%eax
   12dda:	39 d0                	cmp    %edx,%eax
   12ddc:	75 e4                	jne    12dc2 <Allocate_Segment_Descriptor+0x7f>
   12dde:	be 00 00 00 00       	mov    $0x0,%esi
   12de3:	e8 69 d5 ff ff       	call   10351 <Interrupts_Enabled>
   12de8:	84 c0                	test   %al,%al
   12dea:	74 4a                	je     12e36 <Allocate_Segment_Descriptor+0xf3>
   12dec:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12df3:	e8 fb e2 ff ff       	call   110f3 <Set_Current_Attr>
   12df8:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12dfd:	89 44 24 18          	mov    %eax,0x18(%esp)
   12e01:	8b 45 04             	mov    0x4(%ebp),%eax
   12e04:	89 44 24 14          	mov    %eax,0x14(%esp)
   12e08:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   12e0f:	00 
   12e10:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   12e17:	00 
   12e18:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   12e1f:	00 
   12e20:	c7 44 24 04 d1 d4 01 	movl   $0x1d4d1,0x4(%esp)
   12e27:	00 
   12e28:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12e2f:	e8 88 e1 ff ff       	call   10fbc <Print>
   12e34:	eb fe                	jmp    12e34 <Allocate_Segment_Descriptor+0xf1>
   12e36:	84 db                	test   %bl,%bl
   12e38:	74 5a                	je     12e94 <Allocate_Segment_Descriptor+0x151>
   12e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   12e40:	e8 0c d5 ff ff       	call   10351 <Interrupts_Enabled>
   12e45:	84 c0                	test   %al,%al
   12e47:	74 4a                	je     12e93 <Allocate_Segment_Descriptor+0x150>
   12e49:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12e50:	e8 9e e2 ff ff       	call   110f3 <Set_Current_Attr>
   12e55:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12e5a:	89 44 24 18          	mov    %eax,0x18(%esp)
   12e5e:	8b 45 04             	mov    0x4(%ebp),%eax
   12e61:	89 44 24 14          	mov    %eax,0x14(%esp)
   12e65:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   12e6c:	00 
   12e6d:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   12e74:	00 
   12e75:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   12e7c:	00 
   12e7d:	c7 44 24 04 d1 d4 01 	movl   $0x1d4d1,0x4(%esp)
   12e84:	00 
   12e85:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12e8c:	e8 2b e1 ff ff       	call   10fbc <Print>
   12e91:	eb fe                	jmp    12e91 <Allocate_Segment_Descriptor+0x14e>
   12e93:	fb                   	sti    
   12e94:	89 f0                	mov    %esi,%eax
   12e96:	83 c4 20             	add    $0x20,%esp
   12e99:	5b                   	pop    %ebx
   12e9a:	5e                   	pop    %esi
   12e9b:	5d                   	pop    %ebp
   12e9c:	c3                   	ret    

00012e9d <Init_GDT>:
   12e9d:	55                   	push   %ebp
   12e9e:	89 e5                	mov    %esp,%ebp
   12ea0:	57                   	push   %edi
   12ea1:	56                   	push   %esi
   12ea2:	53                   	push   %ebx
   12ea3:	83 ec 3c             	sub    $0x3c,%esp
   12ea6:	be 00 00 02 00       	mov    $0x20000,%esi
   12eab:	bf 80 00 02 00       	mov    $0x20080,%edi
   12eb0:	89 f3                	mov    %esi,%ebx
   12eb2:	89 1c 24             	mov    %ebx,(%esp)
   12eb5:	e8 0a 04 00 00       	call   132c4 <Init_Null_Segment_Descriptor>
   12eba:	80 4b 06 10          	orb    $0x10,0x6(%ebx)
   12ebe:	83 c3 08             	add    $0x8,%ebx
   12ec1:	39 fb                	cmp    %edi,%ebx
   12ec3:	75 ed                	jne    12eb2 <Init_GDT+0x15>
   12ec5:	e8 79 fe ff ff       	call   12d43 <Allocate_Segment_Descriptor>
   12eca:	89 c3                	mov    %eax,%ebx
   12ecc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
   12ed3:	00 
   12ed4:	c7 44 24 08 00 00 10 	movl   $0x100000,0x8(%esp)
   12edb:	00 
   12edc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   12ee3:	00 
   12ee4:	89 04 24             	mov    %eax,(%esp)
   12ee7:	e8 ed 03 00 00       	call   132d9 <Init_Code_Segment_Descriptor>
   12eec:	89 1c 24             	mov    %ebx,(%esp)
   12eef:	e8 bc fc ff ff       	call   12bb0 <Get_Descriptor_Index>
   12ef4:	83 f8 01             	cmp    $0x1,%eax
   12ef7:	74 4a                	je     12f43 <Init_GDT+0xa6>
   12ef9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12f00:	e8 ee e1 ff ff       	call   110f3 <Set_Current_Attr>
   12f05:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12f0a:	89 44 24 18          	mov    %eax,0x18(%esp)
   12f0e:	8b 45 04             	mov    0x4(%ebp),%eax
   12f11:	89 44 24 14          	mov    %eax,0x14(%esp)
   12f15:	c7 44 24 10 7b 00 00 	movl   $0x7b,0x10(%esp)
   12f1c:	00 
   12f1d:	c7 44 24 0c 1e d4 01 	movl   $0x1d41e,0xc(%esp)
   12f24:	00 
   12f25:	c7 44 24 08 40 d4 01 	movl   $0x1d440,0x8(%esp)
   12f2c:	00 
   12f2d:	c7 44 24 04 9f d4 01 	movl   $0x1d49f,0x4(%esp)
   12f34:	00 
   12f35:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12f3c:	e8 7b e0 ff ff       	call   10fbc <Print>
   12f41:	eb fe                	jmp    12f41 <Init_GDT+0xa4>
   12f43:	e8 fb fd ff ff       	call   12d43 <Allocate_Segment_Descriptor>
   12f48:	89 c3                	mov    %eax,%ebx
   12f4a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
   12f51:	00 
   12f52:	c7 44 24 08 00 00 10 	movl   $0x100000,0x8(%esp)
   12f59:	00 
   12f5a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   12f61:	00 
   12f62:	89 04 24             	mov    %eax,(%esp)
   12f65:	e8 4c 02 00 00       	call   131b6 <Init_Data_Segment_Descriptor>
   12f6a:	89 1c 24             	mov    %ebx,(%esp)
   12f6d:	e8 3e fc ff ff       	call   12bb0 <Get_Descriptor_Index>
   12f72:	83 f8 02             	cmp    $0x2,%eax
   12f75:	74 4a                	je     12fc1 <Init_GDT+0x124>
   12f77:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   12f7e:	e8 70 e1 ff ff       	call   110f3 <Set_Current_Attr>
   12f83:	a1 d0 07 02 00       	mov    0x207d0,%eax
   12f88:	89 44 24 18          	mov    %eax,0x18(%esp)
   12f8c:	8b 45 04             	mov    0x4(%ebp),%eax
   12f8f:	89 44 24 14          	mov    %eax,0x14(%esp)
   12f93:	c7 44 24 10 85 00 00 	movl   $0x85,0x10(%esp)
   12f9a:	00 
   12f9b:	c7 44 24 0c 1e d4 01 	movl   $0x1d41e,0xc(%esp)
   12fa2:	00 
   12fa3:	c7 44 24 08 70 d4 01 	movl   $0x1d470,0x8(%esp)
   12faa:	00 
   12fab:	c7 44 24 04 9f d4 01 	movl   $0x1d49f,0x4(%esp)
   12fb2:	00 
   12fb3:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   12fba:	e8 fd df ff ff       	call   10fbc <Print>
   12fbf:	eb fe                	jmp    12fbf <Init_GDT+0x122>
   12fc1:	66 c7 45 e2 80 00    	movw   $0x80,-0x1e(%ebp)
   12fc7:	66 89 75 e4          	mov    %si,-0x1c(%ebp)
   12fcb:	c1 ee 10             	shr    $0x10,%esi
   12fce:	66 89 75 e6          	mov    %si,-0x1a(%ebp)
   12fd2:	8d 45 e2             	lea    -0x1e(%ebp),%eax
   12fd5:	89 04 24             	mov    %eax,(%esp)
   12fd8:	e8 7b 7d 00 00       	call   1ad58 <Load_GDTR>
   12fdd:	83 c4 3c             	add    $0x3c,%esp
   12fe0:	5b                   	pop    %ebx
   12fe1:	5e                   	pop    %esi
   12fe2:	5f                   	pop    %edi
   12fe3:	5d                   	pop    %ebp
   12fe4:	c3                   	ret    
   12fe5:	90                   	nop
   12fe6:	90                   	nop
   12fe7:	90                   	nop

00012fe8 <Set_Kernel_Stack_Pointer>:
   12fe8:	55                   	push   %ebp
   12fe9:	89 e5                	mov    %esp,%ebp
   12feb:	66 c7 05 88 00 02 00 	movw   $0x10,0x20088
   12ff2:	10 00 
   12ff4:	8b 45 08             	mov    0x8(%ebp),%eax
   12ff7:	a3 84 00 02 00       	mov    %eax,0x20084
   12ffc:	a1 e8 00 02 00       	mov    0x200e8,%eax
   13001:	0f b6 50 05          	movzbl 0x5(%eax),%edx
   13005:	83 e2 f0             	and    $0xfffffff0,%edx
   13008:	83 ca 09             	or     $0x9,%edx
   1300b:	88 50 05             	mov    %dl,0x5(%eax)
   1300e:	0f b7 05 ec 00 02 00 	movzwl 0x200ec,%eax
   13015:	0f 00 d8             	ltr    %ax
   13018:	5d                   	pop    %ebp
   13019:	c3                   	ret    

0001301a <Init_TSS>:
   1301a:	55                   	push   %ebp
   1301b:	89 e5                	mov    %esp,%ebp
   1301d:	57                   	push   %edi
   1301e:	83 ec 24             	sub    $0x24,%esp
   13021:	e8 1d fd ff ff       	call   12d43 <Allocate_Segment_Descriptor>
   13026:	a3 e8 00 02 00       	mov    %eax,0x200e8
   1302b:	85 c0                	test   %eax,%eax
   1302d:	75 4a                	jne    13079 <Init_TSS+0x5f>
   1302f:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13036:	e8 b8 e0 ff ff       	call   110f3 <Set_Current_Attr>
   1303b:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13040:	89 44 24 18          	mov    %eax,0x18(%esp)
   13044:	8b 45 04             	mov    0x4(%ebp),%eax
   13047:	89 44 24 14          	mov    %eax,0x14(%esp)
   1304b:	c7 44 24 10 31 00 00 	movl   $0x31,0x10(%esp)
   13052:	00 
   13053:	c7 44 24 0c e0 d4 01 	movl   $0x1d4e0,0xc(%esp)
   1305a:	00 
   1305b:	c7 44 24 08 f4 d4 01 	movl   $0x1d4f4,0x8(%esp)
   13062:	00 
   13063:	c7 44 24 04 03 d5 01 	movl   $0x1d503,0x4(%esp)
   1306a:	00 
   1306b:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13072:	e8 45 df ff ff       	call   10fbc <Print>
   13077:	eb fe                	jmp    13077 <Init_TSS+0x5d>
   13079:	ba 80 00 02 00       	mov    $0x20080,%edx
   1307e:	b9 1a 00 00 00       	mov    $0x1a,%ecx
   13083:	b8 00 00 00 00       	mov    $0x0,%eax
   13088:	89 d7                	mov    %edx,%edi
   1308a:	f3 ab                	rep stos %eax,%es:(%edi)
   1308c:	89 54 24 04          	mov    %edx,0x4(%esp)
   13090:	a1 e8 00 02 00       	mov    0x200e8,%eax
   13095:	89 04 24             	mov    %eax,(%esp)
   13098:	e8 33 00 00 00       	call   130d0 <Init_TSS_Descriptor>
   1309d:	a1 e8 00 02 00       	mov    0x200e8,%eax
   130a2:	89 04 24             	mov    %eax,(%esp)
   130a5:	e8 06 fb ff ff       	call   12bb0 <Get_Descriptor_Index>
   130aa:	c1 e0 03             	shl    $0x3,%eax
   130ad:	66 a3 ec 00 02 00    	mov    %ax,0x200ec
   130b3:	8b 15 e8 00 02 00    	mov    0x200e8,%edx
   130b9:	0f b6 4a 05          	movzbl 0x5(%edx),%ecx
   130bd:	83 e1 f0             	and    $0xfffffff0,%ecx
   130c0:	83 c9 09             	or     $0x9,%ecx
   130c3:	88 4a 05             	mov    %cl,0x5(%edx)
   130c6:	0f 00 d8             	ltr    %ax
   130c9:	83 c4 24             	add    $0x24,%esp
   130cc:	5f                   	pop    %edi
   130cd:	5d                   	pop    %ebp
   130ce:	c3                   	ret    
   130cf:	90                   	nop

000130d0 <Init_TSS_Descriptor>:
   130d0:	55                   	push   %ebp
   130d1:	89 e5                	mov    %esp,%ebp
   130d3:	83 ec 0c             	sub    $0xc,%esp
   130d6:	89 1c 24             	mov    %ebx,(%esp)
   130d9:	89 74 24 04          	mov    %esi,0x4(%esp)
   130dd:	89 7c 24 08          	mov    %edi,0x8(%esp)
   130e1:	8b 45 08             	mov    0x8(%ebp),%eax
   130e4:	8b 55 0c             	mov    0xc(%ebp),%edx
   130e7:	66 c7 00 68 00       	movw   $0x68,(%eax)
   130ec:	0f b6 78 06          	movzbl 0x6(%eax),%edi
   130f0:	89 d1                	mov    %edx,%ecx
   130f2:	81 e1 ff ff ff 00    	and    $0xffffff,%ecx
   130f8:	88 50 02             	mov    %dl,0x2(%eax)
   130fb:	0f b6 f5             	movzbl %ch,%esi
   130fe:	89 f3                	mov    %esi,%ebx
   13100:	88 58 03             	mov    %bl,0x3(%eax)
   13103:	c1 e9 10             	shr    $0x10,%ecx
   13106:	88 48 04             	mov    %cl,0x4(%eax)
   13109:	c1 ea 18             	shr    $0x18,%edx
   1310c:	88 50 07             	mov    %dl,0x7(%eax)
   1310f:	0f b6 50 05          	movzbl 0x5(%eax),%edx
   13113:	83 e2 f0             	and    $0xfffffff0,%edx
   13116:	83 ca 09             	or     $0x9,%edx
   13119:	83 e2 8f             	and    $0xffffff8f,%edx
   1311c:	83 ca 80             	or     $0xffffff80,%edx
   1311f:	88 50 05             	mov    %dl,0x5(%eax)
   13122:	89 fa                	mov    %edi,%edx
   13124:	83 e2 10             	and    $0x10,%edx
   13127:	88 50 06             	mov    %dl,0x6(%eax)
   1312a:	8b 1c 24             	mov    (%esp),%ebx
   1312d:	8b 74 24 04          	mov    0x4(%esp),%esi
   13131:	8b 7c 24 08          	mov    0x8(%esp),%edi
   13135:	89 ec                	mov    %ebp,%esp
   13137:	5d                   	pop    %ebp
   13138:	c3                   	ret    

00013139 <Init_LDT_Descriptor>:
   13139:	55                   	push   %ebp
   1313a:	89 e5                	mov    %esp,%ebp
   1313c:	83 ec 0c             	sub    $0xc,%esp
   1313f:	89 1c 24             	mov    %ebx,(%esp)
   13142:	89 74 24 04          	mov    %esi,0x4(%esp)
   13146:	89 7c 24 08          	mov    %edi,0x8(%esp)
   1314a:	8b 45 08             	mov    0x8(%ebp),%eax
   1314d:	8b 55 10             	mov    0x10(%ebp),%edx
   13150:	c1 e2 03             	shl    $0x3,%edx
   13153:	66 89 10             	mov    %dx,(%eax)
   13156:	c1 ea 10             	shr    $0x10,%edx
   13159:	0f b6 58 06          	movzbl 0x6(%eax),%ebx
   1315d:	83 e3 f0             	and    $0xfffffff0,%ebx
   13160:	89 de                	mov    %ebx,%esi
   13162:	83 e2 0f             	and    $0xf,%edx
   13165:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   13168:	81 e3 ff ff ff 00    	and    $0xffffff,%ebx
   1316e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
   13172:	88 48 02             	mov    %cl,0x2(%eax)
   13175:	0f b6 ff             	movzbl %bh,%edi
   13178:	89 f9                	mov    %edi,%ecx
   1317a:	88 48 03             	mov    %cl,0x3(%eax)
   1317d:	c1 eb 10             	shr    $0x10,%ebx
   13180:	88 58 04             	mov    %bl,0x4(%eax)
   13183:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   13186:	c1 e9 18             	shr    $0x18,%ecx
   13189:	88 48 07             	mov    %cl,0x7(%eax)
   1318c:	09 f2                	or     %esi,%edx
   1318e:	0f b6 48 05          	movzbl 0x5(%eax),%ecx
   13192:	83 e1 f0             	and    $0xfffffff0,%ecx
   13195:	83 c9 02             	or     $0x2,%ecx
   13198:	83 e1 8f             	and    $0xffffff8f,%ecx
   1319b:	83 c9 80             	or     $0xffffff80,%ecx
   1319e:	88 48 05             	mov    %cl,0x5(%eax)
   131a1:	83 e2 1f             	and    $0x1f,%edx
   131a4:	88 50 06             	mov    %dl,0x6(%eax)
   131a7:	8b 1c 24             	mov    (%esp),%ebx
   131aa:	8b 74 24 04          	mov    0x4(%esp),%esi
   131ae:	8b 7c 24 08          	mov    0x8(%esp),%edi
   131b2:	89 ec                	mov    %ebp,%esp
   131b4:	5d                   	pop    %ebp
   131b5:	c3                   	ret    

000131b6 <Init_Data_Segment_Descriptor>:
   131b6:	55                   	push   %ebp
   131b7:	89 e5                	mov    %esp,%ebp
   131b9:	53                   	push   %ebx
   131ba:	83 ec 34             	sub    $0x34,%esp
   131bd:	8b 45 08             	mov    0x8(%ebp),%eax
   131c0:	8b 55 0c             	mov    0xc(%ebp),%edx
   131c3:	8b 5d 10             	mov    0x10(%ebp),%ebx
   131c6:	83 7d 14 03          	cmpl   $0x3,0x14(%ebp)
   131ca:	76 4a                	jbe    13216 <Init_Data_Segment_Descriptor+0x60>
   131cc:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   131d3:	e8 1b df ff ff       	call   110f3 <Set_Current_Attr>
   131d8:	a1 d0 07 02 00       	mov    0x207d0,%eax
   131dd:	89 44 24 18          	mov    %eax,0x18(%esp)
   131e1:	8b 45 04             	mov    0x4(%ebp),%eax
   131e4:	89 44 24 14          	mov    %eax,0x14(%esp)
   131e8:	c7 44 24 10 5f 00 00 	movl   $0x5f,0x10(%esp)
   131ef:	00 
   131f0:	c7 44 24 0c 0c d5 01 	movl   $0x1d50c,0xc(%esp)
   131f7:	00 
   131f8:	c7 44 24 08 34 d5 01 	movl   $0x1d534,0x8(%esp)
   131ff:	00 
   13200:	c7 44 24 04 5f d5 01 	movl   $0x1d55f,0x4(%esp)
   13207:	00 
   13208:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1320f:	e8 a8 dd ff ff       	call   10fbc <Print>
   13214:	eb fe                	jmp    13214 <Init_Data_Segment_Descriptor+0x5e>
   13216:	85 db                	test   %ebx,%ebx
   13218:	75 51                	jne    1326b <Init_Data_Segment_Descriptor+0xb5>
   1321a:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   13228:	e8 c6 de ff ff       	call   110f3 <Set_Current_Attr>
   1322d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13232:	89 44 24 18          	mov    %eax,0x18(%esp)
   13236:	8b 45 04             	mov    0x4(%ebp),%eax
   13239:	89 44 24 14          	mov    %eax,0x14(%esp)
   1323d:	c7 44 24 10 21 00 00 	movl   $0x21,0x10(%esp)
   13244:	00 
   13245:	c7 44 24 0c 0c d5 01 	movl   $0x1d50c,0xc(%esp)
   1324c:	00 
   1324d:	c7 44 24 08 24 d5 01 	movl   $0x1d524,0x8(%esp)
   13254:	00 
   13255:	c7 44 24 04 7c d5 01 	movl   $0x1d57c,0x4(%esp)
   1325c:	00 
   1325d:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13264:	e8 53 dd ff ff       	call   10fbc <Print>
   13269:	eb fe                	jmp    13269 <Init_Data_Segment_Descriptor+0xb3>
   1326b:	83 eb 01             	sub    $0x1,%ebx
   1326e:	66 89 18             	mov    %bx,(%eax)
   13271:	c1 eb 10             	shr    $0x10,%ebx
   13274:	83 e3 0f             	and    $0xf,%ebx
   13277:	88 5d f7             	mov    %bl,-0x9(%ebp)
   1327a:	0f b6 58 06          	movzbl 0x6(%eax),%ebx
   1327e:	83 e3 10             	and    $0x10,%ebx
   13281:	88 5d f6             	mov    %bl,-0xa(%ebp)
   13284:	89 d3                	mov    %edx,%ebx
   13286:	81 e3 ff ff ff 00    	and    $0xffffff,%ebx
   1328c:	88 50 02             	mov    %dl,0x2(%eax)
   1328f:	0f b6 cf             	movzbl %bh,%ecx
   13292:	88 48 03             	mov    %cl,0x3(%eax)
   13295:	c1 eb 10             	shr    $0x10,%ebx
   13298:	88 58 04             	mov    %bl,0x4(%eax)
   1329b:	c1 ea 18             	shr    $0x18,%edx
   1329e:	88 50 07             	mov    %dl,0x7(%eax)
   132a1:	0f b6 55 14          	movzbl 0x14(%ebp),%edx
   132a5:	83 e2 03             	and    $0x3,%edx
   132a8:	c1 e2 05             	shl    $0x5,%edx
   132ab:	83 ca 92             	or     $0xffffff92,%edx
   132ae:	88 50 05             	mov    %dl,0x5(%eax)
   132b1:	0f b6 55 f6          	movzbl -0xa(%ebp),%edx
   132b5:	0a 55 f7             	or     -0x9(%ebp),%dl
   132b8:	83 ca c0             	or     $0xffffffc0,%edx
   132bb:	88 50 06             	mov    %dl,0x6(%eax)
   132be:	83 c4 34             	add    $0x34,%esp
   132c1:	5b                   	pop    %ebx
   132c2:	5d                   	pop    %ebp
   132c3:	c3                   	ret    

000132c4 <Init_Null_Segment_Descriptor>:
   132c4:	55                   	push   %ebp
   132c5:	89 e5                	mov    %esp,%ebp
   132c7:	8b 45 08             	mov    0x8(%ebp),%eax
   132ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   132d0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   132d7:	5d                   	pop    %ebp
   132d8:	c3                   	ret    

000132d9 <Init_Code_Segment_Descriptor>:
   132d9:	55                   	push   %ebp
   132da:	89 e5                	mov    %esp,%ebp
   132dc:	53                   	push   %ebx
   132dd:	83 ec 34             	sub    $0x34,%esp
   132e0:	8b 45 08             	mov    0x8(%ebp),%eax
   132e3:	8b 55 0c             	mov    0xc(%ebp),%edx
   132e6:	8b 5d 10             	mov    0x10(%ebp),%ebx
   132e9:	83 7d 14 03          	cmpl   $0x3,0x14(%ebp)
   132ed:	76 4a                	jbe    13339 <Init_Code_Segment_Descriptor+0x60>
   132ef:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   132f6:	e8 f8 dd ff ff       	call   110f3 <Set_Current_Attr>
   132fb:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13300:	89 44 24 18          	mov    %eax,0x18(%esp)
   13304:	8b 45 04             	mov    0x4(%ebp),%eax
   13307:	89 44 24 14          	mov    %eax,0x14(%esp)
   1330b:	c7 44 24 10 4a 00 00 	movl   $0x4a,0x10(%esp)
   13312:	00 
   13313:	c7 44 24 0c 0c d5 01 	movl   $0x1d50c,0xc(%esp)
   1331a:	00 
   1331b:	c7 44 24 08 34 d5 01 	movl   $0x1d534,0x8(%esp)
   13322:	00 
   13323:	c7 44 24 04 94 d5 01 	movl   $0x1d594,0x4(%esp)
   1332a:	00 
   1332b:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13332:	e8 85 dc ff ff       	call   10fbc <Print>
   13337:	eb fe                	jmp    13337 <Init_Code_Segment_Descriptor+0x5e>
   13339:	85 db                	test   %ebx,%ebx
   1333b:	75 4e                	jne    1338b <Init_Code_Segment_Descriptor+0xb2>
   1333d:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   13348:	e8 a6 dd ff ff       	call   110f3 <Set_Current_Attr>
   1334d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13352:	89 44 24 18          	mov    %eax,0x18(%esp)
   13356:	8b 45 04             	mov    0x4(%ebp),%eax
   13359:	89 44 24 14          	mov    %eax,0x14(%esp)
   1335d:	c7 44 24 10 21 00 00 	movl   $0x21,0x10(%esp)
   13364:	00 
   13365:	c7 44 24 0c 0c d5 01 	movl   $0x1d50c,0xc(%esp)
   1336c:	00 
   1336d:	c7 44 24 08 24 d5 01 	movl   $0x1d524,0x8(%esp)
   13374:	00 
   13375:	c7 44 24 04 7c d5 01 	movl   $0x1d57c,0x4(%esp)
   1337c:	00 
   1337d:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13384:	e8 33 dc ff ff       	call   10fbc <Print>
   13389:	eb fe                	jmp    13389 <Init_Code_Segment_Descriptor+0xb0>
   1338b:	83 eb 01             	sub    $0x1,%ebx
   1338e:	66 89 18             	mov    %bx,(%eax)
   13391:	c1 eb 10             	shr    $0x10,%ebx
   13394:	83 e3 0f             	and    $0xf,%ebx
   13397:	88 5d f7             	mov    %bl,-0x9(%ebp)
   1339a:	0f b6 58 06          	movzbl 0x6(%eax),%ebx
   1339e:	83 e3 10             	and    $0x10,%ebx
   133a1:	88 5d f6             	mov    %bl,-0xa(%ebp)
   133a4:	89 d3                	mov    %edx,%ebx
   133a6:	81 e3 ff ff ff 00    	and    $0xffffff,%ebx
   133ac:	88 50 02             	mov    %dl,0x2(%eax)
   133af:	0f b6 cf             	movzbl %bh,%ecx
   133b2:	88 48 03             	mov    %cl,0x3(%eax)
   133b5:	c1 eb 10             	shr    $0x10,%ebx
   133b8:	88 58 04             	mov    %bl,0x4(%eax)
   133bb:	c1 ea 18             	shr    $0x18,%edx
   133be:	88 50 07             	mov    %dl,0x7(%eax)
   133c1:	0f b6 55 14          	movzbl 0x14(%ebp),%edx
   133c5:	83 e2 03             	and    $0x3,%edx
   133c8:	c1 e2 05             	shl    $0x5,%edx
   133cb:	83 ca 9a             	or     $0xffffff9a,%edx
   133ce:	88 50 05             	mov    %dl,0x5(%eax)
   133d1:	0f b6 55 f6          	movzbl -0xa(%ebp),%edx
   133d5:	0a 55 f7             	or     -0x9(%ebp),%dl
   133d8:	83 ca c0             	or     $0xffffffc0,%edx
   133db:	88 50 06             	mov    %dl,0x6(%eax)
   133de:	83 c4 34             	add    $0x34,%esp
   133e1:	5b                   	pop    %ebx
   133e2:	5d                   	pop    %ebp
   133e3:	c3                   	ret    
   133e4:	90                   	nop
   133e5:	90                   	nop
   133e6:	90                   	nop
   133e7:	90                   	nop
   133e8:	90                   	nop
   133e9:	90                   	nop
   133ea:	90                   	nop
   133eb:	90                   	nop
   133ec:	90                   	nop
   133ed:	90                   	nop
   133ee:	90                   	nop
   133ef:	90                   	nop

000133f0 <bpool>:
   133f0:	55                   	push   %ebp
   133f1:	89 e5                	mov    %esp,%ebp
   133f3:	56                   	push   %esi
   133f4:	53                   	push   %ebx
   133f5:	83 ec 20             	sub    $0x20,%esp
   133f8:	8b 55 0c             	mov    0xc(%ebp),%edx
   133fb:	83 e2 fc             	and    $0xfffffffc,%edx
   133fe:	83 ea 08             	sub    $0x8,%edx
   13401:	85 d2                	test   %edx,%edx
   13403:	79 4a                	jns    1344f <bpool+0x5f>
   13405:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1340c:	e8 e2 dc ff ff       	call   110f3 <Set_Current_Attr>
   13411:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13416:	89 44 24 18          	mov    %eax,0x18(%esp)
   1341a:	8b 45 04             	mov    0x4(%ebp),%eax
   1341d:	89 44 24 14          	mov    %eax,0x14(%esp)
   13421:	c7 44 24 10 fa 03 00 	movl   $0x3fa,0x10(%esp)
   13428:	00 
   13429:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13430:	00 
   13431:	c7 44 24 08 bc d6 01 	movl   $0x1d6bc,0x8(%esp)
   13438:	00 
   13439:	c7 44 24 04 5a d8 01 	movl   $0x1d85a,0x4(%esp)
   13440:	00 
   13441:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13448:	e8 6f db ff ff       	call   10fbc <Print>
   1344d:	eb fe                	jmp    1344d <bpool+0x5d>
   1344f:	8b 45 08             	mov    0x8(%ebp),%eax
   13452:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   13458:	8b 1d 1c f0 01 00    	mov    0x1f01c,%ebx
   1345e:	81 7b 08 10 f0 01 00 	cmpl   $0x1f010,0x8(%ebx)
   13465:	74 4a                	je     134b1 <bpool+0xc1>
   13467:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1346e:	e8 80 dc ff ff       	call   110f3 <Set_Current_Attr>
   13473:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13478:	89 44 24 18          	mov    %eax,0x18(%esp)
   1347c:	8b 45 04             	mov    0x4(%ebp),%eax
   1347f:	89 44 24 14          	mov    %eax,0x14(%esp)
   13483:	c7 44 24 10 04 04 00 	movl   $0x404,0x10(%esp)
   1348a:	00 
   1348b:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13492:	00 
   13493:	c7 44 24 08 2c d7 01 	movl   $0x1d72c,0x8(%esp)
   1349a:	00 
   1349b:	c7 44 24 04 5a d8 01 	movl   $0x1d85a,0x4(%esp)
   134a2:	00 
   134a3:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   134aa:	e8 0d db ff ff       	call   10fbc <Print>
   134af:	eb fe                	jmp    134af <bpool+0xbf>
   134b1:	8b 1d 18 f0 01 00    	mov    0x1f018,%ebx
   134b7:	81 7b 0c 10 f0 01 00 	cmpl   $0x1f010,0xc(%ebx)
   134be:	74 4a                	je     1350a <bpool+0x11a>
   134c0:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   134c7:	e8 27 dc ff ff       	call   110f3 <Set_Current_Attr>
   134cc:	a1 d0 07 02 00       	mov    0x207d0,%eax
   134d1:	89 44 24 18          	mov    %eax,0x18(%esp)
   134d5:	8b 45 04             	mov    0x4(%ebp),%eax
   134d8:	89 44 24 14          	mov    %eax,0x14(%esp)
   134dc:	c7 44 24 10 05 04 00 	movl   $0x405,0x10(%esp)
   134e3:	00 
   134e4:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   134eb:	00 
   134ec:	c7 44 24 08 58 d7 01 	movl   $0x1d758,0x8(%esp)
   134f3:	00 
   134f4:	c7 44 24 04 5a d8 01 	movl   $0x1d85a,0x4(%esp)
   134fb:	00 
   134fc:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13503:	e8 b4 da ff ff       	call   10fbc <Print>
   13508:	eb fe                	jmp    13508 <bpool+0x118>
   1350a:	c7 40 08 10 f0 01 00 	movl   $0x1f010,0x8(%eax)
   13511:	bb 1c f0 01 00       	mov    $0x1f01c,%ebx
   13516:	8b 33                	mov    (%ebx),%esi
   13518:	89 70 0c             	mov    %esi,0xc(%eax)
   1351b:	89 03                	mov    %eax,(%ebx)
   1351d:	8b 58 0c             	mov    0xc(%eax),%ebx
   13520:	89 43 08             	mov    %eax,0x8(%ebx)
   13523:	89 50 04             	mov    %edx,0x4(%eax)
   13526:	01 d0                	add    %edx,%eax
   13528:	89 10                	mov    %edx,(%eax)
   1352a:	c7 40 04 00 00 00 80 	movl   $0x80000000,0x4(%eax)
   13531:	83 c4 20             	add    $0x20,%esp
   13534:	5b                   	pop    %ebx
   13535:	5e                   	pop    %esi
   13536:	5d                   	pop    %ebp
   13537:	c3                   	ret    

00013538 <brel>:
   13538:	55                   	push   %ebp
   13539:	89 e5                	mov    %esp,%ebp
   1353b:	56                   	push   %esi
   1353c:	53                   	push   %ebx
   1353d:	83 ec 20             	sub    $0x20,%esp
   13540:	8b 45 08             	mov    0x8(%ebp),%eax
   13543:	85 c0                	test   %eax,%eax
   13545:	75 4a                	jne    13591 <brel+0x59>
   13547:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1354e:	e8 a0 db ff ff       	call   110f3 <Set_Current_Attr>
   13553:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13558:	89 44 24 18          	mov    %eax,0x18(%esp)
   1355c:	8b 45 04             	mov    0x4(%ebp),%eax
   1355f:	89 44 24 14          	mov    %eax,0x14(%esp)
   13563:	c7 44 24 10 44 03 00 	movl   $0x344,0x10(%esp)
   1356a:	00 
   1356b:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13572:	00 
   13573:	c7 44 24 08 c6 d5 01 	movl   $0x1d5c6,0x8(%esp)
   1357a:	00 
   1357b:	c7 44 24 04 60 d8 01 	movl   $0x1d860,0x4(%esp)
   13582:	00 
   13583:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1358a:	e8 2d da ff ff       	call   10fbc <Print>
   1358f:	eb fe                	jmp    1358f <brel+0x57>
   13591:	83 e8 08             	sub    $0x8,%eax
   13594:	8b 50 04             	mov    0x4(%eax),%edx
   13597:	85 d2                	test   %edx,%edx
   13599:	78 4a                	js     135e5 <brel+0xad>
   1359b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   135a2:	e8 4c db ff ff       	call   110f3 <Set_Current_Attr>
   135a7:	a1 d0 07 02 00       	mov    0x207d0,%eax
   135ac:	89 44 24 18          	mov    %eax,0x18(%esp)
   135b0:	8b 45 04             	mov    0x4(%ebp),%eax
   135b3:	89 44 24 14          	mov    %eax,0x14(%esp)
   135b7:	c7 44 24 10 61 03 00 	movl   $0x361,0x10(%esp)
   135be:	00 
   135bf:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   135c6:	00 
   135c7:	c7 44 24 08 d9 d5 01 	movl   $0x1d5d9,0x8(%esp)
   135ce:	00 
   135cf:	c7 44 24 04 60 d8 01 	movl   $0x1d860,0x4(%esp)
   135d6:	00 
   135d7:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   135de:	e8 d9 d9 ff ff       	call   10fbc <Print>
   135e3:	eb fe                	jmp    135e3 <brel+0xab>
   135e5:	89 d1                	mov    %edx,%ecx
   135e7:	f7 d9                	neg    %ecx
   135e9:	83 3c 08 00          	cmpl   $0x0,(%eax,%ecx,1)
   135ed:	74 4a                	je     13639 <brel+0x101>
   135ef:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   135f6:	e8 f8 da ff ff       	call   110f3 <Set_Current_Attr>
   135fb:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13600:	89 44 24 18          	mov    %eax,0x18(%esp)
   13604:	8b 45 04             	mov    0x4(%ebp),%eax
   13607:	89 44 24 14          	mov    %eax,0x14(%esp)
   1360b:	c7 44 24 10 66 03 00 	movl   $0x366,0x10(%esp)
   13612:	00 
   13613:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   1361a:	00 
   1361b:	c7 44 24 08 84 d7 01 	movl   $0x1d784,0x8(%esp)
   13622:	00 
   13623:	c7 44 24 04 60 d8 01 	movl   $0x1d860,0x4(%esp)
   1362a:	00 
   1362b:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13632:	e8 85 d9 ff ff       	call   10fbc <Print>
   13637:	eb fe                	jmp    13637 <brel+0xff>
   13639:	8b 08                	mov    (%eax),%ecx
   1363b:	85 c9                	test   %ecx,%ecx
   1363d:	74 5e                	je     1369d <brel+0x165>
   1363f:	89 cb                	mov    %ecx,%ebx
   13641:	f7 db                	neg    %ebx
   13643:	3b 4c 18 04          	cmp    0x4(%eax,%ebx,1),%ecx
   13647:	74 4a                	je     13693 <brel+0x15b>
   13649:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13650:	e8 9e da ff ff       	call   110f3 <Set_Current_Attr>
   13655:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1365a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1365e:	8b 45 04             	mov    0x4(%ebp),%eax
   13661:	89 44 24 14          	mov    %eax,0x14(%esp)
   13665:	c7 44 24 10 7a 03 00 	movl   $0x37a,0x10(%esp)
   1366c:	00 
   1366d:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13674:	00 
   13675:	c7 44 24 08 c4 d7 01 	movl   $0x1d7c4,0x8(%esp)
   1367c:	00 
   1367d:	c7 44 24 04 60 d8 01 	movl   $0x1d860,0x4(%esp)
   13684:	00 
   13685:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1368c:	e8 2b d9 ff ff       	call   10fbc <Print>
   13691:	eb fe                	jmp    13691 <brel+0x159>
   13693:	01 d8                	add    %ebx,%eax
   13695:	29 50 04             	sub    %edx,0x4(%eax)
   13698:	e9 ce 00 00 00       	jmp    1376b <brel+0x233>
   1369d:	8b 15 1c f0 01 00    	mov    0x1f01c,%edx
   136a3:	81 7a 08 10 f0 01 00 	cmpl   $0x1f010,0x8(%edx)
   136aa:	74 4a                	je     136f6 <brel+0x1be>
   136ac:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   136b3:	e8 3b da ff ff       	call   110f3 <Set_Current_Attr>
   136b8:	a1 d0 07 02 00       	mov    0x207d0,%eax
   136bd:	89 44 24 18          	mov    %eax,0x18(%esp)
   136c1:	8b 45 04             	mov    0x4(%ebp),%eax
   136c4:	89 44 24 14          	mov    %eax,0x14(%esp)
   136c8:	c7 44 24 10 82 03 00 	movl   $0x382,0x10(%esp)
   136cf:	00 
   136d0:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   136d7:	00 
   136d8:	c7 44 24 08 2c d7 01 	movl   $0x1d72c,0x8(%esp)
   136df:	00 
   136e0:	c7 44 24 04 60 d8 01 	movl   $0x1d860,0x4(%esp)
   136e7:	00 
   136e8:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   136ef:	e8 c8 d8 ff ff       	call   10fbc <Print>
   136f4:	eb fe                	jmp    136f4 <brel+0x1bc>
   136f6:	8b 15 18 f0 01 00    	mov    0x1f018,%edx
   136fc:	81 7a 0c 10 f0 01 00 	cmpl   $0x1f010,0xc(%edx)
   13703:	74 4a                	je     1374f <brel+0x217>
   13705:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1370c:	e8 e2 d9 ff ff       	call   110f3 <Set_Current_Attr>
   13711:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13716:	89 44 24 18          	mov    %eax,0x18(%esp)
   1371a:	8b 45 04             	mov    0x4(%ebp),%eax
   1371d:	89 44 24 14          	mov    %eax,0x14(%esp)
   13721:	c7 44 24 10 83 03 00 	movl   $0x383,0x10(%esp)
   13728:	00 
   13729:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13730:	00 
   13731:	c7 44 24 08 58 d7 01 	movl   $0x1d758,0x8(%esp)
   13738:	00 
   13739:	c7 44 24 04 60 d8 01 	movl   $0x1d860,0x4(%esp)
   13740:	00 
   13741:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13748:	e8 6f d8 ff ff       	call   10fbc <Print>
   1374d:	eb fe                	jmp    1374d <brel+0x215>
   1374f:	c7 40 08 10 f0 01 00 	movl   $0x1f010,0x8(%eax)
   13756:	ba 1c f0 01 00       	mov    $0x1f01c,%edx
   1375b:	8b 0a                	mov    (%edx),%ecx
   1375d:	89 48 0c             	mov    %ecx,0xc(%eax)
   13760:	89 02                	mov    %eax,(%edx)
   13762:	8b 50 0c             	mov    0xc(%eax),%edx
   13765:	89 42 08             	mov    %eax,0x8(%edx)
   13768:	f7 58 04             	negl   0x4(%eax)
   1376b:	89 c2                	mov    %eax,%edx
   1376d:	03 50 04             	add    0x4(%eax),%edx
   13770:	8b 4a 04             	mov    0x4(%edx),%ecx
   13773:	85 c9                	test   %ecx,%ecx
   13775:	0f 8e 10 01 00 00    	jle    1388b <brel+0x353>
   1377b:	3b 0c 0a             	cmp    (%edx,%ecx,1),%ecx
   1377e:	74 4a                	je     137ca <brel+0x292>
   13780:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13787:	e8 67 d9 ff ff       	call   110f3 <Set_Current_Attr>
   1378c:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13791:	89 44 24 18          	mov    %eax,0x18(%esp)
   13795:	8b 45 04             	mov    0x4(%ebp),%eax
   13798:	89 44 24 14          	mov    %eax,0x14(%esp)
   1379c:	c7 44 24 10 96 03 00 	movl   $0x396,0x10(%esp)
   137a3:	00 
   137a4:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   137ab:	00 
   137ac:	c7 44 24 08 10 d8 01 	movl   $0x1d810,0x8(%esp)
   137b3:	00 
   137b4:	c7 44 24 04 60 d8 01 	movl   $0x1d860,0x4(%esp)
   137bb:	00 
   137bc:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   137c3:	e8 f4 d7 ff ff       	call   10fbc <Print>
   137c8:	eb fe                	jmp    137c8 <brel+0x290>
   137ca:	8b 5a 0c             	mov    0xc(%edx),%ebx
   137cd:	8b 4b 08             	mov    0x8(%ebx),%ecx
   137d0:	39 d1                	cmp    %edx,%ecx
   137d2:	74 4a                	je     1381e <brel+0x2e6>
   137d4:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   137db:	e8 13 d9 ff ff       	call   110f3 <Set_Current_Attr>
   137e0:	a1 d0 07 02 00       	mov    0x207d0,%eax
   137e5:	89 44 24 18          	mov    %eax,0x18(%esp)
   137e9:	8b 45 04             	mov    0x4(%ebp),%eax
   137ec:	89 44 24 14          	mov    %eax,0x14(%esp)
   137f0:	c7 44 24 10 97 03 00 	movl   $0x397,0x10(%esp)
   137f7:	00 
   137f8:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   137ff:	00 
   13800:	c7 44 24 08 e9 d5 01 	movl   $0x1d5e9,0x8(%esp)
   13807:	00 
   13808:	c7 44 24 04 60 d8 01 	movl   $0x1d860,0x4(%esp)
   1380f:	00 
   13810:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13817:	e8 a0 d7 ff ff       	call   10fbc <Print>
   1381c:	eb fe                	jmp    1381c <brel+0x2e4>
   1381e:	8b 51 08             	mov    0x8(%ecx),%edx
   13821:	3b 4a 0c             	cmp    0xc(%edx),%ecx
   13824:	74 4d                	je     13873 <brel+0x33b>
   13826:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1382d:	8d 76 00             	lea    0x0(%esi),%esi
   13830:	e8 be d8 ff ff       	call   110f3 <Set_Current_Attr>
   13835:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1383a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1383e:	8b 45 04             	mov    0x4(%ebp),%eax
   13841:	89 44 24 14          	mov    %eax,0x14(%esp)
   13845:	c7 44 24 10 98 03 00 	movl   $0x398,0x10(%esp)
   1384c:	00 
   1384d:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13854:	00 
   13855:	c7 44 24 08 06 d6 01 	movl   $0x1d606,0x8(%esp)
   1385c:	00 
   1385d:	c7 44 24 04 60 d8 01 	movl   $0x1d860,0x4(%esp)
   13864:	00 
   13865:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1386c:	e8 4b d7 ff ff       	call   10fbc <Print>
   13871:	eb fe                	jmp    13871 <brel+0x339>
   13873:	89 53 08             	mov    %edx,0x8(%ebx)
   13876:	8b 51 08             	mov    0x8(%ecx),%edx
   13879:	8b 59 0c             	mov    0xc(%ecx),%ebx
   1387c:	89 5a 0c             	mov    %ebx,0xc(%edx)
   1387f:	8b 51 04             	mov    0x4(%ecx),%edx
   13882:	03 50 04             	add    0x4(%eax),%edx
   13885:	89 50 04             	mov    %edx,0x4(%eax)
   13888:	8d 14 10             	lea    (%eax,%edx,1),%edx
   1388b:	83 7a 04 00          	cmpl   $0x0,0x4(%edx)
   1388f:	78 4a                	js     138db <brel+0x3a3>
   13891:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13898:	e8 56 d8 ff ff       	call   110f3 <Set_Current_Attr>
   1389d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   138a2:	89 44 24 18          	mov    %eax,0x18(%esp)
   138a6:	8b 45 04             	mov    0x4(%ebp),%eax
   138a9:	89 44 24 14          	mov    %eax,0x14(%esp)
   138ad:	c7 44 24 10 aa 03 00 	movl   $0x3aa,0x10(%esp)
   138b4:	00 
   138b5:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   138bc:	00 
   138bd:	c7 44 24 08 23 d6 01 	movl   $0x1d623,0x8(%esp)
   138c4:	00 
   138c5:	c7 44 24 04 60 d8 01 	movl   $0x1d860,0x4(%esp)
   138cc:	00 
   138cd:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   138d4:	e8 e3 d6 ff ff       	call   10fbc <Print>
   138d9:	eb fe                	jmp    138d9 <brel+0x3a1>
   138db:	8b 40 04             	mov    0x4(%eax),%eax
   138de:	89 02                	mov    %eax,(%edx)
   138e0:	83 c4 20             	add    $0x20,%esp
   138e3:	5b                   	pop    %ebx
   138e4:	5e                   	pop    %esi
   138e5:	5d                   	pop    %ebp
   138e6:	c3                   	ret    

000138e7 <bget>:
   138e7:	55                   	push   %ebp
   138e8:	89 e5                	mov    %esp,%ebp
   138ea:	57                   	push   %edi
   138eb:	56                   	push   %esi
   138ec:	53                   	push   %ebx
   138ed:	83 ec 2c             	sub    $0x2c,%esp
   138f0:	8b 45 08             	mov    0x8(%ebp),%eax
   138f3:	85 c0                	test   %eax,%eax
   138f5:	7f 4a                	jg     13941 <bget+0x5a>
   138f7:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   138fe:	e8 f0 d7 ff ff       	call   110f3 <Set_Current_Attr>
   13903:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13908:	89 44 24 18          	mov    %eax,0x18(%esp)
   1390c:	8b 45 04             	mov    0x4(%ebp),%eax
   1390f:	89 44 24 14          	mov    %eax,0x14(%esp)
   13913:	c7 44 24 10 4d 02 00 	movl   $0x24d,0x10(%esp)
   1391a:	00 
   1391b:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13922:	00 
   13923:	c7 44 24 08 a3 d6 01 	movl   $0x1d6a3,0x8(%esp)
   1392a:	00 
   1392b:	c7 44 24 04 71 d8 01 	movl   $0x1d871,0x4(%esp)
   13932:	00 
   13933:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1393a:	e8 7d d6 ff ff       	call   10fbc <Print>
   1393f:	eb fe                	jmp    1393f <bget+0x58>
   13941:	89 c2                	mov    %eax,%edx
   13943:	83 f8 07             	cmp    $0x7,%eax
   13946:	77 05                	ja     1394d <bget+0x66>
   13948:	ba 08 00 00 00       	mov    $0x8,%edx
   1394d:	83 c2 03             	add    $0x3,%edx
   13950:	89 d6                	mov    %edx,%esi
   13952:	83 e6 fc             	and    $0xfffffffc,%esi
   13955:	83 c6 08             	add    $0x8,%esi
   13958:	89 f3                	mov    %esi,%ebx
   1395a:	8b 15 18 f0 01 00    	mov    0x1f018,%edx
   13960:	b8 10 f0 01 00       	mov    $0x1f010,%eax
   13965:	eb 18                	jmp    1397f <bget+0x98>
   13967:	8b 4a 04             	mov    0x4(%edx),%ecx
   1396a:	39 cb                	cmp    %ecx,%ebx
   1396c:	7f 0e                	jg     1397c <bget+0x95>
   1396e:	3d 10 f0 01 00       	cmp    $0x1f010,%eax
   13973:	74 05                	je     1397a <bget+0x93>
   13975:	3b 48 04             	cmp    0x4(%eax),%ecx
   13978:	7d 02                	jge    1397c <bget+0x95>
   1397a:	89 d0                	mov    %edx,%eax
   1397c:	8b 52 08             	mov    0x8(%edx),%edx
   1397f:	81 fa 10 f0 01 00    	cmp    $0x1f010,%edx
   13985:	75 e0                	jne    13967 <bget+0x80>
   13987:	e9 94 01 00 00       	jmp    13b20 <bget+0x239>
   1398c:	8b 50 04             	mov    0x4(%eax),%edx
   1398f:	39 d3                	cmp    %edx,%ebx
   13991:	0f 8f 86 01 00 00    	jg     13b1d <bget+0x236>
   13997:	89 d7                	mov    %edx,%edi
   13999:	29 df                	sub    %ebx,%edi
   1399b:	83 ff 10             	cmp    $0x10,%edi
   1399e:	76 6c                	jbe    13a0c <bget+0x125>
   139a0:	8d 0c 38             	lea    (%eax,%edi,1),%ecx
   139a3:	8d 34 31             	lea    (%ecx,%esi,1),%esi
   139a6:	39 16                	cmp    %edx,(%esi)
   139a8:	74 4a                	je     139f4 <bget+0x10d>
   139aa:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   139b1:	e8 3d d7 ff ff       	call   110f3 <Set_Current_Attr>
   139b6:	a1 d0 07 02 00       	mov    0x207d0,%eax
   139bb:	89 44 24 18          	mov    %eax,0x18(%esp)
   139bf:	8b 45 04             	mov    0x4(%ebp),%eax
   139c2:	89 44 24 14          	mov    %eax,0x14(%esp)
   139c6:	c7 44 24 10 88 02 00 	movl   $0x288,0x10(%esp)
   139cd:	00 
   139ce:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   139d5:	00 
   139d6:	c7 44 24 08 34 d6 01 	movl   $0x1d634,0x8(%esp)
   139dd:	00 
   139de:	c7 44 24 04 71 d8 01 	movl   $0x1d871,0x4(%esp)
   139e5:	00 
   139e6:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   139ed:	e8 ca d5 ff ff       	call   10fbc <Print>
   139f2:	eb fe                	jmp    139f2 <bget+0x10b>
   139f4:	89 78 04             	mov    %edi,0x4(%eax)
   139f7:	89 39                	mov    %edi,(%ecx)
   139f9:	f7 db                	neg    %ebx
   139fb:	89 59 04             	mov    %ebx,0x4(%ecx)
   139fe:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
   13a04:	8d 41 08             	lea    0x8(%ecx),%eax
   13a07:	e9 24 01 00 00       	jmp    13b30 <bget+0x249>
   13a0c:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
   13a0f:	39 11                	cmp    %edx,(%ecx)
   13a11:	74 4a                	je     13a5d <bget+0x176>
   13a13:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13a1a:	e8 d4 d6 ff ff       	call   110f3 <Set_Current_Attr>
   13a1f:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13a24:	89 44 24 18          	mov    %eax,0x18(%esp)
   13a28:	8b 45 04             	mov    0x4(%ebp),%eax
   13a2b:	89 44 24 14          	mov    %eax,0x14(%esp)
   13a2f:	c7 44 24 10 9c 02 00 	movl   $0x29c,0x10(%esp)
   13a36:	00 
   13a37:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13a3e:	00 
   13a3f:	c7 44 24 08 50 d6 01 	movl   $0x1d650,0x8(%esp)
   13a46:	00 
   13a47:	c7 44 24 04 71 d8 01 	movl   $0x1d871,0x4(%esp)
   13a4e:	00 
   13a4f:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13a56:	e8 61 d5 ff ff       	call   10fbc <Print>
   13a5b:	eb fe                	jmp    13a5b <bget+0x174>
   13a5d:	8b 58 0c             	mov    0xc(%eax),%ebx
   13a60:	8b 53 08             	mov    0x8(%ebx),%edx
   13a63:	39 c2                	cmp    %eax,%edx
   13a65:	74 4a                	je     13ab1 <bget+0x1ca>
   13a67:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13a6e:	e8 80 d6 ff ff       	call   110f3 <Set_Current_Attr>
   13a73:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13a78:	89 44 24 18          	mov    %eax,0x18(%esp)
   13a7c:	8b 45 04             	mov    0x4(%ebp),%eax
   13a7f:	89 44 24 14          	mov    %eax,0x14(%esp)
   13a83:	c7 44 24 10 a1 02 00 	movl   $0x2a1,0x10(%esp)
   13a8a:	00 
   13a8b:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13a92:	00 
   13a93:	c7 44 24 08 6c d6 01 	movl   $0x1d66c,0x8(%esp)
   13a9a:	00 
   13a9b:	c7 44 24 04 71 d8 01 	movl   $0x1d871,0x4(%esp)
   13aa2:	00 
   13aa3:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13aaa:	e8 0d d5 ff ff       	call   10fbc <Print>
   13aaf:	eb fe                	jmp    13aaf <bget+0x1c8>
   13ab1:	8b 42 08             	mov    0x8(%edx),%eax
   13ab4:	3b 50 0c             	cmp    0xc(%eax),%edx
   13ab7:	74 4a                	je     13b03 <bget+0x21c>
   13ab9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13ac0:	e8 2e d6 ff ff       	call   110f3 <Set_Current_Attr>
   13ac5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13aca:	89 44 24 18          	mov    %eax,0x18(%esp)
   13ace:	8b 45 04             	mov    0x4(%ebp),%eax
   13ad1:	89 44 24 14          	mov    %eax,0x14(%esp)
   13ad5:	c7 44 24 10 a2 02 00 	movl   $0x2a2,0x10(%esp)
   13adc:	00 
   13add:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13ae4:	00 
   13ae5:	c7 44 24 08 87 d6 01 	movl   $0x1d687,0x8(%esp)
   13aec:	00 
   13aed:	c7 44 24 04 71 d8 01 	movl   $0x1d871,0x4(%esp)
   13af4:	00 
   13af5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13afc:	e8 bb d4 ff ff       	call   10fbc <Print>
   13b01:	eb fe                	jmp    13b01 <bget+0x21a>
   13b03:	89 43 08             	mov    %eax,0x8(%ebx)
   13b06:	8b 42 08             	mov    0x8(%edx),%eax
   13b09:	8b 5a 0c             	mov    0xc(%edx),%ebx
   13b0c:	89 58 0c             	mov    %ebx,0xc(%eax)
   13b0f:	f7 5a 04             	negl   0x4(%edx)
   13b12:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
   13b18:	8d 42 08             	lea    0x8(%edx),%eax
   13b1b:	eb 13                	jmp    13b30 <bget+0x249>
   13b1d:	8b 40 08             	mov    0x8(%eax),%eax
   13b20:	3d 10 f0 01 00       	cmp    $0x1f010,%eax
   13b25:	0f 85 61 fe ff ff    	jne    1398c <bget+0xa5>
   13b2b:	b8 00 00 00 00       	mov    $0x0,%eax
   13b30:	83 c4 2c             	add    $0x2c,%esp
   13b33:	5b                   	pop    %ebx
   13b34:	5e                   	pop    %esi
   13b35:	5f                   	pop    %edi
   13b36:	5d                   	pop    %ebp
   13b37:	c3                   	ret    

00013b38 <bgetr>:
   13b38:	55                   	push   %ebp
   13b39:	89 e5                	mov    %esp,%ebp
   13b3b:	57                   	push   %edi
   13b3c:	56                   	push   %esi
   13b3d:	53                   	push   %ebx
   13b3e:	83 ec 2c             	sub    $0x2c,%esp
   13b41:	8b 5d 08             	mov    0x8(%ebp),%ebx
   13b44:	8b 7d 0c             	mov    0xc(%ebp),%edi
   13b47:	89 3c 24             	mov    %edi,(%esp)
   13b4a:	e8 98 fd ff ff       	call   138e7 <bget>
   13b4f:	89 c6                	mov    %eax,%esi
   13b51:	85 c0                	test   %eax,%eax
   13b53:	74 78                	je     13bcd <bgetr+0x95>
   13b55:	85 db                	test   %ebx,%ebx
   13b57:	74 74                	je     13bcd <bgetr+0x95>
   13b59:	b8 f8 ff ff ff       	mov    $0xfffffff8,%eax
   13b5e:	2b 43 fc             	sub    -0x4(%ebx),%eax
   13b61:	85 c0                	test   %eax,%eax
   13b63:	7f 4a                	jg     13baf <bgetr+0x77>
   13b65:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13b6c:	e8 82 d5 ff ff       	call   110f3 <Set_Current_Attr>
   13b71:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13b76:	89 44 24 18          	mov    %eax,0x18(%esp)
   13b7a:	8b 45 04             	mov    0x4(%ebp),%eax
   13b7d:	89 44 24 14          	mov    %eax,0x14(%esp)
   13b81:	c7 44 24 10 32 03 00 	movl   $0x332,0x10(%esp)
   13b88:	00 
   13b89:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13b90:	00 
   13b91:	c7 44 24 08 a2 d6 01 	movl   $0x1d6a2,0x8(%esp)
   13b98:	00 
   13b99:	c7 44 24 04 65 d8 01 	movl   $0x1d865,0x4(%esp)
   13ba0:	00 
   13ba1:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13ba8:	e8 0f d4 ff ff       	call   10fbc <Print>
   13bad:	eb fe                	jmp    13bad <bgetr+0x75>
   13baf:	39 f8                	cmp    %edi,%eax
   13bb1:	7e 02                	jle    13bb5 <bgetr+0x7d>
   13bb3:	89 f8                	mov    %edi,%eax
   13bb5:	89 44 24 08          	mov    %eax,0x8(%esp)
   13bb9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
   13bbd:	89 34 24             	mov    %esi,(%esp)
   13bc0:	e8 6e 8b 00 00       	call   1c733 <memcpy>
   13bc5:	89 1c 24             	mov    %ebx,(%esp)
   13bc8:	e8 6b f9 ff ff       	call   13538 <brel>
   13bcd:	89 f0                	mov    %esi,%eax
   13bcf:	83 c4 2c             	add    $0x2c,%esp
   13bd2:	5b                   	pop    %ebx
   13bd3:	5e                   	pop    %esi
   13bd4:	5f                   	pop    %edi
   13bd5:	5d                   	pop    %ebp
   13bd6:	c3                   	ret    

00013bd7 <bgetz>:
   13bd7:	55                   	push   %ebp
   13bd8:	89 e5                	mov    %esp,%ebp
   13bda:	56                   	push   %esi
   13bdb:	53                   	push   %ebx
   13bdc:	83 ec 20             	sub    $0x20,%esp
   13bdf:	8b 75 08             	mov    0x8(%ebp),%esi
   13be2:	89 34 24             	mov    %esi,(%esp)
   13be5:	e8 fd fc ff ff       	call   138e7 <bget>
   13bea:	89 c3                	mov    %eax,%ebx
   13bec:	85 c0                	test   %eax,%eax
   13bee:	74 74                	je     13c64 <bgetz+0x8d>
   13bf0:	8b 40 fc             	mov    -0x4(%eax),%eax
   13bf3:	f7 d8                	neg    %eax
   13bf5:	75 08                	jne    13bff <bgetz+0x28>
   13bf7:	8b 43 f4             	mov    -0xc(%ebx),%eax
   13bfa:	83 e8 0c             	sub    $0xc,%eax
   13bfd:	eb 03                	jmp    13c02 <bgetz+0x2b>
   13bff:	83 e8 08             	sub    $0x8,%eax
   13c02:	39 f0                	cmp    %esi,%eax
   13c04:	7d 4a                	jge    13c50 <bgetz+0x79>
   13c06:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13c0d:	e8 e1 d4 ff ff       	call   110f3 <Set_Current_Attr>
   13c12:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13c17:	89 44 24 18          	mov    %eax,0x18(%esp)
   13c1b:	8b 45 04             	mov    0x4(%ebp),%eax
   13c1e:	89 44 24 14          	mov    %eax,0x14(%esp)
   13c22:	c7 44 24 10 0d 03 00 	movl   $0x30d,0x10(%esp)
   13c29:	00 
   13c2a:	c7 44 24 0c b1 d5 01 	movl   $0x1d5b1,0xc(%esp)
   13c31:	00 
   13c32:	c7 44 24 08 ac d6 01 	movl   $0x1d6ac,0x8(%esp)
   13c39:	00 
   13c3a:	c7 44 24 04 6b d8 01 	movl   $0x1d86b,0x4(%esp)
   13c41:	00 
   13c42:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13c49:	e8 6e d3 ff ff       	call   10fbc <Print>
   13c4e:	eb fe                	jmp    13c4e <bgetz+0x77>
   13c50:	89 44 24 08          	mov    %eax,0x8(%esp)
   13c54:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   13c5b:	00 
   13c5c:	89 1c 24             	mov    %ebx,(%esp)
   13c5f:	e8 ac 8a 00 00       	call   1c710 <memset>
   13c64:	89 d8                	mov    %ebx,%eax
   13c66:	83 c4 20             	add    $0x20,%esp
   13c69:	5b                   	pop    %ebx
   13c6a:	5e                   	pop    %esi
   13c6b:	5d                   	pop    %ebp
   13c6c:	c3                   	ret    
   13c6d:	90                   	nop
   13c6e:	90                   	nop
   13c6f:	90                   	nop

00013c70 <Malloc>:
   13c70:	55                   	push   %ebp
   13c71:	89 e5                	mov    %esp,%ebp
   13c73:	56                   	push   %esi
   13c74:	53                   	push   %ebx
   13c75:	83 ec 20             	sub    $0x20,%esp
   13c78:	8b 75 08             	mov    0x8(%ebp),%esi
   13c7b:	85 f6                	test   %esi,%esi
   13c7d:	75 4a                	jne    13cc9 <Malloc+0x59>
   13c7f:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13c86:	e8 68 d4 ff ff       	call   110f3 <Set_Current_Attr>
   13c8b:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13c90:	89 44 24 18          	mov    %eax,0x18(%esp)
   13c94:	8b 45 04             	mov    0x4(%ebp),%eax
   13c97:	89 44 24 14          	mov    %eax,0x14(%esp)
   13c9b:	c7 44 24 10 24 00 00 	movl   $0x24,0x10(%esp)
   13ca2:	00 
   13ca3:	c7 44 24 0c 76 d8 01 	movl   $0x1d876,0xc(%esp)
   13caa:	00 
   13cab:	c7 44 24 08 a3 d6 01 	movl   $0x1d6a3,0x8(%esp)
   13cb2:	00 
   13cb3:	c7 44 24 04 ad d8 01 	movl   $0x1d8ad,0x4(%esp)
   13cba:	00 
   13cbb:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13cc2:	e8 f5 d2 ff ff       	call   10fbc <Print>
   13cc7:	eb fe                	jmp    13cc7 <Malloc+0x57>
   13cc9:	e8 83 c6 ff ff       	call   10351 <Interrupts_Enabled>
   13cce:	89 c3                	mov    %eax,%ebx
   13cd0:	84 c0                	test   %al,%al
   13cd2:	74 54                	je     13d28 <Malloc+0xb8>
   13cd4:	e8 78 c6 ff ff       	call   10351 <Interrupts_Enabled>
   13cd9:	84 c0                	test   %al,%al
   13cdb:	75 4a                	jne    13d27 <Malloc+0xb7>
   13cdd:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13ce4:	e8 0a d4 ff ff       	call   110f3 <Set_Current_Attr>
   13ce9:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13cee:	89 44 24 18          	mov    %eax,0x18(%esp)
   13cf2:	8b 45 04             	mov    0x4(%ebp),%eax
   13cf5:	89 44 24 14          	mov    %eax,0x14(%esp)
   13cf9:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   13d00:	00 
   13d01:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   13d08:	00 
   13d09:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   13d10:	00 
   13d11:	c7 44 24 04 8d d8 01 	movl   $0x1d88d,0x4(%esp)
   13d18:	00 
   13d19:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13d20:	e8 97 d2 ff ff       	call   10fbc <Print>
   13d25:	eb fe                	jmp    13d25 <Malloc+0xb5>
   13d27:	fa                   	cli    
   13d28:	89 34 24             	mov    %esi,(%esp)
   13d2b:	e8 b7 fb ff ff       	call   138e7 <bget>
   13d30:	89 c6                	mov    %eax,%esi
   13d32:	e8 1a c6 ff ff       	call   10351 <Interrupts_Enabled>
   13d37:	84 c0                	test   %al,%al
   13d39:	74 4a                	je     13d85 <Malloc+0x115>
   13d3b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13d42:	e8 ac d3 ff ff       	call   110f3 <Set_Current_Attr>
   13d47:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13d4c:	89 44 24 18          	mov    %eax,0x18(%esp)
   13d50:	8b 45 04             	mov    0x4(%ebp),%eax
   13d53:	89 44 24 14          	mov    %eax,0x14(%esp)
   13d57:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   13d5e:	00 
   13d5f:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   13d66:	00 
   13d67:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   13d6e:	00 
   13d6f:	c7 44 24 04 9e d8 01 	movl   $0x1d89e,0x4(%esp)
   13d76:	00 
   13d77:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13d7e:	e8 39 d2 ff ff       	call   10fbc <Print>
   13d83:	eb fe                	jmp    13d83 <Malloc+0x113>
   13d85:	84 db                	test   %bl,%bl
   13d87:	74 5b                	je     13de4 <Malloc+0x174>
   13d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   13d90:	e8 bc c5 ff ff       	call   10351 <Interrupts_Enabled>
   13d95:	84 c0                	test   %al,%al
   13d97:	74 4a                	je     13de3 <Malloc+0x173>
   13d99:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13da0:	e8 4e d3 ff ff       	call   110f3 <Set_Current_Attr>
   13da5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13daa:	89 44 24 18          	mov    %eax,0x18(%esp)
   13dae:	8b 45 04             	mov    0x4(%ebp),%eax
   13db1:	89 44 24 14          	mov    %eax,0x14(%esp)
   13db5:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   13dbc:	00 
   13dbd:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   13dc4:	00 
   13dc5:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   13dcc:	00 
   13dcd:	c7 44 24 04 9e d8 01 	movl   $0x1d89e,0x4(%esp)
   13dd4:	00 
   13dd5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13ddc:	e8 db d1 ff ff       	call   10fbc <Print>
   13de1:	eb fe                	jmp    13de1 <Malloc+0x171>
   13de3:	fb                   	sti    
   13de4:	89 f0                	mov    %esi,%eax
   13de6:	83 c4 20             	add    $0x20,%esp
   13de9:	5b                   	pop    %ebx
   13dea:	5e                   	pop    %esi
   13deb:	5d                   	pop    %ebp
   13dec:	c3                   	ret    

00013ded <Init_Heap>:
   13ded:	55                   	push   %ebp
   13dee:	89 e5                	mov    %esp,%ebp
   13df0:	83 ec 18             	sub    $0x18,%esp
   13df3:	8b 45 0c             	mov    0xc(%ebp),%eax
   13df6:	89 44 24 04          	mov    %eax,0x4(%esp)
   13dfa:	8b 45 08             	mov    0x8(%ebp),%eax
   13dfd:	89 04 24             	mov    %eax,(%esp)
   13e00:	e8 eb f5 ff ff       	call   133f0 <bpool>
   13e05:	c9                   	leave  
   13e06:	c3                   	ret    

00013e07 <Free>:
   13e07:	55                   	push   %ebp
   13e08:	89 e5                	mov    %esp,%ebp
   13e0a:	53                   	push   %ebx
   13e0b:	83 ec 24             	sub    $0x24,%esp
   13e0e:	e8 3e c5 ff ff       	call   10351 <Interrupts_Enabled>
   13e13:	89 c3                	mov    %eax,%ebx
   13e15:	84 c0                	test   %al,%al
   13e17:	74 54                	je     13e6d <Free+0x66>
   13e19:	e8 33 c5 ff ff       	call   10351 <Interrupts_Enabled>
   13e1e:	84 c0                	test   %al,%al
   13e20:	75 4a                	jne    13e6c <Free+0x65>
   13e22:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13e29:	e8 c5 d2 ff ff       	call   110f3 <Set_Current_Attr>
   13e2e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13e33:	89 44 24 18          	mov    %eax,0x18(%esp)
   13e37:	8b 45 04             	mov    0x4(%ebp),%eax
   13e3a:	89 44 24 14          	mov    %eax,0x14(%esp)
   13e3e:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   13e45:	00 
   13e46:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   13e4d:	00 
   13e4e:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   13e55:	00 
   13e56:	c7 44 24 04 8d d8 01 	movl   $0x1d88d,0x4(%esp)
   13e5d:	00 
   13e5e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13e65:	e8 52 d1 ff ff       	call   10fbc <Print>
   13e6a:	eb fe                	jmp    13e6a <Free+0x63>
   13e6c:	fa                   	cli    
   13e6d:	8b 45 08             	mov    0x8(%ebp),%eax
   13e70:	89 04 24             	mov    %eax,(%esp)
   13e73:	e8 c0 f6 ff ff       	call   13538 <brel>
   13e78:	e8 d4 c4 ff ff       	call   10351 <Interrupts_Enabled>
   13e7d:	84 c0                	test   %al,%al
   13e7f:	74 4a                	je     13ecb <Free+0xc4>
   13e81:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13e88:	e8 66 d2 ff ff       	call   110f3 <Set_Current_Attr>
   13e8d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13e92:	89 44 24 18          	mov    %eax,0x18(%esp)
   13e96:	8b 45 04             	mov    0x4(%ebp),%eax
   13e99:	89 44 24 14          	mov    %eax,0x14(%esp)
   13e9d:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   13ea4:	00 
   13ea5:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   13eac:	00 
   13ead:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   13eb4:	00 
   13eb5:	c7 44 24 04 9e d8 01 	movl   $0x1d89e,0x4(%esp)
   13ebc:	00 
   13ebd:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13ec4:	e8 f3 d0 ff ff       	call   10fbc <Print>
   13ec9:	eb fe                	jmp    13ec9 <Free+0xc2>
   13ecb:	84 db                	test   %bl,%bl
   13ecd:	74 55                	je     13f24 <Free+0x11d>
   13ecf:	90                   	nop
   13ed0:	e8 7c c4 ff ff       	call   10351 <Interrupts_Enabled>
   13ed5:	84 c0                	test   %al,%al
   13ed7:	74 4a                	je     13f23 <Free+0x11c>
   13ed9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13ee0:	e8 0e d2 ff ff       	call   110f3 <Set_Current_Attr>
   13ee5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13eea:	89 44 24 18          	mov    %eax,0x18(%esp)
   13eee:	8b 45 04             	mov    0x4(%ebp),%eax
   13ef1:	89 44 24 14          	mov    %eax,0x14(%esp)
   13ef5:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   13efc:	00 
   13efd:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   13f04:	00 
   13f05:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   13f0c:	00 
   13f0d:	c7 44 24 04 9e d8 01 	movl   $0x1d89e,0x4(%esp)
   13f14:	00 
   13f15:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13f1c:	e8 9b d0 ff ff       	call   10fbc <Print>
   13f21:	eb fe                	jmp    13f21 <Free+0x11a>
   13f23:	fb                   	sti    
   13f24:	83 c4 24             	add    $0x24,%esp
   13f27:	5b                   	pop    %ebx
   13f28:	5d                   	pop    %ebp
   13f29:	c3                   	ret    
   13f2a:	90                   	nop
   13f2b:	90                   	nop
   13f2c:	90                   	nop
   13f2d:	90                   	nop
   13f2e:	90                   	nop
   13f2f:	90                   	nop

00013f30 <Mutex_Init>:
   13f30:	55                   	push   %ebp
   13f31:	89 e5                	mov    %esp,%ebp
   13f33:	8b 45 08             	mov    0x8(%ebp),%eax
   13f36:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   13f3c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   13f43:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   13f4a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
   13f51:	5d                   	pop    %ebp
   13f52:	c3                   	ret    

00013f53 <Cond_Init>:
   13f53:	55                   	push   %ebp
   13f54:	89 e5                	mov    %esp,%ebp
   13f56:	8b 45 08             	mov    0x8(%ebp),%eax
   13f59:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   13f60:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   13f66:	5d                   	pop    %ebp
   13f67:	c3                   	ret    

00013f68 <Cond_Broadcast>:
   13f68:	55                   	push   %ebp
   13f69:	89 e5                	mov    %esp,%ebp
   13f6b:	83 ec 28             	sub    $0x28,%esp
   13f6e:	e8 de c3 ff ff       	call   10351 <Interrupts_Enabled>
   13f73:	84 c0                	test   %al,%al
   13f75:	75 4a                	jne    13fc1 <Cond_Broadcast+0x59>
   13f77:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13f7e:	e8 70 d1 ff ff       	call   110f3 <Set_Current_Attr>
   13f83:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13f88:	89 44 24 18          	mov    %eax,0x18(%esp)
   13f8c:	8b 45 04             	mov    0x4(%ebp),%eax
   13f8f:	89 44 24 14          	mov    %eax,0x14(%esp)
   13f93:	c7 44 24 10 ca 00 00 	movl   $0xca,0x10(%esp)
   13f9a:	00 
   13f9b:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   13fa2:	00 
   13fa3:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   13faa:	00 
   13fab:	c7 44 24 04 f7 d8 01 	movl   $0x1d8f7,0x4(%esp)
   13fb2:	00 
   13fb3:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   13fba:	e8 fd cf ff ff       	call   10fbc <Print>
   13fbf:	eb fe                	jmp    13fbf <Cond_Broadcast+0x57>
   13fc1:	e8 8b c3 ff ff       	call   10351 <Interrupts_Enabled>
   13fc6:	84 c0                	test   %al,%al
   13fc8:	75 4a                	jne    14014 <Cond_Broadcast+0xac>
   13fca:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   13fd1:	e8 1d d1 ff ff       	call   110f3 <Set_Current_Attr>
   13fd6:	a1 d0 07 02 00       	mov    0x207d0,%eax
   13fdb:	89 44 24 18          	mov    %eax,0x18(%esp)
   13fdf:	8b 45 04             	mov    0x4(%ebp),%eax
   13fe2:	89 44 24 14          	mov    %eax,0x14(%esp)
   13fe6:	c7 44 24 10 cb 00 00 	movl   $0xcb,0x10(%esp)
   13fed:	00 
   13fee:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   13ff5:	00 
   13ff6:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   13ffd:	00 
   13ffe:	c7 44 24 04 f7 d8 01 	movl   $0x1d8f7,0x4(%esp)
   14005:	00 
   14006:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1400d:	e8 aa cf ff ff       	call   10fbc <Print>
   14012:	eb fe                	jmp    14012 <Cond_Broadcast+0xaa>
   14014:	fa                   	cli    
   14015:	8b 45 08             	mov    0x8(%ebp),%eax
   14018:	89 04 24             	mov    %eax,(%esp)
   1401b:	e8 2f 13 00 00       	call   1534f <Wake_Up>
   14020:	e8 2c c3 ff ff       	call   10351 <Interrupts_Enabled>
   14025:	84 c0                	test   %al,%al
   14027:	74 4a                	je     14073 <Cond_Broadcast+0x10b>
   14029:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14030:	e8 be d0 ff ff       	call   110f3 <Set_Current_Attr>
   14035:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1403a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1403e:	8b 45 04             	mov    0x4(%ebp),%eax
   14041:	89 44 24 14          	mov    %eax,0x14(%esp)
   14045:	c7 44 24 10 cd 00 00 	movl   $0xcd,0x10(%esp)
   1404c:	00 
   1404d:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14054:	00 
   14055:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1405c:	00 
   1405d:	c7 44 24 04 f7 d8 01 	movl   $0x1d8f7,0x4(%esp)
   14064:	00 
   14065:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1406c:	e8 4b cf ff ff       	call   10fbc <Print>
   14071:	eb fe                	jmp    14071 <Cond_Broadcast+0x109>
   14073:	fb                   	sti    
   14074:	c9                   	leave  
   14075:	c3                   	ret    

00014076 <Cond_Signal>:
   14076:	55                   	push   %ebp
   14077:	89 e5                	mov    %esp,%ebp
   14079:	83 ec 28             	sub    $0x28,%esp
   1407c:	e8 d0 c2 ff ff       	call   10351 <Interrupts_Enabled>
   14081:	84 c0                	test   %al,%al
   14083:	75 4a                	jne    140cf <Cond_Signal+0x59>
   14085:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1408c:	e8 62 d0 ff ff       	call   110f3 <Set_Current_Attr>
   14091:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14096:	89 44 24 18          	mov    %eax,0x18(%esp)
   1409a:	8b 45 04             	mov    0x4(%ebp),%eax
   1409d:	89 44 24 14          	mov    %eax,0x14(%esp)
   140a1:	c7 44 24 10 be 00 00 	movl   $0xbe,0x10(%esp)
   140a8:	00 
   140a9:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   140b0:	00 
   140b1:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   140b8:	00 
   140b9:	c7 44 24 04 06 d9 01 	movl   $0x1d906,0x4(%esp)
   140c0:	00 
   140c1:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   140c8:	e8 ef ce ff ff       	call   10fbc <Print>
   140cd:	eb fe                	jmp    140cd <Cond_Signal+0x57>
   140cf:	e8 7d c2 ff ff       	call   10351 <Interrupts_Enabled>
   140d4:	84 c0                	test   %al,%al
   140d6:	75 4a                	jne    14122 <Cond_Signal+0xac>
   140d8:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   140df:	e8 0f d0 ff ff       	call   110f3 <Set_Current_Attr>
   140e4:	a1 d0 07 02 00       	mov    0x207d0,%eax
   140e9:	89 44 24 18          	mov    %eax,0x18(%esp)
   140ed:	8b 45 04             	mov    0x4(%ebp),%eax
   140f0:	89 44 24 14          	mov    %eax,0x14(%esp)
   140f4:	c7 44 24 10 bf 00 00 	movl   $0xbf,0x10(%esp)
   140fb:	00 
   140fc:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14103:	00 
   14104:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1410b:	00 
   1410c:	c7 44 24 04 06 d9 01 	movl   $0x1d906,0x4(%esp)
   14113:	00 
   14114:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1411b:	e8 9c ce ff ff       	call   10fbc <Print>
   14120:	eb fe                	jmp    14120 <Cond_Signal+0xaa>
   14122:	fa                   	cli    
   14123:	8b 45 08             	mov    0x8(%ebp),%eax
   14126:	89 04 24             	mov    %eax,(%esp)
   14129:	e8 e6 10 00 00       	call   15214 <Wake_Up_One>
   1412e:	e8 1e c2 ff ff       	call   10351 <Interrupts_Enabled>
   14133:	84 c0                	test   %al,%al
   14135:	74 4a                	je     14181 <Cond_Signal+0x10b>
   14137:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1413e:	e8 b0 cf ff ff       	call   110f3 <Set_Current_Attr>
   14143:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14148:	89 44 24 18          	mov    %eax,0x18(%esp)
   1414c:	8b 45 04             	mov    0x4(%ebp),%eax
   1414f:	89 44 24 14          	mov    %eax,0x14(%esp)
   14153:	c7 44 24 10 c1 00 00 	movl   $0xc1,0x10(%esp)
   1415a:	00 
   1415b:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14162:	00 
   14163:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1416a:	00 
   1416b:	c7 44 24 04 06 d9 01 	movl   $0x1d906,0x4(%esp)
   14172:	00 
   14173:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1417a:	e8 3d ce ff ff       	call   10fbc <Print>
   1417f:	eb fe                	jmp    1417f <Cond_Signal+0x109>
   14181:	fb                   	sti    
   14182:	c9                   	leave  
   14183:	c3                   	ret    

00014184 <Mutex_Wait>:
   14184:	55                   	push   %ebp
   14185:	89 e5                	mov    %esp,%ebp
   14187:	53                   	push   %ebx
   14188:	83 ec 24             	sub    $0x24,%esp
   1418b:	89 c3                	mov    %eax,%ebx
   1418d:	83 38 01             	cmpl   $0x1,(%eax)
   14190:	74 4a                	je     141dc <Mutex_Wait+0x58>
   14192:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14199:	e8 55 cf ff ff       	call   110f3 <Set_Current_Attr>
   1419e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   141a3:	89 44 24 18          	mov    %eax,0x18(%esp)
   141a7:	8b 45 04             	mov    0x4(%ebp),%eax
   141aa:	89 44 24 14          	mov    %eax,0x14(%esp)
   141ae:	c7 44 24 10 25 00 00 	movl   $0x25,0x10(%esp)
   141b5:	00 
   141b6:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   141bd:	00 
   141be:	c7 44 24 08 ca d8 01 	movl   $0x1d8ca,0x8(%esp)
   141c5:	00 
   141c6:	c7 44 24 04 3c d9 01 	movl   $0x1d93c,0x4(%esp)
   141cd:	00 
   141ce:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   141d5:	e8 e2 cd ff ff       	call   10fbc <Print>
   141da:	eb fe                	jmp    141da <Mutex_Wait+0x56>
   141dc:	a1 cc 07 02 00       	mov    0x207cc,%eax
   141e1:	85 c0                	test   %eax,%eax
   141e3:	75 4a                	jne    1422f <Mutex_Wait+0xab>
   141e5:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   141ec:	e8 02 cf ff ff       	call   110f3 <Set_Current_Attr>
   141f1:	a1 d0 07 02 00       	mov    0x207d0,%eax
   141f6:	89 44 24 18          	mov    %eax,0x18(%esp)
   141fa:	8b 45 04             	mov    0x4(%ebp),%eax
   141fd:	89 44 24 14          	mov    %eax,0x14(%esp)
   14201:	c7 44 24 10 26 00 00 	movl   $0x26,0x10(%esp)
   14208:	00 
   14209:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14210:	00 
   14211:	c7 44 24 08 cd d9 01 	movl   $0x1d9cd,0x8(%esp)
   14218:	00 
   14219:	c7 44 24 04 3c d9 01 	movl   $0x1d93c,0x4(%esp)
   14220:	00 
   14221:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14228:	e8 8f cd ff ff       	call   10fbc <Print>
   1422d:	eb fe                	jmp    1422d <Mutex_Wait+0xa9>
   1422f:	e8 1d c1 ff ff       	call   10351 <Interrupts_Enabled>
   14234:	84 c0                	test   %al,%al
   14236:	75 4a                	jne    14282 <Mutex_Wait+0xfe>
   14238:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1423f:	e8 af ce ff ff       	call   110f3 <Set_Current_Attr>
   14244:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14249:	89 44 24 18          	mov    %eax,0x18(%esp)
   1424d:	8b 45 04             	mov    0x4(%ebp),%eax
   14250:	89 44 24 14          	mov    %eax,0x14(%esp)
   14254:	c7 44 24 10 28 00 00 	movl   $0x28,0x10(%esp)
   1425b:	00 
   1425c:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14263:	00 
   14264:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1426b:	00 
   1426c:	c7 44 24 04 3c d9 01 	movl   $0x1d93c,0x4(%esp)
   14273:	00 
   14274:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1427b:	e8 3c cd ff ff       	call   10fbc <Print>
   14280:	eb fe                	jmp    14280 <Mutex_Wait+0xfc>
   14282:	fa                   	cli    
   14283:	c7 05 cc 07 02 00 00 	movl   $0x0,0x207cc
   1428a:	00 00 00 
   1428d:	83 c3 08             	add    $0x8,%ebx
   14290:	89 1c 24             	mov    %ebx,(%esp)
   14293:	e8 87 0d 00 00       	call   1501f <Wait>
   14298:	c7 05 cc 07 02 00 01 	movl   $0x1,0x207cc
   1429f:	00 00 00 
   142a2:	e8 aa c0 ff ff       	call   10351 <Interrupts_Enabled>
   142a7:	84 c0                	test   %al,%al
   142a9:	74 4a                	je     142f5 <Mutex_Wait+0x171>
   142ab:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   142b2:	e8 3c ce ff ff       	call   110f3 <Set_Current_Attr>
   142b7:	a1 d0 07 02 00       	mov    0x207d0,%eax
   142bc:	89 44 24 18          	mov    %eax,0x18(%esp)
   142c0:	8b 45 04             	mov    0x4(%ebp),%eax
   142c3:	89 44 24 14          	mov    %eax,0x14(%esp)
   142c7:	c7 44 24 10 2c 00 00 	movl   $0x2c,0x10(%esp)
   142ce:	00 
   142cf:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   142d6:	00 
   142d7:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   142de:	00 
   142df:	c7 44 24 04 3c d9 01 	movl   $0x1d93c,0x4(%esp)
   142e6:	00 
   142e7:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   142ee:	e8 c9 cc ff ff       	call   10fbc <Print>
   142f3:	eb fe                	jmp    142f3 <Mutex_Wait+0x16f>
   142f5:	fb                   	sti    
   142f6:	83 c4 24             	add    $0x24,%esp
   142f9:	5b                   	pop    %ebx
   142fa:	5d                   	pop    %ebp
   142fb:	c3                   	ret    

000142fc <Cond_Wait>:
   142fc:	55                   	push   %ebp
   142fd:	89 e5                	mov    %esp,%ebp
   142ff:	53                   	push   %ebx
   14300:	83 ec 24             	sub    $0x24,%esp
   14303:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   14306:	e8 46 c0 ff ff       	call   10351 <Interrupts_Enabled>
   1430b:	84 c0                	test   %al,%al
   1430d:	75 4a                	jne    14359 <Cond_Wait+0x5d>
   1430f:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14316:	e8 d8 cd ff ff       	call   110f3 <Set_Current_Attr>
   1431b:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14320:	89 44 24 18          	mov    %eax,0x18(%esp)
   14324:	8b 45 04             	mov    0x4(%ebp),%eax
   14327:	89 44 24 14          	mov    %eax,0x14(%esp)
   1432b:	c7 44 24 10 94 00 00 	movl   $0x94,0x10(%esp)
   14332:	00 
   14333:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   1433a:	00 
   1433b:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   14342:	00 
   14343:	c7 44 24 04 12 d9 01 	movl   $0x1d912,0x4(%esp)
   1434a:	00 
   1434b:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14352:	e8 65 cc ff ff       	call   10fbc <Print>
   14357:	eb fe                	jmp    14357 <Cond_Wait+0x5b>
   14359:	83 3b 01             	cmpl   $0x1,(%ebx)
   1435c:	75 0b                	jne    14369 <Cond_Wait+0x6d>
   1435e:	8b 43 04             	mov    0x4(%ebx),%eax
   14361:	3b 05 d0 07 02 00    	cmp    0x207d0,%eax
   14367:	74 4a                	je     143b3 <Cond_Wait+0xb7>
   14369:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14370:	e8 7e cd ff ff       	call   110f3 <Set_Current_Attr>
   14375:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1437a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1437e:	8b 45 04             	mov    0x4(%ebp),%eax
   14381:	89 44 24 14          	mov    %eax,0x14(%esp)
   14385:	c7 44 24 10 97 00 00 	movl   $0x97,0x10(%esp)
   1438c:	00 
   1438d:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14394:	00 
   14395:	c7 44 24 08 e8 d8 01 	movl   $0x1d8e8,0x8(%esp)
   1439c:	00 
   1439d:	c7 44 24 04 12 d9 01 	movl   $0x1d912,0x4(%esp)
   143a4:	00 
   143a5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   143ac:	e8 0b cc ff ff       	call   10fbc <Print>
   143b1:	eb fe                	jmp    143b1 <Cond_Wait+0xb5>
   143b3:	c7 05 cc 07 02 00 01 	movl   $0x1,0x207cc
   143ba:	00 00 00 
   143bd:	a1 cc 07 02 00       	mov    0x207cc,%eax
   143c2:	85 c0                	test   %eax,%eax
   143c4:	75 4a                	jne    14410 <Cond_Wait+0x114>
   143c6:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   143cd:	e8 21 cd ff ff       	call   110f3 <Set_Current_Attr>
   143d2:	a1 d0 07 02 00       	mov    0x207d0,%eax
   143d7:	89 44 24 18          	mov    %eax,0x18(%esp)
   143db:	8b 45 04             	mov    0x4(%ebp),%eax
   143de:	89 44 24 14          	mov    %eax,0x14(%esp)
   143e2:	c7 44 24 10 4a 00 00 	movl   $0x4a,0x10(%esp)
   143e9:	00 
   143ea:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   143f1:	00 
   143f2:	c7 44 24 08 cd d9 01 	movl   $0x1d9cd,0x8(%esp)
   143f9:	00 
   143fa:	c7 44 24 04 1c d9 01 	movl   $0x1d91c,0x4(%esp)
   14401:	00 
   14402:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14409:	e8 ae cb ff ff       	call   10fbc <Print>
   1440e:	eb fe                	jmp    1440e <Cond_Wait+0x112>
   14410:	83 3b 01             	cmpl   $0x1,(%ebx)
   14413:	75 0d                	jne    14422 <Cond_Wait+0x126>
   14415:	8b 43 04             	mov    0x4(%ebx),%eax
   14418:	3b 05 d0 07 02 00    	cmp    0x207d0,%eax
   1441e:	66 90                	xchg   %ax,%ax
   14420:	74 4a                	je     1446c <Cond_Wait+0x170>
   14422:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14429:	e8 c5 cc ff ff       	call   110f3 <Set_Current_Attr>
   1442e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14433:	89 44 24 18          	mov    %eax,0x18(%esp)
   14437:	8b 45 04             	mov    0x4(%ebp),%eax
   1443a:	89 44 24 14          	mov    %eax,0x14(%esp)
   1443e:	c7 44 24 10 4d 00 00 	movl   $0x4d,0x10(%esp)
   14445:	00 
   14446:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   1444d:	00 
   1444e:	c7 44 24 08 e8 d8 01 	movl   $0x1d8e8,0x8(%esp)
   14455:	00 
   14456:	c7 44 24 04 1c d9 01 	movl   $0x1d91c,0x4(%esp)
   1445d:	00 
   1445e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14465:	e8 52 cb ff ff       	call   10fbc <Print>
   1446a:	eb fe                	jmp    1446a <Cond_Wait+0x16e>
   1446c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
   14472:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
   14479:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
   1447d:	0f 84 b3 00 00 00    	je     14536 <Cond_Wait+0x23a>
   14483:	e8 c9 be ff ff       	call   10351 <Interrupts_Enabled>
   14488:	84 c0                	test   %al,%al
   1448a:	75 4a                	jne    144d6 <Cond_Wait+0x1da>
   1448c:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14493:	e8 5b cc ff ff       	call   110f3 <Set_Current_Attr>
   14498:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1449d:	89 44 24 18          	mov    %eax,0x18(%esp)
   144a1:	8b 45 04             	mov    0x4(%ebp),%eax
   144a4:	89 44 24 14          	mov    %eax,0x14(%esp)
   144a8:	c7 44 24 10 5b 00 00 	movl   $0x5b,0x10(%esp)
   144af:	00 
   144b0:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   144b7:	00 
   144b8:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   144bf:	00 
   144c0:	c7 44 24 04 1c d9 01 	movl   $0x1d91c,0x4(%esp)
   144c7:	00 
   144c8:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   144cf:	e8 e8 ca ff ff       	call   10fbc <Print>
   144d4:	eb fe                	jmp    144d4 <Cond_Wait+0x1d8>
   144d6:	fa                   	cli    
   144d7:	8d 43 08             	lea    0x8(%ebx),%eax
   144da:	89 04 24             	mov    %eax,(%esp)
   144dd:	e8 32 0d 00 00       	call   15214 <Wake_Up_One>
   144e2:	e8 6a be ff ff       	call   10351 <Interrupts_Enabled>
   144e7:	84 c0                	test   %al,%al
   144e9:	74 4a                	je     14535 <Cond_Wait+0x239>
   144eb:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   144f2:	e8 fc cb ff ff       	call   110f3 <Set_Current_Attr>
   144f7:	a1 d0 07 02 00       	mov    0x207d0,%eax
   144fc:	89 44 24 18          	mov    %eax,0x18(%esp)
   14500:	8b 45 04             	mov    0x4(%ebp),%eax
   14503:	89 44 24 14          	mov    %eax,0x14(%esp)
   14507:	c7 44 24 10 5d 00 00 	movl   $0x5d,0x10(%esp)
   1450e:	00 
   1450f:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14516:	00 
   14517:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1451e:	00 
   1451f:	c7 44 24 04 1c d9 01 	movl   $0x1d91c,0x4(%esp)
   14526:	00 
   14527:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1452e:	e8 89 ca ff ff       	call   10fbc <Print>
   14533:	eb fe                	jmp    14533 <Cond_Wait+0x237>
   14535:	fb                   	sti    
   14536:	e8 16 be ff ff       	call   10351 <Interrupts_Enabled>
   1453b:	84 c0                	test   %al,%al
   1453d:	8d 76 00             	lea    0x0(%esi),%esi
   14540:	75 4a                	jne    1458c <Cond_Wait+0x290>
   14542:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14549:	e8 a5 cb ff ff       	call   110f3 <Set_Current_Attr>
   1454e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14553:	89 44 24 18          	mov    %eax,0x18(%esp)
   14557:	8b 45 04             	mov    0x4(%ebp),%eax
   1455a:	89 44 24 14          	mov    %eax,0x14(%esp)
   1455e:	c7 44 24 10 ab 00 00 	movl   $0xab,0x10(%esp)
   14565:	00 
   14566:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   1456d:	00 
   1456e:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   14575:	00 
   14576:	c7 44 24 04 12 d9 01 	movl   $0x1d912,0x4(%esp)
   1457d:	00 
   1457e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14585:	e8 32 ca ff ff       	call   10fbc <Print>
   1458a:	eb fe                	jmp    1458a <Cond_Wait+0x28e>
   1458c:	fa                   	cli    
   1458d:	c7 05 cc 07 02 00 00 	movl   $0x0,0x207cc
   14594:	00 00 00 
   14597:	8b 45 08             	mov    0x8(%ebp),%eax
   1459a:	89 04 24             	mov    %eax,(%esp)
   1459d:	e8 7d 0a 00 00       	call   1501f <Wait>
   145a2:	c7 05 cc 07 02 00 01 	movl   $0x1,0x207cc
   145a9:	00 00 00 
   145ac:	e8 a0 bd ff ff       	call   10351 <Interrupts_Enabled>
   145b1:	84 c0                	test   %al,%al
   145b3:	74 4a                	je     145ff <Cond_Wait+0x303>
   145b5:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   145bc:	e8 32 cb ff ff       	call   110f3 <Set_Current_Attr>
   145c1:	a1 d0 07 02 00       	mov    0x207d0,%eax
   145c6:	89 44 24 18          	mov    %eax,0x18(%esp)
   145ca:	8b 45 04             	mov    0x4(%ebp),%eax
   145cd:	89 44 24 14          	mov    %eax,0x14(%esp)
   145d1:	c7 44 24 10 af 00 00 	movl   $0xaf,0x10(%esp)
   145d8:	00 
   145d9:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   145e0:	00 
   145e1:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   145e8:	00 
   145e9:	c7 44 24 04 12 d9 01 	movl   $0x1d912,0x4(%esp)
   145f0:	00 
   145f1:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   145f8:	e8 bf c9 ff ff       	call   10fbc <Print>
   145fd:	eb fe                	jmp    145fd <Cond_Wait+0x301>
   145ff:	fb                   	sti    
   14600:	a1 cc 07 02 00       	mov    0x207cc,%eax
   14605:	85 c0                	test   %eax,%eax
   14607:	75 4a                	jne    14653 <Cond_Wait+0x357>
   14609:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14610:	e8 de ca ff ff       	call   110f3 <Set_Current_Attr>
   14615:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1461a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1461e:	8b 45 04             	mov    0x4(%ebp),%eax
   14621:	89 44 24 14          	mov    %eax,0x14(%esp)
   14625:	c7 44 24 10 35 00 00 	movl   $0x35,0x10(%esp)
   1462c:	00 
   1462d:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14634:	00 
   14635:	c7 44 24 08 cd d9 01 	movl   $0x1d9cd,0x8(%esp)
   1463c:	00 
   1463d:	c7 44 24 04 2d d9 01 	movl   $0x1d92d,0x4(%esp)
   14644:	00 
   14645:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1464c:	e8 6b c9 ff ff       	call   10fbc <Print>
   14651:	eb fe                	jmp    14651 <Cond_Wait+0x355>
   14653:	83 3b 01             	cmpl   $0x1,(%ebx)
   14656:	75 5c                	jne    146b4 <Cond_Wait+0x3b8>
   14658:	8b 43 04             	mov    0x4(%ebx),%eax
   1465b:	3b 05 d0 07 02 00    	cmp    0x207d0,%eax
   14661:	75 51                	jne    146b4 <Cond_Wait+0x3b8>
   14663:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1466a:	e8 84 ca ff ff       	call   110f3 <Set_Current_Attr>
   1466f:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14674:	89 44 24 18          	mov    %eax,0x18(%esp)
   14678:	8b 45 04             	mov    0x4(%ebp),%eax
   1467b:	89 44 24 14          	mov    %eax,0x14(%esp)
   1467f:	c7 44 24 10 38 00 00 	movl   $0x38,0x10(%esp)
   14686:	00 
   14687:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   1468e:	00 
   1468f:	c7 44 24 08 e7 d8 01 	movl   $0x1d8e7,0x8(%esp)
   14696:	00 
   14697:	c7 44 24 04 2d d9 01 	movl   $0x1d92d,0x4(%esp)
   1469e:	00 
   1469f:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   146a6:	e8 11 c9 ff ff       	call   10fbc <Print>
   146ab:	eb fe                	jmp    146ab <Cond_Wait+0x3af>
   146ad:	89 d8                	mov    %ebx,%eax
   146af:	e8 d0 fa ff ff       	call   14184 <Mutex_Wait>
   146b4:	83 3b 01             	cmpl   $0x1,(%ebx)
   146b7:	74 f4                	je     146ad <Cond_Wait+0x3b1>
   146b9:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
   146bf:	a1 d0 07 02 00       	mov    0x207d0,%eax
   146c4:	89 43 04             	mov    %eax,0x4(%ebx)
   146c7:	c7 05 cc 07 02 00 00 	movl   $0x0,0x207cc
   146ce:	00 00 00 
   146d1:	83 c4 24             	add    $0x24,%esp
   146d4:	5b                   	pop    %ebx
   146d5:	5d                   	pop    %ebp
   146d6:	c3                   	ret    

000146d7 <Mutex_Lock>:
   146d7:	55                   	push   %ebp
   146d8:	89 e5                	mov    %esp,%ebp
   146da:	53                   	push   %ebx
   146db:	83 ec 24             	sub    $0x24,%esp
   146de:	8b 5d 08             	mov    0x8(%ebp),%ebx
   146e1:	e8 6b bc ff ff       	call   10351 <Interrupts_Enabled>
   146e6:	84 c0                	test   %al,%al
   146e8:	75 4a                	jne    14734 <Mutex_Lock+0x5d>
   146ea:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   146f1:	e8 fd c9 ff ff       	call   110f3 <Set_Current_Attr>
   146f6:	a1 d0 07 02 00       	mov    0x207d0,%eax
   146fb:	89 44 24 18          	mov    %eax,0x18(%esp)
   146ff:	8b 45 04             	mov    0x4(%ebp),%eax
   14702:	89 44 24 14          	mov    %eax,0x14(%esp)
   14706:	c7 44 24 10 74 00 00 	movl   $0x74,0x10(%esp)
   1470d:	00 
   1470e:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14715:	00 
   14716:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1471d:	00 
   1471e:	c7 44 24 04 54 d9 01 	movl   $0x1d954,0x4(%esp)
   14725:	00 
   14726:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1472d:	e8 8a c8 ff ff       	call   10fbc <Print>
   14732:	eb fe                	jmp    14732 <Mutex_Lock+0x5b>
   14734:	c7 05 cc 07 02 00 01 	movl   $0x1,0x207cc
   1473b:	00 00 00 
   1473e:	a1 cc 07 02 00       	mov    0x207cc,%eax
   14743:	85 c0                	test   %eax,%eax
   14745:	75 4a                	jne    14791 <Mutex_Lock+0xba>
   14747:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1474e:	e8 a0 c9 ff ff       	call   110f3 <Set_Current_Attr>
   14753:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14758:	89 44 24 18          	mov    %eax,0x18(%esp)
   1475c:	8b 45 04             	mov    0x4(%ebp),%eax
   1475f:	89 44 24 14          	mov    %eax,0x14(%esp)
   14763:	c7 44 24 10 35 00 00 	movl   $0x35,0x10(%esp)
   1476a:	00 
   1476b:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14772:	00 
   14773:	c7 44 24 08 cd d9 01 	movl   $0x1d9cd,0x8(%esp)
   1477a:	00 
   1477b:	c7 44 24 04 2d d9 01 	movl   $0x1d92d,0x4(%esp)
   14782:	00 
   14783:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1478a:	e8 2d c8 ff ff       	call   10fbc <Print>
   1478f:	eb fe                	jmp    1478f <Mutex_Lock+0xb8>
   14791:	83 3b 01             	cmpl   $0x1,(%ebx)
   14794:	75 5d                	jne    147f3 <Mutex_Lock+0x11c>
   14796:	8b 43 04             	mov    0x4(%ebx),%eax
   14799:	3b 05 d0 07 02 00    	cmp    0x207d0,%eax
   1479f:	90                   	nop
   147a0:	75 51                	jne    147f3 <Mutex_Lock+0x11c>
   147a2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   147a9:	e8 45 c9 ff ff       	call   110f3 <Set_Current_Attr>
   147ae:	a1 d0 07 02 00       	mov    0x207d0,%eax
   147b3:	89 44 24 18          	mov    %eax,0x18(%esp)
   147b7:	8b 45 04             	mov    0x4(%ebp),%eax
   147ba:	89 44 24 14          	mov    %eax,0x14(%esp)
   147be:	c7 44 24 10 38 00 00 	movl   $0x38,0x10(%esp)
   147c5:	00 
   147c6:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   147cd:	00 
   147ce:	c7 44 24 08 e7 d8 01 	movl   $0x1d8e7,0x8(%esp)
   147d5:	00 
   147d6:	c7 44 24 04 2d d9 01 	movl   $0x1d92d,0x4(%esp)
   147dd:	00 
   147de:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   147e5:	e8 d2 c7 ff ff       	call   10fbc <Print>
   147ea:	eb fe                	jmp    147ea <Mutex_Lock+0x113>
   147ec:	89 d8                	mov    %ebx,%eax
   147ee:	e8 91 f9 ff ff       	call   14184 <Mutex_Wait>
   147f3:	83 3b 01             	cmpl   $0x1,(%ebx)
   147f6:	74 f4                	je     147ec <Mutex_Lock+0x115>
   147f8:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
   147fe:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14803:	89 43 04             	mov    %eax,0x4(%ebx)
   14806:	c7 05 cc 07 02 00 00 	movl   $0x0,0x207cc
   1480d:	00 00 00 
   14810:	83 c4 24             	add    $0x24,%esp
   14813:	5b                   	pop    %ebx
   14814:	5d                   	pop    %ebp
   14815:	c3                   	ret    

00014816 <Mutex_Unlock>:
   14816:	55                   	push   %ebp
   14817:	89 e5                	mov    %esp,%ebp
   14819:	53                   	push   %ebx
   1481a:	83 ec 24             	sub    $0x24,%esp
   1481d:	8b 5d 08             	mov    0x8(%ebp),%ebx
   14820:	e8 2c bb ff ff       	call   10351 <Interrupts_Enabled>
   14825:	84 c0                	test   %al,%al
   14827:	75 4a                	jne    14873 <Mutex_Unlock+0x5d>
   14829:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14830:	e8 be c8 ff ff       	call   110f3 <Set_Current_Attr>
   14835:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1483a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1483e:	8b 45 04             	mov    0x4(%ebp),%eax
   14841:	89 44 24 14          	mov    %eax,0x14(%esp)
   14845:	c7 44 24 10 80 00 00 	movl   $0x80,0x10(%esp)
   1484c:	00 
   1484d:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14854:	00 
   14855:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1485c:	00 
   1485d:	c7 44 24 04 47 d9 01 	movl   $0x1d947,0x4(%esp)
   14864:	00 
   14865:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1486c:	e8 4b c7 ff ff       	call   10fbc <Print>
   14871:	eb fe                	jmp    14871 <Mutex_Unlock+0x5b>
   14873:	c7 05 cc 07 02 00 01 	movl   $0x1,0x207cc
   1487a:	00 00 00 
   1487d:	a1 cc 07 02 00       	mov    0x207cc,%eax
   14882:	85 c0                	test   %eax,%eax
   14884:	75 4a                	jne    148d0 <Mutex_Unlock+0xba>
   14886:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1488d:	e8 61 c8 ff ff       	call   110f3 <Set_Current_Attr>
   14892:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14897:	89 44 24 18          	mov    %eax,0x18(%esp)
   1489b:	8b 45 04             	mov    0x4(%ebp),%eax
   1489e:	89 44 24 14          	mov    %eax,0x14(%esp)
   148a2:	c7 44 24 10 4a 00 00 	movl   $0x4a,0x10(%esp)
   148a9:	00 
   148aa:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   148b1:	00 
   148b2:	c7 44 24 08 cd d9 01 	movl   $0x1d9cd,0x8(%esp)
   148b9:	00 
   148ba:	c7 44 24 04 1c d9 01 	movl   $0x1d91c,0x4(%esp)
   148c1:	00 
   148c2:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   148c9:	e8 ee c6 ff ff       	call   10fbc <Print>
   148ce:	eb fe                	jmp    148ce <Mutex_Unlock+0xb8>
   148d0:	83 3b 01             	cmpl   $0x1,(%ebx)
   148d3:	75 0d                	jne    148e2 <Mutex_Unlock+0xcc>
   148d5:	8b 43 04             	mov    0x4(%ebx),%eax
   148d8:	3b 05 d0 07 02 00    	cmp    0x207d0,%eax
   148de:	66 90                	xchg   %ax,%ax
   148e0:	74 4a                	je     1492c <Mutex_Unlock+0x116>
   148e2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   148e9:	e8 05 c8 ff ff       	call   110f3 <Set_Current_Attr>
   148ee:	a1 d0 07 02 00       	mov    0x207d0,%eax
   148f3:	89 44 24 18          	mov    %eax,0x18(%esp)
   148f7:	8b 45 04             	mov    0x4(%ebp),%eax
   148fa:	89 44 24 14          	mov    %eax,0x14(%esp)
   148fe:	c7 44 24 10 4d 00 00 	movl   $0x4d,0x10(%esp)
   14905:	00 
   14906:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   1490d:	00 
   1490e:	c7 44 24 08 e8 d8 01 	movl   $0x1d8e8,0x8(%esp)
   14915:	00 
   14916:	c7 44 24 04 1c d9 01 	movl   $0x1d91c,0x4(%esp)
   1491d:	00 
   1491e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14925:	e8 92 c6 ff ff       	call   10fbc <Print>
   1492a:	eb fe                	jmp    1492a <Mutex_Unlock+0x114>
   1492c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
   14932:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
   14939:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
   1493d:	0f 84 b3 00 00 00    	je     149f6 <Mutex_Unlock+0x1e0>
   14943:	e8 09 ba ff ff       	call   10351 <Interrupts_Enabled>
   14948:	84 c0                	test   %al,%al
   1494a:	75 4a                	jne    14996 <Mutex_Unlock+0x180>
   1494c:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14953:	e8 9b c7 ff ff       	call   110f3 <Set_Current_Attr>
   14958:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1495d:	89 44 24 18          	mov    %eax,0x18(%esp)
   14961:	8b 45 04             	mov    0x4(%ebp),%eax
   14964:	89 44 24 14          	mov    %eax,0x14(%esp)
   14968:	c7 44 24 10 5b 00 00 	movl   $0x5b,0x10(%esp)
   1496f:	00 
   14970:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   14977:	00 
   14978:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1497f:	00 
   14980:	c7 44 24 04 1c d9 01 	movl   $0x1d91c,0x4(%esp)
   14987:	00 
   14988:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1498f:	e8 28 c6 ff ff       	call   10fbc <Print>
   14994:	eb fe                	jmp    14994 <Mutex_Unlock+0x17e>
   14996:	fa                   	cli    
   14997:	83 c3 08             	add    $0x8,%ebx
   1499a:	89 1c 24             	mov    %ebx,(%esp)
   1499d:	e8 72 08 00 00       	call   15214 <Wake_Up_One>
   149a2:	e8 aa b9 ff ff       	call   10351 <Interrupts_Enabled>
   149a7:	84 c0                	test   %al,%al
   149a9:	74 4a                	je     149f5 <Mutex_Unlock+0x1df>
   149ab:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   149b2:	e8 3c c7 ff ff       	call   110f3 <Set_Current_Attr>
   149b7:	a1 d0 07 02 00       	mov    0x207d0,%eax
   149bc:	89 44 24 18          	mov    %eax,0x18(%esp)
   149c0:	8b 45 04             	mov    0x4(%ebp),%eax
   149c3:	89 44 24 14          	mov    %eax,0x14(%esp)
   149c7:	c7 44 24 10 5d 00 00 	movl   $0x5d,0x10(%esp)
   149ce:	00 
   149cf:	c7 44 24 0c b4 d8 01 	movl   $0x1d8b4,0xc(%esp)
   149d6:	00 
   149d7:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   149de:	00 
   149df:	c7 44 24 04 1c d9 01 	movl   $0x1d91c,0x4(%esp)
   149e6:	00 
   149e7:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   149ee:	e8 c9 c5 ff ff       	call   10fbc <Print>
   149f3:	eb fe                	jmp    149f3 <Mutex_Unlock+0x1dd>
   149f5:	fb                   	sti    
   149f6:	c7 05 cc 07 02 00 00 	movl   $0x0,0x207cc
   149fd:	00 00 00 
   14a00:	83 c4 24             	add    $0x24,%esp
   14a03:	5b                   	pop    %ebx
   14a04:	5d                   	pop    %ebp
   14a05:	c3                   	ret    
   14a06:	90                   	nop
   14a07:	90                   	nop
   14a08:	90                   	nop
   14a09:	90                   	nop
   14a0a:	90                   	nop
   14a0b:	90                   	nop
   14a0c:	90                   	nop
   14a0d:	90                   	nop
   14a0e:	90                   	nop
   14a0f:	90                   	nop

00014a10 <Get_Current>:
   14a10:	55                   	push   %ebp
   14a11:	89 e5                	mov    %esp,%ebp
   14a13:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14a18:	5d                   	pop    %ebp
   14a19:	c3                   	ret    

00014a1a <Tlocal_Put>:
   14a1a:	55                   	push   %ebp
   14a1b:	89 e5                	mov    %esp,%ebp
   14a1d:	83 ec 28             	sub    $0x28,%esp
   14a20:	8b 45 08             	mov    0x8(%ebp),%eax
   14a23:	39 05 00 01 02 00    	cmp    %eax,0x20100
   14a29:	77 4a                	ja     14a75 <Tlocal_Put+0x5b>
   14a2b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14a32:	e8 bc c6 ff ff       	call   110f3 <Set_Current_Attr>
   14a37:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14a3c:	89 44 24 18          	mov    %eax,0x18(%esp)
   14a40:	8b 45 04             	mov    0x4(%ebp),%eax
   14a43:	89 44 24 14          	mov    %eax,0x14(%esp)
   14a47:	c7 44 24 10 00 03 00 	movl   $0x300,0x10(%esp)
   14a4e:	00 
   14a4f:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   14a56:	00 
   14a57:	c7 44 24 08 77 d9 01 	movl   $0x1d977,0x8(%esp)
   14a5e:	00 
   14a5f:	c7 44 24 04 87 db 01 	movl   $0x1db87,0x4(%esp)
   14a66:	00 
   14a67:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14a6e:	e8 49 c5 ff ff       	call   10fbc <Print>
   14a73:	eb fe                	jmp    14a73 <Tlocal_Put+0x59>
   14a75:	8b 15 d0 07 02 00    	mov    0x207d0,%edx
   14a7b:	83 f8 7f             	cmp    $0x7f,%eax
   14a7e:	76 4a                	jbe    14aca <Tlocal_Put+0xb0>
   14a80:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14a87:	e8 67 c6 ff ff       	call   110f3 <Set_Current_Attr>
   14a8c:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14a91:	89 44 24 18          	mov    %eax,0x18(%esp)
   14a95:	8b 45 04             	mov    0x4(%ebp),%eax
   14a98:	89 44 24 14          	mov    %eax,0x14(%esp)
   14a9c:	c7 44 24 10 80 01 00 	movl   $0x180,0x10(%esp)
   14aa3:	00 
   14aa4:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   14aab:	00 
   14aac:	c7 44 24 08 8e d9 01 	movl   $0x1d98e,0x8(%esp)
   14ab3:	00 
   14ab4:	c7 44 24 04 74 db 01 	movl   $0x1db74,0x4(%esp)
   14abb:	00 
   14abc:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14ac3:	e8 f4 c4 ff ff       	call   10fbc <Print>
   14ac8:	eb fe                	jmp    14ac8 <Tlocal_Put+0xae>
   14aca:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   14acd:	89 4c 82 40          	mov    %ecx,0x40(%edx,%eax,4)
   14ad1:	c9                   	leave  
   14ad2:	c3                   	ret    

00014ad3 <Tlocal_Create>:
   14ad3:	55                   	push   %ebp
   14ad4:	89 e5                	mov    %esp,%ebp
   14ad6:	56                   	push   %esi
   14ad7:	53                   	push   %ebx
   14ad8:	83 ec 20             	sub    $0x20,%esp
   14adb:	8b 75 08             	mov    0x8(%ebp),%esi
   14ade:	85 f6                	test   %esi,%esi
   14ae0:	75 4a                	jne    14b2c <Tlocal_Create+0x59>
   14ae2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14ae9:	e8 05 c6 ff ff       	call   110f3 <Set_Current_Attr>
   14aee:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14af3:	89 44 24 18          	mov    %eax,0x18(%esp)
   14af7:	8b 45 04             	mov    0x4(%ebp),%eax
   14afa:	89 44 24 14          	mov    %eax,0x14(%esp)
   14afe:	c7 44 24 10 ec 02 00 	movl   $0x2ec,0x10(%esp)
   14b05:	00 
   14b06:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   14b0d:	00 
   14b0e:	c7 44 24 08 a2 d9 01 	movl   $0x1d9a2,0x8(%esp)
   14b15:	00 
   14b16:	c7 44 24 04 92 db 01 	movl   $0x1db92,0x4(%esp)
   14b1d:	00 
   14b1e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14b25:	e8 92 c4 ff ff       	call   10fbc <Print>
   14b2a:	eb fe                	jmp    14b2a <Tlocal_Create+0x57>
   14b2c:	e8 20 b8 ff ff       	call   10351 <Interrupts_Enabled>
   14b31:	89 c3                	mov    %eax,%ebx
   14b33:	84 c0                	test   %al,%al
   14b35:	74 56                	je     14b8d <Tlocal_Create+0xba>
   14b37:	e8 15 b8 ff ff       	call   10351 <Interrupts_Enabled>
   14b3c:	84 c0                	test   %al,%al
   14b3e:	66 90                	xchg   %ax,%ax
   14b40:	75 4a                	jne    14b8c <Tlocal_Create+0xb9>
   14b42:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14b49:	e8 a5 c5 ff ff       	call   110f3 <Set_Current_Attr>
   14b4e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14b53:	89 44 24 18          	mov    %eax,0x18(%esp)
   14b57:	8b 45 04             	mov    0x4(%ebp),%eax
   14b5a:	89 44 24 14          	mov    %eax,0x14(%esp)
   14b5e:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   14b65:	00 
   14b66:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   14b6d:	00 
   14b6e:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   14b75:	00 
   14b76:	c7 44 24 04 49 db 01 	movl   $0x1db49,0x4(%esp)
   14b7d:	00 
   14b7e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14b85:	e8 32 c4 ff ff       	call   10fbc <Print>
   14b8a:	eb fe                	jmp    14b8a <Tlocal_Create+0xb7>
   14b8c:	fa                   	cli    
   14b8d:	8b 15 00 01 02 00    	mov    0x20100,%edx
   14b93:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   14b98:	81 fa 80 00 00 00    	cmp    $0x80,%edx
   14b9e:	0f 84 ce 00 00 00    	je     14c72 <Tlocal_Create+0x19f>
   14ba4:	8b 45 0c             	mov    0xc(%ebp),%eax
   14ba7:	89 04 95 40 01 02 00 	mov    %eax,0x20140(,%edx,4)
   14bae:	89 16                	mov    %edx,(%esi)
   14bb0:	83 c2 01             	add    $0x1,%edx
   14bb3:	89 15 00 01 02 00    	mov    %edx,0x20100
   14bb9:	e8 93 b7 ff ff       	call   10351 <Interrupts_Enabled>
   14bbe:	84 c0                	test   %al,%al
   14bc0:	74 4a                	je     14c0c <Tlocal_Create+0x139>
   14bc2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14bc9:	e8 25 c5 ff ff       	call   110f3 <Set_Current_Attr>
   14bce:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14bd3:	89 44 24 18          	mov    %eax,0x18(%esp)
   14bd7:	8b 45 04             	mov    0x4(%ebp),%eax
   14bda:	89 44 24 14          	mov    %eax,0x14(%esp)
   14bde:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   14be5:	00 
   14be6:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   14bed:	00 
   14bee:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   14bf5:	00 
   14bf6:	c7 44 24 04 5a db 01 	movl   $0x1db5a,0x4(%esp)
   14bfd:	00 
   14bfe:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14c05:	e8 b2 c3 ff ff       	call   10fbc <Print>
   14c0a:	eb fe                	jmp    14c0a <Tlocal_Create+0x137>
   14c0c:	b8 00 00 00 00       	mov    $0x0,%eax
   14c11:	84 db                	test   %bl,%bl
   14c13:	74 5d                	je     14c72 <Tlocal_Create+0x19f>
   14c15:	8d 76 00             	lea    0x0(%esi),%esi
   14c18:	e8 34 b7 ff ff       	call   10351 <Interrupts_Enabled>
   14c1d:	84 c0                	test   %al,%al
   14c1f:	90                   	nop
   14c20:	74 4a                	je     14c6c <Tlocal_Create+0x199>
   14c22:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14c29:	e8 c5 c4 ff ff       	call   110f3 <Set_Current_Attr>
   14c2e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14c33:	89 44 24 18          	mov    %eax,0x18(%esp)
   14c37:	8b 45 04             	mov    0x4(%ebp),%eax
   14c3a:	89 44 24 14          	mov    %eax,0x14(%esp)
   14c3e:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   14c45:	00 
   14c46:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   14c4d:	00 
   14c4e:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   14c55:	00 
   14c56:	c7 44 24 04 5a db 01 	movl   $0x1db5a,0x4(%esp)
   14c5d:	00 
   14c5e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14c65:	e8 52 c3 ff ff       	call   10fbc <Print>
   14c6a:	eb fe                	jmp    14c6a <Tlocal_Create+0x197>
   14c6c:	fb                   	sti    
   14c6d:	b8 00 00 00 00       	mov    $0x0,%eax
   14c72:	83 c4 20             	add    $0x20,%esp
   14c75:	5b                   	pop    %ebx
   14c76:	5e                   	pop    %esi
   14c77:	5d                   	pop    %ebp
   14c78:	c3                   	ret    

00014c79 <Launch_Thread>:
   14c79:	55                   	push   %ebp
   14c7a:	89 e5                	mov    %esp,%ebp
   14c7c:	83 ec 28             	sub    $0x28,%esp
   14c7f:	e8 cd b6 ff ff       	call   10351 <Interrupts_Enabled>
   14c84:	84 c0                	test   %al,%al
   14c86:	74 4a                	je     14cd2 <Launch_Thread+0x59>
   14c88:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14c8f:	e8 5f c4 ff ff       	call   110f3 <Set_Current_Attr>
   14c94:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14c99:	89 44 24 18          	mov    %eax,0x18(%esp)
   14c9d:	8b 45 04             	mov    0x4(%ebp),%eax
   14ca0:	89 44 24 14          	mov    %eax,0x14(%esp)
   14ca4:	c7 44 24 10 d1 00 00 	movl   $0xd1,0x10(%esp)
   14cab:	00 
   14cac:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   14cb3:	00 
   14cb4:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   14cbb:	00 
   14cbc:	c7 44 24 04 83 dc 01 	movl   $0x1dc83,0x4(%esp)
   14cc3:	00 
   14cc4:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14ccb:	e8 ec c2 ff ff       	call   10fbc <Print>
   14cd0:	eb fe                	jmp    14cd0 <Launch_Thread+0x57>
   14cd2:	fb                   	sti    
   14cd3:	c9                   	leave  
   14cd4:	c3                   	ret    

00014cd5 <Init_Thread>:
   14cd5:	55                   	push   %ebp
   14cd6:	89 e5                	mov    %esp,%ebp
   14cd8:	83 ec 10             	sub    $0x10,%esp
   14cdb:	89 5d f4             	mov    %ebx,-0xc(%ebp)
   14cde:	89 75 f8             	mov    %esi,-0x8(%ebp)
   14ce1:	89 7d fc             	mov    %edi,-0x4(%ebp)
   14ce4:	89 c3                	mov    %eax,%ebx
   14ce6:	89 ce                	mov    %ecx,%esi
   14ce8:	80 7d 08 00          	cmpb   $0x0,0x8(%ebp)
   14cec:	75 38                	jne    14d26 <Init_Thread+0x51>
   14cee:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14cf3:	89 45 f0             	mov    %eax,-0x10(%ebp)
   14cf6:	b9 90 00 00 00       	mov    $0x90,%ecx
   14cfb:	b8 00 00 00 00       	mov    $0x0,%eax
   14d00:	89 df                	mov    %ebx,%edi
   14d02:	f3 ab                	rep stos %eax,%es:(%edi)
   14d04:	89 53 14             	mov    %edx,0x14(%ebx)
   14d07:	81 c2 00 10 00 00    	add    $0x1000,%edx
   14d0d:	89 13                	mov    %edx,(%ebx)
   14d0f:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
   14d16:	89 73 08             	mov    %esi,0x8(%ebx)
   14d19:	8b 45 f0             	mov    -0x10(%ebp),%eax
   14d1c:	89 43 1c             	mov    %eax,0x1c(%ebx)
   14d1f:	b8 02 00 00 00       	mov    $0x2,%eax
   14d24:	eb 25                	jmp    14d4b <Init_Thread+0x76>
   14d26:	b9 90 00 00 00       	mov    $0x90,%ecx
   14d2b:	b8 00 00 00 00       	mov    $0x0,%eax
   14d30:	89 df                	mov    %ebx,%edi
   14d32:	f3 ab                	rep stos %eax,%es:(%edi)
   14d34:	89 53 14             	mov    %edx,0x14(%ebx)
   14d37:	81 c2 00 10 00 00    	add    $0x1000,%edx
   14d3d:	89 13                	mov    %edx,(%ebx)
   14d3f:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
   14d46:	89 73 08             	mov    %esi,0x8(%ebx)
   14d49:	b0 01                	mov    $0x1,%al
   14d4b:	89 43 20             	mov    %eax,0x20(%ebx)
   14d4e:	c6 43 24 01          	movb   $0x1,0x24(%ebx)
   14d52:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
   14d59:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
   14d60:	a1 20 f0 01 00       	mov    0x1f020,%eax
   14d65:	89 43 34             	mov    %eax,0x34(%ebx)
   14d68:	83 c0 01             	add    $0x1,%eax
   14d6b:	a3 20 f0 01 00       	mov    %eax,0x1f020
   14d70:	8b 5d f4             	mov    -0xc(%ebp),%ebx
   14d73:	8b 75 f8             	mov    -0x8(%ebp),%esi
   14d76:	8b 7d fc             	mov    -0x4(%ebp),%edi
   14d79:	89 ec                	mov    %ebp,%esp
   14d7b:	5d                   	pop    %ebp
   14d7c:	c3                   	ret    

00014d7d <Get_Next_Runnable>:
   14d7d:	55                   	push   %ebp
   14d7e:	89 e5                	mov    %esp,%ebp
   14d80:	53                   	push   %ebx
   14d81:	83 ec 24             	sub    $0x24,%esp
   14d84:	8b 0d 0c 01 02 00    	mov    0x2010c,%ecx
   14d8a:	85 c9                	test   %ecx,%ecx
   14d8c:	74 2c                	je     14dba <Get_Next_Runnable+0x3d>
   14d8e:	89 ca                	mov    %ecx,%edx
   14d90:	89 c8                	mov    %ecx,%eax
   14d92:	eb 0e                	jmp    14da2 <Get_Next_Runnable+0x25>
   14d94:	85 c0                	test   %eax,%eax
   14d96:	74 08                	je     14da0 <Get_Next_Runnable+0x23>
   14d98:	8b 5a 08             	mov    0x8(%edx),%ebx
   14d9b:	3b 58 08             	cmp    0x8(%eax),%ebx
   14d9e:	7e 02                	jle    14da2 <Get_Next_Runnable+0x25>
   14da0:	89 d0                	mov    %edx,%eax
   14da2:	8b 52 10             	mov    0x10(%edx),%edx
   14da5:	85 d2                	test   %edx,%edx
   14da7:	75 eb                	jne    14d94 <Get_Next_Runnable+0x17>
   14da9:	85 c0                	test   %eax,%eax
   14dab:	74 0d                	je     14dba <Get_Next_Runnable+0x3d>
   14dad:	39 c1                	cmp    %eax,%ecx
   14daf:	75 5e                	jne    14e0f <Get_Next_Runnable+0x92>
   14db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   14db8:	eb 5e                	jmp    14e18 <Get_Next_Runnable+0x9b>
   14dba:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   14dc8:	e8 26 c3 ff ff       	call   110f3 <Set_Current_Attr>
   14dcd:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14dd2:	89 44 24 18          	mov    %eax,0x18(%esp)
   14dd6:	8b 45 04             	mov    0x4(%ebp),%eax
   14dd9:	89 44 24 14          	mov    %eax,0x14(%esp)
   14ddd:	c7 44 24 10 0c 02 00 	movl   $0x20c,0x10(%esp)
   14de4:	00 
   14de5:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   14dec:	00 
   14ded:	c7 44 24 08 a6 d9 01 	movl   $0x1d9a6,0x8(%esp)
   14df4:	00 
   14df5:	c7 44 24 04 2d dc 01 	movl   $0x1dc2d,0x4(%esp)
   14dfc:	00 
   14dfd:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14e04:	e8 b3 c1 ff ff       	call   10fbc <Print>
   14e09:	eb fe                	jmp    14e09 <Get_Next_Runnable+0x8c>
   14e0b:	39 c1                	cmp    %eax,%ecx
   14e0d:	74 09                	je     14e18 <Get_Next_Runnable+0x9b>
   14e0f:	8b 49 10             	mov    0x10(%ecx),%ecx
   14e12:	85 c9                	test   %ecx,%ecx
   14e14:	75 f5                	jne    14e0b <Get_Next_Runnable+0x8e>
   14e16:	eb 49                	jmp    14e61 <Get_Next_Runnable+0xe4>
   14e18:	8b 50 0c             	mov    0xc(%eax),%edx
   14e1b:	85 d2                	test   %edx,%edx
   14e1d:	8d 76 00             	lea    0x0(%esi),%esi
   14e20:	75 10                	jne    14e32 <Get_Next_Runnable+0xb5>
   14e22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   14e28:	eb 10                	jmp    14e3a <Get_Next_Runnable+0xbd>
   14e2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   14e30:	eb f8                	jmp    14e2a <Get_Next_Runnable+0xad>
   14e32:	8b 48 10             	mov    0x10(%eax),%ecx
   14e35:	89 4a 10             	mov    %ecx,0x10(%edx)
   14e38:	eb 09                	jmp    14e43 <Get_Next_Runnable+0xc6>
   14e3a:	8b 50 10             	mov    0x10(%eax),%edx
   14e3d:	89 15 0c 01 02 00    	mov    %edx,0x2010c
   14e43:	8b 50 10             	mov    0x10(%eax),%edx
   14e46:	85 d2                	test   %edx,%edx
   14e48:	74 08                	je     14e52 <Get_Next_Runnable+0xd5>
   14e4a:	8b 48 0c             	mov    0xc(%eax),%ecx
   14e4d:	89 4a 0c             	mov    %ecx,0xc(%edx)
   14e50:	eb 09                	jmp    14e5b <Get_Next_Runnable+0xde>
   14e52:	8b 50 0c             	mov    0xc(%eax),%edx
   14e55:	89 15 10 01 02 00    	mov    %edx,0x20110
   14e5b:	83 c4 24             	add    $0x24,%esp
   14e5e:	5b                   	pop    %ebx
   14e5f:	5d                   	pop    %ebp
   14e60:	c3                   	ret    
   14e61:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14e68:	e8 86 c2 ff ff       	call   110f3 <Set_Current_Attr>
   14e6d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14e72:	89 44 24 18          	mov    %eax,0x18(%esp)
   14e76:	8b 45 04             	mov    0x4(%ebp),%eax
   14e79:	89 44 24 14          	mov    %eax,0x14(%esp)
   14e7d:	c7 44 24 10 44 00 00 	movl   $0x44,0x10(%esp)
   14e84:	00 
   14e85:	c7 44 24 0c b0 d9 01 	movl   $0x1d9b0,0xc(%esp)
   14e8c:	00 
   14e8d:	c7 44 24 08 24 da 01 	movl   $0x1da24,0x8(%esp)
   14e94:	00 
   14e95:	c7 44 24 04 ac db 01 	movl   $0x1dbac,0x4(%esp)
   14e9c:	00 
   14e9d:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14ea4:	e8 13 c1 ff ff       	call   10fbc <Print>
   14ea9:	e9 7c ff ff ff       	jmp    14e2a <Get_Next_Runnable+0xad>

00014eae <Schedule>:
   14eae:	55                   	push   %ebp
   14eaf:	89 e5                	mov    %esp,%ebp
   14eb1:	83 ec 28             	sub    $0x28,%esp
   14eb4:	e8 98 b4 ff ff       	call   10351 <Interrupts_Enabled>
   14eb9:	84 c0                	test   %al,%al
   14ebb:	74 4a                	je     14f07 <Schedule+0x59>
   14ebd:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14ec4:	e8 2a c2 ff ff       	call   110f3 <Set_Current_Attr>
   14ec9:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14ece:	89 44 24 18          	mov    %eax,0x18(%esp)
   14ed2:	8b 45 04             	mov    0x4(%ebp),%eax
   14ed5:	89 44 24 14          	mov    %eax,0x14(%esp)
   14ed9:	c7 44 24 10 22 02 00 	movl   $0x222,0x10(%esp)
   14ee0:	00 
   14ee1:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   14ee8:	00 
   14ee9:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   14ef0:	00 
   14ef1:	c7 44 24 04 24 dc 01 	movl   $0x1dc24,0x4(%esp)
   14ef8:	00 
   14ef9:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14f00:	e8 b7 c0 ff ff       	call   10fbc <Print>
   14f05:	eb fe                	jmp    14f05 <Schedule+0x57>
   14f07:	a1 cc 07 02 00       	mov    0x207cc,%eax
   14f0c:	85 c0                	test   %eax,%eax
   14f0e:	74 4a                	je     14f5a <Schedule+0xac>
   14f10:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14f17:	e8 d7 c1 ff ff       	call   110f3 <Set_Current_Attr>
   14f1c:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14f21:	89 44 24 18          	mov    %eax,0x18(%esp)
   14f25:	8b 45 04             	mov    0x4(%ebp),%eax
   14f28:	89 44 24 14          	mov    %eax,0x14(%esp)
   14f2c:	c7 44 24 10 25 02 00 	movl   $0x225,0x10(%esp)
   14f33:	00 
   14f34:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   14f3b:	00 
   14f3c:	c7 44 24 08 cc d9 01 	movl   $0x1d9cc,0x8(%esp)
   14f43:	00 
   14f44:	c7 44 24 04 24 dc 01 	movl   $0x1dc24,0x4(%esp)
   14f4b:	00 
   14f4c:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14f53:	e8 64 c0 ff ff       	call   10fbc <Print>
   14f58:	eb fe                	jmp    14f58 <Schedule+0xaa>
   14f5a:	e8 1e fe ff ff       	call   14d7d <Get_Next_Runnable>
   14f5f:	89 04 24             	mov    %eax,(%esp)
   14f62:	e8 a9 5e 00 00       	call   1ae10 <Switch_To_Thread>
   14f67:	c9                   	leave  
   14f68:	c3                   	ret    

00014f69 <Tlocal_Get>:
   14f69:	55                   	push   %ebp
   14f6a:	89 e5                	mov    %esp,%ebp
   14f6c:	83 ec 28             	sub    $0x28,%esp
   14f6f:	8b 45 08             	mov    0x8(%ebp),%eax
   14f72:	39 05 00 01 02 00    	cmp    %eax,0x20100
   14f78:	77 4a                	ja     14fc4 <Tlocal_Get+0x5b>
   14f7a:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14f81:	e8 6d c1 ff ff       	call   110f3 <Set_Current_Attr>
   14f86:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14f8b:	89 44 24 18          	mov    %eax,0x18(%esp)
   14f8f:	8b 45 04             	mov    0x4(%ebp),%eax
   14f92:	89 44 24 14          	mov    %eax,0x14(%esp)
   14f96:	c7 44 24 10 0d 03 00 	movl   $0x30d,0x10(%esp)
   14f9d:	00 
   14f9e:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   14fa5:	00 
   14fa6:	c7 44 24 08 77 d9 01 	movl   $0x1d977,0x8(%esp)
   14fad:	00 
   14fae:	c7 44 24 04 69 db 01 	movl   $0x1db69,0x4(%esp)
   14fb5:	00 
   14fb6:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   14fbd:	e8 fa bf ff ff       	call   10fbc <Print>
   14fc2:	eb fe                	jmp    14fc2 <Tlocal_Get+0x59>
   14fc4:	8b 15 d0 07 02 00    	mov    0x207d0,%edx
   14fca:	83 f8 7f             	cmp    $0x7f,%eax
   14fcd:	76 4a                	jbe    15019 <Tlocal_Get+0xb0>
   14fcf:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   14fd6:	e8 18 c1 ff ff       	call   110f3 <Set_Current_Attr>
   14fdb:	a1 d0 07 02 00       	mov    0x207d0,%eax
   14fe0:	89 44 24 18          	mov    %eax,0x18(%esp)
   14fe4:	8b 45 04             	mov    0x4(%ebp),%eax
   14fe7:	89 44 24 14          	mov    %eax,0x14(%esp)
   14feb:	c7 44 24 10 80 01 00 	movl   $0x180,0x10(%esp)
   14ff2:	00 
   14ff3:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   14ffa:	00 
   14ffb:	c7 44 24 08 8e d9 01 	movl   $0x1d98e,0x8(%esp)
   15002:	00 
   15003:	c7 44 24 04 74 db 01 	movl   $0x1db74,0x4(%esp)
   1500a:	00 
   1500b:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15012:	e8 a5 bf ff ff       	call   10fbc <Print>
   15017:	eb fe                	jmp    15017 <Tlocal_Get+0xae>
   15019:	8b 44 82 40          	mov    0x40(%edx,%eax,4),%eax
   1501d:	c9                   	leave  
   1501e:	c3                   	ret    

0001501f <Wait>:
   1501f:	55                   	push   %ebp
   15020:	89 e5                	mov    %esp,%ebp
   15022:	56                   	push   %esi
   15023:	53                   	push   %ebx
   15024:	83 ec 20             	sub    $0x20,%esp
   15027:	8b 75 08             	mov    0x8(%ebp),%esi
   1502a:	8b 1d d0 07 02 00    	mov    0x207d0,%ebx
   15030:	e8 1c b3 ff ff       	call   10351 <Interrupts_Enabled>
   15035:	84 c0                	test   %al,%al
   15037:	74 4a                	je     15083 <Wait+0x64>
   15039:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15040:	e8 ae c0 ff ff       	call   110f3 <Set_Current_Attr>
   15045:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1504a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1504e:	8b 45 04             	mov    0x4(%ebp),%eax
   15051:	89 44 24 14          	mov    %eax,0x14(%esp)
   15055:	c7 44 24 10 b0 02 00 	movl   $0x2b0,0x10(%esp)
   1505c:	00 
   1505d:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15064:	00 
   15065:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1506c:	00 
   1506d:	c7 44 24 04 cd db 01 	movl   $0x1dbcd,0x4(%esp)
   15074:	00 
   15075:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1507c:	e8 3b bf ff ff       	call   10fbc <Print>
   15081:	eb fe                	jmp    15081 <Wait+0x62>
   15083:	8b 06                	mov    (%esi),%eax
   15085:	eb 0e                	jmp    15095 <Wait+0x76>
   15087:	39 c3                	cmp    %eax,%ebx
   15089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   15090:	74 09                	je     1509b <Wait+0x7c>
   15092:	8b 40 10             	mov    0x10(%eax),%eax
   15095:	85 c0                	test   %eax,%eax
   15097:	75 ee                	jne    15087 <Wait+0x68>
   15099:	eb 70                	jmp    1510b <Wait+0xec>
   1509b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   150a2:	e8 4c c0 ff ff       	call   110f3 <Set_Current_Attr>
   150a7:	a1 d0 07 02 00       	mov    0x207d0,%eax
   150ac:	89 44 24 18          	mov    %eax,0x18(%esp)
   150b0:	8b 45 04             	mov    0x4(%ebp),%eax
   150b3:	89 44 24 14          	mov    %eax,0x14(%esp)
   150b7:	c7 44 24 10 44 00 00 	movl   $0x44,0x10(%esp)
   150be:	00 
   150bf:	c7 44 24 0c b0 d9 01 	movl   $0x1d9b0,0xc(%esp)
   150c6:	00 
   150c7:	c7 44 24 08 50 da 01 	movl   $0x1da50,0x8(%esp)
   150ce:	00 
   150cf:	c7 44 24 04 d2 db 01 	movl   $0x1dbd2,0x4(%esp)
   150d6:	00 
   150d7:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   150de:	e8 d9 be ff ff       	call   10fbc <Print>
   150e3:	eb fe                	jmp    150e3 <Wait+0xc4>
   150e5:	89 5e 04             	mov    %ebx,0x4(%esi)
   150e8:	89 1e                	mov    %ebx,(%esi)
   150ea:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
   150f1:	eb 0c                	jmp    150ff <Wait+0xe0>
   150f3:	89 58 10             	mov    %ebx,0x10(%eax)
   150f6:	8b 46 04             	mov    0x4(%esi),%eax
   150f9:	89 43 0c             	mov    %eax,0xc(%ebx)
   150fc:	89 5e 04             	mov    %ebx,0x4(%esi)
   150ff:	e8 aa fd ff ff       	call   14eae <Schedule>
   15104:	83 c4 20             	add    $0x20,%esp
   15107:	5b                   	pop    %ebx
   15108:	5e                   	pop    %esi
   15109:	5d                   	pop    %ebp
   1510a:	c3                   	ret    
   1510b:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
   15112:	8b 46 04             	mov    0x4(%esi),%eax
   15115:	85 c0                	test   %eax,%eax
   15117:	75 da                	jne    150f3 <Wait+0xd4>
   15119:	eb ca                	jmp    150e5 <Wait+0xc6>

0001511b <Make_Runnable>:
   1511b:	55                   	push   %ebp
   1511c:	89 e5                	mov    %esp,%ebp
   1511e:	53                   	push   %ebx
   1511f:	83 ec 24             	sub    $0x24,%esp
   15122:	8b 5d 08             	mov    0x8(%ebp),%ebx
   15125:	e8 27 b2 ff ff       	call   10351 <Interrupts_Enabled>
   1512a:	84 c0                	test   %al,%al
   1512c:	74 4a                	je     15178 <Make_Runnable+0x5d>
   1512e:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15135:	e8 b9 bf ff ff       	call   110f3 <Set_Current_Attr>
   1513a:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1513f:	89 44 24 18          	mov    %eax,0x18(%esp)
   15143:	8b 45 04             	mov    0x4(%ebp),%eax
   15146:	89 44 24 14          	mov    %eax,0x14(%esp)
   1514a:	c7 44 24 10 eb 01 00 	movl   $0x1eb,0x10(%esp)
   15151:	00 
   15152:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15159:	00 
   1515a:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   15161:	00 
   15162:	c7 44 24 04 54 dc 01 	movl   $0x1dc54,0x4(%esp)
   15169:	00 
   1516a:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15171:	e8 46 be ff ff       	call   10fbc <Print>
   15176:	eb fe                	jmp    15176 <Make_Runnable+0x5b>
   15178:	a1 0c 01 02 00       	mov    0x2010c,%eax
   1517d:	eb 07                	jmp    15186 <Make_Runnable+0x6b>
   1517f:	39 c3                	cmp    %eax,%ebx
   15181:	74 09                	je     1518c <Make_Runnable+0x71>
   15183:	8b 40 10             	mov    0x10(%eax),%eax
   15186:	85 c0                	test   %eax,%eax
   15188:	75 f5                	jne    1517f <Make_Runnable+0x64>
   1518a:	eb 70                	jmp    151fc <Make_Runnable+0xe1>
   1518c:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15193:	e8 5b bf ff ff       	call   110f3 <Set_Current_Attr>
   15198:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1519d:	89 44 24 18          	mov    %eax,0x18(%esp)
   151a1:	8b 45 04             	mov    0x4(%ebp),%eax
   151a4:	89 44 24 14          	mov    %eax,0x14(%esp)
   151a8:	c7 44 24 10 44 00 00 	movl   $0x44,0x10(%esp)
   151af:	00 
   151b0:	c7 44 24 0c b0 d9 01 	movl   $0x1d9b0,0xc(%esp)
   151b7:	00 
   151b8:	c7 44 24 08 50 da 01 	movl   $0x1da50,0x8(%esp)
   151bf:	00 
   151c0:	c7 44 24 04 d2 db 01 	movl   $0x1dbd2,0x4(%esp)
   151c7:	00 
   151c8:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   151cf:	e8 e8 bd ff ff       	call   10fbc <Print>
   151d4:	eb fe                	jmp    151d4 <Make_Runnable+0xb9>
   151d6:	89 1d 10 01 02 00    	mov    %ebx,0x20110
   151dc:	89 1d 0c 01 02 00    	mov    %ebx,0x2010c
   151e2:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
   151e9:	eb 23                	jmp    1520e <Make_Runnable+0xf3>
   151eb:	89 58 10             	mov    %ebx,0x10(%eax)
   151ee:	b8 10 01 02 00       	mov    $0x20110,%eax
   151f3:	8b 10                	mov    (%eax),%edx
   151f5:	89 53 0c             	mov    %edx,0xc(%ebx)
   151f8:	89 18                	mov    %ebx,(%eax)
   151fa:	eb 12                	jmp    1520e <Make_Runnable+0xf3>
   151fc:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
   15203:	a1 10 01 02 00       	mov    0x20110,%eax
   15208:	85 c0                	test   %eax,%eax
   1520a:	75 df                	jne    151eb <Make_Runnable+0xd0>
   1520c:	eb c8                	jmp    151d6 <Make_Runnable+0xbb>
   1520e:	83 c4 24             	add    $0x24,%esp
   15211:	5b                   	pop    %ebx
   15212:	5d                   	pop    %ebp
   15213:	c3                   	ret    

00015214 <Wake_Up_One>:
   15214:	55                   	push   %ebp
   15215:	89 e5                	mov    %esp,%ebp
   15217:	56                   	push   %esi
   15218:	53                   	push   %ebx
   15219:	83 ec 20             	sub    $0x20,%esp
   1521c:	8b 5d 08             	mov    0x8(%ebp),%ebx
   1521f:	e8 2d b1 ff ff       	call   10351 <Interrupts_Enabled>
   15224:	84 c0                	test   %al,%al
   15226:	74 4a                	je     15272 <Wake_Up_One+0x5e>
   15228:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1522f:	e8 bf be ff ff       	call   110f3 <Set_Current_Attr>
   15234:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15239:	89 44 24 18          	mov    %eax,0x18(%esp)
   1523d:	8b 45 04             	mov    0x4(%ebp),%eax
   15240:	89 44 24 14          	mov    %eax,0x14(%esp)
   15244:	c7 44 24 10 dc 02 00 	movl   $0x2dc,0x10(%esp)
   1524b:	00 
   1524c:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15253:	00 
   15254:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1525b:	00 
   1525c:	c7 44 24 04 a0 db 01 	movl   $0x1dba0,0x4(%esp)
   15263:	00 
   15264:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1526b:	e8 4c bd ff ff       	call   10fbc <Print>
   15270:	eb fe                	jmp    15270 <Wake_Up_One+0x5c>
   15272:	8b 13                	mov    (%ebx),%edx
   15274:	85 d2                	test   %edx,%edx
   15276:	0f 84 cc 00 00 00    	je     15348 <Wake_Up_One+0x134>
   1527c:	89 d1                	mov    %edx,%ecx
   1527e:	89 d0                	mov    %edx,%eax
   15280:	eb 0e                	jmp    15290 <Wake_Up_One+0x7c>
   15282:	85 c0                	test   %eax,%eax
   15284:	74 08                	je     1528e <Wake_Up_One+0x7a>
   15286:	8b 71 08             	mov    0x8(%ecx),%esi
   15289:	3b 70 08             	cmp    0x8(%eax),%esi
   1528c:	7e 02                	jle    15290 <Wake_Up_One+0x7c>
   1528e:	89 c8                	mov    %ecx,%eax
   15290:	8b 49 10             	mov    0x10(%ecx),%ecx
   15293:	85 c9                	test   %ecx,%ecx
   15295:	75 eb                	jne    15282 <Wake_Up_One+0x6e>
   15297:	85 c0                	test   %eax,%eax
   15299:	0f 84 a9 00 00 00    	je     15348 <Wake_Up_One+0x134>
   1529f:	39 c2                	cmp    %eax,%edx
   152a1:	75 0f                	jne    152b2 <Wake_Up_One+0x9e>
   152a3:	90                   	nop
   152a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   152a8:	eb 11                	jmp    152bb <Wake_Up_One+0xa7>
   152aa:	39 c2                	cmp    %eax,%edx
   152ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   152b0:	74 09                	je     152bb <Wake_Up_One+0xa7>
   152b2:	8b 52 10             	mov    0x10(%edx),%edx
   152b5:	85 d2                	test   %edx,%edx
   152b7:	75 f1                	jne    152aa <Wake_Up_One+0x96>
   152b9:	eb 43                	jmp    152fe <Wake_Up_One+0xea>
   152bb:	8b 50 0c             	mov    0xc(%eax),%edx
   152be:	85 d2                	test   %edx,%edx
   152c0:	75 10                	jne    152d2 <Wake_Up_One+0xbe>
   152c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   152c8:	eb 10                	jmp    152da <Wake_Up_One+0xc6>
   152ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   152d0:	eb f8                	jmp    152ca <Wake_Up_One+0xb6>
   152d2:	8b 48 10             	mov    0x10(%eax),%ecx
   152d5:	89 4a 10             	mov    %ecx,0x10(%edx)
   152d8:	eb 05                	jmp    152df <Wake_Up_One+0xcb>
   152da:	8b 50 10             	mov    0x10(%eax),%edx
   152dd:	89 13                	mov    %edx,(%ebx)
   152df:	8b 50 10             	mov    0x10(%eax),%edx
   152e2:	85 d2                	test   %edx,%edx
   152e4:	74 08                	je     152ee <Wake_Up_One+0xda>
   152e6:	8b 48 0c             	mov    0xc(%eax),%ecx
   152e9:	89 4a 0c             	mov    %ecx,0xc(%edx)
   152ec:	eb 06                	jmp    152f4 <Wake_Up_One+0xe0>
   152ee:	8b 50 0c             	mov    0xc(%eax),%edx
   152f1:	89 53 04             	mov    %edx,0x4(%ebx)
   152f4:	89 04 24             	mov    %eax,(%esp)
   152f7:	e8 1f fe ff ff       	call   1511b <Make_Runnable>
   152fc:	eb 4a                	jmp    15348 <Wake_Up_One+0x134>
   152fe:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15305:	e8 e9 bd ff ff       	call   110f3 <Set_Current_Attr>
   1530a:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1530f:	89 44 24 18          	mov    %eax,0x18(%esp)
   15313:	8b 45 04             	mov    0x4(%ebp),%eax
   15316:	89 44 24 14          	mov    %eax,0x14(%esp)
   1531a:	c7 44 24 10 44 00 00 	movl   $0x44,0x10(%esp)
   15321:	00 
   15322:	c7 44 24 0c b0 d9 01 	movl   $0x1d9b0,0xc(%esp)
   15329:	00 
   1532a:	c7 44 24 08 24 da 01 	movl   $0x1da24,0x8(%esp)
   15331:	00 
   15332:	c7 44 24 04 ac db 01 	movl   $0x1dbac,0x4(%esp)
   15339:	00 
   1533a:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15341:	e8 76 bc ff ff       	call   10fbc <Print>
   15346:	eb 82                	jmp    152ca <Wake_Up_One+0xb6>
   15348:	83 c4 20             	add    $0x20,%esp
   1534b:	5b                   	pop    %ebx
   1534c:	5e                   	pop    %esi
   1534d:	5d                   	pop    %ebp
   1534e:	c3                   	ret    

0001534f <Wake_Up>:
   1534f:	55                   	push   %ebp
   15350:	89 e5                	mov    %esp,%ebp
   15352:	57                   	push   %edi
   15353:	56                   	push   %esi
   15354:	53                   	push   %ebx
   15355:	83 ec 2c             	sub    $0x2c,%esp
   15358:	8b 7d 08             	mov    0x8(%ebp),%edi
   1535b:	8b 1f                	mov    (%edi),%ebx
   1535d:	e8 ef af ff ff       	call   10351 <Interrupts_Enabled>
   15362:	84 c0                	test   %al,%al
   15364:	75 0c                	jne    15372 <Wake_Up+0x23>
   15366:	85 db                	test   %ebx,%ebx
   15368:	75 5b                	jne    153c5 <Wake_Up+0x76>
   1536a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   15370:	eb 62                	jmp    153d4 <Wake_Up+0x85>
   15372:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   15380:	e8 6e bd ff ff       	call   110f3 <Set_Current_Attr>
   15385:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1538a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1538e:	8b 45 04             	mov    0x4(%ebp),%eax
   15391:	89 44 24 14          	mov    %eax,0x14(%esp)
   15395:	c7 44 24 10 c3 02 00 	movl   $0x2c3,0x10(%esp)
   1539c:	00 
   1539d:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   153a4:	00 
   153a5:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   153ac:	00 
   153ad:	c7 44 24 04 c5 db 01 	movl   $0x1dbc5,0x4(%esp)
   153b4:	00 
   153b5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   153bc:	e8 fb bb ff ff       	call   10fbc <Print>
   153c1:	eb fe                	jmp    153c1 <Wake_Up+0x72>
   153c3:	89 f3                	mov    %esi,%ebx
   153c5:	8b 73 10             	mov    0x10(%ebx),%esi
   153c8:	89 1c 24             	mov    %ebx,(%esp)
   153cb:	e8 4b fd ff ff       	call   1511b <Make_Runnable>
   153d0:	85 f6                	test   %esi,%esi
   153d2:	75 ef                	jne    153c3 <Wake_Up+0x74>
   153d4:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
   153db:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
   153e1:	83 c4 2c             	add    $0x2c,%esp
   153e4:	5b                   	pop    %ebx
   153e5:	5e                   	pop    %esi
   153e6:	5f                   	pop    %edi
   153e7:	5d                   	pop    %ebp
   153e8:	c3                   	ret    

000153e9 <Detach_Thread>:
   153e9:	55                   	push   %ebp
   153ea:	89 e5                	mov    %esp,%ebp
   153ec:	53                   	push   %ebx
   153ed:	83 ec 24             	sub    $0x24,%esp
   153f0:	89 c3                	mov    %eax,%ebx
   153f2:	e8 5a af ff ff       	call   10351 <Interrupts_Enabled>
   153f7:	84 c0                	test   %al,%al
   153f9:	74 4a                	je     15445 <Detach_Thread+0x5c>
   153fb:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15402:	e8 ec bc ff ff       	call   110f3 <Set_Current_Attr>
   15407:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1540c:	89 44 24 18          	mov    %eax,0x18(%esp)
   15410:	8b 45 04             	mov    0x4(%ebp),%eax
   15413:	89 44 24 14          	mov    %eax,0x14(%esp)
   15417:	c7 44 24 10 c0 00 00 	movl   $0xc0,0x10(%esp)
   1541e:	00 
   1541f:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15426:	00 
   15427:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1542e:	00 
   1542f:	c7 44 24 04 f3 db 01 	movl   $0x1dbf3,0x4(%esp)
   15436:	00 
   15437:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1543e:	e8 79 bb ff ff       	call   10fbc <Print>
   15443:	eb fe                	jmp    15443 <Detach_Thread+0x5a>
   15445:	8b 43 20             	mov    0x20(%ebx),%eax
   15448:	85 c0                	test   %eax,%eax
   1544a:	7f 4a                	jg     15496 <Detach_Thread+0xad>
   1544c:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15453:	e8 9b bc ff ff       	call   110f3 <Set_Current_Attr>
   15458:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1545d:	89 44 24 18          	mov    %eax,0x18(%esp)
   15461:	8b 45 04             	mov    0x4(%ebp),%eax
   15464:	89 44 24 14          	mov    %eax,0x14(%esp)
   15468:	c7 44 24 10 c1 00 00 	movl   $0xc1,0x10(%esp)
   1546f:	00 
   15470:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15477:	00 
   15478:	c7 44 24 08 e2 d9 01 	movl   $0x1d9e2,0x8(%esp)
   1547f:	00 
   15480:	c7 44 24 04 f3 db 01 	movl   $0x1dbf3,0x4(%esp)
   15487:	00 
   15488:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1548f:	e8 28 bb ff ff       	call   10fbc <Print>
   15494:	eb fe                	jmp    15494 <Detach_Thread+0xab>
   15496:	83 e8 01             	sub    $0x1,%eax
   15499:	89 43 20             	mov    %eax,0x20(%ebx)
   1549c:	85 c0                	test   %eax,%eax
   1549e:	0f 85 f5 00 00 00    	jne    15599 <Detach_Thread+0x1b0>
   154a4:	e8 a8 ae ff ff       	call   10351 <Interrupts_Enabled>
   154a9:	84 c0                	test   %al,%al
   154ab:	74 4a                	je     154f7 <Detach_Thread+0x10e>
   154ad:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   154b4:	e8 3a bc ff ff       	call   110f3 <Set_Current_Attr>
   154b9:	a1 d0 07 02 00       	mov    0x207d0,%eax
   154be:	89 44 24 18          	mov    %eax,0x18(%esp)
   154c2:	8b 45 04             	mov    0x4(%ebp),%eax
   154c5:	89 44 24 14          	mov    %eax,0x14(%esp)
   154c9:	c7 44 24 10 b6 00 00 	movl   $0xb6,0x10(%esp)
   154d0:	00 
   154d1:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   154d8:	00 
   154d9:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   154e0:	00 
   154e1:	c7 44 24 04 01 dc 01 	movl   $0x1dc01,0x4(%esp)
   154e8:	00 
   154e9:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   154f0:	e8 c7 ba ff ff       	call   10fbc <Print>
   154f5:	eb fe                	jmp    154f5 <Detach_Thread+0x10c>
   154f7:	a1 14 01 02 00       	mov    0x20114,%eax
   154fc:	eb 07                	jmp    15505 <Detach_Thread+0x11c>
   154fe:	39 c3                	cmp    %eax,%ebx
   15500:	74 09                	je     1550b <Detach_Thread+0x122>
   15502:	8b 40 10             	mov    0x10(%eax),%eax
   15505:	85 c0                	test   %eax,%eax
   15507:	75 f5                	jne    154fe <Detach_Thread+0x115>
   15509:	eb 7c                	jmp    15587 <Detach_Thread+0x19e>
   1550b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15512:	e8 dc bb ff ff       	call   110f3 <Set_Current_Attr>
   15517:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1551c:	89 44 24 18          	mov    %eax,0x18(%esp)
   15520:	8b 45 04             	mov    0x4(%ebp),%eax
   15523:	89 44 24 14          	mov    %eax,0x14(%esp)
   15527:	c7 44 24 10 44 00 00 	movl   $0x44,0x10(%esp)
   1552e:	00 
   1552f:	c7 44 24 0c b0 d9 01 	movl   $0x1d9b0,0xc(%esp)
   15536:	00 
   15537:	c7 44 24 08 50 da 01 	movl   $0x1da50,0x8(%esp)
   1553e:	00 
   1553f:	c7 44 24 04 d2 db 01 	movl   $0x1dbd2,0x4(%esp)
   15546:	00 
   15547:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1554e:	e8 69 ba ff ff       	call   10fbc <Print>
   15553:	eb fe                	jmp    15553 <Detach_Thread+0x16a>
   15555:	89 1d 18 01 02 00    	mov    %ebx,0x20118
   1555b:	89 1d 14 01 02 00    	mov    %ebx,0x20114
   15561:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
   15568:	eb 0f                	jmp    15579 <Detach_Thread+0x190>
   1556a:	89 58 10             	mov    %ebx,0x10(%eax)
   1556d:	b8 18 01 02 00       	mov    $0x20118,%eax
   15572:	8b 10                	mov    (%eax),%edx
   15574:	89 53 0c             	mov    %edx,0xc(%ebx)
   15577:	89 18                	mov    %ebx,(%eax)
   15579:	c7 04 24 1c 01 02 00 	movl   $0x2011c,(%esp)
   15580:	e8 ca fd ff ff       	call   1534f <Wake_Up>
   15585:	eb 12                	jmp    15599 <Detach_Thread+0x1b0>
   15587:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
   1558e:	a1 18 01 02 00       	mov    0x20118,%eax
   15593:	85 c0                	test   %eax,%eax
   15595:	75 d3                	jne    1556a <Detach_Thread+0x181>
   15597:	eb bc                	jmp    15555 <Detach_Thread+0x16c>
   15599:	83 c4 24             	add    $0x24,%esp
   1559c:	5b                   	pop    %ebx
   1559d:	5d                   	pop    %ebp
   1559e:	c3                   	ret    

0001559f <Join>:
   1559f:	55                   	push   %ebp
   155a0:	89 e5                	mov    %esp,%ebp
   155a2:	56                   	push   %esi
   155a3:	53                   	push   %ebx
   155a4:	83 ec 20             	sub    $0x20,%esp
   155a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
   155aa:	e8 a2 ad ff ff       	call   10351 <Interrupts_Enabled>
   155af:	84 c0                	test   %al,%al
   155b1:	75 4a                	jne    155fd <Join+0x5e>
   155b3:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   155ba:	e8 34 bb ff ff       	call   110f3 <Set_Current_Attr>
   155bf:	a1 d0 07 02 00       	mov    0x207d0,%eax
   155c4:	89 44 24 18          	mov    %eax,0x18(%esp)
   155c8:	8b 45 04             	mov    0x4(%ebp),%eax
   155cb:	89 44 24 14          	mov    %eax,0x14(%esp)
   155cf:	c7 44 24 10 6b 02 00 	movl   $0x26b,0x10(%esp)
   155d6:	00 
   155d7:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   155de:	00 
   155df:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   155e6:	00 
   155e7:	c7 44 24 04 ee db 01 	movl   $0x1dbee,0x4(%esp)
   155ee:	00 
   155ef:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   155f6:	e8 c1 b9 ff ff       	call   10fbc <Print>
   155fb:	eb fe                	jmp    155fb <Join+0x5c>
   155fd:	8b 43 1c             	mov    0x1c(%ebx),%eax
   15600:	3b 05 d0 07 02 00    	cmp    0x207d0,%eax
   15606:	74 4a                	je     15652 <Join+0xb3>
   15608:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1560f:	e8 df ba ff ff       	call   110f3 <Set_Current_Attr>
   15614:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15619:	89 44 24 18          	mov    %eax,0x18(%esp)
   1561d:	8b 45 04             	mov    0x4(%ebp),%eax
   15620:	89 44 24 14          	mov    %eax,0x14(%esp)
   15624:	c7 44 24 10 6e 02 00 	movl   $0x26e,0x10(%esp)
   1562b:	00 
   1562c:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15633:	00 
   15634:	c7 44 24 08 80 da 01 	movl   $0x1da80,0x8(%esp)
   1563b:	00 
   1563c:	c7 44 24 04 ee db 01 	movl   $0x1dbee,0x4(%esp)
   15643:	00 
   15644:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1564b:	e8 6c b9 ff ff       	call   10fbc <Print>
   15650:	eb fe                	jmp    15650 <Join+0xb1>
   15652:	e8 fa ac ff ff       	call   10351 <Interrupts_Enabled>
   15657:	84 c0                	test   %al,%al
   15659:	75 4a                	jne    156a5 <Join+0x106>
   1565b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15662:	e8 8c ba ff ff       	call   110f3 <Set_Current_Attr>
   15667:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1566c:	89 44 24 18          	mov    %eax,0x18(%esp)
   15670:	8b 45 04             	mov    0x4(%ebp),%eax
   15673:	89 44 24 14          	mov    %eax,0x14(%esp)
   15677:	c7 44 24 10 70 02 00 	movl   $0x270,0x10(%esp)
   1567e:	00 
   1567f:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15686:	00 
   15687:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1568e:	00 
   1568f:	c7 44 24 04 ee db 01 	movl   $0x1dbee,0x4(%esp)
   15696:	00 
   15697:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1569e:	e8 19 b9 ff ff       	call   10fbc <Print>
   156a3:	eb fe                	jmp    156a3 <Join+0x104>
   156a5:	fa                   	cli    
   156a6:	8d 73 28             	lea    0x28(%ebx),%esi
   156a9:	eb 0a                	jmp    156b5 <Join+0x116>
   156ab:	89 34 24             	mov    %esi,(%esp)
   156ae:	66 90                	xchg   %ax,%ax
   156b0:	e8 6a f9 ff ff       	call   1501f <Wait>
   156b5:	80 7b 24 00          	cmpb   $0x0,0x24(%ebx)
   156b9:	75 f0                	jne    156ab <Join+0x10c>
   156bb:	8b 73 30             	mov    0x30(%ebx),%esi
   156be:	89 d8                	mov    %ebx,%eax
   156c0:	e8 24 fd ff ff       	call   153e9 <Detach_Thread>
   156c5:	e8 87 ac ff ff       	call   10351 <Interrupts_Enabled>
   156ca:	84 c0                	test   %al,%al
   156cc:	74 4a                	je     15718 <Join+0x179>
   156ce:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   156d5:	e8 19 ba ff ff       	call   110f3 <Set_Current_Attr>
   156da:	a1 d0 07 02 00       	mov    0x207d0,%eax
   156df:	89 44 24 18          	mov    %eax,0x18(%esp)
   156e3:	8b 45 04             	mov    0x4(%ebp),%eax
   156e6:	89 44 24 14          	mov    %eax,0x14(%esp)
   156ea:	c7 44 24 10 7d 02 00 	movl   $0x27d,0x10(%esp)
   156f1:	00 
   156f2:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   156f9:	00 
   156fa:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   15701:	00 
   15702:	c7 44 24 04 ee db 01 	movl   $0x1dbee,0x4(%esp)
   15709:	00 
   1570a:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15711:	e8 a6 b8 ff ff       	call   10fbc <Print>
   15716:	eb fe                	jmp    15716 <Join+0x177>
   15718:	fb                   	sti    
   15719:	89 f0                	mov    %esi,%eax
   1571b:	83 c4 20             	add    $0x20,%esp
   1571e:	5b                   	pop    %ebx
   1571f:	5e                   	pop    %esi
   15720:	5d                   	pop    %ebp
   15721:	c3                   	ret    

00015722 <Exit>:
   15722:	55                   	push   %ebp
   15723:	89 e5                	mov    %esp,%ebp
   15725:	57                   	push   %edi
   15726:	56                   	push   %esi
   15727:	53                   	push   %ebx
   15728:	83 ec 3c             	sub    $0x3c,%esp
   1572b:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15730:	89 45 dc             	mov    %eax,-0x24(%ebp)
   15733:	e8 19 ac ff ff       	call   10351 <Interrupts_Enabled>
   15738:	84 c0                	test   %al,%al
   1573a:	74 54                	je     15790 <Exit+0x6e>
   1573c:	e8 10 ac ff ff       	call   10351 <Interrupts_Enabled>
   15741:	84 c0                	test   %al,%al
   15743:	75 4a                	jne    1578f <Exit+0x6d>
   15745:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1574c:	e8 a2 b9 ff ff       	call   110f3 <Set_Current_Attr>
   15751:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15756:	89 44 24 18          	mov    %eax,0x18(%esp)
   1575a:	8b 45 04             	mov    0x4(%ebp),%eax
   1575d:	89 44 24 14          	mov    %eax,0x14(%esp)
   15761:	c7 44 24 10 48 02 00 	movl   $0x248,0x10(%esp)
   15768:	00 
   15769:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15770:	00 
   15771:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   15778:	00 
   15779:	c7 44 24 04 0d dc 01 	movl   $0x1dc0d,0x4(%esp)
   15780:	00 
   15781:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15788:	e8 2f b8 ff ff       	call   10fbc <Print>
   1578d:	eb fe                	jmp    1578d <Exit+0x6b>
   1578f:	fa                   	cli    
   15790:	8b 45 08             	mov    0x8(%ebp),%eax
   15793:	8b 55 dc             	mov    -0x24(%ebp),%edx
   15796:	89 42 30             	mov    %eax,0x30(%edx)
   15799:	c6 42 24 00          	movb   $0x0,0x24(%edx)
   1579d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   157a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   157a5:	e8 a7 ab ff ff       	call   10351 <Interrupts_Enabled>
   157aa:	84 c0                	test   %al,%al
   157ac:	75 11                	jne    157bf <Exit+0x9d>
   157ae:	b8 00 00 00 00       	mov    $0x0,%eax
   157b3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
   157ba:	e9 43 01 00 00       	jmp    15902 <Exit+0x1e0>
   157bf:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   157c6:	e8 28 b9 ff ff       	call   110f3 <Set_Current_Attr>
   157cb:	a1 d0 07 02 00       	mov    0x207d0,%eax
   157d0:	89 44 24 18          	mov    %eax,0x18(%esp)
   157d4:	8b 45 04             	mov    0x4(%ebp),%eax
   157d7:	89 44 24 14          	mov    %eax,0x14(%esp)
   157db:	c7 44 24 10 90 01 00 	movl   $0x190,0x10(%esp)
   157e2:	00 
   157e3:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   157ea:	00 
   157eb:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   157f2:	00 
   157f3:	c7 44 24 04 12 dc 01 	movl   $0x1dc12,0x4(%esp)
   157fa:	00 
   157fb:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15802:	e8 b5 b7 ff ff       	call   10fbc <Print>
   15807:	eb fe                	jmp    15807 <Exit+0xe5>
   15809:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   1580c:	8b 7c 9a 40          	mov    0x40(%edx,%ebx,4),%edi
   15810:	85 ff                	test   %edi,%edi
   15812:	0f 84 cd 00 00 00    	je     158e5 <Exit+0x1c3>
   15818:	83 3c 9d 40 01 02 00 	cmpl   $0x0,0x20140(,%ebx,4)
   1581f:	00 
   15820:	0f 84 bf 00 00 00    	je     158e5 <Exit+0x1c3>
   15826:	c7 44 9a 40 00 00 00 	movl   $0x0,0x40(%edx,%ebx,4)
   1582d:	00 
   1582e:	e8 1e ab ff ff       	call   10351 <Interrupts_Enabled>
   15833:	84 c0                	test   %al,%al
   15835:	74 4a                	je     15881 <Exit+0x15f>
   15837:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1583e:	e8 b0 b8 ff ff       	call   110f3 <Set_Current_Attr>
   15843:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15848:	89 44 24 18          	mov    %eax,0x18(%esp)
   1584c:	8b 45 04             	mov    0x4(%ebp),%eax
   1584f:	89 44 24 14          	mov    %eax,0x14(%esp)
   15853:	c7 44 24 10 9c 01 00 	movl   $0x19c,0x10(%esp)
   1585a:	00 
   1585b:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15862:	00 
   15863:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1586a:	00 
   1586b:	c7 44 24 04 12 dc 01 	movl   $0x1dc12,0x4(%esp)
   15872:	00 
   15873:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1587a:	e8 3d b7 ff ff       	call   10fbc <Print>
   1587f:	eb fe                	jmp    1587f <Exit+0x15d>
   15881:	fb                   	sti    
   15882:	89 3c 24             	mov    %edi,(%esp)
   15885:	ff 14 9d 40 01 02 00 	call   *0x20140(,%ebx,4)
   1588c:	e8 c0 aa ff ff       	call   10351 <Interrupts_Enabled>
   15891:	84 c0                	test   %al,%al
   15893:	75 4a                	jne    158df <Exit+0x1bd>
   15895:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1589c:	e8 52 b8 ff ff       	call   110f3 <Set_Current_Attr>
   158a1:	a1 d0 07 02 00       	mov    0x207d0,%eax
   158a6:	89 44 24 18          	mov    %eax,0x18(%esp)
   158aa:	8b 45 04             	mov    0x4(%ebp),%eax
   158ad:	89 44 24 14          	mov    %eax,0x14(%esp)
   158b1:	c7 44 24 10 9e 01 00 	movl   $0x19e,0x10(%esp)
   158b8:	00 
   158b9:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   158c0:	00 
   158c1:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   158c8:	00 
   158c9:	c7 44 24 04 12 dc 01 	movl   $0x1dc12,0x4(%esp)
   158d0:	00 
   158d1:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   158d8:	e8 df b6 ff ff       	call   10fbc <Print>
   158dd:	eb fe                	jmp    158dd <Exit+0x1bb>
   158df:	fa                   	cli    
   158e0:	b8 01 00 00 00       	mov    $0x1,%eax
   158e5:	83 c3 01             	add    $0x1,%ebx
   158e8:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
   158ee:	0f 85 15 ff ff ff    	jne    15809 <Exit+0xe7>
   158f4:	85 c0                	test   %eax,%eax
   158f6:	74 14                	je     1590c <Exit+0x1ea>
   158f8:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
   158fc:	83 7d e0 04          	cmpl   $0x4,-0x20(%ebp)
   15900:	74 0a                	je     1590c <Exit+0x1ea>
   15902:	bb 00 00 00 00       	mov    $0x0,%ebx
   15907:	e9 fd fe ff ff       	jmp    15809 <Exit+0xe7>
   1590c:	8b 45 dc             	mov    -0x24(%ebp),%eax
   1590f:	83 c0 28             	add    $0x28,%eax
   15912:	89 04 24             	mov    %eax,(%esp)
   15915:	e8 35 fa ff ff       	call   1534f <Wake_Up>
   1591a:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1591f:	e8 c5 fa ff ff       	call   153e9 <Detach_Thread>
   15924:	e8 85 f5 ff ff       	call   14eae <Schedule>
   15929:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15930:	e8 be b7 ff ff       	call   110f3 <Set_Current_Attr>
   15935:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1593a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1593e:	8b 45 04             	mov    0x4(%ebp),%eax
   15941:	89 44 24 14          	mov    %eax,0x14(%esp)
   15945:	c7 44 24 10 5f 02 00 	movl   $0x25f,0x10(%esp)
   1594c:	00 
   1594d:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15954:	00 
   15955:	c7 44 24 08 6b d1 01 	movl   $0x1d16b,0x8(%esp)
   1595c:	00 
   1595d:	c7 44 24 04 0d dc 01 	movl   $0x1dc0d,0x4(%esp)
   15964:	00 
   15965:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1596c:	e8 4b b6 ff ff       	call   10fbc <Print>
   15971:	eb fe                	jmp    15971 <Exit+0x24f>

00015973 <Shutdown_Thread>:
   15973:	55                   	push   %ebp
   15974:	89 e5                	mov    %esp,%ebp
   15976:	83 ec 18             	sub    $0x18,%esp
   15979:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   15980:	e8 9d fd ff ff       	call   15722 <Exit>

00015985 <Make_Runnable_Atomic>:
   15985:	55                   	push   %ebp
   15986:	89 e5                	mov    %esp,%ebp
   15988:	83 ec 28             	sub    $0x28,%esp
   1598b:	e8 c1 a9 ff ff       	call   10351 <Interrupts_Enabled>
   15990:	84 c0                	test   %al,%al
   15992:	75 4a                	jne    159de <Make_Runnable_Atomic+0x59>
   15994:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1599b:	e8 53 b7 ff ff       	call   110f3 <Set_Current_Attr>
   159a0:	a1 d0 07 02 00       	mov    0x207d0,%eax
   159a5:	89 44 24 18          	mov    %eax,0x18(%esp)
   159a9:	8b 45 04             	mov    0x4(%ebp),%eax
   159ac:	89 44 24 14          	mov    %eax,0x14(%esp)
   159b0:	c7 44 24 10 f6 01 00 	movl   $0x1f6,0x10(%esp)
   159b7:	00 
   159b8:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   159bf:	00 
   159c0:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   159c7:	00 
   159c8:	c7 44 24 04 3f dc 01 	movl   $0x1dc3f,0x4(%esp)
   159cf:	00 
   159d0:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   159d7:	e8 e0 b5 ff ff       	call   10fbc <Print>
   159dc:	eb fe                	jmp    159dc <Make_Runnable_Atomic+0x57>
   159de:	fa                   	cli    
   159df:	8b 45 08             	mov    0x8(%ebp),%eax
   159e2:	89 04 24             	mov    %eax,(%esp)
   159e5:	e8 31 f7 ff ff       	call   1511b <Make_Runnable>
   159ea:	e8 62 a9 ff ff       	call   10351 <Interrupts_Enabled>
   159ef:	84 c0                	test   %al,%al
   159f1:	74 4a                	je     15a3d <Make_Runnable_Atomic+0xb8>
   159f3:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   159fa:	e8 f4 b6 ff ff       	call   110f3 <Set_Current_Attr>
   159ff:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15a04:	89 44 24 18          	mov    %eax,0x18(%esp)
   15a08:	8b 45 04             	mov    0x4(%ebp),%eax
   15a0b:	89 44 24 14          	mov    %eax,0x14(%esp)
   15a0f:	c7 44 24 10 f8 01 00 	movl   $0x1f8,0x10(%esp)
   15a16:	00 
   15a17:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15a1e:	00 
   15a1f:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   15a26:	00 
   15a27:	c7 44 24 04 3f dc 01 	movl   $0x1dc3f,0x4(%esp)
   15a2e:	00 
   15a2f:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15a36:	e8 81 b5 ff ff       	call   10fbc <Print>
   15a3b:	eb fe                	jmp    15a3b <Make_Runnable_Atomic+0xb6>
   15a3d:	fb                   	sti    
   15a3e:	c9                   	leave  
   15a3f:	c3                   	ret    

00015a40 <Start_Kernel_Thread>:
   15a40:	55                   	push   %ebp
   15a41:	89 e5                	mov    %esp,%ebp
   15a43:	53                   	push   %ebx
   15a44:	83 ec 34             	sub    $0x34,%esp
   15a47:	0f b6 45 14          	movzbl 0x14(%ebp),%eax
   15a4b:	88 45 f7             	mov    %al,-0x9(%ebp)
   15a4e:	e8 74 ce ff ff       	call   128c7 <Alloc_Page>
   15a53:	89 c3                	mov    %eax,%ebx
   15a55:	85 c0                	test   %eax,%eax
   15a57:	0f 84 be 00 00 00    	je     15b1b <Start_Kernel_Thread+0xdb>
   15a5d:	e8 65 ce ff ff       	call   128c7 <Alloc_Page>
   15a62:	85 c0                	test   %eax,%eax
   15a64:	75 12                	jne    15a78 <Start_Kernel_Thread+0x38>
   15a66:	89 1c 24             	mov    %ebx,(%esp)
   15a69:	e8 52 c8 ff ff       	call   122c0 <Free_Page>
   15a6e:	bb 00 00 00 00       	mov    $0x0,%ebx
   15a73:	e9 a3 00 00 00       	jmp    15b1b <Start_Kernel_Thread+0xdb>
   15a78:	0f b6 55 f7          	movzbl -0x9(%ebp),%edx
   15a7c:	89 14 24             	mov    %edx,(%esp)
   15a7f:	8b 4d 10             	mov    0x10(%ebp),%ecx
   15a82:	89 c2                	mov    %eax,%edx
   15a84:	89 d8                	mov    %ebx,%eax
   15a86:	e8 4a f2 ff ff       	call   14cd5 <Init_Thread>
   15a8b:	a1 04 01 02 00       	mov    0x20104,%eax
   15a90:	85 c0                	test   %eax,%eax
   15a92:	0f 84 8b 00 00 00    	je     15b23 <Start_Kernel_Thread+0xe3>
   15a98:	39 c3                	cmp    %eax,%ebx
   15a9a:	75 06                	jne    15aa2 <Start_Kernel_Thread+0x62>
   15a9c:	eb 0d                	jmp    15aab <Start_Kernel_Thread+0x6b>
   15a9e:	39 c3                	cmp    %eax,%ebx
   15aa0:	74 09                	je     15aab <Start_Kernel_Thread+0x6b>
   15aa2:	8b 40 3c             	mov    0x3c(%eax),%eax
   15aa5:	85 c0                	test   %eax,%eax
   15aa7:	75 f5                	jne    15a9e <Start_Kernel_Thread+0x5e>
   15aa9:	eb 78                	jmp    15b23 <Start_Kernel_Thread+0xe3>
   15aab:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15ab2:	e8 3c b6 ff ff       	call   110f3 <Set_Current_Attr>
   15ab7:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15abc:	89 44 24 18          	mov    %eax,0x18(%esp)
   15ac0:	8b 45 04             	mov    0x4(%ebp),%eax
   15ac3:	89 44 24 14          	mov    %eax,0x14(%esp)
   15ac7:	c7 44 24 10 45 00 00 	movl   $0x45,0x10(%esp)
   15ace:	00 
   15acf:	c7 44 24 0c b0 d9 01 	movl   $0x1d9b0,0xc(%esp)
   15ad6:	00 
   15ad7:	c7 44 24 08 a4 da 01 	movl   $0x1daa4,0x8(%esp)
   15ade:	00 
   15adf:	c7 44 24 04 64 dc 01 	movl   $0x1dc64,0x4(%esp)
   15ae6:	00 
   15ae7:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15aee:	e8 c9 b4 ff ff       	call   10fbc <Print>
   15af3:	eb fe                	jmp    15af3 <Start_Kernel_Thread+0xb3>
   15af5:	89 1d 08 01 02 00    	mov    %ebx,0x20108
   15afb:	89 1d 04 01 02 00    	mov    %ebx,0x20104
   15b01:	c7 43 38 00 00 00 00 	movl   $0x0,0x38(%ebx)
   15b08:	eb 2b                	jmp    15b35 <Start_Kernel_Thread+0xf5>
   15b0a:	89 58 3c             	mov    %ebx,0x3c(%eax)
   15b0d:	b8 08 01 02 00       	mov    $0x20108,%eax
   15b12:	8b 10                	mov    (%eax),%edx
   15b14:	89 53 38             	mov    %edx,0x38(%ebx)
   15b17:	89 18                	mov    %ebx,(%eax)
   15b19:	eb 1a                	jmp    15b35 <Start_Kernel_Thread+0xf5>
   15b1b:	89 d8                	mov    %ebx,%eax
   15b1d:	83 c4 34             	add    $0x34,%esp
   15b20:	5b                   	pop    %ebx
   15b21:	5d                   	pop    %ebp
   15b22:	c3                   	ret    
   15b23:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
   15b2a:	a1 08 01 02 00       	mov    0x20108,%eax
   15b2f:	85 c0                	test   %eax,%eax
   15b31:	75 d7                	jne    15b0a <Start_Kernel_Thread+0xca>
   15b33:	eb c0                	jmp    15af5 <Start_Kernel_Thread+0xb5>
   15b35:	8b 03                	mov    (%ebx),%eax
   15b37:	83 e8 04             	sub    $0x4,%eax
   15b3a:	89 03                	mov    %eax,(%ebx)
   15b3c:	8b 55 0c             	mov    0xc(%ebp),%edx
   15b3f:	89 10                	mov    %edx,(%eax)
   15b41:	8b 03                	mov    (%ebx),%eax
   15b43:	83 e8 04             	sub    $0x4,%eax
   15b46:	89 03                	mov    %eax,(%ebx)
   15b48:	c7 00 73 59 01 00    	movl   $0x15973,(%eax)
   15b4e:	8b 03                	mov    (%ebx),%eax
   15b50:	83 e8 04             	sub    $0x4,%eax
   15b53:	89 03                	mov    %eax,(%ebx)
   15b55:	8b 55 08             	mov    0x8(%ebp),%edx
   15b58:	89 10                	mov    %edx,(%eax)
   15b5a:	8b 03                	mov    (%ebx),%eax
   15b5c:	83 e8 04             	sub    $0x4,%eax
   15b5f:	89 03                	mov    %eax,(%ebx)
   15b61:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15b67:	8b 03                	mov    (%ebx),%eax
   15b69:	83 e8 04             	sub    $0x4,%eax
   15b6c:	89 03                	mov    %eax,(%ebx)
   15b6e:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
   15b74:	8b 03                	mov    (%ebx),%eax
   15b76:	83 e8 04             	sub    $0x4,%eax
   15b79:	89 03                	mov    %eax,(%ebx)
   15b7b:	c7 00 79 4c 01 00    	movl   $0x14c79,(%eax)
   15b81:	8b 03                	mov    (%ebx),%eax
   15b83:	83 e8 04             	sub    $0x4,%eax
   15b86:	89 03                	mov    %eax,(%ebx)
   15b88:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15b8e:	8b 03                	mov    (%ebx),%eax
   15b90:	83 e8 04             	sub    $0x4,%eax
   15b93:	89 03                	mov    %eax,(%ebx)
   15b95:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15b9b:	8b 03                	mov    (%ebx),%eax
   15b9d:	83 e8 04             	sub    $0x4,%eax
   15ba0:	89 03                	mov    %eax,(%ebx)
   15ba2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15ba8:	8b 03                	mov    (%ebx),%eax
   15baa:	83 e8 04             	sub    $0x4,%eax
   15bad:	89 03                	mov    %eax,(%ebx)
   15baf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15bb5:	8b 03                	mov    (%ebx),%eax
   15bb7:	83 e8 04             	sub    $0x4,%eax
   15bba:	89 03                	mov    %eax,(%ebx)
   15bbc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15bc2:	8b 03                	mov    (%ebx),%eax
   15bc4:	83 e8 04             	sub    $0x4,%eax
   15bc7:	89 03                	mov    %eax,(%ebx)
   15bc9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15bcf:	8b 03                	mov    (%ebx),%eax
   15bd1:	83 e8 04             	sub    $0x4,%eax
   15bd4:	89 03                	mov    %eax,(%ebx)
   15bd6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15bdc:	8b 03                	mov    (%ebx),%eax
   15bde:	83 e8 04             	sub    $0x4,%eax
   15be1:	89 03                	mov    %eax,(%ebx)
   15be3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15be9:	8b 03                	mov    (%ebx),%eax
   15beb:	83 e8 04             	sub    $0x4,%eax
   15bee:	89 03                	mov    %eax,(%ebx)
   15bf0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15bf6:	8b 03                	mov    (%ebx),%eax
   15bf8:	83 e8 04             	sub    $0x4,%eax
   15bfb:	89 03                	mov    %eax,(%ebx)
   15bfd:	c7 00 10 00 00 00    	movl   $0x10,(%eax)
   15c03:	8b 03                	mov    (%ebx),%eax
   15c05:	83 e8 04             	sub    $0x4,%eax
   15c08:	89 03                	mov    %eax,(%ebx)
   15c0a:	c7 00 10 00 00 00    	movl   $0x10,(%eax)
   15c10:	8b 03                	mov    (%ebx),%eax
   15c12:	83 e8 04             	sub    $0x4,%eax
   15c15:	89 03                	mov    %eax,(%ebx)
   15c17:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15c1d:	8b 03                	mov    (%ebx),%eax
   15c1f:	83 e8 04             	sub    $0x4,%eax
   15c22:	89 03                	mov    %eax,(%ebx)
   15c24:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   15c2a:	89 1c 24             	mov    %ebx,(%esp)
   15c2d:	e8 53 fd ff ff       	call   15985 <Make_Runnable_Atomic>
   15c32:	e9 e4 fe ff ff       	jmp    15b1b <Start_Kernel_Thread+0xdb>

00015c37 <Init_Scheduler>:
   15c37:	55                   	push   %ebp
   15c38:	89 e5                	mov    %esp,%ebp
   15c3a:	83 ec 28             	sub    $0x28,%esp
   15c3d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   15c44:	b9 05 00 00 00       	mov    $0x5,%ecx
   15c49:	ba 00 10 10 00       	mov    $0x101000,%edx
   15c4e:	b8 00 00 10 00       	mov    $0x100000,%eax
   15c53:	e8 7d f0 ff ff       	call   14cd5 <Init_Thread>
   15c58:	c7 05 d0 07 02 00 00 	movl   $0x100000,0x207d0
   15c5f:	00 10 00 
   15c62:	a1 04 01 02 00       	mov    0x20104,%eax
   15c67:	85 c0                	test   %eax,%eax
   15c69:	0f 84 ed 00 00 00    	je     15d5c <Init_Scheduler+0x125>
   15c6f:	3d 00 00 10 00       	cmp    $0x100000,%eax
   15c74:	75 0c                	jne    15c82 <Init_Scheduler+0x4b>
   15c76:	eb 16                	jmp    15c8e <Init_Scheduler+0x57>
   15c78:	3d 00 00 10 00       	cmp    $0x100000,%eax
   15c7d:	8d 76 00             	lea    0x0(%esi),%esi
   15c80:	74 0c                	je     15c8e <Init_Scheduler+0x57>
   15c82:	8b 40 3c             	mov    0x3c(%eax),%eax
   15c85:	85 c0                	test   %eax,%eax
   15c87:	75 ef                	jne    15c78 <Init_Scheduler+0x41>
   15c89:	e9 ce 00 00 00       	jmp    15d5c <Init_Scheduler+0x125>
   15c8e:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15c95:	e8 59 b4 ff ff       	call   110f3 <Set_Current_Attr>
   15c9a:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15c9f:	89 44 24 18          	mov    %eax,0x18(%esp)
   15ca3:	8b 45 04             	mov    0x4(%ebp),%eax
   15ca6:	89 44 24 14          	mov    %eax,0x14(%esp)
   15caa:	c7 44 24 10 45 00 00 	movl   $0x45,0x10(%esp)
   15cb1:	00 
   15cb2:	c7 44 24 0c b0 d9 01 	movl   $0x1d9b0,0xc(%esp)
   15cb9:	00 
   15cba:	c7 44 24 08 a4 da 01 	movl   $0x1daa4,0x8(%esp)
   15cc1:	00 
   15cc2:	c7 44 24 04 64 dc 01 	movl   $0x1dc64,0x4(%esp)
   15cc9:	00 
   15cca:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15cd1:	e8 e6 b2 ff ff       	call   10fbc <Print>
   15cd6:	eb fe                	jmp    15cd6 <Init_Scheduler+0x9f>
   15cd8:	c7 05 08 01 02 00 00 	movl   $0x100000,0x20108
   15cdf:	00 10 00 
   15ce2:	c7 05 04 01 02 00 00 	movl   $0x100000,0x20104
   15ce9:	00 10 00 
   15cec:	c7 05 38 00 10 00 00 	movl   $0x0,0x100038
   15cf3:	00 00 00 
   15cf6:	eb 1a                	jmp    15d12 <Init_Scheduler+0xdb>
   15cf8:	c7 40 3c 00 00 10 00 	movl   $0x100000,0x3c(%eax)
   15cff:	b8 08 01 02 00       	mov    $0x20108,%eax
   15d04:	8b 10                	mov    (%eax),%edx
   15d06:	89 15 38 00 10 00    	mov    %edx,0x100038
   15d0c:	c7 00 00 00 10 00    	movl   $0x100000,(%eax)
   15d12:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
   15d19:	00 
   15d1a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
   15d21:	00 
   15d22:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   15d29:	00 
   15d2a:	c7 04 24 36 5e 01 00 	movl   $0x15e36,(%esp)
   15d31:	e8 0a fd ff ff       	call   15a40 <Start_Kernel_Thread>
   15d36:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
   15d3d:	00 
   15d3e:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
   15d45:	00 
   15d46:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   15d4d:	00 
   15d4e:	c7 04 24 43 5e 01 00 	movl   $0x15e43,(%esp)
   15d55:	e8 e6 fc ff ff       	call   15a40 <Start_Kernel_Thread>
   15d5a:	c9                   	leave  
   15d5b:	c3                   	ret    
   15d5c:	c7 05 3c 00 10 00 00 	movl   $0x0,0x10003c
   15d63:	00 00 00 
   15d66:	a1 08 01 02 00       	mov    0x20108,%eax
   15d6b:	85 c0                	test   %eax,%eax
   15d6d:	75 89                	jne    15cf8 <Init_Scheduler+0xc1>
   15d6f:	e9 64 ff ff ff       	jmp    15cd8 <Init_Scheduler+0xa1>

00015d74 <Yield>:
   15d74:	55                   	push   %ebp
   15d75:	89 e5                	mov    %esp,%ebp
   15d77:	83 ec 28             	sub    $0x28,%esp
   15d7a:	e8 d2 a5 ff ff       	call   10351 <Interrupts_Enabled>
   15d7f:	84 c0                	test   %al,%al
   15d81:	75 4a                	jne    15dcd <Yield+0x59>
   15d83:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15d8a:	e8 64 b3 ff ff       	call   110f3 <Set_Current_Attr>
   15d8f:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15d94:	89 44 24 18          	mov    %eax,0x18(%esp)
   15d98:	8b 45 04             	mov    0x4(%ebp),%eax
   15d9b:	89 44 24 14          	mov    %eax,0x14(%esp)
   15d9f:	c7 44 24 10 39 02 00 	movl   $0x239,0x10(%esp)
   15da6:	00 
   15da7:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15dae:	00 
   15daf:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   15db6:	00 
   15db7:	c7 44 24 04 1e dc 01 	movl   $0x1dc1e,0x4(%esp)
   15dbe:	00 
   15dbf:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15dc6:	e8 f1 b1 ff ff       	call   10fbc <Print>
   15dcb:	eb fe                	jmp    15dcb <Yield+0x57>
   15dcd:	fa                   	cli    
   15dce:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15dd3:	89 04 24             	mov    %eax,(%esp)
   15dd6:	e8 40 f3 ff ff       	call   1511b <Make_Runnable>
   15ddb:	e8 ce f0 ff ff       	call   14eae <Schedule>
   15de0:	e8 6c a5 ff ff       	call   10351 <Interrupts_Enabled>
   15de5:	84 c0                	test   %al,%al
   15de7:	74 4a                	je     15e33 <Yield+0xbf>
   15de9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15df0:	e8 fe b2 ff ff       	call   110f3 <Set_Current_Attr>
   15df5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15dfa:	89 44 24 18          	mov    %eax,0x18(%esp)
   15dfe:	8b 45 04             	mov    0x4(%ebp),%eax
   15e01:	89 44 24 14          	mov    %eax,0x14(%esp)
   15e05:	c7 44 24 10 3c 02 00 	movl   $0x23c,0x10(%esp)
   15e0c:	00 
   15e0d:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15e14:	00 
   15e15:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   15e1c:	00 
   15e1d:	c7 44 24 04 1e dc 01 	movl   $0x1dc1e,0x4(%esp)
   15e24:	00 
   15e25:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15e2c:	e8 8b b1 ff ff       	call   10fbc <Print>
   15e31:	eb fe                	jmp    15e31 <Yield+0xbd>
   15e33:	fb                   	sti    
   15e34:	c9                   	leave  
   15e35:	c3                   	ret    

00015e36 <Idle>:
   15e36:	55                   	push   %ebp
   15e37:	89 e5                	mov    %esp,%ebp
   15e39:	83 ec 08             	sub    $0x8,%esp
   15e3c:	e8 33 ff ff ff       	call   15d74 <Yield>
   15e41:	eb f9                	jmp    15e3c <Idle+0x6>

00015e43 <Reaper>:
   15e43:	55                   	push   %ebp
   15e44:	89 e5                	mov    %esp,%ebp
   15e46:	57                   	push   %edi
   15e47:	56                   	push   %esi
   15e48:	53                   	push   %ebx
   15e49:	83 ec 2c             	sub    $0x2c,%esp
   15e4c:	e8 00 a5 ff ff       	call   10351 <Interrupts_Enabled>
   15e51:	84 c0                	test   %al,%al
   15e53:	75 4a                	jne    15e9f <Reaper+0x5c>
   15e55:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15e5c:	e8 92 b2 ff ff       	call   110f3 <Set_Current_Attr>
   15e61:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15e66:	89 44 24 18          	mov    %eax,0x18(%esp)
   15e6a:	8b 45 04             	mov    0x4(%ebp),%eax
   15e6d:	89 44 24 14          	mov    %eax,0x14(%esp)
   15e71:	c7 44 24 10 41 01 00 	movl   $0x141,0x10(%esp)
   15e78:	00 
   15e79:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15e80:	00 
   15e81:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   15e88:	00 
   15e89:	c7 44 24 04 91 dc 01 	movl   $0x1dc91,0x4(%esp)
   15e90:	00 
   15e91:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15e98:	e8 1f b1 ff ff       	call   10fbc <Print>
   15e9d:	eb fe                	jmp    15e9d <Reaper+0x5a>
   15e9f:	fa                   	cli    
   15ea0:	be 04 01 02 00       	mov    $0x20104,%esi
   15ea5:	8b 1d 14 01 02 00    	mov    0x20114,%ebx
   15eab:	85 db                	test   %ebx,%ebx
   15ead:	75 0e                	jne    15ebd <Reaper+0x7a>
   15eaf:	c7 04 24 1c 01 02 00 	movl   $0x2011c,(%esp)
   15eb6:	e8 64 f1 ff ff       	call   1501f <Wait>
   15ebb:	eb e8                	jmp    15ea5 <Reaper+0x62>
   15ebd:	c7 05 18 01 02 00 00 	movl   $0x0,0x20118
   15ec4:	00 00 00 
   15ec7:	c7 05 14 01 02 00 00 	movl   $0x0,0x20114
   15ece:	00 00 00 
   15ed1:	e8 7b a4 ff ff       	call   10351 <Interrupts_Enabled>
   15ed6:	84 c0                	test   %al,%al
   15ed8:	74 4a                	je     15f24 <Reaper+0xe1>
   15eda:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15ee1:	e8 0d b2 ff ff       	call   110f3 <Set_Current_Attr>
   15ee6:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15eeb:	89 44 24 18          	mov    %eax,0x18(%esp)
   15eef:	8b 45 04             	mov    0x4(%ebp),%eax
   15ef2:	89 44 24 14          	mov    %eax,0x14(%esp)
   15ef6:	c7 44 24 10 51 01 00 	movl   $0x151,0x10(%esp)
   15efd:	00 
   15efe:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15f05:	00 
   15f06:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   15f0d:	00 
   15f0e:	c7 44 24 04 91 dc 01 	movl   $0x1dc91,0x4(%esp)
   15f15:	00 
   15f16:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15f1d:	e8 9a b0 ff ff       	call   10fbc <Print>
   15f22:	eb fe                	jmp    15f22 <Reaper+0xdf>
   15f24:	fb                   	sti    
   15f25:	e8 4a fe ff ff       	call   15d74 <Yield>
   15f2a:	8b 7b 10             	mov    0x10(%ebx),%edi
   15f2d:	e8 1f a4 ff ff       	call   10351 <Interrupts_Enabled>
   15f32:	84 c0                	test   %al,%al
   15f34:	75 4a                	jne    15f80 <Reaper+0x13d>
   15f36:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   15f3d:	e8 b1 b1 ff ff       	call   110f3 <Set_Current_Attr>
   15f42:	a1 d0 07 02 00       	mov    0x207d0,%eax
   15f47:	89 44 24 18          	mov    %eax,0x18(%esp)
   15f4b:	8b 45 04             	mov    0x4(%ebp),%eax
   15f4e:	89 44 24 14          	mov    %eax,0x14(%esp)
   15f52:	c7 44 24 10 a5 00 00 	movl   $0xa5,0x10(%esp)
   15f59:	00 
   15f5a:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   15f61:	00 
   15f62:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   15f69:	00 
   15f6a:	c7 44 24 04 98 dc 01 	movl   $0x1dc98,0x4(%esp)
   15f71:	00 
   15f72:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   15f79:	e8 3e b0 ff ff       	call   10fbc <Print>
   15f7e:	eb fe                	jmp    15f7e <Reaper+0x13b>
   15f80:	fa                   	cli    
   15f81:	8b 43 14             	mov    0x14(%ebx),%eax
   15f84:	89 04 24             	mov    %eax,(%esp)
   15f87:	e8 34 c3 ff ff       	call   122c0 <Free_Page>
   15f8c:	89 1c 24             	mov    %ebx,(%esp)
   15f8f:	e8 2c c3 ff ff       	call   122c0 <Free_Page>
   15f94:	8b 06                	mov    (%esi),%eax
   15f96:	85 c0                	test   %eax,%eax
   15f98:	0f 84 0b 01 00 00    	je     160a9 <Reaper+0x266>
   15f9e:	39 c3                	cmp    %eax,%ebx
   15fa0:	75 08                	jne    15faa <Reaper+0x167>
   15fa2:	eb 13                	jmp    15fb7 <Reaper+0x174>
   15fa4:	39 c3                	cmp    %eax,%ebx
   15fa6:	66 90                	xchg   %ax,%ax
   15fa8:	74 0d                	je     15fb7 <Reaper+0x174>
   15faa:	8b 40 3c             	mov    0x3c(%eax),%eax
   15fad:	85 c0                	test   %eax,%eax
   15faf:	90                   	nop
   15fb0:	75 f2                	jne    15fa4 <Reaper+0x161>
   15fb2:	e9 f2 00 00 00       	jmp    160a9 <Reaper+0x266>
   15fb7:	8b 43 38             	mov    0x38(%ebx),%eax
   15fba:	85 c0                	test   %eax,%eax
   15fbc:	75 0c                	jne    15fca <Reaper+0x187>
   15fbe:	66 90                	xchg   %ax,%ax
   15fc0:	eb 10                	jmp    15fd2 <Reaper+0x18f>
   15fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   15fc8:	eb f8                	jmp    15fc2 <Reaper+0x17f>
   15fca:	8b 53 3c             	mov    0x3c(%ebx),%edx
   15fcd:	89 50 3c             	mov    %edx,0x3c(%eax)
   15fd0:	eb 05                	jmp    15fd7 <Reaper+0x194>
   15fd2:	8b 43 3c             	mov    0x3c(%ebx),%eax
   15fd5:	89 06                	mov    %eax,(%esi)
   15fd7:	8b 43 3c             	mov    0x3c(%ebx),%eax
   15fda:	85 c0                	test   %eax,%eax
   15fdc:	74 08                	je     15fe6 <Reaper+0x1a3>
   15fde:	8b 53 38             	mov    0x38(%ebx),%edx
   15fe1:	89 50 38             	mov    %edx,0x38(%eax)
   15fe4:	eb 0a                	jmp    15ff0 <Reaper+0x1ad>
   15fe6:	8b 43 38             	mov    0x38(%ebx),%eax
   15fe9:	ba 08 01 02 00       	mov    $0x20108,%edx
   15fee:	89 02                	mov    %eax,(%edx)
   15ff0:	e8 5c a3 ff ff       	call   10351 <Interrupts_Enabled>
   15ff5:	84 c0                	test   %al,%al
   15ff7:	74 4a                	je     16043 <Reaper+0x200>
   15ff9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16000:	e8 ee b0 ff ff       	call   110f3 <Set_Current_Attr>
   16005:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1600a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1600e:	8b 45 04             	mov    0x4(%ebp),%eax
   16011:	89 44 24 14          	mov    %eax,0x14(%esp)
   16015:	c7 44 24 10 ac 00 00 	movl   $0xac,0x10(%esp)
   1601c:	00 
   1601d:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   16024:	00 
   16025:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1602c:	00 
   1602d:	c7 44 24 04 98 dc 01 	movl   $0x1dc98,0x4(%esp)
   16034:	00 
   16035:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1603c:	e8 7b af ff ff       	call   10fbc <Print>
   16041:	eb fe                	jmp    16041 <Reaper+0x1fe>
   16043:	fb                   	sti    
   16044:	85 ff                	test   %edi,%edi
   16046:	74 07                	je     1604f <Reaper+0x20c>
   16048:	89 fb                	mov    %edi,%ebx
   1604a:	e9 db fe ff ff       	jmp    15f2a <Reaper+0xe7>
   1604f:	90                   	nop
   16050:	e8 fc a2 ff ff       	call   10351 <Interrupts_Enabled>
   16055:	84 c0                	test   %al,%al
   16057:	75 4a                	jne    160a3 <Reaper+0x260>
   16059:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16060:	e8 8e b0 ff ff       	call   110f3 <Set_Current_Attr>
   16065:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1606a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1606e:	8b 45 04             	mov    0x4(%ebp),%eax
   16071:	89 44 24 14          	mov    %eax,0x14(%esp)
   16075:	c7 44 24 10 63 01 00 	movl   $0x163,0x10(%esp)
   1607c:	00 
   1607d:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   16084:	00 
   16085:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1608c:	00 
   1608d:	c7 44 24 04 91 dc 01 	movl   $0x1dc91,0x4(%esp)
   16094:	00 
   16095:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1609c:	e8 1b af ff ff       	call   10fbc <Print>
   160a1:	eb fe                	jmp    160a1 <Reaper+0x25e>
   160a3:	fa                   	cli    
   160a4:	e9 fc fd ff ff       	jmp    15ea5 <Reaper+0x62>
   160a9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   160b0:	e8 3e b0 ff ff       	call   110f3 <Set_Current_Attr>
   160b5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   160ba:	89 44 24 18          	mov    %eax,0x18(%esp)
   160be:	8b 45 04             	mov    0x4(%ebp),%eax
   160c1:	89 44 24 14          	mov    %eax,0x14(%esp)
   160c5:	c7 44 24 10 45 00 00 	movl   $0x45,0x10(%esp)
   160cc:	00 
   160cd:	c7 44 24 0c b0 d9 01 	movl   $0x1d9b0,0xc(%esp)
   160d4:	00 
   160d5:	c7 44 24 08 d4 da 01 	movl   $0x1dad4,0x8(%esp)
   160dc:	00 
   160dd:	c7 44 24 04 a7 dc 01 	movl   $0x1dca7,0x4(%esp)
   160e4:	00 
   160e5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   160ec:	e8 cb ae ff ff       	call   10fbc <Print>
   160f1:	e9 cc fe ff ff       	jmp    15fc2 <Reaper+0x17f>

000160f6 <Lookup_Thread>:
   160f6:	55                   	push   %ebp
   160f7:	89 e5                	mov    %esp,%ebp
   160f9:	56                   	push   %esi
   160fa:	53                   	push   %ebx
   160fb:	83 ec 30             	sub    $0x30,%esp
   160fe:	8b 75 08             	mov    0x8(%ebp),%esi
   16101:	e8 4b a2 ff ff       	call   10351 <Interrupts_Enabled>
   16106:	88 45 f7             	mov    %al,-0x9(%ebp)
   16109:	84 c0                	test   %al,%al
   1610b:	74 54                	je     16161 <Lookup_Thread+0x6b>
   1610d:	e8 3f a2 ff ff       	call   10351 <Interrupts_Enabled>
   16112:	84 c0                	test   %al,%al
   16114:	75 4a                	jne    16160 <Lookup_Thread+0x6a>
   16116:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1611d:	e8 d1 af ff ff       	call   110f3 <Set_Current_Attr>
   16122:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16127:	89 44 24 18          	mov    %eax,0x18(%esp)
   1612b:	8b 45 04             	mov    0x4(%ebp),%eax
   1612e:	89 44 24 14          	mov    %eax,0x14(%esp)
   16132:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   16139:	00 
   1613a:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   16141:	00 
   16142:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   16149:	00 
   1614a:	c7 44 24 04 49 db 01 	movl   $0x1db49,0x4(%esp)
   16151:	00 
   16152:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16159:	e8 5e ae ff ff       	call   10fbc <Print>
   1615e:	eb fe                	jmp    1615e <Lookup_Thread+0x68>
   16160:	fa                   	cli    
   16161:	8b 1d 04 01 02 00    	mov    0x20104,%ebx
   16167:	85 db                	test   %ebx,%ebx
   16169:	74 2c                	je     16197 <Lookup_Thread+0xa1>
   1616b:	39 73 34             	cmp    %esi,0x34(%ebx)
   1616e:	75 20                	jne    16190 <Lookup_Thread+0x9a>
   16170:	eb 08                	jmp    1617a <Lookup_Thread+0x84>
   16172:	39 73 34             	cmp    %esi,0x34(%ebx)
   16175:	8d 76 00             	lea    0x0(%esi),%esi
   16178:	75 16                	jne    16190 <Lookup_Thread+0x9a>
   1617a:	8b 43 1c             	mov    0x1c(%ebx),%eax
   1617d:	3b 05 d0 07 02 00    	cmp    0x207d0,%eax
   16183:	0f 95 c0             	setne  %al
   16186:	0f b6 c0             	movzbl %al,%eax
   16189:	83 e8 01             	sub    $0x1,%eax
   1618c:	21 c3                	and    %eax,%ebx
   1618e:	eb 07                	jmp    16197 <Lookup_Thread+0xa1>
   16190:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
   16193:	85 db                	test   %ebx,%ebx
   16195:	75 db                	jne    16172 <Lookup_Thread+0x7c>
   16197:	e8 b5 a1 ff ff       	call   10351 <Interrupts_Enabled>
   1619c:	84 c0                	test   %al,%al
   1619e:	66 90                	xchg   %ax,%ax
   161a0:	74 4a                	je     161ec <Lookup_Thread+0xf6>
   161a2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   161a9:	e8 45 af ff ff       	call   110f3 <Set_Current_Attr>
   161ae:	a1 d0 07 02 00       	mov    0x207d0,%eax
   161b3:	89 44 24 18          	mov    %eax,0x18(%esp)
   161b7:	8b 45 04             	mov    0x4(%ebp),%eax
   161ba:	89 44 24 14          	mov    %eax,0x14(%esp)
   161be:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   161c5:	00 
   161c6:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   161cd:	00 
   161ce:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   161d5:	00 
   161d6:	c7 44 24 04 5a db 01 	movl   $0x1db5a,0x4(%esp)
   161dd:	00 
   161de:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   161e5:	e8 d2 ad ff ff       	call   10fbc <Print>
   161ea:	eb fe                	jmp    161ea <Lookup_Thread+0xf4>
   161ec:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
   161f0:	74 5b                	je     1624d <Lookup_Thread+0x157>
   161f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   161f8:	e8 54 a1 ff ff       	call   10351 <Interrupts_Enabled>
   161fd:	84 c0                	test   %al,%al
   161ff:	90                   	nop
   16200:	74 4a                	je     1624c <Lookup_Thread+0x156>
   16202:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16209:	e8 e5 ae ff ff       	call   110f3 <Set_Current_Attr>
   1620e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16213:	89 44 24 18          	mov    %eax,0x18(%esp)
   16217:	8b 45 04             	mov    0x4(%ebp),%eax
   1621a:	89 44 24 14          	mov    %eax,0x14(%esp)
   1621e:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   16225:	00 
   16226:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   1622d:	00 
   1622e:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   16235:	00 
   16236:	c7 44 24 04 5a db 01 	movl   $0x1db5a,0x4(%esp)
   1623d:	00 
   1623e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16245:	e8 72 ad ff ff       	call   10fbc <Print>
   1624a:	eb fe                	jmp    1624a <Lookup_Thread+0x154>
   1624c:	fb                   	sti    
   1624d:	89 d8                	mov    %ebx,%eax
   1624f:	83 c4 30             	add    $0x30,%esp
   16252:	5b                   	pop    %ebx
   16253:	5e                   	pop    %esi
   16254:	5d                   	pop    %ebp
   16255:	c3                   	ret    

00016256 <Dump_All_Thread_List>:
   16256:	55                   	push   %ebp
   16257:	89 e5                	mov    %esp,%ebp
   16259:	56                   	push   %esi
   1625a:	53                   	push   %ebx
   1625b:	83 ec 30             	sub    $0x30,%esp
   1625e:	e8 ee a0 ff ff       	call   10351 <Interrupts_Enabled>
   16263:	88 45 f7             	mov    %al,-0x9(%ebp)
   16266:	84 c0                	test   %al,%al
   16268:	74 54                	je     162be <Dump_All_Thread_List+0x68>
   1626a:	e8 e2 a0 ff ff       	call   10351 <Interrupts_Enabled>
   1626f:	84 c0                	test   %al,%al
   16271:	75 4a                	jne    162bd <Dump_All_Thread_List+0x67>
   16273:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1627a:	e8 74 ae ff ff       	call   110f3 <Set_Current_Attr>
   1627f:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16284:	89 44 24 18          	mov    %eax,0x18(%esp)
   16288:	8b 45 04             	mov    0x4(%ebp),%eax
   1628b:	89 44 24 14          	mov    %eax,0x14(%esp)
   1628f:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   16296:	00 
   16297:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   1629e:	00 
   1629f:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   162a6:	00 
   162a7:	c7 44 24 04 49 db 01 	movl   $0x1db49,0x4(%esp)
   162ae:	00 
   162af:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   162b6:	e8 01 ad ff ff       	call   10fbc <Print>
   162bb:	eb fe                	jmp    162bb <Dump_All_Thread_List+0x65>
   162bd:	fa                   	cli    
   162be:	8b 1d 04 01 02 00    	mov    0x20104,%ebx
   162c4:	c7 04 24 f8 d9 01 00 	movl   $0x1d9f8,(%esp)
   162cb:	e8 ec ac ff ff       	call   10fbc <Print>
   162d0:	85 db                	test   %ebx,%ebx
   162d2:	74 7f                	je     16353 <Dump_All_Thread_List+0xfd>
   162d4:	be 00 00 00 00       	mov    $0x0,%esi
   162d9:	8b 43 3c             	mov    0x3c(%ebx),%eax
   162dc:	89 44 24 0c          	mov    %eax,0xc(%esp)
   162e0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
   162e4:	8b 43 38             	mov    0x38(%ebx),%eax
   162e7:	89 44 24 04          	mov    %eax,0x4(%esp)
   162eb:	c7 04 24 fa d9 01 00 	movl   $0x1d9fa,(%esp)
   162f2:	e8 c5 ac ff ff       	call   10fbc <Print>
   162f7:	8b 43 3c             	mov    0x3c(%ebx),%eax
   162fa:	39 c3                	cmp    %eax,%ebx
   162fc:	75 4a                	jne    16348 <Dump_All_Thread_List+0xf2>
   162fe:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16305:	e8 e9 ad ff ff       	call   110f3 <Set_Current_Attr>
   1630a:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1630f:	89 44 24 18          	mov    %eax,0x18(%esp)
   16313:	8b 45 04             	mov    0x4(%ebp),%eax
   16316:	89 44 24 14          	mov    %eax,0x14(%esp)
   1631a:	c7 44 24 10 26 03 00 	movl   $0x326,0x10(%esp)
   16321:	00 
   16322:	c7 44 24 0c 5f d9 01 	movl   $0x1d95f,0xc(%esp)
   16329:	00 
   1632a:	c7 44 24 08 04 db 01 	movl   $0x1db04,0x8(%esp)
   16331:	00 
   16332:	c7 44 24 04 34 db 01 	movl   $0x1db34,0x4(%esp)
   16339:	00 
   1633a:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16341:	e8 76 ac ff ff       	call   10fbc <Print>
   16346:	eb fe                	jmp    16346 <Dump_All_Thread_List+0xf0>
   16348:	83 c6 01             	add    $0x1,%esi
   1634b:	85 c0                	test   %eax,%eax
   1634d:	74 09                	je     16358 <Dump_All_Thread_List+0x102>
   1634f:	89 c3                	mov    %eax,%ebx
   16351:	eb 86                	jmp    162d9 <Dump_All_Thread_List+0x83>
   16353:	be 00 00 00 00       	mov    $0x0,%esi
   16358:	c7 04 24 08 da 01 00 	movl   $0x1da08,(%esp)
   1635f:	e8 58 ac ff ff       	call   10fbc <Print>
   16364:	89 74 24 04          	mov    %esi,0x4(%esp)
   16368:	c7 04 24 0b da 01 00 	movl   $0x1da0b,(%esp)
   1636f:	e8 48 ac ff ff       	call   10fbc <Print>
   16374:	e8 d8 9f ff ff       	call   10351 <Interrupts_Enabled>
   16379:	84 c0                	test   %al,%al
   1637b:	74 4a                	je     163c7 <Dump_All_Thread_List+0x171>
   1637d:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16384:	e8 6a ad ff ff       	call   110f3 <Set_Current_Attr>
   16389:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1638e:	89 44 24 18          	mov    %eax,0x18(%esp)
   16392:	8b 45 04             	mov    0x4(%ebp),%eax
   16395:	89 44 24 14          	mov    %eax,0x14(%esp)
   16399:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   163a0:	00 
   163a1:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   163a8:	00 
   163a9:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   163b0:	00 
   163b1:	c7 44 24 04 5a db 01 	movl   $0x1db5a,0x4(%esp)
   163b8:	00 
   163b9:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   163c0:	e8 f7 ab ff ff       	call   10fbc <Print>
   163c5:	eb fe                	jmp    163c5 <Dump_All_Thread_List+0x16f>
   163c7:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
   163cb:	74 57                	je     16424 <Dump_All_Thread_List+0x1ce>
   163cd:	8d 76 00             	lea    0x0(%esi),%esi
   163d0:	e8 7c 9f ff ff       	call   10351 <Interrupts_Enabled>
   163d5:	84 c0                	test   %al,%al
   163d7:	74 4a                	je     16423 <Dump_All_Thread_List+0x1cd>
   163d9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   163e0:	e8 0e ad ff ff       	call   110f3 <Set_Current_Attr>
   163e5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   163ea:	89 44 24 18          	mov    %eax,0x18(%esp)
   163ee:	8b 45 04             	mov    0x4(%ebp),%eax
   163f1:	89 44 24 14          	mov    %eax,0x14(%esp)
   163f5:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   163fc:	00 
   163fd:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   16404:	00 
   16405:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1640c:	00 
   1640d:	c7 44 24 04 5a db 01 	movl   $0x1db5a,0x4(%esp)
   16414:	00 
   16415:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1641c:	e8 9b ab ff ff       	call   10fbc <Print>
   16421:	eb fe                	jmp    16421 <Dump_All_Thread_List+0x1cb>
   16423:	fb                   	sti    
   16424:	83 c4 30             	add    $0x30,%esp
   16427:	5b                   	pop    %ebx
   16428:	5e                   	pop    %esi
   16429:	5d                   	pop    %ebp
   1642a:	c3                   	ret    
   1642b:	90                   	nop
   1642c:	90                   	nop
   1642d:	90                   	nop
   1642e:	90                   	nop
   1642f:	90                   	nop

00016430 <Unmask_DMA>:
   16430:	55                   	push   %ebp
   16431:	89 e5                	mov    %esp,%ebp
   16433:	83 ec 28             	sub    $0x28,%esp
   16436:	8b 45 08             	mov    0x8(%ebp),%eax
   16439:	83 f8 03             	cmp    $0x3,%eax
   1643c:	76 4a                	jbe    16488 <Unmask_DMA+0x58>
   1643e:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16445:	e8 a9 ac ff ff       	call   110f3 <Set_Current_Attr>
   1644a:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1644f:	89 44 24 18          	mov    %eax,0x18(%esp)
   16453:	8b 45 04             	mov    0x4(%ebp),%eax
   16456:	89 44 24 14          	mov    %eax,0x14(%esp)
   1645a:	c7 44 24 10 f4 00 00 	movl   $0xf4,0x10(%esp)
   16461:	00 
   16462:	c7 44 24 0c c3 dc 01 	movl   $0x1dcc3,0xc(%esp)
   16469:	00 
   1646a:	c7 44 24 08 d7 dc 01 	movl   $0x1dcd7,0x8(%esp)
   16471:	00 
   16472:	c7 44 24 04 88 dd 01 	movl   $0x1dd88,0x4(%esp)
   16479:	00 
   1647a:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16481:	e8 36 ab ff ff       	call   10fbc <Print>
   16486:	eb fe                	jmp    16486 <Unmask_DMA+0x56>
   16488:	0f b6 15 40 03 02 00 	movzbl 0x20340,%edx
   1648f:	0f a3 c2             	bt     %eax,%edx
   16492:	72 4a                	jb     164de <Unmask_DMA+0xae>
   16494:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1649b:	e8 53 ac ff ff       	call   110f3 <Set_Current_Attr>
   164a0:	a1 d0 07 02 00       	mov    0x207d0,%eax
   164a5:	89 44 24 18          	mov    %eax,0x18(%esp)
   164a9:	8b 45 04             	mov    0x4(%ebp),%eax
   164ac:	89 44 24 14          	mov    %eax,0x14(%esp)
   164b0:	c7 44 24 10 f5 00 00 	movl   $0xf5,0x10(%esp)
   164b7:	00 
   164b8:	c7 44 24 0c c3 dc 01 	movl   $0x1dcc3,0xc(%esp)
   164bf:	00 
   164c0:	c7 44 24 08 eb dc 01 	movl   $0x1dceb,0x8(%esp)
   164c7:	00 
   164c8:	c7 44 24 04 88 dd 01 	movl   $0x1dd88,0x4(%esp)
   164cf:	00 
   164d0:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   164d7:	e8 e0 aa ff ff       	call   10fbc <Print>
   164dc:	eb fe                	jmp    164dc <Unmask_DMA+0xac>
   164de:	83 e0 03             	and    $0x3,%eax
   164e1:	89 44 24 04          	mov    %eax,0x4(%esp)
   164e5:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
   164ec:	e8 6b a3 ff ff       	call   1085c <Out_Byte>
   164f1:	c9                   	leave  
   164f2:	c3                   	ret    

000164f3 <Mask_DMA>:
   164f3:	55                   	push   %ebp
   164f4:	89 e5                	mov    %esp,%ebp
   164f6:	83 ec 28             	sub    $0x28,%esp
   164f9:	8b 45 08             	mov    0x8(%ebp),%eax
   164fc:	83 f8 03             	cmp    $0x3,%eax
   164ff:	76 4a                	jbe    1654b <Mask_DMA+0x58>
   16501:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16508:	e8 e6 ab ff ff       	call   110f3 <Set_Current_Attr>
   1650d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16512:	89 44 24 18          	mov    %eax,0x18(%esp)
   16516:	8b 45 04             	mov    0x4(%ebp),%eax
   16519:	89 44 24 14          	mov    %eax,0x14(%esp)
   1651d:	c7 44 24 10 e7 00 00 	movl   $0xe7,0x10(%esp)
   16524:	00 
   16525:	c7 44 24 0c c3 dc 01 	movl   $0x1dcc3,0xc(%esp)
   1652c:	00 
   1652d:	c7 44 24 08 d7 dc 01 	movl   $0x1dcd7,0x8(%esp)
   16534:	00 
   16535:	c7 44 24 04 93 dd 01 	movl   $0x1dd93,0x4(%esp)
   1653c:	00 
   1653d:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16544:	e8 73 aa ff ff       	call   10fbc <Print>
   16549:	eb fe                	jmp    16549 <Mask_DMA+0x56>
   1654b:	0f b6 15 40 03 02 00 	movzbl 0x20340,%edx
   16552:	0f a3 c2             	bt     %eax,%edx
   16555:	72 4a                	jb     165a1 <Mask_DMA+0xae>
   16557:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1655e:	e8 90 ab ff ff       	call   110f3 <Set_Current_Attr>
   16563:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16568:	89 44 24 18          	mov    %eax,0x18(%esp)
   1656c:	8b 45 04             	mov    0x4(%ebp),%eax
   1656f:	89 44 24 14          	mov    %eax,0x14(%esp)
   16573:	c7 44 24 10 e8 00 00 	movl   $0xe8,0x10(%esp)
   1657a:	00 
   1657b:	c7 44 24 0c c3 dc 01 	movl   $0x1dcc3,0xc(%esp)
   16582:	00 
   16583:	c7 44 24 08 eb dc 01 	movl   $0x1dceb,0x8(%esp)
   1658a:	00 
   1658b:	c7 44 24 04 93 dd 01 	movl   $0x1dd93,0x4(%esp)
   16592:	00 
   16593:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1659a:	e8 1d aa ff ff       	call   10fbc <Print>
   1659f:	eb fe                	jmp    1659f <Mask_DMA+0xac>
   165a1:	83 e0 03             	and    $0x3,%eax
   165a4:	83 c8 04             	or     $0x4,%eax
   165a7:	89 44 24 04          	mov    %eax,0x4(%esp)
   165ab:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
   165b2:	e8 a5 a2 ff ff       	call   1085c <Out_Byte>
   165b7:	c9                   	leave  
   165b8:	c3                   	ret    

000165b9 <Setup_DMA>:
   165b9:	55                   	push   %ebp
   165ba:	89 e5                	mov    %esp,%ebp
   165bc:	57                   	push   %edi
   165bd:	56                   	push   %esi
   165be:	53                   	push   %ebx
   165bf:	83 ec 2c             	sub    $0x2c,%esp
   165c2:	8b 7d 08             	mov    0x8(%ebp),%edi
   165c5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   165c8:	83 ff 01             	cmp    $0x1,%edi
   165cb:	76 4a                	jbe    16617 <Setup_DMA+0x5e>
   165cd:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   165d4:	e8 1a ab ff ff       	call   110f3 <Set_Current_Attr>
   165d9:	a1 d0 07 02 00       	mov    0x207d0,%eax
   165de:	89 44 24 18          	mov    %eax,0x18(%esp)
   165e2:	8b 45 04             	mov    0x4(%ebp),%eax
   165e5:	89 44 24 14          	mov    %eax,0x14(%esp)
   165e9:	c7 44 24 10 b1 00 00 	movl   $0xb1,0x10(%esp)
   165f0:	00 
   165f1:	c7 44 24 0c c3 dc 01 	movl   $0x1dcc3,0xc(%esp)
   165f8:	00 
   165f9:	c7 44 24 08 14 dd 01 	movl   $0x1dd14,0x8(%esp)
   16600:	00 
   16601:	c7 44 24 04 a0 dd 01 	movl   $0x1dda0,0x4(%esp)
   16608:	00 
   16609:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16610:	e8 a7 a9 ff ff       	call   10fbc <Print>
   16615:	eb fe                	jmp    16615 <Setup_DMA+0x5c>
   16617:	83 fb 03             	cmp    $0x3,%ebx
   1661a:	76 4f                	jbe    1666b <Setup_DMA+0xb2>
   1661c:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16623:	90                   	nop
   16624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   16628:	e8 c6 aa ff ff       	call   110f3 <Set_Current_Attr>
   1662d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16632:	89 44 24 18          	mov    %eax,0x18(%esp)
   16636:	8b 45 04             	mov    0x4(%ebp),%eax
   16639:	89 44 24 14          	mov    %eax,0x14(%esp)
   1663d:	c7 44 24 10 b2 00 00 	movl   $0xb2,0x10(%esp)
   16644:	00 
   16645:	c7 44 24 0c c3 dc 01 	movl   $0x1dcc3,0xc(%esp)
   1664c:	00 
   1664d:	c7 44 24 08 d7 dc 01 	movl   $0x1dcd7,0x8(%esp)
   16654:	00 
   16655:	c7 44 24 04 a0 dd 01 	movl   $0x1dda0,0x4(%esp)
   1665c:	00 
   1665d:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16664:	e8 53 a9 ff ff       	call   10fbc <Print>
   16669:	eb fe                	jmp    16669 <Setup_DMA+0xb0>
   1666b:	0f b6 05 40 03 02 00 	movzbl 0x20340,%eax
   16672:	0f a3 d8             	bt     %ebx,%eax
   16675:	72 4a                	jb     166c1 <Setup_DMA+0x108>
   16677:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1667e:	e8 70 aa ff ff       	call   110f3 <Set_Current_Attr>
   16683:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16688:	89 44 24 18          	mov    %eax,0x18(%esp)
   1668c:	8b 45 04             	mov    0x4(%ebp),%eax
   1668f:	89 44 24 14          	mov    %eax,0x14(%esp)
   16693:	c7 44 24 10 b3 00 00 	movl   $0xb3,0x10(%esp)
   1669a:	00 
   1669b:	c7 44 24 0c c3 dc 01 	movl   $0x1dcc3,0xc(%esp)
   166a2:	00 
   166a3:	c7 44 24 08 eb dc 01 	movl   $0x1dceb,0x8(%esp)
   166aa:	00 
   166ab:	c7 44 24 04 a0 dd 01 	movl   $0x1dda0,0x4(%esp)
   166b2:	00 
   166b3:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   166ba:	e8 fd a8 ff ff       	call   10fbc <Print>
   166bf:	eb fe                	jmp    166bf <Setup_DMA+0x106>
   166c1:	8b 75 10             	mov    0x10(%ebp),%esi
   166c4:	8b 45 14             	mov    0x14(%ebp),%eax
   166c7:	01 f0                	add    %esi,%eax
   166c9:	0f 93 c2             	setae  %dl
   166cc:	85 c0                	test   %eax,%eax
   166ce:	0f 94 c1             	sete   %cl
   166d1:	08 d1                	or     %dl,%cl
   166d3:	74 1d                	je     166f2 <Setup_DMA+0x139>
   166d5:	81 fe ff ff ff 00    	cmp    $0xffffff,%esi
   166db:	77 15                	ja     166f2 <Setup_DMA+0x139>
   166dd:	3d 00 00 00 01       	cmp    $0x1000000,%eax
   166e2:	77 0e                	ja     166f2 <Setup_DMA+0x139>
   166e4:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
   166e8:	0f 85 9f 00 00 00    	jne    1678d <Setup_DMA+0x1d4>
   166ee:	66 90                	xchg   %ax,%ax
   166f0:	eb 51                	jmp    16743 <Setup_DMA+0x18a>
   166f2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   166f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   16700:	e8 ee a9 ff ff       	call   110f3 <Set_Current_Attr>
   16705:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1670a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1670e:	8b 45 04             	mov    0x4(%ebp),%eax
   16711:	89 44 24 14          	mov    %eax,0x14(%esp)
   16715:	c7 44 24 10 b4 00 00 	movl   $0xb4,0x10(%esp)
   1671c:	00 
   1671d:	c7 44 24 0c c3 dc 01 	movl   $0x1dcc3,0xc(%esp)
   16724:	00 
   16725:	c7 44 24 08 fd dc 01 	movl   $0x1dcfd,0x8(%esp)
   1672c:	00 
   1672d:	c7 44 24 04 a0 dd 01 	movl   $0x1dda0,0x4(%esp)
   16734:	00 
   16735:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1673c:	e8 7b a8 ff ff       	call   10fbc <Print>
   16741:	eb fe                	jmp    16741 <Setup_DMA+0x188>
   16743:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1674a:	e8 a4 a9 ff ff       	call   110f3 <Set_Current_Attr>
   1674f:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16754:	89 44 24 18          	mov    %eax,0x18(%esp)
   16758:	8b 45 04             	mov    0x4(%ebp),%eax
   1675b:	89 44 24 14          	mov    %eax,0x14(%esp)
   1675f:	c7 44 24 10 b5 00 00 	movl   $0xb5,0x10(%esp)
   16766:	00 
   16767:	c7 44 24 0c c3 dc 01 	movl   $0x1dcc3,0xc(%esp)
   1676e:	00 
   1676f:	c7 44 24 08 a3 d6 01 	movl   $0x1d6a3,0x8(%esp)
   16776:	00 
   16777:	c7 44 24 04 a0 dd 01 	movl   $0x1dda0,0x4(%esp)
   1677e:	00 
   1677f:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16786:	e8 31 a8 ff ff       	call   10fbc <Print>
   1678b:	eb fe                	jmp    1678b <Setup_DMA+0x1d2>
   1678d:	89 f0                	mov    %esi,%eax
   1678f:	f7 d0                	not    %eax
   16791:	25 ff ff 00 00       	and    $0xffff,%eax
   16796:	39 45 14             	cmp    %eax,0x14(%ebp)
   16799:	76 4a                	jbe    167e5 <Setup_DMA+0x22c>
   1679b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   167a2:	e8 4c a9 ff ff       	call   110f3 <Set_Current_Attr>
   167a7:	a1 d0 07 02 00       	mov    0x207d0,%eax
   167ac:	89 44 24 18          	mov    %eax,0x18(%esp)
   167b0:	8b 45 04             	mov    0x4(%ebp),%eax
   167b3:	89 44 24 14          	mov    %eax,0x14(%esp)
   167b7:	c7 44 24 10 b6 00 00 	movl   $0xb6,0x10(%esp)
   167be:	00 
   167bf:	c7 44 24 0c c3 dc 01 	movl   $0x1dcc3,0xc(%esp)
   167c6:	00 
   167c7:	c7 44 24 08 44 dd 01 	movl   $0x1dd44,0x8(%esp)
   167ce:	00 
   167cf:	c7 44 24 04 a0 dd 01 	movl   $0x1dda0,0x4(%esp)
   167d6:	00 
   167d7:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   167de:	e8 d9 a7 ff ff       	call   10fbc <Print>
   167e3:	eb fe                	jmp    167e3 <Setup_DMA+0x22a>
   167e5:	83 ff 01             	cmp    $0x1,%edi
   167e8:	19 ff                	sbb    %edi,%edi
   167ea:	83 e7 fc             	and    $0xfffffffc,%edi
   167ed:	83 c7 08             	add    $0x8,%edi
   167f0:	89 1c 24             	mov    %ebx,(%esp)
   167f3:	e8 fb fc ff ff       	call   164f3 <Mask_DMA>
   167f8:	89 d8                	mov    %ebx,%eax
   167fa:	83 e0 03             	and    $0x3,%eax
   167fd:	83 c8 40             	or     $0x40,%eax
   16800:	09 f8                	or     %edi,%eax
   16802:	0f b6 c0             	movzbl %al,%eax
   16805:	89 44 24 04          	mov    %eax,0x4(%esp)
   16809:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
   16810:	e8 47 a0 ff ff       	call   1085c <Out_Byte>
   16815:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   1681c:	00 
   1681d:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
   16824:	e8 33 a0 ff ff       	call   1085c <Out_Byte>
   16829:	8d 3c 1b             	lea    (%ebx,%ebx,1),%edi
   1682c:	83 e7 06             	and    $0x6,%edi
   1682f:	89 f2                	mov    %esi,%edx
   16831:	0f b6 c2             	movzbl %dl,%eax
   16834:	89 44 24 04          	mov    %eax,0x4(%esp)
   16838:	89 3c 24             	mov    %edi,(%esp)
   1683b:	e8 1c a0 ff ff       	call   1085c <Out_Byte>
   16840:	89 f2                	mov    %esi,%edx
   16842:	0f b6 c6             	movzbl %dh,%eax
   16845:	89 44 24 04          	mov    %eax,0x4(%esp)
   16849:	89 3c 24             	mov    %edi,(%esp)
   1684c:	e8 0b a0 ff ff       	call   1085c <Out_Byte>
   16851:	89 f0                	mov    %esi,%eax
   16853:	c1 e8 10             	shr    $0x10,%eax
   16856:	0f b6 c0             	movzbl %al,%eax
   16859:	89 44 24 04          	mov    %eax,0x4(%esp)
   1685d:	0f b6 83 9c dd 01 00 	movzbl 0x1dd9c(%ebx),%eax
   16864:	89 04 24             	mov    %eax,(%esp)
   16867:	e8 f0 9f ff ff       	call   1085c <Out_Byte>
   1686c:	8b 7d 14             	mov    0x14(%ebp),%edi
   1686f:	83 ef 01             	sub    $0x1,%edi
   16872:	89 de                	mov    %ebx,%esi
   16874:	83 e6 03             	and    $0x3,%esi
   16877:	01 f6                	add    %esi,%esi
   16879:	83 ce 01             	or     $0x1,%esi
   1687c:	89 fa                	mov    %edi,%edx
   1687e:	0f b6 c2             	movzbl %dl,%eax
   16881:	89 44 24 04          	mov    %eax,0x4(%esp)
   16885:	89 34 24             	mov    %esi,(%esp)
   16888:	e8 cf 9f ff ff       	call   1085c <Out_Byte>
   1688d:	89 f8                	mov    %edi,%eax
   1688f:	0f b6 fc             	movzbl %ah,%edi
   16892:	89 7c 24 04          	mov    %edi,0x4(%esp)
   16896:	89 34 24             	mov    %esi,(%esp)
   16899:	e8 be 9f ff ff       	call   1085c <Out_Byte>
   1689e:	89 1c 24             	mov    %ebx,(%esp)
   168a1:	e8 8a fb ff ff       	call   16430 <Unmask_DMA>
   168a6:	83 c4 2c             	add    $0x2c,%esp
   168a9:	5b                   	pop    %ebx
   168aa:	5e                   	pop    %esi
   168ab:	5f                   	pop    %edi
   168ac:	5d                   	pop    %ebp
   168ad:	c3                   	ret    

000168ae <Init_DMA>:
   168ae:	55                   	push   %ebp
   168af:	89 e5                	mov    %esp,%ebp
   168b1:	83 ec 18             	sub    $0x18,%esp
   168b4:	c7 04 24 68 dd 01 00 	movl   $0x1dd68,(%esp)
   168bb:	e8 fc a6 ff ff       	call   10fbc <Print>
   168c0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   168c7:	00 
   168c8:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
   168cf:	e8 88 9f ff ff       	call   1085c <Out_Byte>
   168d4:	c9                   	leave  
   168d5:	c3                   	ret    

000168d6 <Reserve_DMA>:
   168d6:	55                   	push   %ebp
   168d7:	89 e5                	mov    %esp,%ebp
   168d9:	56                   	push   %esi
   168da:	53                   	push   %ebx
   168db:	83 ec 30             	sub    $0x30,%esp
   168de:	8b 5d 08             	mov    0x8(%ebp),%ebx
   168e1:	e8 6b 9a ff ff       	call   10351 <Interrupts_Enabled>
   168e6:	88 45 f7             	mov    %al,-0x9(%ebp)
   168e9:	84 c0                	test   %al,%al
   168eb:	74 54                	je     16941 <Reserve_DMA+0x6b>
   168ed:	e8 5f 9a ff ff       	call   10351 <Interrupts_Enabled>
   168f2:	84 c0                	test   %al,%al
   168f4:	75 4a                	jne    16940 <Reserve_DMA+0x6a>
   168f6:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   168fd:	e8 f1 a7 ff ff       	call   110f3 <Set_Current_Attr>
   16902:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16907:	89 44 24 18          	mov    %eax,0x18(%esp)
   1690b:	8b 45 04             	mov    0x4(%ebp),%eax
   1690e:	89 44 24 14          	mov    %eax,0x14(%esp)
   16912:	c7 44 24 10 8f 00 00 	movl   $0x8f,0x10(%esp)
   16919:	00 
   1691a:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   16921:	00 
   16922:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   16929:	00 
   1692a:	c7 44 24 04 b6 dd 01 	movl   $0x1ddb6,0x4(%esp)
   16931:	00 
   16932:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16939:	e8 7e a6 ff ff       	call   10fbc <Print>
   1693e:	eb fe                	jmp    1693e <Reserve_DMA+0x68>
   16940:	fa                   	cli    
   16941:	83 fb 03             	cmp    $0x3,%ebx
   16944:	76 4d                	jbe    16993 <Reserve_DMA+0xbd>
   16946:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1694d:	8d 76 00             	lea    0x0(%esi),%esi
   16950:	e8 9e a7 ff ff       	call   110f3 <Set_Current_Attr>
   16955:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1695a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1695e:	8b 45 04             	mov    0x4(%ebp),%eax
   16961:	89 44 24 14          	mov    %eax,0x14(%esp)
   16965:	c7 44 24 10 94 00 00 	movl   $0x94,0x10(%esp)
   1696c:	00 
   1696d:	c7 44 24 0c c3 dc 01 	movl   $0x1dcc3,0xc(%esp)
   16974:	00 
   16975:	c7 44 24 08 d7 dc 01 	movl   $0x1dcd7,0x8(%esp)
   1697c:	00 
   1697d:	c7 44 24 04 aa dd 01 	movl   $0x1ddaa,0x4(%esp)
   16984:	00 
   16985:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1698c:	e8 2b a6 ff ff       	call   10fbc <Print>
   16991:	eb fe                	jmp    16991 <Reserve_DMA+0xbb>
   16993:	0f b6 05 40 03 02 00 	movzbl 0x20340,%eax
   1699a:	be 00 00 00 00       	mov    $0x0,%esi
   1699f:	0f a3 d8             	bt     %ebx,%eax
   169a2:	72 29                	jb     169cd <Reserve_DMA+0xf7>
   169a4:	89 d8                	mov    %ebx,%eax
   169a6:	83 e0 03             	and    $0x3,%eax
   169a9:	89 44 24 04          	mov    %eax,0x4(%esp)
   169ad:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
   169b4:	e8 a3 9e ff ff       	call   1085c <Out_Byte>
   169b9:	b8 01 00 00 00       	mov    $0x1,%eax
   169be:	89 d9                	mov    %ebx,%ecx
   169c0:	d3 e0                	shl    %cl,%eax
   169c2:	08 05 40 03 02 00    	or     %al,0x20340
   169c8:	be 01 00 00 00       	mov    $0x1,%esi
   169cd:	e8 7f 99 ff ff       	call   10351 <Interrupts_Enabled>
   169d2:	84 c0                	test   %al,%al
   169d4:	74 4a                	je     16a20 <Reserve_DMA+0x14a>
   169d6:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   169dd:	e8 11 a7 ff ff       	call   110f3 <Set_Current_Attr>
   169e2:	a1 d0 07 02 00       	mov    0x207d0,%eax
   169e7:	89 44 24 18          	mov    %eax,0x18(%esp)
   169eb:	8b 45 04             	mov    0x4(%ebp),%eax
   169ee:	89 44 24 14          	mov    %eax,0x14(%esp)
   169f2:	c7 44 24 10 99 00 00 	movl   $0x99,0x10(%esp)
   169f9:	00 
   169fa:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   16a01:	00 
   16a02:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   16a09:	00 
   16a0a:	c7 44 24 04 c7 dd 01 	movl   $0x1ddc7,0x4(%esp)
   16a11:	00 
   16a12:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16a19:	e8 9e a5 ff ff       	call   10fbc <Print>
   16a1e:	eb fe                	jmp    16a1e <Reserve_DMA+0x148>
   16a20:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
   16a24:	74 57                	je     16a7d <Reserve_DMA+0x1a7>
   16a26:	66 90                	xchg   %ax,%ax
   16a28:	e8 24 99 ff ff       	call   10351 <Interrupts_Enabled>
   16a2d:	84 c0                	test   %al,%al
   16a2f:	90                   	nop
   16a30:	74 4a                	je     16a7c <Reserve_DMA+0x1a6>
   16a32:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16a39:	e8 b5 a6 ff ff       	call   110f3 <Set_Current_Attr>
   16a3e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16a43:	89 44 24 18          	mov    %eax,0x18(%esp)
   16a47:	8b 45 04             	mov    0x4(%ebp),%eax
   16a4a:	89 44 24 14          	mov    %eax,0x14(%esp)
   16a4e:	c7 44 24 10 9c 00 00 	movl   $0x9c,0x10(%esp)
   16a55:	00 
   16a56:	c7 44 24 0c 6e ce 01 	movl   $0x1ce6e,0xc(%esp)
   16a5d:	00 
   16a5e:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   16a65:	00 
   16a66:	c7 44 24 04 c7 dd 01 	movl   $0x1ddc7,0x4(%esp)
   16a6d:	00 
   16a6e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16a75:	e8 42 a5 ff ff       	call   10fbc <Print>
   16a7a:	eb fe                	jmp    16a7a <Reserve_DMA+0x1a4>
   16a7c:	fb                   	sti    
   16a7d:	89 f0                	mov    %esi,%eax
   16a7f:	83 c4 30             	add    $0x30,%esp
   16a82:	5b                   	pop    %ebx
   16a83:	5e                   	pop    %esi
   16a84:	5d                   	pop    %ebp
   16a85:	c3                   	ret    
   16a86:	90                   	nop
   16a87:	90                   	nop
   16a88:	90                   	nop
   16a89:	90                   	nop
   16a8a:	90                   	nop
   16a8b:	90                   	nop
   16a8c:	90                   	nop
   16a8d:	90                   	nop
   16a8e:	90                   	nop
   16a8f:	90                   	nop

00016a90 <Start_Motor>:
   16a90:	55                   	push   %ebp
   16a91:	89 e5                	mov    %esp,%ebp
   16a93:	83 ec 18             	sub    $0x18,%esp
   16a96:	8d 48 04             	lea    0x4(%eax),%ecx
   16a99:	ba 01 00 00 00       	mov    $0x1,%edx
   16a9e:	d3 e2                	shl    %cl,%edx
   16aa0:	83 ca 0c             	or     $0xc,%edx
   16aa3:	0f b6 d2             	movzbl %dl,%edx
   16aa6:	89 54 24 04          	mov    %edx,0x4(%esp)
   16aaa:	c7 04 24 f2 03 00 00 	movl   $0x3f2,(%esp)
   16ab1:	e8 a6 9d ff ff       	call   1085c <Out_Byte>
   16ab6:	c9                   	leave  
   16ab7:	c3                   	ret    

00016ab8 <Stop_Motor>:
   16ab8:	55                   	push   %ebp
   16ab9:	89 e5                	mov    %esp,%ebp
   16abb:	83 ec 18             	sub    $0x18,%esp
   16abe:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
   16ac5:	00 
   16ac6:	c7 04 24 f2 03 00 00 	movl   $0x3f2,(%esp)
   16acd:	e8 8a 9d ff ff       	call   1085c <Out_Byte>
   16ad2:	c9                   	leave  
   16ad3:	c3                   	ret    

00016ad4 <Floppy_Get_Num_Blocks>:
   16ad4:	55                   	push   %ebp
   16ad5:	89 e5                	mov    %esp,%ebp
   16ad7:	83 ec 28             	sub    $0x28,%esp
   16ada:	8b 45 08             	mov    0x8(%ebp),%eax
   16add:	8b 40 14             	mov    0x14(%eax),%eax
   16ae0:	83 f8 01             	cmp    $0x1,%eax
   16ae3:	76 4a                	jbe    16b2f <Floppy_Get_Num_Blocks+0x5b>
   16ae5:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16aec:	e8 02 a6 ff ff       	call   110f3 <Set_Current_Attr>
   16af1:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16af6:	89 44 24 18          	mov    %eax,0x18(%esp)
   16afa:	8b 45 04             	mov    0x4(%ebp),%eax
   16afd:	89 44 24 14          	mov    %eax,0x14(%esp)
   16b01:	c7 44 24 10 e4 00 00 	movl   $0xe4,0x10(%esp)
   16b08:	00 
   16b09:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   16b10:	00 
   16b11:	c7 44 24 08 18 de 01 	movl   $0x1de18,0x8(%esp)
   16b18:	00 
   16b19:	c7 44 24 04 74 e0 01 	movl   $0x1e074,0x4(%esp)
   16b20:	00 
   16b21:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16b28:	e8 8f a4 ff ff       	call   10fbc <Print>
   16b2d:	eb fe                	jmp    16b2d <Floppy_Get_Num_Blocks+0x59>
   16b2f:	8b 04 85 d8 07 02 00 	mov    0x207d8(,%eax,4),%eax
   16b36:	85 c0                	test   %eax,%eax
   16b38:	75 4a                	jne    16b84 <Floppy_Get_Num_Blocks+0xb0>
   16b3a:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16b41:	e8 ad a5 ff ff       	call   110f3 <Set_Current_Attr>
   16b46:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16b4b:	89 44 24 18          	mov    %eax,0x18(%esp)
   16b4f:	8b 45 04             	mov    0x4(%ebp),%eax
   16b52:	89 44 24 14          	mov    %eax,0x14(%esp)
   16b56:	c7 44 24 10 e8 00 00 	movl   $0xe8,0x10(%esp)
   16b5d:	00 
   16b5e:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   16b65:	00 
   16b66:	c7 44 24 08 ed dd 01 	movl   $0x1dded,0x8(%esp)
   16b6d:	00 
   16b6e:	c7 44 24 04 74 e0 01 	movl   $0x1e074,0x4(%esp)
   16b75:	00 
   16b76:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16b7d:	e8 3a a4 ff ff       	call   10fbc <Print>
   16b82:	eb fe                	jmp    16b82 <Floppy_Get_Num_Blocks+0xae>
   16b84:	8b 50 04             	mov    0x4(%eax),%edx
   16b87:	0f af 10             	imul   (%eax),%edx
   16b8a:	0f af 50 08          	imul   0x8(%eax),%edx
   16b8e:	89 d0                	mov    %edx,%eax
   16b90:	c9                   	leave  
   16b91:	c3                   	ret    

00016b92 <Floppy_Close>:
   16b92:	55                   	push   %ebp
   16b93:	89 e5                	mov    %esp,%ebp
   16b95:	83 ec 28             	sub    $0x28,%esp
   16b98:	8b 45 08             	mov    0x8(%ebp),%eax
   16b9b:	80 78 18 00          	cmpb   $0x0,0x18(%eax)
   16b9f:	75 4a                	jne    16beb <Floppy_Close+0x59>
   16ba1:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16ba8:	e8 46 a5 ff ff       	call   110f3 <Set_Current_Attr>
   16bad:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16bb2:	89 44 24 18          	mov    %eax,0x18(%esp)
   16bb6:	8b 45 04             	mov    0x4(%ebp),%eax
   16bb9:	89 44 24 14          	mov    %eax,0x14(%esp)
   16bbd:	c7 44 24 10 d8 00 00 	movl   $0xd8,0x10(%esp)
   16bc4:	00 
   16bc5:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   16bcc:	00 
   16bcd:	c7 44 24 08 fa dd 01 	movl   $0x1ddfa,0x8(%esp)
   16bd4:	00 
   16bd5:	c7 44 24 04 8a e0 01 	movl   $0x1e08a,0x4(%esp)
   16bdc:	00 
   16bdd:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16be4:	e8 d3 a3 ff ff       	call   10fbc <Print>
   16be9:	eb fe                	jmp    16be9 <Floppy_Close+0x57>
   16beb:	b8 00 00 00 00       	mov    $0x0,%eax
   16bf0:	c9                   	leave  
   16bf1:	c3                   	ret    

00016bf2 <Floppy_Open>:
   16bf2:	55                   	push   %ebp
   16bf3:	89 e5                	mov    %esp,%ebp
   16bf5:	83 ec 28             	sub    $0x28,%esp
   16bf8:	8b 45 08             	mov    0x8(%ebp),%eax
   16bfb:	80 78 18 00          	cmpb   $0x0,0x18(%eax)
   16bff:	74 4a                	je     16c4b <Floppy_Open+0x59>
   16c01:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16c08:	e8 e6 a4 ff ff       	call   110f3 <Set_Current_Attr>
   16c0d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16c12:	89 44 24 18          	mov    %eax,0x18(%esp)
   16c16:	8b 45 04             	mov    0x4(%ebp),%eax
   16c19:	89 44 24 14          	mov    %eax,0x14(%esp)
   16c1d:	c7 44 24 10 cf 00 00 	movl   $0xcf,0x10(%esp)
   16c24:	00 
   16c25:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   16c2c:	00 
   16c2d:	c7 44 24 08 f9 dd 01 	movl   $0x1ddf9,0x8(%esp)
   16c34:	00 
   16c35:	c7 44 24 04 97 e0 01 	movl   $0x1e097,0x4(%esp)
   16c3c:	00 
   16c3d:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16c44:	e8 73 a3 ff ff       	call   10fbc <Print>
   16c49:	eb fe                	jmp    16c49 <Floppy_Open+0x57>
   16c4b:	b8 00 00 00 00       	mov    $0x0,%eax
   16c50:	c9                   	leave  
   16c51:	c3                   	ret    

00016c52 <Wait_For_MRQ>:
   16c52:	55                   	push   %ebp
   16c53:	89 e5                	mov    %esp,%ebp
   16c55:	53                   	push   %ebx
   16c56:	83 ec 24             	sub    $0x24,%esp
   16c59:	89 c3                	mov    %eax,%ebx
   16c5b:	3c c0                	cmp    $0xc0,%al
   16c5d:	74 4e                	je     16cad <Wait_For_MRQ+0x5b>
   16c5f:	3c 80                	cmp    $0x80,%al
   16c61:	74 4a                	je     16cad <Wait_For_MRQ+0x5b>
   16c63:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16c6a:	e8 84 a4 ff ff       	call   110f3 <Set_Current_Attr>
   16c6f:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16c74:	89 44 24 18          	mov    %eax,0x18(%esp)
   16c78:	8b 45 04             	mov    0x4(%ebp),%eax
   16c7b:	89 44 24 14          	mov    %eax,0x14(%esp)
   16c7f:	c7 44 24 10 38 01 00 	movl   $0x138,0x10(%esp)
   16c86:	00 
   16c87:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   16c8e:	00 
   16c8f:	c7 44 24 08 3c de 01 	movl   $0x1de3c,0x8(%esp)
   16c96:	00 
   16c97:	c7 44 24 04 ad e0 01 	movl   $0x1e0ad,0x4(%esp)
   16c9e:	00 
   16c9f:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16ca6:	e8 11 a3 ff ff       	call   10fbc <Print>
   16cab:	eb fe                	jmp    16cab <Wait_For_MRQ+0x59>
   16cad:	0f b6 db             	movzbl %bl,%ebx
   16cb0:	c7 04 24 f4 03 00 00 	movl   $0x3f4,(%esp)
   16cb7:	e8 ae 9b ff ff       	call   1086a <In_Byte>
   16cbc:	25 c0 00 00 00       	and    $0xc0,%eax
   16cc1:	39 d8                	cmp    %ebx,%eax
   16cc3:	75 eb                	jne    16cb0 <Wait_For_MRQ+0x5e>
   16cc5:	83 c4 24             	add    $0x24,%esp
   16cc8:	5b                   	pop    %ebx
   16cc9:	5d                   	pop    %ebp
   16cca:	c3                   	ret    

00016ccb <Floppy_Out>:
   16ccb:	55                   	push   %ebp
   16ccc:	89 e5                	mov    %esp,%ebp
   16cce:	53                   	push   %ebx
   16ccf:	83 ec 14             	sub    $0x14,%esp
   16cd2:	89 c3                	mov    %eax,%ebx
   16cd4:	b8 80 00 00 00       	mov    $0x80,%eax
   16cd9:	e8 74 ff ff ff       	call   16c52 <Wait_For_MRQ>
   16cde:	0f b6 db             	movzbl %bl,%ebx
   16ce1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
   16ce5:	c7 04 24 f5 03 00 00 	movl   $0x3f5,(%esp)
   16cec:	e8 6b 9b ff ff       	call   1085c <Out_Byte>
   16cf1:	83 c4 14             	add    $0x14,%esp
   16cf4:	5b                   	pop    %ebx
   16cf5:	5d                   	pop    %ebp
   16cf6:	c3                   	ret    

00016cf7 <Floppy_In>:
   16cf7:	55                   	push   %ebp
   16cf8:	89 e5                	mov    %esp,%ebp
   16cfa:	83 ec 18             	sub    $0x18,%esp
   16cfd:	b8 c0 00 00 00       	mov    $0xc0,%eax
   16d02:	e8 4b ff ff ff       	call   16c52 <Wait_For_MRQ>
   16d07:	c7 04 24 f5 03 00 00 	movl   $0x3f5,(%esp)
   16d0e:	e8 57 9b ff ff       	call   1086a <In_Byte>
   16d13:	c9                   	leave  
   16d14:	c3                   	ret    

00016d15 <Sense_Interrupt_Status>:
   16d15:	55                   	push   %ebp
   16d16:	89 e5                	mov    %esp,%ebp
   16d18:	83 ec 08             	sub    $0x8,%esp
   16d1b:	89 1c 24             	mov    %ebx,(%esp)
   16d1e:	89 74 24 04          	mov    %esi,0x4(%esp)
   16d22:	89 c3                	mov    %eax,%ebx
   16d24:	89 d6                	mov    %edx,%esi
   16d26:	b8 08 00 00 00       	mov    $0x8,%eax
   16d2b:	e8 9b ff ff ff       	call   16ccb <Floppy_Out>
   16d30:	e8 c2 ff ff ff       	call   16cf7 <Floppy_In>
   16d35:	88 03                	mov    %al,(%ebx)
   16d37:	e8 bb ff ff ff       	call   16cf7 <Floppy_In>
   16d3c:	88 06                	mov    %al,(%esi)
   16d3e:	8b 1c 24             	mov    (%esp),%ebx
   16d41:	8b 74 24 04          	mov    0x4(%esp),%esi
   16d45:	89 ec                	mov    %ebp,%esp
   16d47:	5d                   	pop    %ebp
   16d48:	c3                   	ret    

00016d49 <Wait_For_Interrupt>:
   16d49:	55                   	push   %ebp
   16d4a:	89 e5                	mov    %esp,%ebp
   16d4c:	83 ec 28             	sub    $0x28,%esp
   16d4f:	e8 fd 95 ff ff       	call   10351 <Interrupts_Enabled>
   16d54:	84 c0                	test   %al,%al
   16d56:	74 4a                	je     16da2 <Wait_For_Interrupt+0x59>
   16d58:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16d5f:	e8 8f a3 ff ff       	call   110f3 <Set_Current_Attr>
   16d64:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16d69:	89 44 24 18          	mov    %eax,0x18(%esp)
   16d6d:	8b 45 04             	mov    0x4(%ebp),%eax
   16d70:	89 44 24 14          	mov    %eax,0x14(%esp)
   16d74:	c7 44 24 10 59 01 00 	movl   $0x159,0x10(%esp)
   16d7b:	00 
   16d7c:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   16d83:	00 
   16d84:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   16d8b:	00 
   16d8c:	c7 44 24 04 ba e0 01 	movl   $0x1e0ba,0x4(%esp)
   16d93:	00 
   16d94:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16d9b:	e8 1c a2 ff ff       	call   10fbc <Print>
   16da0:	eb fe                	jmp    16da0 <Wait_For_Interrupt+0x57>
   16da2:	c7 05 44 03 02 00 00 	movl   $0x0,0x20344
   16da9:	00 00 00 
   16dac:	e8 a0 95 ff ff       	call   10351 <Interrupts_Enabled>
   16db1:	84 c0                	test   %al,%al
   16db3:	74 4a                	je     16dff <Wait_For_Interrupt+0xb6>
   16db5:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16dbc:	e8 32 a3 ff ff       	call   110f3 <Set_Current_Attr>
   16dc1:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16dc6:	89 44 24 18          	mov    %eax,0x18(%esp)
   16dca:	8b 45 04             	mov    0x4(%ebp),%eax
   16dcd:	89 44 24 14          	mov    %eax,0x14(%esp)
   16dd1:	c7 44 24 10 5e 01 00 	movl   $0x15e,0x10(%esp)
   16dd8:	00 
   16dd9:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   16de0:	00 
   16de1:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   16de8:	00 
   16de9:	c7 44 24 04 ba e0 01 	movl   $0x1e0ba,0x4(%esp)
   16df0:	00 
   16df1:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16df8:	e8 bf a1 ff ff       	call   10fbc <Print>
   16dfd:	eb fe                	jmp    16dfd <Wait_For_Interrupt+0xb4>
   16dff:	fb                   	sti    
   16e00:	a1 44 03 02 00       	mov    0x20344,%eax
   16e05:	85 c0                	test   %eax,%eax
   16e07:	74 f7                	je     16e00 <Wait_For_Interrupt+0xb7>
   16e09:	e8 43 95 ff ff       	call   10351 <Interrupts_Enabled>
   16e0e:	84 c0                	test   %al,%al
   16e10:	75 4a                	jne    16e5c <Wait_For_Interrupt+0x113>
   16e12:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16e19:	e8 d5 a2 ff ff       	call   110f3 <Set_Current_Attr>
   16e1e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16e23:	89 44 24 18          	mov    %eax,0x18(%esp)
   16e27:	8b 45 04             	mov    0x4(%ebp),%eax
   16e2a:	89 44 24 14          	mov    %eax,0x14(%esp)
   16e2e:	c7 44 24 10 62 01 00 	movl   $0x162,0x10(%esp)
   16e35:	00 
   16e36:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   16e3d:	00 
   16e3e:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   16e45:	00 
   16e46:	c7 44 24 04 ba e0 01 	movl   $0x1e0ba,0x4(%esp)
   16e4d:	00 
   16e4e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16e55:	e8 62 a1 ff ff       	call   10fbc <Print>
   16e5a:	eb fe                	jmp    16e5a <Wait_For_Interrupt+0x111>
   16e5c:	fa                   	cli    
   16e5d:	c9                   	leave  
   16e5e:	c3                   	ret    

00016e5f <Setup_Drive_Parameters>:
   16e5f:	55                   	push   %ebp
   16e60:	89 e5                	mov    %esp,%ebp
   16e62:	83 ec 48             	sub    $0x48,%esp
   16e65:	89 5d f4             	mov    %ebx,-0xc(%ebp)
   16e68:	89 75 f8             	mov    %esi,-0x8(%ebp)
   16e6b:	89 7d fc             	mov    %edi,-0x4(%ebp)
   16e6e:	89 c6                	mov    %eax,%esi
   16e70:	83 fa 05             	cmp    $0x5,%edx
   16e73:	0f 87 a2 00 00 00    	ja     16f1b <Setup_Drive_Parameters+0xbc>
   16e79:	8d 14 92             	lea    (%edx,%edx,4),%edx
   16e7c:	83 3c 95 40 f0 01 00 	cmpl   $0x0,0x1f040(,%edx,4)
   16e83:	00 
   16e84:	0f 8e 91 00 00 00    	jle    16f1b <Setup_Drive_Parameters+0xbc>
   16e8a:	8d 1c 95 40 f0 01 00 	lea    0x1f040(,%edx,4),%ebx
   16e91:	89 74 24 0c          	mov    %esi,0xc(%esp)
   16e95:	c7 44 24 08 05 de 01 	movl   $0x1de05,0x8(%esp)
   16e9c:	00 
   16e9d:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
   16ea4:	00 
   16ea5:	8d 7d d8             	lea    -0x28(%ebp),%edi
   16ea8:	89 3c 24             	mov    %edi,(%esp)
   16eab:	e8 ff 5b 00 00       	call   1caaf <snprintf>
   16eb0:	8b 43 08             	mov    0x8(%ebx),%eax
   16eb3:	89 44 24 10          	mov    %eax,0x10(%esp)
   16eb7:	8b 43 04             	mov    0x4(%ebx),%eax
   16eba:	89 44 24 0c          	mov    %eax,0xc(%esp)
   16ebe:	8b 03                	mov    (%ebx),%eax
   16ec0:	89 44 24 08          	mov    %eax,0x8(%esp)
   16ec4:	89 7c 24 04          	mov    %edi,0x4(%esp)
   16ec8:	c7 04 24 88 de 01 00 	movl   $0x1de88,(%esp)
   16ecf:	e8 e8 a0 ff ff       	call   10fbc <Print>
   16ed4:	89 1c b5 d8 07 02 00 	mov    %ebx,0x207d8(,%esi,4)
   16edb:	c7 44 24 14 4c 03 02 	movl   $0x2034c,0x14(%esp)
   16ee2:	00 
   16ee3:	c7 44 24 10 54 03 02 	movl   $0x20354,0x10(%esp)
   16eea:	00 
   16eeb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
   16ef2:	00 
   16ef3:	89 74 24 08          	mov    %esi,0x8(%esp)
   16ef7:	c7 44 24 04 b8 f0 01 	movl   $0x1f0b8,0x4(%esp)
   16efe:	00 
   16eff:	89 3c 24             	mov    %edi,(%esp)
   16f02:	e8 8e 11 00 00       	call   18095 <Register_Block_Device>
   16f07:	85 c0                	test   %eax,%eax
   16f09:	74 10                	je     16f1b <Setup_Drive_Parameters+0xbc>
   16f0b:	89 7c 24 04          	mov    %edi,0x4(%esp)
   16f0f:	c7 04 24 b0 de 01 00 	movl   $0x1deb0,(%esp)
   16f16:	e8 a1 a0 ff ff       	call   10fbc <Print>
   16f1b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
   16f1e:	8b 75 f8             	mov    -0x8(%ebp),%esi
   16f21:	8b 7d fc             	mov    -0x4(%ebp),%edi
   16f24:	89 ec                	mov    %ebp,%esp
   16f26:	5d                   	pop    %ebp
   16f27:	c3                   	ret    

00016f28 <Init_Floppy>:
   16f28:	55                   	push   %ebp
   16f29:	89 e5                	mov    %esp,%ebp
   16f2b:	57                   	push   %edi
   16f2c:	56                   	push   %esi
   16f2d:	53                   	push   %ebx
   16f2e:	83 ec 3c             	sub    $0x3c,%esp
   16f31:	c7 04 24 e0 de 01 00 	movl   $0x1dee0,(%esp)
   16f38:	e8 7f a0 ff ff       	call   10fbc <Print>
   16f3d:	e8 85 b9 ff ff       	call   128c7 <Alloc_Page>
   16f42:	a3 48 03 02 00       	mov    %eax,0x20348
   16f47:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
   16f4e:	00 
   16f4f:	c7 04 24 70 00 00 00 	movl   $0x70,(%esp)
   16f56:	e8 01 99 ff ff       	call   1085c <Out_Byte>
   16f5b:	c7 04 24 71 00 00 00 	movl   $0x71,(%esp)
   16f62:	e8 03 99 ff ff       	call   1086a <In_Byte>
   16f67:	89 c3                	mov    %eax,%ebx
   16f69:	89 c2                	mov    %eax,%edx
   16f6b:	c0 ea 04             	shr    $0x4,%dl
   16f6e:	0f b6 d2             	movzbl %dl,%edx
   16f71:	b8 00 00 00 00       	mov    $0x0,%eax
   16f76:	e8 e4 fe ff ff       	call   16e5f <Setup_Drive_Parameters>
   16f7b:	89 da                	mov    %ebx,%edx
   16f7d:	83 e2 0f             	and    $0xf,%edx
   16f80:	b8 01 00 00 00       	mov    $0x1,%eax
   16f85:	e8 d5 fe ff ff       	call   16e5f <Setup_Drive_Parameters>
   16f8a:	c7 44 24 04 31 78 01 	movl   $0x17831,0x4(%esp)
   16f91:	00 
   16f92:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
   16f99:	e8 81 95 ff ff       	call   1051f <Install_IRQ>
   16f9e:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
   16fa5:	e8 92 95 ff ff       	call   1053c <Enable_IRQ>
   16faa:	e8 a2 93 ff ff       	call   10351 <Interrupts_Enabled>
   16faf:	84 c0                	test   %al,%al
   16fb1:	75 4a                	jne    16ffd <Init_Floppy+0xd5>
   16fb3:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   16fba:	e8 34 a1 ff ff       	call   110f3 <Set_Current_Attr>
   16fbf:	a1 d0 07 02 00       	mov    0x207d0,%eax
   16fc4:	89 44 24 18          	mov    %eax,0x18(%esp)
   16fc8:	8b 45 04             	mov    0x4(%ebp),%eax
   16fcb:	89 44 24 14          	mov    %eax,0x14(%esp)
   16fcf:	c7 44 24 10 7b 02 00 	movl   $0x27b,0x10(%esp)
   16fd6:	00 
   16fd7:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   16fde:	00 
   16fdf:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   16fe6:	00 
   16fe7:	c7 44 24 04 68 e0 01 	movl   $0x1e068,0x4(%esp)
   16fee:	00 
   16fef:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   16ff6:	e8 c1 9f ff ff       	call   10fbc <Print>
   16ffb:	eb fe                	jmp    16ffb <Init_Floppy+0xd3>
   16ffd:	fa                   	cli    
   16ffe:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   17005:	00 
   17006:	c7 04 24 f2 03 00 00 	movl   $0x3f2,(%esp)
   1700d:	e8 4a 98 ff ff       	call   1085c <Out_Byte>
   17012:	b8 00 00 00 00       	mov    $0x0,%eax
   17017:	e8 74 fa ff ff       	call   16a90 <Start_Motor>
   1701c:	e8 30 93 ff ff       	call   10351 <Interrupts_Enabled>
   17021:	bb 03 00 00 00       	mov    $0x3,%ebx
   17026:	84 c0                	test   %al,%al
   17028:	74 4a                	je     17074 <Init_Floppy+0x14c>
   1702a:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17031:	e8 bd a0 ff ff       	call   110f3 <Set_Current_Attr>
   17036:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1703b:	89 44 24 18          	mov    %eax,0x18(%esp)
   1703f:	8b 45 04             	mov    0x4(%ebp),%eax
   17042:	89 44 24 14          	mov    %eax,0x14(%esp)
   17046:	c7 44 24 10 75 01 00 	movl   $0x175,0x10(%esp)
   1704d:	00 
   1704e:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   17055:	00 
   17056:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1705d:	00 
   1705e:	c7 44 24 04 a3 e0 01 	movl   $0x1e0a3,0x4(%esp)
   17065:	00 
   17066:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1706d:	e8 4a 9f ff ff       	call   10fbc <Print>
   17072:	eb fe                	jmp    17072 <Init_Floppy+0x14a>
   17074:	8d 75 e6             	lea    -0x1a(%ebp),%esi
   17077:	8d 7d e7             	lea    -0x19(%ebp),%edi
   1707a:	b8 07 00 00 00       	mov    $0x7,%eax
   1707f:	e8 47 fc ff ff       	call   16ccb <Floppy_Out>
   17084:	b8 00 00 00 00       	mov    $0x0,%eax
   17089:	e8 3d fc ff ff       	call   16ccb <Floppy_Out>
   1708e:	e8 b6 fc ff ff       	call   16d49 <Wait_For_Interrupt>
   17093:	89 f2                	mov    %esi,%edx
   17095:	89 f8                	mov    %edi,%eax
   17097:	e8 79 fc ff ff       	call   16d15 <Sense_Interrupt_Status>
   1709c:	f6 45 e7 20          	testb  $0x20,-0x19(%ebp)
   170a0:	75 09                	jne    170ab <Init_Floppy+0x183>
   170a2:	85 db                	test   %ebx,%ebx
   170a4:	74 0a                	je     170b0 <Init_Floppy+0x188>
   170a6:	83 eb 01             	sub    $0x1,%ebx
   170a9:	eb cf                	jmp    1707a <Init_Floppy+0x152>
   170ab:	bb 01 00 00 00       	mov    $0x1,%ebx
   170b0:	e8 9c 92 ff ff       	call   10351 <Interrupts_Enabled>
   170b5:	84 c0                	test   %al,%al
   170b7:	74 4a                	je     17103 <Init_Floppy+0x1db>
   170b9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   170c0:	e8 2e a0 ff ff       	call   110f3 <Set_Current_Attr>
   170c5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   170ca:	89 44 24 18          	mov    %eax,0x18(%esp)
   170ce:	8b 45 04             	mov    0x4(%ebp),%eax
   170d1:	89 44 24 14          	mov    %eax,0x14(%esp)
   170d5:	c7 44 24 10 7d 02 00 	movl   $0x27d,0x10(%esp)
   170dc:	00 
   170dd:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   170e4:	00 
   170e5:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   170ec:	00 
   170ed:	c7 44 24 04 68 e0 01 	movl   $0x1e068,0x4(%esp)
   170f4:	00 
   170f5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   170fc:	e8 bb 9e ff ff       	call   10fbc <Print>
   17101:	eb fe                	jmp    17101 <Init_Floppy+0x1d9>
   17103:	fb                   	sti    
   17104:	84 db                	test   %bl,%bl
   17106:	75 0e                	jne    17116 <Init_Floppy+0x1ee>
   17108:	c7 04 24 04 df 01 00 	movl   $0x1df04,(%esp)
   1710f:	e8 a8 9e ff ff       	call   10fbc <Print>
   17114:	eb 44                	jmp    1715a <Init_Floppy+0x232>
   17116:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
   1711d:	e8 b4 f7 ff ff       	call   168d6 <Reserve_DMA>
   17122:	84 c0                	test   %al,%al
   17124:	75 0e                	jne    17134 <Init_Floppy+0x20c>
   17126:	c7 04 24 24 df 01 00 	movl   $0x1df24,(%esp)
   1712d:	e8 8a 9e ff ff       	call   10fbc <Print>
   17132:	eb 26                	jmp    1715a <Init_Floppy+0x232>
   17134:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
   1713b:	00 
   1713c:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
   17143:	00 
   17144:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   1714b:	00 
   1714c:	c7 04 24 61 76 01 00 	movl   $0x17661,(%esp)
   17153:	e8 e8 e8 ff ff       	call   15a40 <Start_Kernel_Thread>
   17158:	eb 0c                	jmp    17166 <Init_Floppy+0x23e>
   1715a:	c7 04 24 48 df 01 00 	movl   $0x1df48,(%esp)
   17161:	e8 56 9e ff ff       	call   10fbc <Print>
   17166:	83 c4 3c             	add    $0x3c,%esp
   17169:	5b                   	pop    %ebx
   1716a:	5e                   	pop    %esi
   1716b:	5f                   	pop    %edi
   1716c:	5d                   	pop    %ebp
   1716d:	c3                   	ret    

0001716e <Floppy_Transfer>:
   1716e:	55                   	push   %ebp
   1716f:	89 e5                	mov    %esp,%ebp
   17171:	57                   	push   %edi
   17172:	56                   	push   %esi
   17173:	53                   	push   %ebx
   17174:	83 ec 5c             	sub    $0x5c,%esp
   17177:	89 45 cc             	mov    %eax,-0x34(%ebp)
   1717a:	8b 1c 95 d8 07 02 00 	mov    0x207d8(,%edx,4),%ebx
   17181:	85 d2                	test   %edx,%edx
   17183:	74 4a                	je     171cf <Floppy_Transfer+0x61>
   17185:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1718c:	e8 62 9f ff ff       	call   110f3 <Set_Current_Attr>
   17191:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17196:	89 44 24 18          	mov    %eax,0x18(%esp)
   1719a:	8b 45 04             	mov    0x4(%ebp),%eax
   1719d:	89 44 24 14          	mov    %eax,0x14(%esp)
   171a1:	c7 44 24 10 de 01 00 	movl   $0x1de,0x10(%esp)
   171a8:	00 
   171a9:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   171b0:	00 
   171b1:	c7 44 24 08 0a de 01 	movl   $0x1de0a,0x8(%esp)
   171b8:	00 
   171b9:	c7 44 24 04 e3 e0 01 	movl   $0x1e0e3,0x4(%esp)
   171c0:	00 
   171c1:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   171c8:	e8 ef 9d ff ff       	call   10fbc <Print>
   171cd:	eb fe                	jmp    171cd <Floppy_Transfer+0x5f>
   171cf:	83 7d cc 01          	cmpl   $0x1,-0x34(%ebp)
   171d3:	76 4e                	jbe    17223 <Floppy_Transfer+0xb5>
   171d5:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   171dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   171e0:	e8 0e 9f ff ff       	call   110f3 <Set_Current_Attr>
   171e5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   171ea:	89 44 24 18          	mov    %eax,0x18(%esp)
   171ee:	8b 45 04             	mov    0x4(%ebp),%eax
   171f1:	89 44 24 14          	mov    %eax,0x14(%esp)
   171f5:	c7 44 24 10 df 01 00 	movl   $0x1df,0x10(%esp)
   171fc:	00 
   171fd:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   17204:	00 
   17205:	c7 44 24 08 74 df 01 	movl   $0x1df74,0x8(%esp)
   1720c:	00 
   1720d:	c7 44 24 04 e3 e0 01 	movl   $0x1e0e3,0x4(%esp)
   17214:	00 
   17215:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1721c:	e8 9b 9d ff ff       	call   10fbc <Print>
   17221:	eb fe                	jmp    17221 <Floppy_Transfer+0xb3>
   17223:	85 db                	test   %ebx,%ebx
   17225:	75 4c                	jne    17273 <Floppy_Transfer+0x105>
   17227:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1722e:	66 90                	xchg   %ax,%ax
   17230:	e8 be 9e ff ff       	call   110f3 <Set_Current_Attr>
   17235:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1723a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1723e:	8b 45 04             	mov    0x4(%ebp),%eax
   17241:	89 44 24 14          	mov    %eax,0x14(%esp)
   17245:	c7 44 24 10 e0 01 00 	movl   $0x1e0,0x10(%esp)
   1724c:	00 
   1724d:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   17254:	00 
   17255:	c7 44 24 08 ed dd 01 	movl   $0x1dded,0x8(%esp)
   1725c:	00 
   1725d:	c7 44 24 04 e3 e0 01 	movl   $0x1e0e3,0x4(%esp)
   17264:	00 
   17265:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1726c:	e8 4b 9d ff ff       	call   10fbc <Print>
   17271:	eb fe                	jmp    17271 <Floppy_Transfer+0x103>
   17273:	8b 43 04             	mov    0x4(%ebx),%eax
   17276:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   17279:	8b 7b 08             	mov    0x8(%ebx),%edi
   1727c:	0f af c7             	imul   %edi,%eax
   1727f:	89 45 d0             	mov    %eax,-0x30(%ebp)
   17282:	89 ca                	mov    %ecx,%edx
   17284:	89 c8                	mov    %ecx,%eax
   17286:	c1 fa 1f             	sar    $0x1f,%edx
   17289:	f7 7d d0             	idivl  -0x30(%ebp)
   1728c:	89 c6                	mov    %eax,%esi
   1728e:	85 c0                	test   %eax,%eax
   17290:	78 04                	js     17296 <Floppy_Transfer+0x128>
   17292:	3b 03                	cmp    (%ebx),%eax
   17294:	7c 4a                	jl     172e0 <Floppy_Transfer+0x172>
   17296:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1729d:	e8 51 9e ff ff       	call   110f3 <Set_Current_Attr>
   172a2:	a1 d0 07 02 00       	mov    0x207d0,%eax
   172a7:	89 44 24 18          	mov    %eax,0x18(%esp)
   172ab:	8b 45 04             	mov    0x4(%ebp),%eax
   172ae:	89 44 24 14          	mov    %eax,0x14(%esp)
   172b2:	c7 44 24 10 2c 01 00 	movl   $0x12c,0x10(%esp)
   172b9:	00 
   172ba:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   172c1:	00 
   172c2:	c7 44 24 08 ac df 01 	movl   $0x1dfac,0x8(%esp)
   172c9:	00 
   172ca:	c7 44 24 04 f3 e0 01 	movl   $0x1e0f3,0x4(%esp)
   172d1:	00 
   172d2:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   172d9:	e8 de 9c ff ff       	call   10fbc <Print>
   172de:	eb fe                	jmp    172de <Floppy_Transfer+0x170>
   172e0:	89 ca                	mov    %ecx,%edx
   172e2:	89 c8                	mov    %ecx,%eax
   172e4:	c1 fa 1f             	sar    $0x1f,%edx
   172e7:	f7 ff                	idiv   %edi
   172e9:	89 c2                	mov    %eax,%edx
   172eb:	c1 fa 1f             	sar    $0x1f,%edx
   172ee:	f7 7d d4             	idivl  -0x2c(%ebp)
   172f1:	89 55 d0             	mov    %edx,-0x30(%ebp)
   172f4:	85 d2                	test   %edx,%edx
   172f6:	78 05                	js     172fd <Floppy_Transfer+0x18f>
   172f8:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
   172fb:	7f 4a                	jg     17347 <Floppy_Transfer+0x1d9>
   172fd:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17304:	e8 ea 9d ff ff       	call   110f3 <Set_Current_Attr>
   17309:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1730e:	89 44 24 18          	mov    %eax,0x18(%esp)
   17312:	8b 45 04             	mov    0x4(%ebp),%eax
   17315:	89 44 24 14          	mov    %eax,0x14(%esp)
   17319:	c7 44 24 10 2d 01 00 	movl   $0x12d,0x10(%esp)
   17320:	00 
   17321:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   17328:	00 
   17329:	c7 44 24 08 dc df 01 	movl   $0x1dfdc,0x8(%esp)
   17330:	00 
   17331:	c7 44 24 04 f3 e0 01 	movl   $0x1e0f3,0x4(%esp)
   17338:	00 
   17339:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17340:	e8 77 9c ff ff       	call   10fbc <Print>
   17345:	eb fe                	jmp    17345 <Floppy_Transfer+0x1d7>
   17347:	89 ca                	mov    %ecx,%edx
   17349:	89 c8                	mov    %ecx,%eax
   1734b:	c1 fa 1f             	sar    $0x1f,%edx
   1734e:	f7 ff                	idiv   %edi
   17350:	83 c2 01             	add    $0x1,%edx
   17353:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   17356:	85 d2                	test   %edx,%edx
   17358:	7e 04                	jle    1735e <Floppy_Transfer+0x1f0>
   1735a:	39 d7                	cmp    %edx,%edi
   1735c:	7d 4a                	jge    173a8 <Floppy_Transfer+0x23a>
   1735e:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17365:	e8 89 9d ff ff       	call   110f3 <Set_Current_Attr>
   1736a:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1736f:	89 44 24 18          	mov    %eax,0x18(%esp)
   17373:	8b 45 04             	mov    0x4(%ebp),%eax
   17376:	89 44 24 14          	mov    %eax,0x14(%esp)
   1737a:	c7 44 24 10 2e 01 00 	movl   $0x12e,0x10(%esp)
   17381:	00 
   17382:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   17389:	00 
   1738a:	c7 44 24 08 00 e0 01 	movl   $0x1e000,0x8(%esp)
   17391:	00 
   17392:	c7 44 24 04 f3 e0 01 	movl   $0x1e0f3,0x4(%esp)
   17399:	00 
   1739a:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   173a1:	e8 16 9c ff ff       	call   10fbc <Print>
   173a6:	eb fe                	jmp    173a6 <Floppy_Transfer+0x238>
   173a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
   173ab:	c1 e0 02             	shl    $0x2,%eax
   173ae:	0f b6 c0             	movzbl %al,%eax
   173b1:	89 45 c8             	mov    %eax,-0x38(%ebp)
   173b4:	bf 03 00 00 00       	mov    $0x3,%edi
   173b9:	89 f0                	mov    %esi,%eax
   173bb:	0f b6 c0             	movzbl %al,%eax
   173be:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   173c1:	b8 00 00 00 00       	mov    $0x0,%eax
   173c6:	e8 c5 f6 ff ff       	call   16a90 <Start_Motor>
   173cb:	e8 81 8f ff ff       	call   10351 <Interrupts_Enabled>
   173d0:	84 c0                	test   %al,%al
   173d2:	75 4a                	jne    1741e <Floppy_Transfer+0x2b0>
   173d4:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   173db:	e8 13 9d ff ff       	call   110f3 <Set_Current_Attr>
   173e0:	a1 d0 07 02 00       	mov    0x207d0,%eax
   173e5:	89 44 24 18          	mov    %eax,0x18(%esp)
   173e9:	8b 45 04             	mov    0x4(%ebp),%eax
   173ec:	89 44 24 14          	mov    %eax,0x14(%esp)
   173f0:	c7 44 24 10 b5 01 00 	movl   $0x1b5,0x10(%esp)
   173f7:	00 
   173f8:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   173ff:	00 
   17400:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   17407:	00 
   17408:	c7 44 24 04 fe e0 01 	movl   $0x1e0fe,0x4(%esp)
   1740f:	00 
   17410:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17417:	e8 a0 9b ff ff       	call   10fbc <Print>
   1741c:	eb fe                	jmp    1741c <Floppy_Transfer+0x2ae>
   1741e:	fa                   	cli    
   1741f:	b8 0f 00 00 00       	mov    $0xf,%eax
   17424:	e8 a2 f8 ff ff       	call   16ccb <Floppy_Out>
   17429:	8b 45 c8             	mov    -0x38(%ebp),%eax
   1742c:	e8 9a f8 ff ff       	call   16ccb <Floppy_Out>
   17431:	8b 45 c4             	mov    -0x3c(%ebp),%eax
   17434:	e8 92 f8 ff ff       	call   16ccb <Floppy_Out>
   17439:	e8 0b f9 ff ff       	call   16d49 <Wait_For_Interrupt>
   1743e:	e8 0e 8f ff ff       	call   10351 <Interrupts_Enabled>
   17443:	84 c0                	test   %al,%al
   17445:	74 4a                	je     17491 <Floppy_Transfer+0x323>
   17447:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1744e:	e8 a0 9c ff ff       	call   110f3 <Set_Current_Attr>
   17453:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17458:	89 44 24 18          	mov    %eax,0x18(%esp)
   1745c:	8b 45 04             	mov    0x4(%ebp),%eax
   1745f:	89 44 24 14          	mov    %eax,0x14(%esp)
   17463:	c7 44 24 10 bf 01 00 	movl   $0x1bf,0x10(%esp)
   1746a:	00 
   1746b:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   17472:	00 
   17473:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1747a:	00 
   1747b:	c7 44 24 04 fe e0 01 	movl   $0x1e0fe,0x4(%esp)
   17482:	00 
   17483:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1748a:	e8 2d 9b ff ff       	call   10fbc <Print>
   1748f:	eb fe                	jmp    1748f <Floppy_Transfer+0x321>
   17491:	fb                   	sti    
   17492:	b8 00 00 00 00       	mov    $0x0,%eax
   17497:	e8 1c f6 ff ff       	call   16ab8 <Stop_Motor>
   1749c:	8d 55 e6             	lea    -0x1a(%ebp),%edx
   1749f:	8d 45 e7             	lea    -0x19(%ebp),%eax
   174a2:	e8 6e f8 ff ff       	call   16d15 <Sense_Interrupt_Status>
   174a7:	f6 45 e7 20          	testb  $0x20,-0x19(%ebp)
   174ab:	74 08                	je     174b5 <Floppy_Transfer+0x347>
   174ad:	0f b6 45 e6          	movzbl -0x1a(%ebp),%eax
   174b1:	39 c6                	cmp    %eax,%esi
   174b3:	74 18                	je     174cd <Floppy_Transfer+0x35f>
   174b5:	85 ff                	test   %edi,%edi
   174b7:	75 0c                	jne    174c5 <Floppy_Transfer+0x357>
   174b9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   174be:	66 90                	xchg   %ax,%ax
   174c0:	e9 92 01 00 00       	jmp    17657 <Floppy_Transfer+0x4e9>
   174c5:	83 ef 01             	sub    $0x1,%edi
   174c8:	e9 f4 fe ff ff       	jmp    173c1 <Floppy_Transfer+0x253>
   174cd:	8d 76 00             	lea    0x0(%esi),%esi
   174d0:	e8 7c 8e ff ff       	call   10351 <Interrupts_Enabled>
   174d5:	84 c0                	test   %al,%al
   174d7:	75 4a                	jne    17523 <Floppy_Transfer+0x3b5>
   174d9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   174e0:	e8 0e 9c ff ff       	call   110f3 <Set_Current_Attr>
   174e5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   174ea:	89 44 24 18          	mov    %eax,0x18(%esp)
   174ee:	8b 45 04             	mov    0x4(%ebp),%eax
   174f1:	89 44 24 14          	mov    %eax,0x14(%esp)
   174f5:	c7 44 24 10 e7 01 00 	movl   $0x1e7,0x10(%esp)
   174fc:	00 
   174fd:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   17504:	00 
   17505:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1750c:	00 
   1750d:	c7 44 24 04 e3 e0 01 	movl   $0x1e0e3,0x4(%esp)
   17514:	00 
   17515:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1751c:	e8 9b 9a ff ff       	call   10fbc <Print>
   17521:	eb fe                	jmp    17521 <Floppy_Transfer+0x3b3>
   17523:	fa                   	cli    
   17524:	c7 44 24 0c 00 02 00 	movl   $0x200,0xc(%esp)
   1752b:	00 
   1752c:	a1 48 03 02 00       	mov    0x20348,%eax
   17531:	89 44 24 08          	mov    %eax,0x8(%esp)
   17535:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
   1753c:	00 
   1753d:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
   17541:	0f 95 c0             	setne  %al
   17544:	0f b6 c0             	movzbl %al,%eax
   17547:	89 04 24             	mov    %eax,(%esp)
   1754a:	e8 6a f0 ff ff       	call   165b9 <Setup_DMA>
   1754f:	b8 00 00 00 00       	mov    $0x0,%eax
   17554:	e8 37 f5 ff ff       	call   16a90 <Start_Motor>
   17559:	c7 04 24 40 1f 00 00 	movl   $0x1f40,(%esp)
   17560:	e8 9e aa ff ff       	call   12003 <Micro_Delay>
   17565:	83 7d cc 01          	cmpl   $0x1,-0x34(%ebp)
   17569:	19 c0                	sbb    %eax,%eax
   1756b:	83 e0 21             	and    $0x21,%eax
   1756e:	83 c0 45             	add    $0x45,%eax
   17571:	0f b6 c0             	movzbl %al,%eax
   17574:	e8 52 f7 ff ff       	call   16ccb <Floppy_Out>
   17579:	8b 45 c8             	mov    -0x38(%ebp),%eax
   1757c:	e8 4a f7 ff ff       	call   16ccb <Floppy_Out>
   17581:	89 f2                	mov    %esi,%edx
   17583:	0f b6 c2             	movzbl %dl,%eax
   17586:	e8 40 f7 ff ff       	call   16ccb <Floppy_Out>
   1758b:	0f b6 45 d0          	movzbl -0x30(%ebp),%eax
   1758f:	e8 37 f7 ff ff       	call   16ccb <Floppy_Out>
   17594:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
   17598:	e8 2e f7 ff ff       	call   16ccb <Floppy_Out>
   1759d:	0f b6 43 0c          	movzbl 0xc(%ebx),%eax
   175a1:	e8 25 f7 ff ff       	call   16ccb <Floppy_Out>
   175a6:	0f b6 43 08          	movzbl 0x8(%ebx),%eax
   175aa:	e8 1c f7 ff ff       	call   16ccb <Floppy_Out>
   175af:	0f b6 43 10          	movzbl 0x10(%ebx),%eax
   175b3:	e8 13 f7 ff ff       	call   16ccb <Floppy_Out>
   175b8:	b8 ff 00 00 00       	mov    $0xff,%eax
   175bd:	e8 09 f7 ff ff       	call   16ccb <Floppy_Out>
   175c2:	e8 82 f7 ff ff       	call   16d49 <Wait_For_Interrupt>
   175c7:	e8 2b f7 ff ff       	call   16cf7 <Floppy_In>
   175cc:	89 c3                	mov    %eax,%ebx
   175ce:	e8 24 f7 ff ff       	call   16cf7 <Floppy_In>
   175d3:	e8 1f f7 ff ff       	call   16cf7 <Floppy_In>
   175d8:	e8 1a f7 ff ff       	call   16cf7 <Floppy_In>
   175dd:	8d 76 00             	lea    0x0(%esi),%esi
   175e0:	e8 12 f7 ff ff       	call   16cf7 <Floppy_In>
   175e5:	e8 0d f7 ff ff       	call   16cf7 <Floppy_In>
   175ea:	e8 08 f7 ff ff       	call   16cf7 <Floppy_In>
   175ef:	b8 00 00 00 00       	mov    $0x0,%eax
   175f4:	e8 bf f4 ff ff       	call   16ab8 <Stop_Motor>
   175f9:	c0 eb 06             	shr    $0x6,%bl
   175fc:	80 fb 01             	cmp    $0x1,%bl
   175ff:	19 db                	sbb    %ebx,%ebx
   17601:	f7 d3                	not    %ebx
   17603:	e8 49 8d ff ff       	call   10351 <Interrupts_Enabled>
   17608:	84 c0                	test   %al,%al
   1760a:	74 4a                	je     17656 <Floppy_Transfer+0x4e8>
   1760c:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17613:	e8 db 9a ff ff       	call   110f3 <Set_Current_Attr>
   17618:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1761d:	89 44 24 18          	mov    %eax,0x18(%esp)
   17621:	8b 45 04             	mov    0x4(%ebp),%eax
   17624:	89 44 24 14          	mov    %eax,0x14(%esp)
   17628:	c7 44 24 10 19 02 00 	movl   $0x219,0x10(%esp)
   1762f:	00 
   17630:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   17637:	00 
   17638:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1763f:	00 
   17640:	c7 44 24 04 e3 e0 01 	movl   $0x1e0e3,0x4(%esp)
   17647:	00 
   17648:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1764f:	e8 68 99 ff ff       	call   10fbc <Print>
   17654:	eb fe                	jmp    17654 <Floppy_Transfer+0x4e6>
   17656:	fb                   	sti    
   17657:	89 d8                	mov    %ebx,%eax
   17659:	83 c4 5c             	add    $0x5c,%esp
   1765c:	5b                   	pop    %ebx
   1765d:	5e                   	pop    %esi
   1765e:	5f                   	pop    %edi
   1765f:	5d                   	pop    %ebp
   17660:	c3                   	ret    

00017661 <Floppy_Request_Thread>:
   17661:	55                   	push   %ebp
   17662:	89 e5                	mov    %esp,%ebp
   17664:	57                   	push   %edi
   17665:	56                   	push   %esi
   17666:	53                   	push   %ebx
   17667:	83 ec 3c             	sub    $0x3c,%esp
   1766a:	b8 00 00 00 00       	mov    $0x0,%eax
   1766f:	83 c0 02             	add    $0x2,%eax
   17672:	89 45 e0             	mov    %eax,-0x20(%ebp)
   17675:	66 b8 00 02          	mov    $0x200,%ax
   17679:	83 e8 01             	sub    $0x1,%eax
   1767c:	89 45 dc             	mov    %eax,-0x24(%ebp)
   1767f:	c7 44 24 04 54 03 02 	movl   $0x20354,0x4(%esp)
   17686:	00 
   17687:	c7 04 24 4c 03 02 00 	movl   $0x2034c,(%esp)
   1768e:	e8 70 04 00 00       	call   17b03 <Dequeue_Request>
   17693:	89 c3                	mov    %eax,%ebx
   17695:	8b 40 04             	mov    0x4(%eax),%eax
   17698:	83 f8 01             	cmp    $0x1,%eax
   1769b:	76 4a                	jbe    176e7 <Floppy_Request_Thread+0x86>
   1769d:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   176a4:	e8 4a 9a ff ff       	call   110f3 <Set_Current_Attr>
   176a9:	a1 d0 07 02 00       	mov    0x207d0,%eax
   176ae:	89 44 24 18          	mov    %eax,0x18(%esp)
   176b2:	8b 45 04             	mov    0x4(%ebp),%eax
   176b5:	89 44 24 14          	mov    %eax,0x14(%esp)
   176b9:	c7 44 24 10 4f 02 00 	movl   $0x24f,0x10(%esp)
   176c0:	00 
   176c1:	c7 44 24 0c d6 dd 01 	movl   $0x1ddd6,0xc(%esp)
   176c8:	00 
   176c9:	c7 44 24 08 2c e0 01 	movl   $0x1e02c,0x8(%esp)
   176d0:	00 
   176d1:	c7 44 24 04 cd e0 01 	movl   $0x1e0cd,0x4(%esp)
   176d8:	00 
   176d9:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   176e0:	e8 d7 98 ff ff       	call   10fbc <Print>
   176e5:	eb fe                	jmp    176e5 <Floppy_Request_Thread+0x84>
   176e7:	85 c0                	test   %eax,%eax
   176e9:	0f 85 a8 00 00 00    	jne    17797 <Floppy_Request_Thread+0x136>
   176ef:	8b 7b 0c             	mov    0xc(%ebx),%edi
   176f2:	8b 73 08             	mov    0x8(%ebx),%esi
   176f5:	8b 03                	mov    (%ebx),%eax
   176f7:	8b 40 14             	mov    0x14(%eax),%eax
   176fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   176fd:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
   17704:	00 
   17705:	c7 44 24 04 cd ff ff 	movl   $0xffffffcd,0x4(%esp)
   1770c:	ff 
   1770d:	89 3c 24             	mov    %edi,(%esp)
   17710:	e8 fb 4f 00 00       	call   1c710 <memset>
   17715:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
   1771c:	00 
   1771d:	c7 44 24 04 cd ff ff 	movl   $0xffffffcd,0x4(%esp)
   17724:	ff 
   17725:	a1 48 03 02 00       	mov    0x20348,%eax
   1772a:	89 04 24             	mov    %eax,(%esp)
   1772d:	e8 de 4f 00 00       	call   1c710 <memset>
   17732:	89 3c 24             	mov    %edi,(%esp)
   17735:	89 f1                	mov    %esi,%ecx
   17737:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   1773a:	b8 00 00 00 00       	mov    $0x0,%eax
   1773f:	e8 2a fa ff ff       	call   1716e <Floppy_Transfer>
   17744:	85 c0                	test   %eax,%eax
   17746:	0f 85 c8 00 00 00    	jne    17814 <Floppy_Request_Thread+0x1b3>
   1774c:	8b 35 48 03 02 00    	mov    0x20348,%esi
   17752:	ba 00 02 00 00       	mov    $0x200,%edx
   17757:	f7 c7 01 00 00 00    	test   $0x1,%edi
   1775d:	74 04                	je     17763 <Floppy_Request_Thread+0x102>
   1775f:	a4                   	movsb  %ds:(%esi),%es:(%edi)
   17760:	8b 55 dc             	mov    -0x24(%ebp),%edx
   17763:	f7 c7 02 00 00 00    	test   $0x2,%edi
   17769:	74 05                	je     17770 <Floppy_Request_Thread+0x10f>
   1776b:	66 a5                	movsw  %ds:(%esi),%es:(%edi)
   1776d:	83 ea 02             	sub    $0x2,%edx
   17770:	89 d1                	mov    %edx,%ecx
   17772:	c1 e9 02             	shr    $0x2,%ecx
   17775:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   17777:	f6 c2 02             	test   $0x2,%dl
   1777a:	74 09                	je     17785 <Floppy_Request_Thread+0x124>
   1777c:	0f b7 0e             	movzwl (%esi),%ecx
   1777f:	66 89 0f             	mov    %cx,(%edi)
   17782:	8b 4d e0             	mov    -0x20(%ebp),%ecx
   17785:	f6 c2 01             	test   $0x1,%dl
   17788:	0f 84 86 00 00 00    	je     17814 <Floppy_Request_Thread+0x1b3>
   1778e:	0f b6 14 0e          	movzbl (%esi,%ecx,1),%edx
   17792:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
   17795:	eb 7d                	jmp    17814 <Floppy_Request_Thread+0x1b3>
   17797:	8b 53 0c             	mov    0xc(%ebx),%edx
   1779a:	8b 43 08             	mov    0x8(%ebx),%eax
   1779d:	89 45 d8             	mov    %eax,-0x28(%ebp)
   177a0:	8b 03                	mov    (%ebx),%eax
   177a2:	8b 40 14             	mov    0x14(%eax),%eax
   177a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   177a8:	8b 3d 48 03 02 00    	mov    0x20348,%edi
   177ae:	89 d6                	mov    %edx,%esi
   177b0:	b8 00 02 00 00       	mov    $0x200,%eax
   177b5:	f7 c7 01 00 00 00    	test   $0x1,%edi
   177bb:	74 0e                	je     177cb <Floppy_Request_Thread+0x16a>
   177bd:	0f b6 02             	movzbl (%edx),%eax
   177c0:	88 07                	mov    %al,(%edi)
   177c2:	83 c7 01             	add    $0x1,%edi
   177c5:	83 c6 01             	add    $0x1,%esi
   177c8:	8b 45 dc             	mov    -0x24(%ebp),%eax
   177cb:	f7 c7 02 00 00 00    	test   $0x2,%edi
   177d1:	74 0f                	je     177e2 <Floppy_Request_Thread+0x181>
   177d3:	0f b7 0e             	movzwl (%esi),%ecx
   177d6:	66 89 0f             	mov    %cx,(%edi)
   177d9:	83 c7 02             	add    $0x2,%edi
   177dc:	83 c6 02             	add    $0x2,%esi
   177df:	83 e8 02             	sub    $0x2,%eax
   177e2:	89 c1                	mov    %eax,%ecx
   177e4:	c1 e9 02             	shr    $0x2,%ecx
   177e7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   177e9:	a8 02                	test   $0x2,%al
   177eb:	74 09                	je     177f6 <Floppy_Request_Thread+0x195>
   177ed:	0f b7 0e             	movzwl (%esi),%ecx
   177f0:	66 89 0f             	mov    %cx,(%edi)
   177f3:	8b 4d e0             	mov    -0x20(%ebp),%ecx
   177f6:	a8 01                	test   $0x1,%al
   177f8:	74 07                	je     17801 <Floppy_Request_Thread+0x1a0>
   177fa:	0f b6 04 0e          	movzbl (%esi,%ecx,1),%eax
   177fe:	88 04 0f             	mov    %al,(%edi,%ecx,1)
   17801:	89 14 24             	mov    %edx,(%esp)
   17804:	8b 4d d8             	mov    -0x28(%ebp),%ecx
   17807:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   1780a:	b8 01 00 00 00       	mov    $0x1,%eax
   1780f:	e8 5a f9 ff ff       	call   1716e <Floppy_Transfer>
   17814:	83 f8 01             	cmp    $0x1,%eax
   17817:	19 d2                	sbb    %edx,%edx
   17819:	83 c2 02             	add    $0x2,%edx
   1781c:	89 44 24 08          	mov    %eax,0x8(%esp)
   17820:	89 54 24 04          	mov    %edx,0x4(%esp)
   17824:	89 1c 24             	mov    %ebx,(%esp)
   17827:	e8 08 02 00 00       	call   17a34 <Notify_Request_Completion>
   1782c:	e9 4e fe ff ff       	jmp    1767f <Floppy_Request_Thread+0x1e>

00017831 <Floppy_Interrupt_Handler>:
   17831:	55                   	push   %ebp
   17832:	89 e5                	mov    %esp,%ebp
   17834:	53                   	push   %ebx
   17835:	83 ec 14             	sub    $0x14,%esp
   17838:	8b 5d 08             	mov    0x8(%ebp),%ebx
   1783b:	89 1c 24             	mov    %ebx,(%esp)
   1783e:	e8 29 8c ff ff       	call   1046c <Begin_IRQ>
   17843:	c7 05 44 03 02 00 01 	movl   $0x1,0x20344
   1784a:	00 00 00 
   1784d:	89 1c 24             	mov    %ebx,(%esp)
   17850:	e8 1c 8c ff ff       	call   10471 <End_IRQ>
   17855:	83 c4 14             	add    $0x14,%esp
   17858:	5b                   	pop    %ebx
   17859:	5d                   	pop    %ebp
   1785a:	c3                   	ret    
   1785b:	90                   	nop

0001785c <Parse_ELF_Executable>:
   1785c:	55                   	push   %ebp
   1785d:	89 e5                	mov    %esp,%ebp
   1785f:	57                   	push   %edi
   17860:	56                   	push   %esi
   17861:	53                   	push   %ebx
   17862:	83 ec 3c             	sub    $0x3c,%esp
   17865:	8b 5d 08             	mov    0x8(%ebp),%ebx
   17868:	8b 7d 10             	mov    0x10(%ebp),%edi
   1786b:	89 de                	mov    %ebx,%esi
   1786d:	8b 43 1c             	mov    0x1c(%ebx),%eax
   17870:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   17873:	85 db                	test   %ebx,%ebx
   17875:	75 4a                	jne    178c1 <Parse_ELF_Executable+0x65>
   17877:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1787e:	e8 70 98 ff ff       	call   110f3 <Set_Current_Attr>
   17883:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17888:	89 44 24 18          	mov    %eax,0x18(%esp)
   1788c:	8b 45 04             	mov    0x4(%ebp),%eax
   1788f:	89 44 24 14          	mov    %eax,0x14(%esp)
   17893:	c7 44 24 10 24 00 00 	movl   $0x24,0x10(%esp)
   1789a:	00 
   1789b:	c7 44 24 0c 0a e1 01 	movl   $0x1e10a,0xc(%esp)
   178a2:	00 
   178a3:	c7 44 24 08 1e e1 01 	movl   $0x1e11e,0x8(%esp)
   178aa:	00 
   178ab:	c7 44 24 04 49 e2 01 	movl   $0x1e249,0x4(%esp)
   178b2:	00 
   178b3:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   178ba:	e8 fd 96 ff ff       	call   10fbc <Print>
   178bf:	eb fe                	jmp    178bf <Parse_ELF_Executable+0x63>
   178c1:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
   178c5:	89 47 3c             	mov    %eax,0x3c(%edi)
   178c8:	8b 43 18             	mov    0x18(%ebx),%eax
   178cb:	89 47 40             	mov    %eax,0x40(%edi)
   178ce:	c7 04 24 2a e1 01 00 	movl   $0x1e12a,(%esp)
   178d5:	e8 e2 96 ff ff       	call   10fbc <Print>
   178da:	0f b7 43 10          	movzwl 0x10(%ebx),%eax
   178de:	89 44 24 04          	mov    %eax,0x4(%esp)
   178e2:	c7 04 24 37 e1 01 00 	movl   $0x1e137,(%esp)
   178e9:	e8 ce 96 ff ff       	call   10fbc <Print>
   178ee:	0f b7 43 12          	movzwl 0x12(%ebx),%eax
   178f2:	89 44 24 04          	mov    %eax,0x4(%esp)
   178f6:	c7 04 24 43 e1 01 00 	movl   $0x1e143,(%esp)
   178fd:	e8 ba 96 ff ff       	call   10fbc <Print>
   17902:	8b 43 14             	mov    0x14(%ebx),%eax
   17905:	89 44 24 04          	mov    %eax,0x4(%esp)
   17909:	c7 04 24 52 e1 01 00 	movl   $0x1e152,(%esp)
   17910:	e8 a7 96 ff ff       	call   10fbc <Print>
   17915:	8b 43 1c             	mov    0x1c(%ebx),%eax
   17918:	89 44 24 04          	mov    %eax,0x4(%esp)
   1791c:	c7 04 24 61 e1 01 00 	movl   $0x1e161,(%esp)
   17923:	e8 94 96 ff ff       	call   10fbc <Print>
   17928:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
   1792c:	89 44 24 04          	mov    %eax,0x4(%esp)
   17930:	c7 04 24 04 e2 01 00 	movl   $0x1e204,(%esp)
   17937:	e8 80 96 ff ff       	call   10fbc <Print>
   1793c:	0f b7 43 30          	movzwl 0x30(%ebx),%eax
   17940:	89 44 24 04          	mov    %eax,0x4(%esp)
   17944:	c7 04 24 28 e2 01 00 	movl   $0x1e228,(%esp)
   1794b:	e8 6c 96 ff ff       	call   10fbc <Print>
   17950:	66 83 7b 2c 00       	cmpw   $0x0,0x2c(%ebx)
   17955:	0f 84 b0 00 00 00    	je     17a0b <Parse_ELF_Executable+0x1af>
   1795b:	03 5d e4             	add    -0x1c(%ebp),%ebx
   1795e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   17965:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   17968:	89 44 24 04          	mov    %eax,0x4(%esp)
   1796c:	c7 04 24 7e e1 01 00 	movl   $0x1e17e,(%esp)
   17973:	e8 44 96 ff ff       	call   10fbc <Print>
   17978:	8b 43 04             	mov    0x4(%ebx),%eax
   1797b:	89 44 24 04          	mov    %eax,0x4(%esp)
   1797f:	c7 04 24 92 e1 01 00 	movl   $0x1e192,(%esp)
   17986:	e8 31 96 ff ff       	call   10fbc <Print>
   1798b:	8b 43 10             	mov    0x10(%ebx),%eax
   1798e:	89 44 24 04          	mov    %eax,0x4(%esp)
   17992:	c7 04 24 a8 e1 01 00 	movl   $0x1e1a8,(%esp)
   17999:	e8 1e 96 ff ff       	call   10fbc <Print>
   1799e:	8b 43 08             	mov    0x8(%ebx),%eax
   179a1:	89 44 24 04          	mov    %eax,0x4(%esp)
   179a5:	c7 04 24 be e1 01 00 	movl   $0x1e1be,(%esp)
   179ac:	e8 0b 96 ff ff       	call   10fbc <Print>
   179b1:	8b 43 14             	mov    0x14(%ebx),%eax
   179b4:	89 44 24 04          	mov    %eax,0x4(%esp)
   179b8:	c7 04 24 d6 e1 01 00 	movl   $0x1e1d6,(%esp)
   179bf:	e8 f8 95 ff ff       	call   10fbc <Print>
   179c4:	8b 43 18             	mov    0x18(%ebx),%eax
   179c7:	89 44 24 04          	mov    %eax,0x4(%esp)
   179cb:	c7 04 24 ec e1 01 00 	movl   $0x1e1ec,(%esp)
   179d2:	e8 e5 95 ff ff       	call   10fbc <Print>
   179d7:	8b 43 04             	mov    0x4(%ebx),%eax
   179da:	89 07                	mov    %eax,(%edi)
   179dc:	8b 43 10             	mov    0x10(%ebx),%eax
   179df:	89 47 04             	mov    %eax,0x4(%edi)
   179e2:	8b 43 08             	mov    0x8(%ebx),%eax
   179e5:	89 47 08             	mov    %eax,0x8(%edi)
   179e8:	8b 43 14             	mov    0x14(%ebx),%eax
   179eb:	89 47 0c             	mov    %eax,0xc(%edi)
   179ee:	8b 43 18             	mov    0x18(%ebx),%eax
   179f1:	89 47 10             	mov    %eax,0x10(%edi)
   179f4:	83 c3 20             	add    $0x20,%ebx
   179f7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   179fb:	83 c7 14             	add    $0x14,%edi
   179fe:	0f b7 46 2c          	movzwl 0x2c(%esi),%eax
   17a02:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
   17a05:	0f 8f 5a ff ff ff    	jg     17965 <Parse_ELF_Executable+0x109>
   17a0b:	b8 00 00 00 00       	mov    $0x0,%eax
   17a10:	83 c4 3c             	add    $0x3c,%esp
   17a13:	5b                   	pop    %ebx
   17a14:	5e                   	pop    %esi
   17a15:	5f                   	pop    %edi
   17a16:	5d                   	pop    %ebp
   17a17:	c3                   	ret    
   17a18:	90                   	nop
   17a19:	90                   	nop
   17a1a:	90                   	nop
   17a1b:	90                   	nop
   17a1c:	90                   	nop
   17a1d:	90                   	nop
   17a1e:	90                   	nop
   17a1f:	90                   	nop

00017a20 <Get_Num_Blocks>:
   17a20:	55                   	push   %ebp
   17a21:	89 e5                	mov    %esp,%ebp
   17a23:	83 ec 18             	sub    $0x18,%esp
   17a26:	8b 45 08             	mov    0x8(%ebp),%eax
   17a29:	8b 50 10             	mov    0x10(%eax),%edx
   17a2c:	89 04 24             	mov    %eax,(%esp)
   17a2f:	ff 52 08             	call   *0x8(%edx)
   17a32:	c9                   	leave  
   17a33:	c3                   	ret    

00017a34 <Notify_Request_Completion>:
   17a34:	55                   	push   %ebp
   17a35:	89 e5                	mov    %esp,%ebp
   17a37:	53                   	push   %ebx
   17a38:	83 ec 24             	sub    $0x24,%esp
   17a3b:	8b 5d 08             	mov    0x8(%ebp),%ebx
   17a3e:	e8 0e 89 ff ff       	call   10351 <Interrupts_Enabled>
   17a43:	84 c0                	test   %al,%al
   17a45:	75 4a                	jne    17a91 <Notify_Request_Completion+0x5d>
   17a47:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17a4e:	e8 a0 96 ff ff       	call   110f3 <Set_Current_Attr>
   17a53:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17a58:	89 44 24 18          	mov    %eax,0x18(%esp)
   17a5c:	8b 45 04             	mov    0x4(%ebp),%eax
   17a5f:	89 44 24 14          	mov    %eax,0x14(%esp)
   17a63:	c7 44 24 10 e9 00 00 	movl   $0xe9,0x10(%esp)
   17a6a:	00 
   17a6b:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   17a72:	00 
   17a73:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   17a7a:	00 
   17a7b:	c7 44 24 04 40 e3 01 	movl   $0x1e340,0x4(%esp)
   17a82:	00 
   17a83:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17a8a:	e8 2d 95 ff ff       	call   10fbc <Print>
   17a8f:	eb fe                	jmp    17a8f <Notify_Request_Completion+0x5b>
   17a91:	fa                   	cli    
   17a92:	8b 45 0c             	mov    0xc(%ebp),%eax
   17a95:	89 43 10             	mov    %eax,0x10(%ebx)
   17a98:	8b 45 10             	mov    0x10(%ebp),%eax
   17a9b:	89 43 14             	mov    %eax,0x14(%ebx)
   17a9e:	83 c3 18             	add    $0x18,%ebx
   17aa1:	89 1c 24             	mov    %ebx,(%esp)
   17aa4:	e8 a6 d8 ff ff       	call   1534f <Wake_Up>
   17aa9:	e8 a3 88 ff ff       	call   10351 <Interrupts_Enabled>
   17aae:	84 c0                	test   %al,%al
   17ab0:	74 4a                	je     17afc <Notify_Request_Completion+0xc8>
   17ab2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17ab9:	e8 35 96 ff ff       	call   110f3 <Set_Current_Attr>
   17abe:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17ac3:	89 44 24 18          	mov    %eax,0x18(%esp)
   17ac7:	8b 45 04             	mov    0x4(%ebp),%eax
   17aca:	89 44 24 14          	mov    %eax,0x14(%esp)
   17ace:	c7 44 24 10 ed 00 00 	movl   $0xed,0x10(%esp)
   17ad5:	00 
   17ad6:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   17add:	00 
   17ade:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   17ae5:	00 
   17ae6:	c7 44 24 04 40 e3 01 	movl   $0x1e340,0x4(%esp)
   17aed:	00 
   17aee:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17af5:	e8 c2 94 ff ff       	call   10fbc <Print>
   17afa:	eb fe                	jmp    17afa <Notify_Request_Completion+0xc6>
   17afc:	fb                   	sti    
   17afd:	83 c4 24             	add    $0x24,%esp
   17b00:	5b                   	pop    %ebx
   17b01:	5d                   	pop    %ebp
   17b02:	c3                   	ret    

00017b03 <Dequeue_Request>:
   17b03:	55                   	push   %ebp
   17b04:	89 e5                	mov    %esp,%ebp
   17b06:	57                   	push   %edi
   17b07:	56                   	push   %esi
   17b08:	53                   	push   %ebx
   17b09:	83 ec 2c             	sub    $0x2c,%esp
   17b0c:	8b 75 08             	mov    0x8(%ebp),%esi
   17b0f:	8b 7d 0c             	mov    0xc(%ebp),%edi
   17b12:	e8 3a 88 ff ff       	call   10351 <Interrupts_Enabled>
   17b17:	84 c0                	test   %al,%al
   17b19:	75 4a                	jne    17b65 <Dequeue_Request+0x62>
   17b1b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17b22:	e8 cc 95 ff ff       	call   110f3 <Set_Current_Attr>
   17b27:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17b2c:	89 44 24 18          	mov    %eax,0x18(%esp)
   17b30:	8b 45 04             	mov    0x4(%ebp),%eax
   17b33:	89 44 24 14          	mov    %eax,0x14(%esp)
   17b37:	c7 44 24 10 da 00 00 	movl   $0xda,0x10(%esp)
   17b3e:	00 
   17b3f:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   17b46:	00 
   17b47:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   17b4e:	00 
   17b4f:	c7 44 24 04 5a e3 01 	movl   $0x1e35a,0x4(%esp)
   17b56:	00 
   17b57:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17b5e:	e8 59 94 ff ff       	call   10fbc <Print>
   17b63:	eb fe                	jmp    17b63 <Dequeue_Request+0x60>
   17b65:	fa                   	cli    
   17b66:	8b 1e                	mov    (%esi),%ebx
   17b68:	85 db                	test   %ebx,%ebx
   17b6a:	75 0e                	jne    17b7a <Dequeue_Request+0x77>
   17b6c:	89 3c 24             	mov    %edi,(%esp)
   17b6f:	e8 ab d4 ff ff       	call   1501f <Wait>
   17b74:	8b 1e                	mov    (%esi),%ebx
   17b76:	85 db                	test   %ebx,%ebx
   17b78:	74 f2                	je     17b6c <Dequeue_Request+0x69>
   17b7a:	8b 43 24             	mov    0x24(%ebx),%eax
   17b7d:	89 06                	mov    %eax,(%esi)
   17b7f:	85 c0                	test   %eax,%eax
   17b81:	75 09                	jne    17b8c <Dequeue_Request+0x89>
   17b83:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
   17b8a:	eb 07                	jmp    17b93 <Dequeue_Request+0x90>
   17b8c:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
   17b93:	e8 b9 87 ff ff       	call   10351 <Interrupts_Enabled>
   17b98:	84 c0                	test   %al,%al
   17b9a:	74 4a                	je     17be6 <Dequeue_Request+0xe3>
   17b9c:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17ba3:	e8 4b 95 ff ff       	call   110f3 <Set_Current_Attr>
   17ba8:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17bad:	89 44 24 18          	mov    %eax,0x18(%esp)
   17bb1:	8b 45 04             	mov    0x4(%ebp),%eax
   17bb4:	89 44 24 14          	mov    %eax,0x14(%esp)
   17bb8:	c7 44 24 10 df 00 00 	movl   $0xdf,0x10(%esp)
   17bbf:	00 
   17bc0:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   17bc7:	00 
   17bc8:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   17bcf:	00 
   17bd0:	c7 44 24 04 5a e3 01 	movl   $0x1e35a,0x4(%esp)
   17bd7:	00 
   17bd8:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17bdf:	e8 d8 93 ff ff       	call   10fbc <Print>
   17be4:	eb fe                	jmp    17be4 <Dequeue_Request+0xe1>
   17be6:	fb                   	sti    
   17be7:	89 d8                	mov    %ebx,%eax
   17be9:	83 c4 2c             	add    $0x2c,%esp
   17bec:	5b                   	pop    %ebx
   17bed:	5e                   	pop    %esi
   17bee:	5f                   	pop    %edi
   17bef:	5d                   	pop    %ebp
   17bf0:	c3                   	ret    

00017bf1 <Post_Request_And_Wait>:
   17bf1:	55                   	push   %ebp
   17bf2:	89 e5                	mov    %esp,%ebp
   17bf4:	56                   	push   %esi
   17bf5:	53                   	push   %ebx
   17bf6:	83 ec 20             	sub    $0x20,%esp
   17bf9:	8b 5d 08             	mov    0x8(%ebp),%ebx
   17bfc:	85 db                	test   %ebx,%ebx
   17bfe:	75 4a                	jne    17c4a <Post_Request_And_Wait+0x59>
   17c00:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17c07:	e8 e7 94 ff ff       	call   110f3 <Set_Current_Attr>
   17c0c:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17c11:	89 44 24 18          	mov    %eax,0x18(%esp)
   17c15:	8b 45 04             	mov    0x4(%ebp),%eax
   17c18:	89 44 24 14          	mov    %eax,0x14(%esp)
   17c1c:	c7 44 24 10 bc 00 00 	movl   $0xbc,0x10(%esp)
   17c23:	00 
   17c24:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   17c2b:	00 
   17c2c:	c7 44 24 08 77 e2 01 	movl   $0x1e277,0x8(%esp)
   17c33:	00 
   17c34:	c7 44 24 04 6a e3 01 	movl   $0x1e36a,0x4(%esp)
   17c3b:	00 
   17c3c:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17c43:	e8 74 93 ff ff       	call   10fbc <Print>
   17c48:	eb fe                	jmp    17c48 <Post_Request_And_Wait+0x57>
   17c4a:	8b 33                	mov    (%ebx),%esi
   17c4c:	85 f6                	test   %esi,%esi
   17c4e:	75 4a                	jne    17c9a <Post_Request_And_Wait+0xa9>
   17c50:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17c57:	e8 97 94 ff ff       	call   110f3 <Set_Current_Attr>
   17c5c:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17c61:	89 44 24 18          	mov    %eax,0x18(%esp)
   17c65:	8b 45 04             	mov    0x4(%ebp),%eax
   17c68:	89 44 24 14          	mov    %eax,0x14(%esp)
   17c6c:	c7 44 24 10 bf 00 00 	movl   $0xbf,0x10(%esp)
   17c73:	00 
   17c74:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   17c7b:	00 
   17c7c:	c7 44 24 08 84 e2 01 	movl   $0x1e284,0x8(%esp)
   17c83:	00 
   17c84:	c7 44 24 04 6a e3 01 	movl   $0x1e36a,0x4(%esp)
   17c8b:	00 
   17c8c:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17c93:	e8 24 93 ff ff       	call   10fbc <Print>
   17c98:	eb fe                	jmp    17c98 <Post_Request_And_Wait+0xa7>
   17c9a:	e8 b2 86 ff ff       	call   10351 <Interrupts_Enabled>
   17c9f:	84 c0                	test   %al,%al
   17ca1:	75 4a                	jne    17ced <Post_Request_And_Wait+0xfc>
   17ca3:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17caa:	e8 44 94 ff ff       	call   110f3 <Set_Current_Attr>
   17caf:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17cb4:	89 44 24 18          	mov    %eax,0x18(%esp)
   17cb8:	8b 45 04             	mov    0x4(%ebp),%eax
   17cbb:	89 44 24 14          	mov    %eax,0x14(%esp)
   17cbf:	c7 44 24 10 c3 00 00 	movl   $0xc3,0x10(%esp)
   17cc6:	00 
   17cc7:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   17cce:	00 
   17ccf:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   17cd6:	00 
   17cd7:	c7 44 24 04 6a e3 01 	movl   $0x1e36a,0x4(%esp)
   17cde:	00 
   17cdf:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17ce6:	e8 d1 92 ff ff       	call   10fbc <Print>
   17ceb:	eb fe                	jmp    17ceb <Post_Request_And_Wait+0xfa>
   17ced:	fa                   	cli    
   17cee:	8b 56 24             	mov    0x24(%esi),%edx
   17cf1:	8b 02                	mov    (%edx),%eax
   17cf3:	85 c0                	test   %eax,%eax
   17cf5:	0f 84 a4 01 00 00    	je     17e9f <Post_Request_And_Wait+0x2ae>
   17cfb:	39 c3                	cmp    %eax,%ebx
   17cfd:	75 0b                	jne    17d0a <Post_Request_And_Wait+0x119>
   17cff:	eb 16                	jmp    17d17 <Post_Request_And_Wait+0x126>
   17d01:	39 c3                	cmp    %eax,%ebx
   17d03:	90                   	nop
   17d04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   17d08:	74 0d                	je     17d17 <Post_Request_And_Wait+0x126>
   17d0a:	8b 40 24             	mov    0x24(%eax),%eax
   17d0d:	85 c0                	test   %eax,%eax
   17d0f:	90                   	nop
   17d10:	75 ef                	jne    17d01 <Post_Request_And_Wait+0x110>
   17d12:	e9 88 01 00 00       	jmp    17e9f <Post_Request_And_Wait+0x2ae>
   17d17:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17d1e:	66 90                	xchg   %ax,%ax
   17d20:	e8 ce 93 ff ff       	call   110f3 <Set_Current_Attr>
   17d25:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17d2a:	89 44 24 18          	mov    %eax,0x18(%esp)
   17d2e:	8b 45 04             	mov    0x4(%ebp),%eax
   17d31:	89 44 24 14          	mov    %eax,0x14(%esp)
   17d35:	c7 44 24 10 39 00 00 	movl   $0x39,0x10(%esp)
   17d3c:	00 
   17d3d:	c7 44 24 0c 8d e2 01 	movl   $0x1e28d,0xc(%esp)
   17d44:	00 
   17d45:	c7 44 24 08 d4 e2 01 	movl   $0x1e2d4,0x8(%esp)
   17d4c:	00 
   17d4d:	c7 44 24 04 80 e3 01 	movl   $0x1e380,0x4(%esp)
   17d54:	00 
   17d55:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17d5c:	e8 5b 92 ff ff       	call   10fbc <Print>
   17d61:	eb fe                	jmp    17d61 <Post_Request_And_Wait+0x170>
   17d63:	89 5a 04             	mov    %ebx,0x4(%edx)
   17d66:	89 1a                	mov    %ebx,(%edx)
   17d68:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
   17d6f:	eb 0c                	jmp    17d7d <Post_Request_And_Wait+0x18c>
   17d71:	89 58 24             	mov    %ebx,0x24(%eax)
   17d74:	8b 42 04             	mov    0x4(%edx),%eax
   17d77:	89 43 20             	mov    %eax,0x20(%ebx)
   17d7a:	89 5a 04             	mov    %ebx,0x4(%edx)
   17d7d:	8b 46 20             	mov    0x20(%esi),%eax
   17d80:	89 04 24             	mov    %eax,(%esp)
   17d83:	e8 c7 d5 ff ff       	call   1534f <Wake_Up>
   17d88:	e8 c4 85 ff ff       	call   10351 <Interrupts_Enabled>
   17d8d:	84 c0                	test   %al,%al
   17d8f:	74 4a                	je     17ddb <Post_Request_And_Wait+0x1ea>
   17d91:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17d98:	e8 56 93 ff ff       	call   110f3 <Set_Current_Attr>
   17d9d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17da2:	89 44 24 18          	mov    %eax,0x18(%esp)
   17da6:	8b 45 04             	mov    0x4(%ebp),%eax
   17da9:	89 44 24 14          	mov    %eax,0x14(%esp)
   17dad:	c7 44 24 10 c6 00 00 	movl   $0xc6,0x10(%esp)
   17db4:	00 
   17db5:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   17dbc:	00 
   17dbd:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   17dc4:	00 
   17dc5:	c7 44 24 04 6a e3 01 	movl   $0x1e36a,0x4(%esp)
   17dcc:	00 
   17dcd:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17dd4:	e8 e3 91 ff ff       	call   10fbc <Print>
   17dd9:	eb fe                	jmp    17dd9 <Post_Request_And_Wait+0x1e8>
   17ddb:	fb                   	sti    
   17ddc:	e8 70 85 ff ff       	call   10351 <Interrupts_Enabled>
   17de1:	84 c0                	test   %al,%al
   17de3:	75 4a                	jne    17e2f <Post_Request_And_Wait+0x23e>
   17de5:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17dec:	e8 02 93 ff ff       	call   110f3 <Set_Current_Attr>
   17df1:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17df6:	89 44 24 18          	mov    %eax,0x18(%esp)
   17dfa:	8b 45 04             	mov    0x4(%ebp),%eax
   17dfd:	89 44 24 14          	mov    %eax,0x14(%esp)
   17e01:	c7 44 24 10 c9 00 00 	movl   $0xc9,0x10(%esp)
   17e08:	00 
   17e09:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   17e10:	00 
   17e11:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   17e18:	00 
   17e19:	c7 44 24 04 6a e3 01 	movl   $0x1e36a,0x4(%esp)
   17e20:	00 
   17e21:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17e28:	e8 8f 91 ff ff       	call   10fbc <Print>
   17e2d:	eb fe                	jmp    17e2d <Post_Request_And_Wait+0x23c>
   17e2f:	fa                   	cli    
   17e30:	8d 73 18             	lea    0x18(%ebx),%esi
   17e33:	eb 08                	jmp    17e3d <Post_Request_And_Wait+0x24c>
   17e35:	89 34 24             	mov    %esi,(%esp)
   17e38:	e8 e2 d1 ff ff       	call   1501f <Wait>
   17e3d:	8b 43 10             	mov    0x10(%ebx),%eax
   17e40:	85 c0                	test   %eax,%eax
   17e42:	74 f1                	je     17e35 <Post_Request_And_Wait+0x244>
   17e44:	e8 08 85 ff ff       	call   10351 <Interrupts_Enabled>
   17e49:	84 c0                	test   %al,%al
   17e4b:	74 4a                	je     17e97 <Post_Request_And_Wait+0x2a6>
   17e4d:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17e54:	e8 9a 92 ff ff       	call   110f3 <Set_Current_Attr>
   17e59:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17e5e:	89 44 24 18          	mov    %eax,0x18(%esp)
   17e62:	8b 45 04             	mov    0x4(%ebp),%eax
   17e65:	89 44 24 14          	mov    %eax,0x14(%esp)
   17e69:	c7 44 24 10 cf 00 00 	movl   $0xcf,0x10(%esp)
   17e70:	00 
   17e71:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   17e78:	00 
   17e79:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   17e80:	00 
   17e81:	c7 44 24 04 6a e3 01 	movl   $0x1e36a,0x4(%esp)
   17e88:	00 
   17e89:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17e90:	e8 27 91 ff ff       	call   10fbc <Print>
   17e95:	eb fe                	jmp    17e95 <Post_Request_And_Wait+0x2a4>
   17e97:	fb                   	sti    
   17e98:	83 c4 20             	add    $0x20,%esp
   17e9b:	5b                   	pop    %ebx
   17e9c:	5e                   	pop    %esi
   17e9d:	5d                   	pop    %ebp
   17e9e:	c3                   	ret    
   17e9f:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
   17ea6:	8b 42 04             	mov    0x4(%edx),%eax
   17ea9:	85 c0                	test   %eax,%eax
   17eab:	0f 85 c0 fe ff ff    	jne    17d71 <Post_Request_And_Wait+0x180>
   17eb1:	e9 ad fe ff ff       	jmp    17d63 <Post_Request_And_Wait+0x172>

00017eb6 <Create_Request>:
   17eb6:	55                   	push   %ebp
   17eb7:	89 e5                	mov    %esp,%ebp
   17eb9:	83 ec 18             	sub    $0x18,%esp
   17ebc:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
   17ec3:	e8 a8 bd ff ff       	call   13c70 <Malloc>
   17ec8:	85 c0                	test   %eax,%eax
   17eca:	74 2c                	je     17ef8 <Create_Request+0x42>
   17ecc:	8b 55 08             	mov    0x8(%ebp),%edx
   17ecf:	89 10                	mov    %edx,(%eax)
   17ed1:	8b 55 0c             	mov    0xc(%ebp),%edx
   17ed4:	89 50 04             	mov    %edx,0x4(%eax)
   17ed7:	8b 55 10             	mov    0x10(%ebp),%edx
   17eda:	89 50 08             	mov    %edx,0x8(%eax)
   17edd:	8b 55 14             	mov    0x14(%ebp),%edx
   17ee0:	89 50 0c             	mov    %edx,0xc(%eax)
   17ee3:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
   17eea:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
   17ef1:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
   17ef8:	c9                   	leave  
   17ef9:	c3                   	ret    

00017efa <Do_Request>:
   17efa:	55                   	push   %ebp
   17efb:	89 e5                	mov    %esp,%ebp
   17efd:	83 ec 18             	sub    $0x18,%esp
   17f00:	89 5d f8             	mov    %ebx,-0x8(%ebp)
   17f03:	89 75 fc             	mov    %esi,-0x4(%ebp)
   17f06:	8b 5d 08             	mov    0x8(%ebp),%ebx
   17f09:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
   17f0d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
   17f11:	89 54 24 04          	mov    %edx,0x4(%esp)
   17f15:	89 04 24             	mov    %eax,(%esp)
   17f18:	e8 99 ff ff ff       	call   17eb6 <Create_Request>
   17f1d:	89 c3                	mov    %eax,%ebx
   17f1f:	be f9 ff ff ff       	mov    $0xfffffff9,%esi
   17f24:	85 c0                	test   %eax,%eax
   17f26:	74 13                	je     17f3b <Do_Request+0x41>
   17f28:	89 04 24             	mov    %eax,(%esp)
   17f2b:	e8 c1 fc ff ff       	call   17bf1 <Post_Request_And_Wait>
   17f30:	8b 73 14             	mov    0x14(%ebx),%esi
   17f33:	89 1c 24             	mov    %ebx,(%esp)
   17f36:	e8 cc be ff ff       	call   13e07 <Free>
   17f3b:	89 f0                	mov    %esi,%eax
   17f3d:	8b 5d f8             	mov    -0x8(%ebp),%ebx
   17f40:	8b 75 fc             	mov    -0x4(%ebp),%esi
   17f43:	89 ec                	mov    %ebp,%esp
   17f45:	5d                   	pop    %ebp
   17f46:	c3                   	ret    

00017f47 <Block_Write>:
   17f47:	55                   	push   %ebp
   17f48:	89 e5                	mov    %esp,%ebp
   17f4a:	83 ec 18             	sub    $0x18,%esp
   17f4d:	8b 45 10             	mov    0x10(%ebp),%eax
   17f50:	89 04 24             	mov    %eax,(%esp)
   17f53:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   17f56:	ba 01 00 00 00       	mov    $0x1,%edx
   17f5b:	8b 45 08             	mov    0x8(%ebp),%eax
   17f5e:	e8 97 ff ff ff       	call   17efa <Do_Request>
   17f63:	c9                   	leave  
   17f64:	c3                   	ret    

00017f65 <Block_Read>:
   17f65:	55                   	push   %ebp
   17f66:	89 e5                	mov    %esp,%ebp
   17f68:	83 ec 18             	sub    $0x18,%esp
   17f6b:	8b 45 10             	mov    0x10(%ebp),%eax
   17f6e:	89 04 24             	mov    %eax,(%esp)
   17f71:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   17f74:	ba 00 00 00 00       	mov    $0x0,%edx
   17f79:	8b 45 08             	mov    0x8(%ebp),%eax
   17f7c:	e8 79 ff ff ff       	call   17efa <Do_Request>
   17f81:	c9                   	leave  
   17f82:	c3                   	ret    

00017f83 <Close_Block_Device>:
   17f83:	55                   	push   %ebp
   17f84:	89 e5                	mov    %esp,%ebp
   17f86:	56                   	push   %esi
   17f87:	53                   	push   %ebx
   17f88:	83 ec 20             	sub    $0x20,%esp
   17f8b:	8b 5d 08             	mov    0x8(%ebp),%ebx
   17f8e:	c7 04 24 5c 03 02 00 	movl   $0x2035c,(%esp)
   17f95:	e8 3d c7 ff ff       	call   146d7 <Mutex_Lock>
   17f9a:	80 7b 18 00          	cmpb   $0x0,0x18(%ebx)
   17f9e:	75 4a                	jne    17fea <Close_Block_Device+0x67>
   17fa0:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   17fa7:	e8 47 91 ff ff       	call   110f3 <Set_Current_Attr>
   17fac:	a1 d0 07 02 00       	mov    0x207d0,%eax
   17fb1:	89 44 24 18          	mov    %eax,0x18(%esp)
   17fb5:	8b 45 04             	mov    0x4(%ebp),%eax
   17fb8:	89 44 24 14          	mov    %eax,0x14(%esp)
   17fbc:	c7 44 24 10 97 00 00 	movl   $0x97,0x10(%esp)
   17fc3:	00 
   17fc4:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   17fcb:	00 
   17fcc:	c7 44 24 08 fa dd 01 	movl   $0x1ddfa,0x8(%esp)
   17fd3:	00 
   17fd4:	c7 44 24 04 a2 e3 01 	movl   $0x1e3a2,0x4(%esp)
   17fdb:	00 
   17fdc:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   17fe3:	e8 d4 8f ff ff       	call   10fbc <Print>
   17fe8:	eb fe                	jmp    17fe8 <Close_Block_Device+0x65>
   17fea:	8b 43 10             	mov    0x10(%ebx),%eax
   17fed:	89 1c 24             	mov    %ebx,(%esp)
   17ff0:	ff 50 04             	call   *0x4(%eax)
   17ff3:	89 c6                	mov    %eax,%esi
   17ff5:	85 c0                	test   %eax,%eax
   17ff7:	75 04                	jne    17ffd <Close_Block_Device+0x7a>
   17ff9:	c6 43 18 00          	movb   $0x0,0x18(%ebx)
   17ffd:	c7 04 24 5c 03 02 00 	movl   $0x2035c,(%esp)
   18004:	e8 0d c8 ff ff       	call   14816 <Mutex_Unlock>
   18009:	89 f0                	mov    %esi,%eax
   1800b:	83 c4 20             	add    $0x20,%esp
   1800e:	5b                   	pop    %ebx
   1800f:	5e                   	pop    %esi
   18010:	5d                   	pop    %ebp
   18011:	c3                   	ret    

00018012 <Open_Block_Device>:
   18012:	55                   	push   %ebp
   18013:	89 e5                	mov    %esp,%ebp
   18015:	56                   	push   %esi
   18016:	53                   	push   %ebx
   18017:	83 ec 10             	sub    $0x10,%esp
   1801a:	8b 75 08             	mov    0x8(%ebp),%esi
   1801d:	c7 04 24 5c 03 02 00 	movl   $0x2035c,(%esp)
   18024:	e8 ae c6 ff ff       	call   146d7 <Mutex_Lock>
   18029:	8b 1d 6c 03 02 00    	mov    0x2036c,%ebx
   1802f:	85 db                	test   %ebx,%ebx
   18031:	74 48                	je     1807b <Open_Block_Device+0x69>
   18033:	89 74 24 04          	mov    %esi,0x4(%esp)
   18037:	89 1c 24             	mov    %ebx,(%esp)
   1803a:	e8 a2 47 00 00       	call   1c7e1 <strcmp>
   1803f:	85 c0                	test   %eax,%eax
   18041:	74 09                	je     1804c <Open_Block_Device+0x3a>
   18043:	8b 5b 2c             	mov    0x2c(%ebx),%ebx
   18046:	85 db                	test   %ebx,%ebx
   18048:	75 e9                	jne    18033 <Open_Block_Device+0x21>
   1804a:	eb 2f                	jmp    1807b <Open_Block_Device+0x69>
   1804c:	85 db                	test   %ebx,%ebx
   1804e:	66 90                	xchg   %ax,%ax
   18050:	74 29                	je     1807b <Open_Block_Device+0x69>
   18052:	be fa ff ff ff       	mov    $0xfffffffa,%esi
   18057:	80 7b 18 00          	cmpb   $0x0,0x18(%ebx)
   1805b:	90                   	nop
   1805c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   18060:	75 1e                	jne    18080 <Open_Block_Device+0x6e>
   18062:	8b 43 10             	mov    0x10(%ebx),%eax
   18065:	89 1c 24             	mov    %ebx,(%esp)
   18068:	ff 10                	call   *(%eax)
   1806a:	89 c6                	mov    %eax,%esi
   1806c:	85 c0                	test   %eax,%eax
   1806e:	75 10                	jne    18080 <Open_Block_Device+0x6e>
   18070:	8b 45 0c             	mov    0xc(%ebp),%eax
   18073:	89 18                	mov    %ebx,(%eax)
   18075:	c6 43 18 01          	movb   $0x1,0x18(%ebx)
   18079:	eb 05                	jmp    18080 <Open_Block_Device+0x6e>
   1807b:	be fc ff ff ff       	mov    $0xfffffffc,%esi
   18080:	c7 04 24 5c 03 02 00 	movl   $0x2035c,(%esp)
   18087:	e8 8a c7 ff ff       	call   14816 <Mutex_Unlock>
   1808c:	89 f0                	mov    %esi,%eax
   1808e:	83 c4 10             	add    $0x10,%esp
   18091:	5b                   	pop    %ebx
   18092:	5e                   	pop    %esi
   18093:	5d                   	pop    %ebp
   18094:	c3                   	ret    

00018095 <Register_Block_Device>:
   18095:	55                   	push   %ebp
   18096:	89 e5                	mov    %esp,%ebp
   18098:	57                   	push   %edi
   18099:	56                   	push   %esi
   1809a:	53                   	push   %ebx
   1809b:	83 ec 2c             	sub    $0x2c,%esp
   1809e:	8b 75 0c             	mov    0xc(%ebp),%esi
   180a1:	8b 7d 18             	mov    0x18(%ebp),%edi
   180a4:	85 f6                	test   %esi,%esi
   180a6:	75 4a                	jne    180f2 <Register_Block_Device+0x5d>
   180a8:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   180af:	e8 3f 90 ff ff       	call   110f3 <Set_Current_Attr>
   180b4:	a1 d0 07 02 00       	mov    0x207d0,%eax
   180b9:	89 44 24 18          	mov    %eax,0x18(%esp)
   180bd:	8b 45 04             	mov    0x4(%ebp),%eax
   180c0:	89 44 24 14          	mov    %eax,0x14(%esp)
   180c4:	c7 44 24 10 51 00 00 	movl   $0x51,0x10(%esp)
   180cb:	00 
   180cc:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   180d3:	00 
   180d4:	c7 44 24 08 aa e2 01 	movl   $0x1e2aa,0x8(%esp)
   180db:	00 
   180dc:	c7 44 24 04 b5 e3 01 	movl   $0x1e3b5,0x4(%esp)
   180e3:	00 
   180e4:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   180eb:	e8 cc 8e ff ff       	call   10fbc <Print>
   180f0:	eb fe                	jmp    180f0 <Register_Block_Device+0x5b>
   180f2:	85 ff                	test   %edi,%edi
   180f4:	75 4d                	jne    18143 <Register_Block_Device+0xae>
   180f6:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   180fd:	8d 76 00             	lea    0x0(%esi),%esi
   18100:	e8 ee 8f ff ff       	call   110f3 <Set_Current_Attr>
   18105:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1810a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1810e:	8b 45 04             	mov    0x4(%ebp),%eax
   18111:	89 44 24 14          	mov    %eax,0x14(%esp)
   18115:	c7 44 24 10 52 00 00 	movl   $0x52,0x10(%esp)
   1811c:	00 
   1811d:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   18124:	00 
   18125:	c7 44 24 08 b3 e2 01 	movl   $0x1e2b3,0x8(%esp)
   1812c:	00 
   1812d:	c7 44 24 04 b5 e3 01 	movl   $0x1e3b5,0x4(%esp)
   18134:	00 
   18135:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1813c:	e8 7b 8e ff ff       	call   10fbc <Print>
   18141:	eb fe                	jmp    18141 <Register_Block_Device+0xac>
   18143:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
   18147:	75 4a                	jne    18193 <Register_Block_Device+0xfe>
   18149:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   18150:	e8 9e 8f ff ff       	call   110f3 <Set_Current_Attr>
   18155:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1815a:	89 44 24 18          	mov    %eax,0x18(%esp)
   1815e:	8b 45 04             	mov    0x4(%ebp),%eax
   18161:	89 44 24 14          	mov    %eax,0x14(%esp)
   18165:	c7 44 24 10 53 00 00 	movl   $0x53,0x10(%esp)
   1816c:	00 
   1816d:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   18174:	00 
   18175:	c7 44 24 08 c2 e2 01 	movl   $0x1e2c2,0x8(%esp)
   1817c:	00 
   1817d:	c7 44 24 04 b5 e3 01 	movl   $0x1e3b5,0x4(%esp)
   18184:	00 
   18185:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1818c:	e8 2b 8e ff ff       	call   10fbc <Print>
   18191:	eb fe                	jmp    18191 <Register_Block_Device+0xfc>
   18193:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
   1819a:	e8 d1 ba ff ff       	call   13c70 <Malloc>
   1819f:	89 c3                	mov    %eax,%ebx
   181a1:	b8 f9 ff ff ff       	mov    $0xfffffff9,%eax
   181a6:	85 db                	test   %ebx,%ebx
   181a8:	0f 84 cd 00 00 00    	je     1827b <Register_Block_Device+0x1e6>
   181ae:	8b 45 08             	mov    0x8(%ebp),%eax
   181b1:	89 44 24 04          	mov    %eax,0x4(%esp)
   181b5:	89 1c 24             	mov    %ebx,(%esp)
   181b8:	e8 40 47 00 00       	call   1c8fd <strcpy>
   181bd:	89 73 10             	mov    %esi,0x10(%ebx)
   181c0:	8b 45 10             	mov    0x10(%ebp),%eax
   181c3:	89 43 14             	mov    %eax,0x14(%ebx)
   181c6:	c6 43 18 00          	movb   $0x0,0x18(%ebx)
   181ca:	8b 45 14             	mov    0x14(%ebp),%eax
   181cd:	89 43 1c             	mov    %eax,0x1c(%ebx)
   181d0:	89 7b 20             	mov    %edi,0x20(%ebx)
   181d3:	8b 45 1c             	mov    0x1c(%ebp),%eax
   181d6:	89 43 24             	mov    %eax,0x24(%ebx)
   181d9:	c7 04 24 5c 03 02 00 	movl   $0x2035c,(%esp)
   181e0:	e8 f2 c4 ff ff       	call   146d7 <Mutex_Lock>
   181e5:	a1 6c 03 02 00       	mov    0x2036c,%eax
   181ea:	eb 07                	jmp    181f3 <Register_Block_Device+0x15e>
   181ec:	39 c3                	cmp    %eax,%ebx
   181ee:	74 0c                	je     181fc <Register_Block_Device+0x167>
   181f0:	8b 40 2c             	mov    0x2c(%eax),%eax
   181f3:	85 c0                	test   %eax,%eax
   181f5:	75 f5                	jne    181ec <Register_Block_Device+0x157>
   181f7:	e9 87 00 00 00       	jmp    18283 <Register_Block_Device+0x1ee>
   181fc:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   18203:	e8 eb 8e ff ff       	call   110f3 <Set_Current_Attr>
   18208:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1820d:	89 44 24 18          	mov    %eax,0x18(%esp)
   18211:	8b 45 04             	mov    0x4(%ebp),%eax
   18214:	89 44 24 14          	mov    %eax,0x14(%esp)
   18218:	c7 44 24 10 27 00 00 	movl   $0x27,0x10(%esp)
   1821f:	00 
   18220:	c7 44 24 0c 5e e2 01 	movl   $0x1e25e,0xc(%esp)
   18227:	00 
   18228:	c7 44 24 08 08 e3 01 	movl   $0x1e308,0x8(%esp)
   1822f:	00 
   18230:	c7 44 24 04 e0 e3 01 	movl   $0x1e3e0,0x4(%esp)
   18237:	00 
   18238:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1823f:	e8 78 8d ff ff       	call   10fbc <Print>
   18244:	eb fe                	jmp    18244 <Register_Block_Device+0x1af>
   18246:	89 1d 70 03 02 00    	mov    %ebx,0x20370
   1824c:	89 1d 6c 03 02 00    	mov    %ebx,0x2036c
   18252:	c7 43 28 00 00 00 00 	movl   $0x0,0x28(%ebx)
   18259:	eb 0f                	jmp    1826a <Register_Block_Device+0x1d5>
   1825b:	89 58 2c             	mov    %ebx,0x2c(%eax)
   1825e:	b8 70 03 02 00       	mov    $0x20370,%eax
   18263:	8b 10                	mov    (%eax),%edx
   18265:	89 53 28             	mov    %edx,0x28(%ebx)
   18268:	89 18                	mov    %ebx,(%eax)
   1826a:	c7 04 24 5c 03 02 00 	movl   $0x2035c,(%esp)
   18271:	e8 a0 c5 ff ff       	call   14816 <Mutex_Unlock>
   18276:	b8 00 00 00 00       	mov    $0x0,%eax
   1827b:	83 c4 2c             	add    $0x2c,%esp
   1827e:	5b                   	pop    %ebx
   1827f:	5e                   	pop    %esi
   18280:	5f                   	pop    %edi
   18281:	5d                   	pop    %ebp
   18282:	c3                   	ret    
   18283:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
   1828a:	a1 70 03 02 00       	mov    0x20370,%eax
   1828f:	85 c0                	test   %eax,%eax
   18291:	75 c8                	jne    1825b <Register_Block_Device+0x1c6>
   18293:	eb b1                	jmp    18246 <Register_Block_Device+0x1b1>
   18295:	90                   	nop
   18296:	90                   	nop
   18297:	90                   	nop
   18298:	90                   	nop
   18299:	90                   	nop
   1829a:	90                   	nop
   1829b:	90                   	nop
   1829c:	90                   	nop
   1829d:	90                   	nop
   1829e:	90                   	nop
   1829f:	90                   	nop

000182a0 <IDE_getNumBlocks>:
   182a0:	55                   	push   %ebp
   182a1:	89 e5                	mov    %esp,%ebp
   182a3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
   182a8:	83 f8 02             	cmp    $0x2,%eax
   182ab:	77 1e                	ja     182cb <IDE_getNumBlocks+0x2b>
   182ad:	0f bf 0c c5 80 03 02 	movswl 0x20380(,%eax,8),%ecx
   182b4:	00 
   182b5:	0f bf 14 c5 7e 03 02 	movswl 0x2037e(,%eax,8),%edx
   182bc:	00 
   182bd:	0f af d1             	imul   %ecx,%edx
   182c0:	0f bf 04 c5 7c 03 02 	movswl 0x2037c(,%eax,8),%eax
   182c7:	00 
   182c8:	0f af d0             	imul   %eax,%edx
   182cb:	89 d0                	mov    %edx,%eax
   182cd:	5d                   	pop    %ebp
   182ce:	c3                   	ret    

000182cf <IDE_Get_Num_Blocks>:
   182cf:	55                   	push   %ebp
   182d0:	89 e5                	mov    %esp,%ebp
   182d2:	8b 45 08             	mov    0x8(%ebp),%eax
   182d5:	8b 40 14             	mov    0x14(%eax),%eax
   182d8:	e8 c3 ff ff ff       	call   182a0 <IDE_getNumBlocks>
   182dd:	5d                   	pop    %ebp
   182de:	c3                   	ret    

000182df <readDriveConfig>:
   182df:	55                   	push   %ebp
   182e0:	89 e5                	mov    %esp,%ebp
   182e2:	57                   	push   %edi
   182e3:	56                   	push   %esi
   182e4:	53                   	push   %ebx
   182e5:	81 ec 3c 02 00 00    	sub    $0x23c,%esp
   182eb:	89 c7                	mov    %eax,%edi
   182ed:	83 3d 74 03 02 00 01 	cmpl   $0x1,0x20374
   182f4:	7e 10                	jle    18306 <readDriveConfig+0x27>
   182f6:	89 44 24 04          	mov    %eax,0x4(%esp)
   182fa:	c7 04 24 04 e4 01 00 	movl   $0x1e404,(%esp)
   18301:	e8 b6 8c ff ff       	call   10fbc <Print>
   18306:	83 ff 01             	cmp    $0x1,%edi
   18309:	19 c0                	sbb    %eax,%eax
   1830b:	83 e0 f0             	and    $0xfffffff0,%eax
   1830e:	05 b0 00 00 00       	add    $0xb0,%eax
   18313:	89 44 24 04          	mov    %eax,0x4(%esp)
   18317:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
   1831e:	e8 39 85 ff ff       	call   1085c <Out_Byte>
   18323:	c7 44 24 04 ec 00 00 	movl   $0xec,0x4(%esp)
   1832a:	00 
   1832b:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18332:	e8 25 85 ff ff       	call   1085c <Out_Byte>
   18337:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   1833e:	e8 27 85 ff ff       	call   1086a <In_Byte>
   18343:	84 c0                	test   %al,%al
   18345:	78 f0                	js     18337 <readDriveConfig+0x58>
   18347:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   1834e:	e8 17 85 ff ff       	call   1086a <In_Byte>
   18353:	a8 08                	test   $0x8,%al
   18355:	0f 84 e4 00 00 00    	je     1843f <readDriveConfig+0x160>
   1835b:	bb 00 00 00 00       	mov    $0x0,%ebx
   18360:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
   18366:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
   1836d:	e8 11 85 ff ff       	call   10883 <In_Word>
   18372:	66 89 04 5e          	mov    %ax,(%esi,%ebx,2)
   18376:	83 c3 01             	add    $0x1,%ebx
   18379:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
   1837f:	75 e5                	jne    18366 <readDriveConfig+0x87>
   18381:	0f b7 85 ea fd ff ff 	movzwl -0x216(%ebp),%eax
   18388:	66 89 04 fd 7c 03 02 	mov    %ax,0x2037c(,%edi,8)
   1838f:	00 
   18390:	0f b7 95 ee fd ff ff 	movzwl -0x212(%ebp),%edx
   18397:	66 89 14 fd 7e 03 02 	mov    %dx,0x2037e(,%edi,8)
   1839e:	00 
   1839f:	0f b7 8d f4 fd ff ff 	movzwl -0x20c(%ebp),%ecx
   183a6:	66 89 0c fd 80 03 02 	mov    %cx,0x20380(,%edi,8)
   183ad:	00 
   183ae:	0f b7 9d f2 fd ff ff 	movzwl -0x20e(%ebp),%ebx
   183b5:	66 89 1c fd 82 03 02 	mov    %bx,0x20382(,%edi,8)
   183bc:	00 
   183bd:	0f bf c9             	movswl %cx,%ecx
   183c0:	89 4c 24 10          	mov    %ecx,0x10(%esp)
   183c4:	0f bf d2             	movswl %dx,%edx
   183c7:	89 54 24 0c          	mov    %edx,0xc(%esp)
   183cb:	98                   	cwtl   
   183cc:	89 44 24 08          	mov    %eax,0x8(%esp)
   183d0:	89 7c 24 04          	mov    %edi,0x4(%esp)
   183d4:	c7 04 24 34 e4 01 00 	movl   $0x1e434,(%esp)
   183db:	e8 dc 8b ff ff       	call   10fbc <Print>
   183e0:	89 7c 24 0c          	mov    %edi,0xc(%esp)
   183e4:	c7 44 24 08 80 e4 01 	movl   $0x1e480,0x8(%esp)
   183eb:	00 
   183ec:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
   183f3:	00 
   183f4:	8d 9d d9 fd ff ff    	lea    -0x227(%ebp),%ebx
   183fa:	89 1c 24             	mov    %ebx,(%esp)
   183fd:	e8 ad 46 00 00       	call   1caaf <snprintf>
   18402:	c7 44 24 14 e0 07 02 	movl   $0x207e0,0x14(%esp)
   18409:	00 
   1840a:	c7 44 24 10 e8 07 02 	movl   $0x207e8,0x10(%esp)
   18411:	00 
   18412:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
   18419:	00 
   1841a:	89 7c 24 08          	mov    %edi,0x8(%esp)
   1841e:	c7 44 24 04 c4 f0 01 	movl   $0x1f0c4,0x4(%esp)
   18425:	00 
   18426:	89 1c 24             	mov    %ebx,(%esp)
   18429:	e8 67 fc ff ff       	call   18095 <Register_Block_Device>
   1842e:	89 c2                	mov    %eax,%edx
   18430:	b8 00 00 00 00       	mov    $0x0,%eax
   18435:	85 d2                	test   %edx,%edx
   18437:	0f 84 85 00 00 00    	je     184c2 <readDriveConfig+0x1e3>
   1843d:	eb 68                	jmp    184a7 <readDriveConfig+0x1c8>
   1843f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   18446:	00 
   18447:	c7 04 24 f1 01 00 00 	movl   $0x1f1,(%esp)
   1844e:	e8 09 84 ff ff       	call   1085c <Out_Byte>
   18453:	83 ff 01             	cmp    $0x1,%edi
   18456:	19 c0                	sbb    %eax,%eax
   18458:	83 e0 f0             	and    $0xfffffff0,%eax
   1845b:	05 b0 00 00 00       	add    $0xb0,%eax
   18460:	89 44 24 04          	mov    %eax,0x4(%esp)
   18464:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
   1846b:	e8 ec 83 ff ff       	call   1085c <Out_Byte>
   18470:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   18477:	00 
   18478:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   1847f:	e8 d8 83 ff ff       	call   1085c <Out_Byte>
   18484:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   1848b:	e8 da 83 ff ff       	call   1086a <In_Byte>
   18490:	84 c0                	test   %al,%al
   18492:	78 f0                	js     18484 <readDriveConfig+0x1a5>
   18494:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   1849b:	e8 ca 83 ff ff       	call   1086a <In_Byte>
   184a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   184a5:	eb 1b                	jmp    184c2 <readDriveConfig+0x1e3>
   184a7:	8d 85 d9 fd ff ff    	lea    -0x227(%ebp),%eax
   184ad:	89 44 24 04          	mov    %eax,0x4(%esp)
   184b1:	c7 04 24 b0 de 01 00 	movl   $0x1deb0,(%esp)
   184b8:	e8 ff 8a ff ff       	call   10fbc <Print>
   184bd:	b8 00 00 00 00       	mov    $0x0,%eax
   184c2:	81 c4 3c 02 00 00    	add    $0x23c,%esp
   184c8:	5b                   	pop    %ebx
   184c9:	5e                   	pop    %esi
   184ca:	5f                   	pop    %edi
   184cb:	5d                   	pop    %ebp
   184cc:	c3                   	ret    

000184cd <Init_IDE>:
   184cd:	55                   	push   %ebp
   184ce:	89 e5                	mov    %esp,%ebp
   184d0:	83 ec 18             	sub    $0x18,%esp
   184d3:	c7 04 24 60 e4 01 00 	movl   $0x1e460,(%esp)
   184da:	e8 dd 8a ff ff       	call   10fbc <Print>
   184df:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
   184e6:	00 
   184e7:	c7 04 24 f6 03 00 00 	movl   $0x3f6,(%esp)
   184ee:	e8 69 83 ff ff       	call   1085c <Out_Byte>
   184f3:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
   184fa:	e8 04 9b ff ff       	call   12003 <Micro_Delay>
   184ff:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
   18506:	00 
   18507:	c7 04 24 f6 03 00 00 	movl   $0x3f6,(%esp)
   1850e:	e8 49 83 ff ff       	call   1085c <Out_Byte>
   18513:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   1851a:	e8 4b 83 ff ff       	call   1086a <In_Byte>
   1851f:	84 c0                	test   %al,%al
   18521:	78 f0                	js     18513 <Init_IDE+0x46>
   18523:	83 3d 74 03 02 00 00 	cmpl   $0x0,0x20374
   1852a:	74 0c                	je     18538 <Init_IDE+0x6b>
   1852c:	c7 04 24 86 e4 01 00 	movl   $0x1e486,(%esp)
   18533:	e8 84 8a ff ff       	call   10fbc <Print>
   18538:	c7 44 24 04 90 00 00 	movl   $0x90,0x4(%esp)
   1853f:	00 
   18540:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18547:	e8 10 83 ff ff       	call   1085c <Out_Byte>
   1854c:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18553:	e8 12 83 ff ff       	call   1086a <In_Byte>
   18558:	84 c0                	test   %al,%al
   1855a:	78 f0                	js     1854c <Init_IDE+0x7f>
   1855c:	c7 04 24 f1 01 00 00 	movl   $0x1f1,(%esp)
   18563:	e8 02 83 ff ff       	call   1086a <In_Byte>
   18568:	83 3d 74 03 02 00 01 	cmpl   $0x1,0x20374
   1856f:	7e 13                	jle    18584 <Init_IDE+0xb7>
   18571:	0f b6 c0             	movzbl %al,%eax
   18574:	89 44 24 04          	mov    %eax,0x4(%esp)
   18578:	c7 04 24 a4 e4 01 00 	movl   $0x1e4a4,(%esp)
   1857f:	e8 38 8a ff ff       	call   10fbc <Print>
   18584:	b8 00 00 00 00       	mov    $0x0,%eax
   18589:	e8 51 fd ff ff       	call   182df <readDriveConfig>
   1858e:	85 c0                	test   %eax,%eax
   18590:	75 07                	jne    18599 <Init_IDE+0xcc>
   18592:	83 05 78 03 02 00 01 	addl   $0x1,0x20378
   18599:	b8 01 00 00 00       	mov    $0x1,%eax
   1859e:	e8 3c fd ff ff       	call   182df <readDriveConfig>
   185a3:	85 c0                	test   %eax,%eax
   185a5:	75 07                	jne    185ae <Init_IDE+0xe1>
   185a7:	83 05 78 03 02 00 01 	addl   $0x1,0x20378
   185ae:	83 3d 74 03 02 00 00 	cmpl   $0x0,0x20374
   185b5:	74 15                	je     185cc <Init_IDE+0xff>
   185b7:	a1 78 03 02 00       	mov    0x20378,%eax
   185bc:	89 44 24 04          	mov    %eax,0x4(%esp)
   185c0:	c7 04 24 c2 e4 01 00 	movl   $0x1e4c2,(%esp)
   185c7:	e8 f0 89 ff ff       	call   10fbc <Print>
   185cc:	83 3d 78 03 02 00 00 	cmpl   $0x0,0x20378
   185d3:	7e 24                	jle    185f9 <Init_IDE+0x12c>
   185d5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
   185dc:	00 
   185dd:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
   185e4:	00 
   185e5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   185ec:	00 
   185ed:	c7 04 24 bb 86 01 00 	movl   $0x186bb,(%esp)
   185f4:	e8 47 d4 ff ff       	call   15a40 <Start_Kernel_Thread>
   185f9:	c9                   	leave  
   185fa:	c3                   	ret    

000185fb <IDE_Close>:
   185fb:	55                   	push   %ebp
   185fc:	89 e5                	mov    %esp,%ebp
   185fe:	83 ec 28             	sub    $0x28,%esp
   18601:	8b 45 08             	mov    0x8(%ebp),%eax
   18604:	80 78 18 00          	cmpb   $0x0,0x18(%eax)
   18608:	75 4a                	jne    18654 <IDE_Close+0x59>
   1860a:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   18611:	e8 dd 8a ff ff       	call   110f3 <Set_Current_Attr>
   18616:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1861b:	89 44 24 18          	mov    %eax,0x18(%esp)
   1861f:	8b 45 04             	mov    0x4(%ebp),%eax
   18622:	89 44 24 14          	mov    %eax,0x14(%esp)
   18626:	c7 44 24 10 19 01 00 	movl   $0x119,0x10(%esp)
   1862d:	00 
   1862e:	c7 44 24 0c d7 e4 01 	movl   $0x1e4d7,0xc(%esp)
   18635:	00 
   18636:	c7 44 24 08 fa dd 01 	movl   $0x1ddfa,0x8(%esp)
   1863d:	00 
   1863e:	c7 44 24 04 cf e5 01 	movl   $0x1e5cf,0x4(%esp)
   18645:	00 
   18646:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1864d:	e8 6a 89 ff ff       	call   10fbc <Print>
   18652:	eb fe                	jmp    18652 <IDE_Close+0x57>
   18654:	b8 00 00 00 00       	mov    $0x0,%eax
   18659:	c9                   	leave  
   1865a:	c3                   	ret    

0001865b <IDE_Open>:
   1865b:	55                   	push   %ebp
   1865c:	89 e5                	mov    %esp,%ebp
   1865e:	83 ec 28             	sub    $0x28,%esp
   18661:	8b 45 08             	mov    0x8(%ebp),%eax
   18664:	80 78 18 00          	cmpb   $0x0,0x18(%eax)
   18668:	74 4a                	je     186b4 <IDE_Open+0x59>
   1866a:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   18671:	e8 7d 8a ff ff       	call   110f3 <Set_Current_Attr>
   18676:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1867b:	89 44 24 18          	mov    %eax,0x18(%esp)
   1867f:	8b 45 04             	mov    0x4(%ebp),%eax
   18682:	89 44 24 14          	mov    %eax,0x14(%esp)
   18686:	c7 44 24 10 13 01 00 	movl   $0x113,0x10(%esp)
   1868d:	00 
   1868e:	c7 44 24 0c d7 e4 01 	movl   $0x1e4d7,0xc(%esp)
   18695:	00 
   18696:	c7 44 24 08 f9 dd 01 	movl   $0x1ddf9,0x8(%esp)
   1869d:	00 
   1869e:	c7 44 24 04 d9 e5 01 	movl   $0x1e5d9,0x4(%esp)
   186a5:	00 
   186a6:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   186ad:	e8 0a 89 ff ff       	call   10fbc <Print>
   186b2:	eb fe                	jmp    186b2 <IDE_Open+0x57>
   186b4:	b8 00 00 00 00       	mov    $0x0,%eax
   186b9:	c9                   	leave  
   186ba:	c3                   	ret    

000186bb <IDE_Request_Thread>:
   186bb:	55                   	push   %ebp
   186bc:	89 e5                	mov    %esp,%ebp
   186be:	57                   	push   %edi
   186bf:	56                   	push   %esi
   186c0:	53                   	push   %ebx
   186c1:	83 ec 4c             	sub    $0x4c,%esp
   186c4:	c7 44 24 04 e8 07 02 	movl   $0x207e8,0x4(%esp)
   186cb:	00 
   186cc:	c7 04 24 e0 07 02 00 	movl   $0x207e0,(%esp)
   186d3:	e8 2b f4 ff ff       	call   17b03 <Dequeue_Request>
   186d8:	89 c7                	mov    %eax,%edi
   186da:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
   186de:	0f 85 39 03 00 00    	jne    18a1d <IDE_Request_Thread+0x362>
   186e4:	8b 70 0c             	mov    0xc(%eax),%esi
   186e7:	8b 40 08             	mov    0x8(%eax),%eax
   186ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   186ed:	8b 07                	mov    (%edi),%eax
   186ef:	8b 58 14             	mov    0x14(%eax),%ebx
   186f2:	85 db                	test   %ebx,%ebx
   186f4:	78 0c                	js     18702 <IDE_Request_Thread+0x47>
   186f6:	a1 78 03 02 00       	mov    0x20378,%eax
   186fb:	83 e8 01             	sub    $0x1,%eax
   186fe:	39 c3                	cmp    %eax,%ebx
   18700:	7e 2c                	jle    1872e <IDE_Request_Thread+0x73>
   18702:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   18707:	83 3d 74 03 02 00 00 	cmpl   $0x0,0x20374
   1870e:	0f 84 f3 05 00 00    	je     18d07 <IDE_Request_Thread+0x64c>
   18714:	89 5c 24 04          	mov    %ebx,0x4(%esp)
   18718:	c7 04 24 eb e4 01 00 	movl   $0x1e4eb,(%esp)
   1871f:	e8 98 88 ff ff       	call   10fbc <Print>
   18724:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   18729:	e9 d9 05 00 00       	jmp    18d07 <IDE_Request_Thread+0x64c>
   1872e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
   18732:	78 0e                	js     18742 <IDE_Request_Thread+0x87>
   18734:	89 d8                	mov    %ebx,%eax
   18736:	e8 65 fb ff ff       	call   182a0 <IDE_getNumBlocks>
   1873b:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
   1873e:	66 90                	xchg   %ax,%ax
   18740:	7c 2f                	jl     18771 <IDE_Request_Thread+0xb6>
   18742:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   18747:	83 3d 74 03 02 00 00 	cmpl   $0x0,0x20374
   1874e:	0f 84 b3 05 00 00    	je     18d07 <IDE_Request_Thread+0x64c>
   18754:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   18757:	89 54 24 04          	mov    %edx,0x4(%esp)
   1875b:	c7 04 24 02 e5 01 00 	movl   $0x1e502,(%esp)
   18762:	e8 55 88 ff ff       	call   10fbc <Print>
   18767:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   1876c:	e9 96 05 00 00       	jmp    18d07 <IDE_Request_Thread+0x64c>
   18771:	e8 db 7b ff ff       	call   10351 <Interrupts_Enabled>
   18776:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
   1877d:	84 c0                	test   %al,%al
   1877f:	90                   	nop
   18780:	74 5b                	je     187dd <IDE_Request_Thread+0x122>
   18782:	e8 ca 7b ff ff       	call   10351 <Interrupts_Enabled>
   18787:	84 c0                	test   %al,%al
   18789:	75 4a                	jne    187d5 <IDE_Request_Thread+0x11a>
   1878b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   18792:	e8 5c 89 ff ff       	call   110f3 <Set_Current_Attr>
   18797:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1879c:	89 44 24 18          	mov    %eax,0x18(%esp)
   187a0:	8b 45 04             	mov    0x4(%ebp),%eax
   187a3:	89 44 24 14          	mov    %eax,0x14(%esp)
   187a7:	c7 44 24 10 92 00 00 	movl   $0x92,0x10(%esp)
   187ae:	00 
   187af:	c7 44 24 0c d7 e4 01 	movl   $0x1e4d7,0xc(%esp)
   187b6:	00 
   187b7:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   187be:	00 
   187bf:	c7 44 24 04 e2 e5 01 	movl   $0x1e5e2,0x4(%esp)
   187c6:	00 
   187c7:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   187ce:	e8 e9 87 ff ff       	call   10fbc <Print>
   187d3:	eb fe                	jmp    187d3 <IDE_Request_Thread+0x118>
   187d5:	fa                   	cli    
   187d6:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%ebp)
   187dd:	0f bf 0c dd 80 03 02 	movswl 0x20380(,%ebx,8),%ecx
   187e4:	00 
   187e5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   187e8:	89 d0                	mov    %edx,%eax
   187ea:	c1 fa 1f             	sar    $0x1f,%edx
   187ed:	f7 f9                	idiv   %ecx
   187ef:	89 45 dc             	mov    %eax,-0x24(%ebp)
   187f2:	83 c2 01             	add    $0x1,%edx
   187f5:	89 55 d4             	mov    %edx,-0x2c(%ebp)
   187f8:	0f bf 14 dd 7e 03 02 	movswl 0x2037e(,%ebx,8),%edx
   187ff:	00 
   18800:	89 55 e0             	mov    %edx,-0x20(%ebp)
   18803:	0f af ca             	imul   %edx,%ecx
   18806:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   18809:	89 d0                	mov    %edx,%eax
   1880b:	c1 fa 1f             	sar    $0x1f,%edx
   1880e:	f7 f9                	idiv   %ecx
   18810:	89 45 d8             	mov    %eax,-0x28(%ebp)
   18813:	8b 55 dc             	mov    -0x24(%ebp),%edx
   18816:	89 d0                	mov    %edx,%eax
   18818:	c1 fa 1f             	sar    $0x1f,%edx
   1881b:	f7 7d e0             	idivl  -0x20(%ebp)
   1881e:	89 55 dc             	mov    %edx,-0x24(%ebp)
   18821:	83 3d 74 03 02 00 01 	cmpl   $0x1,0x20374
   18828:	7e 4c                	jle    18876 <IDE_Request_Thread+0x1bb>
   1882a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1882d:	89 44 24 04          	mov    %eax,0x4(%esp)
   18831:	c7 04 24 19 e5 01 00 	movl   $0x1e519,(%esp)
   18838:	e8 7f 87 ff ff       	call   10fbc <Print>
   1883d:	8b 55 dc             	mov    -0x24(%ebp),%edx
   18840:	89 54 24 04          	mov    %edx,0x4(%esp)
   18844:	c7 04 24 33 e5 01 00 	movl   $0x1e533,(%esp)
   1884b:	e8 6c 87 ff ff       	call   10fbc <Print>
   18850:	8b 45 d8             	mov    -0x28(%ebp),%eax
   18853:	89 44 24 04          	mov    %eax,0x4(%esp)
   18857:	c7 04 24 40 e5 01 00 	movl   $0x1e540,(%esp)
   1885e:	e8 59 87 ff ff       	call   10fbc <Print>
   18863:	8b 55 d4             	mov    -0x2c(%ebp),%edx
   18866:	89 54 24 04          	mov    %edx,0x4(%esp)
   1886a:	c7 04 24 51 e5 01 00 	movl   $0x1e551,(%esp)
   18871:	e8 46 87 ff ff       	call   10fbc <Print>
   18876:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
   1887d:	00 
   1887e:	c7 04 24 f2 01 00 00 	movl   $0x1f2,(%esp)
   18885:	e8 d2 7f ff ff       	call   1085c <Out_Byte>
   1888a:	0f b6 45 d4          	movzbl -0x2c(%ebp),%eax
   1888e:	89 44 24 04          	mov    %eax,0x4(%esp)
   18892:	c7 04 24 f3 01 00 00 	movl   $0x1f3,(%esp)
   18899:	e8 be 7f ff ff       	call   1085c <Out_Byte>
   1889e:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
   188a2:	89 44 24 04          	mov    %eax,0x4(%esp)
   188a6:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
   188ad:	e8 aa 7f ff ff       	call   1085c <Out_Byte>
   188b2:	8b 55 d8             	mov    -0x28(%ebp),%edx
   188b5:	0f b6 c6             	movzbl %dh,%eax
   188b8:	89 44 24 04          	mov    %eax,0x4(%esp)
   188bc:	c7 04 24 f5 01 00 00 	movl   $0x1f5,(%esp)
   188c3:	e8 94 7f ff ff       	call   1085c <Out_Byte>
   188c8:	85 db                	test   %ebx,%ebx
   188ca:	75 1c                	jne    188e8 <IDE_Request_Thread+0x22d>
   188cc:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
   188d0:	83 c8 a0             	or     $0xffffffa0,%eax
   188d3:	0f b6 c0             	movzbl %al,%eax
   188d6:	89 44 24 04          	mov    %eax,0x4(%esp)
   188da:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
   188e1:	e8 76 7f ff ff       	call   1085c <Out_Byte>
   188e6:	eb 1f                	jmp    18907 <IDE_Request_Thread+0x24c>
   188e8:	83 fb 01             	cmp    $0x1,%ebx
   188eb:	75 1a                	jne    18907 <IDE_Request_Thread+0x24c>
   188ed:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
   188f1:	83 c8 b0             	or     $0xffffffb0,%eax
   188f4:	0f b6 c0             	movzbl %al,%eax
   188f7:	89 44 24 04          	mov    %eax,0x4(%esp)
   188fb:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
   18902:	e8 55 7f ff ff       	call   1085c <Out_Byte>
   18907:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   1890e:	00 
   1890f:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18916:	e8 41 7f ff ff       	call   1085c <Out_Byte>
   1891b:	83 3d 74 03 02 00 02 	cmpl   $0x2,0x20374
   18922:	7e 0c                	jle    18930 <IDE_Request_Thread+0x275>
   18924:	c7 04 24 60 e5 01 00 	movl   $0x1e560,(%esp)
   1892b:	e8 8c 86 ff ff       	call   10fbc <Print>
   18930:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18937:	e8 2e 7f ff ff       	call   1086a <In_Byte>
   1893c:	84 c0                	test   %al,%al
   1893e:	78 f0                	js     18930 <IDE_Request_Thread+0x275>
   18940:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18947:	e8 1e 7f ff ff       	call   1086a <In_Byte>
   1894c:	a8 01                	test   $0x1,%al
   1894e:	66 90                	xchg   %ax,%ax
   18950:	74 29                	je     1897b <IDE_Request_Thread+0x2c0>
   18952:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18959:	e8 0c 7f ff ff       	call   1086a <In_Byte>
   1895e:	0f b6 c0             	movzbl %al,%eax
   18961:	89 44 24 04          	mov    %eax,0x4(%esp)
   18965:	c7 04 24 79 e5 01 00 	movl   $0x1e579,(%esp)
   1896c:	e8 4b 86 ff ff       	call   10fbc <Print>
   18971:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
   18976:	e9 8c 03 00 00       	jmp    18d07 <IDE_Request_Thread+0x64c>
   1897b:	83 3d 74 03 02 00 02 	cmpl   $0x2,0x20374
   18982:	7e 0c                	jle    18990 <IDE_Request_Thread+0x2d5>
   18984:	c7 04 24 8d e5 01 00 	movl   $0x1e58d,(%esp)
   1898b:	e8 2c 86 ff ff       	call   10fbc <Print>
   18990:	bb 00 00 00 00       	mov    $0x0,%ebx
   18995:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
   1899c:	e8 e2 7e ff ff       	call   10883 <In_Word>
   189a1:	66 89 04 5e          	mov    %ax,(%esi,%ebx,2)
   189a5:	83 c3 01             	add    $0x1,%ebx
   189a8:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
   189ae:	75 e5                	jne    18995 <IDE_Request_Thread+0x2da>
   189b0:	b8 00 00 00 00       	mov    $0x0,%eax
   189b5:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
   189b9:	0f 84 48 03 00 00    	je     18d07 <IDE_Request_Thread+0x64c>
   189bf:	e8 8d 79 ff ff       	call   10351 <Interrupts_Enabled>
   189c4:	84 c0                	test   %al,%al
   189c6:	74 4a                	je     18a12 <IDE_Request_Thread+0x357>
   189c8:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   189cf:	e8 1f 87 ff ff       	call   110f3 <Set_Current_Attr>
   189d4:	a1 d0 07 02 00       	mov    0x207d0,%eax
   189d9:	89 44 24 18          	mov    %eax,0x18(%esp)
   189dd:	8b 45 04             	mov    0x4(%ebp),%eax
   189e0:	89 44 24 14          	mov    %eax,0x14(%esp)
   189e4:	c7 44 24 10 c1 00 00 	movl   $0xc1,0x10(%esp)
   189eb:	00 
   189ec:	c7 44 24 0c d7 e4 01 	movl   $0x1e4d7,0xc(%esp)
   189f3:	00 
   189f4:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   189fb:	00 
   189fc:	c7 44 24 04 e2 e5 01 	movl   $0x1e5e2,0x4(%esp)
   18a03:	00 
   18a04:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   18a0b:	e8 ac 85 ff ff       	call   10fbc <Print>
   18a10:	eb fe                	jmp    18a10 <IDE_Request_Thread+0x355>
   18a12:	fb                   	sti    
   18a13:	b8 00 00 00 00       	mov    $0x0,%eax
   18a18:	e9 ea 02 00 00       	jmp    18d07 <IDE_Request_Thread+0x64c>
   18a1d:	8b 40 0c             	mov    0xc(%eax),%eax
   18a20:	89 45 d0             	mov    %eax,-0x30(%ebp)
   18a23:	8b 77 08             	mov    0x8(%edi),%esi
   18a26:	8b 07                	mov    (%edi),%eax
   18a28:	8b 58 14             	mov    0x14(%eax),%ebx
   18a2b:	85 db                	test   %ebx,%ebx
   18a2d:	0f 88 c8 02 00 00    	js     18cfb <IDE_Request_Thread+0x640>
   18a33:	a1 78 03 02 00       	mov    0x20378,%eax
   18a38:	83 e8 01             	sub    $0x1,%eax
   18a3b:	39 c3                	cmp    %eax,%ebx
   18a3d:	0f 8f b8 02 00 00    	jg     18cfb <IDE_Request_Thread+0x640>
   18a43:	85 f6                	test   %esi,%esi
   18a45:	0f 88 b7 02 00 00    	js     18d02 <IDE_Request_Thread+0x647>
   18a4b:	89 d8                	mov    %ebx,%eax
   18a4d:	e8 4e f8 ff ff       	call   182a0 <IDE_getNumBlocks>
   18a52:	39 c6                	cmp    %eax,%esi
   18a54:	0f 8d a8 02 00 00    	jge    18d02 <IDE_Request_Thread+0x647>
   18a5a:	e8 f2 78 ff ff       	call   10351 <Interrupts_Enabled>
   18a5f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
   18a66:	84 c0                	test   %al,%al
   18a68:	74 5b                	je     18ac5 <IDE_Request_Thread+0x40a>
   18a6a:	e8 e2 78 ff ff       	call   10351 <Interrupts_Enabled>
   18a6f:	84 c0                	test   %al,%al
   18a71:	75 4a                	jne    18abd <IDE_Request_Thread+0x402>
   18a73:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   18a7a:	e8 74 86 ff ff       	call   110f3 <Set_Current_Attr>
   18a7f:	a1 d0 07 02 00       	mov    0x207d0,%eax
   18a84:	89 44 24 18          	mov    %eax,0x18(%esp)
   18a88:	8b 45 04             	mov    0x4(%ebp),%eax
   18a8b:	89 44 24 14          	mov    %eax,0x14(%esp)
   18a8f:	c7 44 24 10 db 00 00 	movl   $0xdb,0x10(%esp)
   18a96:	00 
   18a97:	c7 44 24 0c d7 e4 01 	movl   $0x1e4d7,0xc(%esp)
   18a9e:	00 
   18a9f:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   18aa6:	00 
   18aa7:	c7 44 24 04 eb e5 01 	movl   $0x1e5eb,0x4(%esp)
   18aae:	00 
   18aaf:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   18ab6:	e8 01 85 ff ff       	call   10fbc <Print>
   18abb:	eb fe                	jmp    18abb <IDE_Request_Thread+0x400>
   18abd:	fa                   	cli    
   18abe:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
   18ac5:	0f bf 0c dd 80 03 02 	movswl 0x20380(,%ebx,8),%ecx
   18acc:	00 
   18acd:	89 f2                	mov    %esi,%edx
   18acf:	89 f0                	mov    %esi,%eax
   18ad1:	c1 fa 1f             	sar    $0x1f,%edx
   18ad4:	f7 f9                	idiv   %ecx
   18ad6:	89 45 e0             	mov    %eax,-0x20(%ebp)
   18ad9:	83 c2 01             	add    $0x1,%edx
   18adc:	89 55 d8             	mov    %edx,-0x28(%ebp)
   18adf:	0f bf 14 dd 7e 03 02 	movswl 0x2037e(,%ebx,8),%edx
   18ae6:	00 
   18ae7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
   18aea:	0f af ca             	imul   %edx,%ecx
   18aed:	89 f2                	mov    %esi,%edx
   18aef:	89 f0                	mov    %esi,%eax
   18af1:	c1 fa 1f             	sar    $0x1f,%edx
   18af4:	f7 f9                	idiv   %ecx
   18af6:	89 45 dc             	mov    %eax,-0x24(%ebp)
   18af9:	8b 55 e0             	mov    -0x20(%ebp),%edx
   18afc:	89 d0                	mov    %edx,%eax
   18afe:	c1 fa 1f             	sar    $0x1f,%edx
   18b01:	f7 7d e4             	idivl  -0x1c(%ebp)
   18b04:	89 55 e0             	mov    %edx,-0x20(%ebp)
   18b07:	83 3d 74 03 02 00 00 	cmpl   $0x0,0x20374
   18b0e:	74 49                	je     18b59 <IDE_Request_Thread+0x49e>
   18b10:	89 74 24 04          	mov    %esi,0x4(%esp)
   18b14:	c7 04 24 9a e5 01 00 	movl   $0x1e59a,(%esp)
   18b1b:	e8 9c 84 ff ff       	call   10fbc <Print>
   18b20:	8b 45 e0             	mov    -0x20(%ebp),%eax
   18b23:	89 44 24 04          	mov    %eax,0x4(%esp)
   18b27:	c7 04 24 33 e5 01 00 	movl   $0x1e533,(%esp)
   18b2e:	e8 89 84 ff ff       	call   10fbc <Print>
   18b33:	8b 55 dc             	mov    -0x24(%ebp),%edx
   18b36:	89 54 24 04          	mov    %edx,0x4(%esp)
   18b3a:	c7 04 24 40 e5 01 00 	movl   $0x1e540,(%esp)
   18b41:	e8 76 84 ff ff       	call   10fbc <Print>
   18b46:	8b 45 d8             	mov    -0x28(%ebp),%eax
   18b49:	89 44 24 04          	mov    %eax,0x4(%esp)
   18b4d:	c7 04 24 51 e5 01 00 	movl   $0x1e551,(%esp)
   18b54:	e8 63 84 ff ff       	call   10fbc <Print>
   18b59:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
   18b60:	00 
   18b61:	c7 04 24 f2 01 00 00 	movl   $0x1f2,(%esp)
   18b68:	e8 ef 7c ff ff       	call   1085c <Out_Byte>
   18b6d:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
   18b71:	89 44 24 04          	mov    %eax,0x4(%esp)
   18b75:	c7 04 24 f3 01 00 00 	movl   $0x1f3,(%esp)
   18b7c:	e8 db 7c ff ff       	call   1085c <Out_Byte>
   18b81:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
   18b85:	89 44 24 04          	mov    %eax,0x4(%esp)
   18b89:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
   18b90:	e8 c7 7c ff ff       	call   1085c <Out_Byte>
   18b95:	8b 55 dc             	mov    -0x24(%ebp),%edx
   18b98:	0f b6 c6             	movzbl %dh,%eax
   18b9b:	89 44 24 04          	mov    %eax,0x4(%esp)
   18b9f:	c7 04 24 f5 01 00 00 	movl   $0x1f5,(%esp)
   18ba6:	e8 b1 7c ff ff       	call   1085c <Out_Byte>
   18bab:	85 db                	test   %ebx,%ebx
   18bad:	75 1c                	jne    18bcb <IDE_Request_Thread+0x510>
   18baf:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
   18bb3:	83 c8 a0             	or     $0xffffffa0,%eax
   18bb6:	0f b6 c0             	movzbl %al,%eax
   18bb9:	89 44 24 04          	mov    %eax,0x4(%esp)
   18bbd:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
   18bc4:	e8 93 7c ff ff       	call   1085c <Out_Byte>
   18bc9:	eb 1f                	jmp    18bea <IDE_Request_Thread+0x52f>
   18bcb:	83 fb 01             	cmp    $0x1,%ebx
   18bce:	75 1a                	jne    18bea <IDE_Request_Thread+0x52f>
   18bd0:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
   18bd4:	83 c8 b0             	or     $0xffffffb0,%eax
   18bd7:	0f b6 c0             	movzbl %al,%eax
   18bda:	89 44 24 04          	mov    %eax,0x4(%esp)
   18bde:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
   18be5:	e8 72 7c ff ff       	call   1085c <Out_Byte>
   18bea:	c7 44 24 04 30 00 00 	movl   $0x30,0x4(%esp)
   18bf1:	00 
   18bf2:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18bf9:	e8 5e 7c ff ff       	call   1085c <Out_Byte>
   18bfe:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18c05:	e8 60 7c ff ff       	call   1086a <In_Byte>
   18c0a:	84 c0                	test   %al,%al
   18c0c:	78 f0                	js     18bfe <IDE_Request_Thread+0x543>
   18c0e:	bb 00 00 00 00       	mov    $0x0,%ebx
   18c13:	8b 55 d0             	mov    -0x30(%ebp),%edx
   18c16:	0f b7 04 5a          	movzwl (%edx,%ebx,2),%eax
   18c1a:	89 44 24 04          	mov    %eax,0x4(%esp)
   18c1e:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
   18c25:	e8 4a 7c ff ff       	call   10874 <Out_Word>
   18c2a:	83 c3 01             	add    $0x1,%ebx
   18c2d:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
   18c33:	75 de                	jne    18c13 <IDE_Request_Thread+0x558>
   18c35:	83 3d 74 03 02 00 00 	cmpl   $0x0,0x20374
   18c3c:	74 0c                	je     18c4a <IDE_Request_Thread+0x58f>
   18c3e:	c7 04 24 b5 e5 01 00 	movl   $0x1e5b5,(%esp)
   18c45:	e8 72 83 ff ff       	call   10fbc <Print>
   18c4a:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18c51:	e8 14 7c ff ff       	call   1086a <In_Byte>
   18c56:	84 c0                	test   %al,%al
   18c58:	78 f0                	js     18c4a <IDE_Request_Thread+0x58f>
   18c5a:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18c61:	e8 04 7c ff ff       	call   1086a <In_Byte>
   18c66:	a8 01                	test   $0x1,%al
   18c68:	74 26                	je     18c90 <IDE_Request_Thread+0x5d5>
   18c6a:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
   18c71:	e8 f4 7b ff ff       	call   1086a <In_Byte>
   18c76:	0f b6 c0             	movzbl %al,%eax
   18c79:	89 44 24 04          	mov    %eax,0x4(%esp)
   18c7d:	c7 04 24 79 e5 01 00 	movl   $0x1e579,(%esp)
   18c84:	e8 33 83 ff ff       	call   10fbc <Print>
   18c89:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
   18c8e:	eb 77                	jmp    18d07 <IDE_Request_Thread+0x64c>
   18c90:	b8 00 00 00 00       	mov    $0x0,%eax
   18c95:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
   18c99:	74 6c                	je     18d07 <IDE_Request_Thread+0x64c>
   18c9b:	90                   	nop
   18c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   18ca0:	e8 ac 76 ff ff       	call   10351 <Interrupts_Enabled>
   18ca5:	84 c0                	test   %al,%al
   18ca7:	74 4a                	je     18cf3 <IDE_Request_Thread+0x638>
   18ca9:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   18cb0:	e8 3e 84 ff ff       	call   110f3 <Set_Current_Attr>
   18cb5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   18cba:	89 44 24 18          	mov    %eax,0x18(%esp)
   18cbe:	8b 45 04             	mov    0x4(%ebp),%eax
   18cc1:	89 44 24 14          	mov    %eax,0x14(%esp)
   18cc5:	c7 44 24 10 0c 01 00 	movl   $0x10c,0x10(%esp)
   18ccc:	00 
   18ccd:	c7 44 24 0c d7 e4 01 	movl   $0x1e4d7,0xc(%esp)
   18cd4:	00 
   18cd5:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   18cdc:	00 
   18cdd:	c7 44 24 04 eb e5 01 	movl   $0x1e5eb,0x4(%esp)
   18ce4:	00 
   18ce5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   18cec:	e8 cb 82 ff ff       	call   10fbc <Print>
   18cf1:	eb fe                	jmp    18cf1 <IDE_Request_Thread+0x636>
   18cf3:	fb                   	sti    
   18cf4:	b8 00 00 00 00       	mov    $0x0,%eax
   18cf9:	eb 0c                	jmp    18d07 <IDE_Request_Thread+0x64c>
   18cfb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   18d00:	eb 05                	jmp    18d07 <IDE_Request_Thread+0x64c>
   18d02:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   18d07:	83 f8 01             	cmp    $0x1,%eax
   18d0a:	19 d2                	sbb    %edx,%edx
   18d0c:	83 c2 02             	add    $0x2,%edx
   18d0f:	89 44 24 08          	mov    %eax,0x8(%esp)
   18d13:	89 54 24 04          	mov    %edx,0x4(%esp)
   18d17:	89 3c 24             	mov    %edi,(%esp)
   18d1a:	e8 15 ed ff ff       	call   17a34 <Notify_Request_Completion>
   18d1f:	e9 a0 f9 ff ff       	jmp    186c4 <IDE_Request_Thread+0x9>
   18d24:	90                   	nop
   18d25:	90                   	nop
   18d26:	90                   	nop
   18d27:	90                   	nop
   18d28:	90                   	nop
   18d29:	90                   	nop
   18d2a:	90                   	nop
   18d2b:	90                   	nop
   18d2c:	90                   	nop
   18d2d:	90                   	nop
   18d2e:	90                   	nop
   18d2f:	90                   	nop

00018d30 <FStat>:
   18d30:	55                   	push   %ebp
   18d31:	89 e5                	mov    %esp,%ebp
   18d33:	83 ec 18             	sub    $0x18,%esp
   18d36:	8b 4d 08             	mov    0x8(%ebp),%ecx
   18d39:	8b 01                	mov    (%ecx),%eax
   18d3b:	8b 10                	mov    (%eax),%edx
   18d3d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
   18d42:	85 d2                	test   %edx,%edx
   18d44:	74 0c                	je     18d52 <FStat+0x22>
   18d46:	8b 45 0c             	mov    0xc(%ebp),%eax
   18d49:	89 44 24 04          	mov    %eax,0x4(%esp)
   18d4d:	89 0c 24             	mov    %ecx,(%esp)
   18d50:	ff d2                	call   *%edx
   18d52:	c9                   	leave  
   18d53:	c3                   	ret    

00018d54 <Read>:
   18d54:	55                   	push   %ebp
   18d55:	89 e5                	mov    %esp,%ebp
   18d57:	83 ec 18             	sub    $0x18,%esp
   18d5a:	8b 4d 08             	mov    0x8(%ebp),%ecx
   18d5d:	8b 01                	mov    (%ecx),%eax
   18d5f:	8b 50 04             	mov    0x4(%eax),%edx
   18d62:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
   18d67:	85 d2                	test   %edx,%edx
   18d69:	74 13                	je     18d7e <Read+0x2a>
   18d6b:	8b 45 10             	mov    0x10(%ebp),%eax
   18d6e:	89 44 24 08          	mov    %eax,0x8(%esp)
   18d72:	8b 45 0c             	mov    0xc(%ebp),%eax
   18d75:	89 44 24 04          	mov    %eax,0x4(%esp)
   18d79:	89 0c 24             	mov    %ecx,(%esp)
   18d7c:	ff d2                	call   *%edx
   18d7e:	c9                   	leave  
   18d7f:	c3                   	ret    

00018d80 <Write>:
   18d80:	55                   	push   %ebp
   18d81:	89 e5                	mov    %esp,%ebp
   18d83:	83 ec 18             	sub    $0x18,%esp
   18d86:	8b 4d 08             	mov    0x8(%ebp),%ecx
   18d89:	8b 01                	mov    (%ecx),%eax
   18d8b:	8b 50 08             	mov    0x8(%eax),%edx
   18d8e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
   18d93:	85 d2                	test   %edx,%edx
   18d95:	74 13                	je     18daa <Write+0x2a>
   18d97:	8b 45 10             	mov    0x10(%ebp),%eax
   18d9a:	89 44 24 08          	mov    %eax,0x8(%esp)
   18d9e:	8b 45 0c             	mov    0xc(%ebp),%eax
   18da1:	89 44 24 04          	mov    %eax,0x4(%esp)
   18da5:	89 0c 24             	mov    %ecx,(%esp)
   18da8:	ff d2                	call   *%edx
   18daa:	c9                   	leave  
   18dab:	c3                   	ret    

00018dac <Seek>:
   18dac:	55                   	push   %ebp
   18dad:	89 e5                	mov    %esp,%ebp
   18daf:	83 ec 18             	sub    $0x18,%esp
   18db2:	8b 4d 08             	mov    0x8(%ebp),%ecx
   18db5:	8b 01                	mov    (%ecx),%eax
   18db7:	8b 50 0c             	mov    0xc(%eax),%edx
   18dba:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
   18dbf:	85 d2                	test   %edx,%edx
   18dc1:	74 0c                	je     18dcf <Seek+0x23>
   18dc3:	8b 45 0c             	mov    0xc(%ebp),%eax
   18dc6:	89 44 24 04          	mov    %eax,0x4(%esp)
   18dca:	89 0c 24             	mov    %ecx,(%esp)
   18dcd:	ff d2                	call   *%edx
   18dcf:	c9                   	leave  
   18dd0:	c3                   	ret    

00018dd1 <Read_Entry>:
   18dd1:	55                   	push   %ebp
   18dd2:	89 e5                	mov    %esp,%ebp
   18dd4:	83 ec 18             	sub    $0x18,%esp
   18dd7:	8b 4d 08             	mov    0x8(%ebp),%ecx
   18dda:	8b 01                	mov    (%ecx),%eax
   18ddc:	8b 50 14             	mov    0x14(%eax),%edx
   18ddf:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
   18de4:	85 d2                	test   %edx,%edx
   18de6:	74 0c                	je     18df4 <Read_Entry+0x23>
   18de8:	8b 45 0c             	mov    0xc(%ebp),%eax
   18deb:	89 44 24 04          	mov    %eax,0x4(%esp)
   18def:	89 0c 24             	mov    %ecx,(%esp)
   18df2:	ff d2                	call   *%edx
   18df4:	c9                   	leave  
   18df5:	c3                   	ret    

00018df6 <Get_Paging_Device>:
   18df6:	55                   	push   %ebp
   18df7:	89 e5                	mov    %esp,%ebp
   18df9:	a1 b0 03 02 00       	mov    0x203b0,%eax
   18dfe:	5d                   	pop    %ebp
   18dff:	c3                   	ret    

00018e00 <Register_Paging_Device>:
   18e00:	55                   	push   %ebp
   18e01:	89 e5                	mov    %esp,%ebp
   18e03:	53                   	push   %ebx
   18e04:	83 ec 24             	sub    $0x24,%esp
   18e07:	8b 5d 08             	mov    0x8(%ebp),%ebx
   18e0a:	83 3d b0 03 02 00 00 	cmpl   $0x0,0x203b0
   18e11:	74 4a                	je     18e5d <Register_Paging_Device+0x5d>
   18e13:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   18e1a:	e8 d4 82 ff ff       	call   110f3 <Set_Current_Attr>
   18e1f:	a1 d0 07 02 00       	mov    0x207d0,%eax
   18e24:	89 44 24 18          	mov    %eax,0x18(%esp)
   18e28:	8b 45 04             	mov    0x4(%ebp),%eax
   18e2b:	89 44 24 14          	mov    %eax,0x14(%esp)
   18e2f:	c7 44 24 10 b8 02 00 	movl   $0x2b8,0x10(%esp)
   18e36:	00 
   18e37:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   18e3e:	00 
   18e3f:	c7 44 24 08 09 e6 01 	movl   $0x1e609,0x8(%esp)
   18e46:	00 
   18e47:	c7 44 24 04 e0 e8 01 	movl   $0x1e8e0,0x4(%esp)
   18e4e:	00 
   18e4f:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   18e56:	e8 61 81 ff ff       	call   10fbc <Print>
   18e5b:	eb fe                	jmp    18e5b <Register_Paging_Device+0x5b>
   18e5d:	85 db                	test   %ebx,%ebx
   18e5f:	75 4a                	jne    18eab <Register_Paging_Device+0xab>
   18e61:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   18e68:	e8 86 82 ff ff       	call   110f3 <Set_Current_Attr>
   18e6d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   18e72:	89 44 24 18          	mov    %eax,0x18(%esp)
   18e76:	8b 45 04             	mov    0x4(%ebp),%eax
   18e79:	89 44 24 14          	mov    %eax,0x14(%esp)
   18e7d:	c7 44 24 10 b9 02 00 	movl   $0x2b9,0x10(%esp)
   18e84:	00 
   18e85:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   18e8c:	00 
   18e8d:	c7 44 24 08 1d e6 01 	movl   $0x1e61d,0x8(%esp)
   18e94:	00 
   18e95:	c7 44 24 04 e0 e8 01 	movl   $0x1e8e0,0x4(%esp)
   18e9c:	00 
   18e9d:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   18ea4:	e8 13 81 ff ff       	call   10fbc <Print>
   18ea9:	eb fe                	jmp    18ea9 <Register_Paging_Device+0xa9>
   18eab:	8b 43 04             	mov    0x4(%ebx),%eax
   18eae:	89 44 24 08          	mov    %eax,0x8(%esp)
   18eb2:	8b 03                	mov    (%ebx),%eax
   18eb4:	89 44 24 04          	mov    %eax,0x4(%esp)
   18eb8:	c7 04 24 24 e7 01 00 	movl   $0x1e724,(%esp)
   18ebf:	e8 f8 80 ff ff       	call   10fbc <Print>
   18ec4:	89 1d b0 03 02 00    	mov    %ebx,0x203b0
   18eca:	83 c4 24             	add    $0x24,%esp
   18ecd:	5b                   	pop    %ebx
   18ece:	5d                   	pop    %ebp
   18ecf:	c3                   	ret    

00018ed0 <Do_Open_Directory>:
   18ed0:	55                   	push   %ebp
   18ed1:	89 e5                	mov    %esp,%ebp
   18ed3:	83 ec 28             	sub    $0x28,%esp
   18ed6:	8b 55 08             	mov    0x8(%ebp),%edx
   18ed9:	8b 02                	mov    (%edx),%eax
   18edb:	8b 40 08             	mov    0x8(%eax),%eax
   18ede:	85 c0                	test   %eax,%eax
   18ee0:	75 4a                	jne    18f2c <Do_Open_Directory+0x5c>
   18ee2:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   18ee9:	e8 05 82 ff ff       	call   110f3 <Set_Current_Attr>
   18eee:	a1 d0 07 02 00       	mov    0x207d0,%eax
   18ef3:	89 44 24 18          	mov    %eax,0x18(%esp)
   18ef7:	8b 45 04             	mov    0x4(%ebp),%eax
   18efa:	89 44 24 14          	mov    %eax,0x14(%esp)
   18efe:	c7 44 24 10 dc 00 00 	movl   $0xdc,0x10(%esp)
   18f05:	00 
   18f06:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   18f0d:	00 
   18f0e:	c7 44 24 08 4c e7 01 	movl   $0x1e74c,0x8(%esp)
   18f15:	00 
   18f16:	c7 44 24 04 03 e9 01 	movl   $0x1e903,0x4(%esp)
   18f1d:	00 
   18f1e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   18f25:	e8 92 80 ff ff       	call   10fbc <Print>
   18f2a:	eb fe                	jmp    18f2a <Do_Open_Directory+0x5a>
   18f2c:	8b 4d 14             	mov    0x14(%ebp),%ecx
   18f2f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
   18f33:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   18f36:	89 4c 24 04          	mov    %ecx,0x4(%esp)
   18f3a:	89 14 24             	mov    %edx,(%esp)
   18f3d:	ff d0                	call   *%eax
   18f3f:	c9                   	leave  
   18f40:	c3                   	ret    

00018f41 <Do_Open_File>:
   18f41:	55                   	push   %ebp
   18f42:	89 e5                	mov    %esp,%ebp
   18f44:	83 ec 28             	sub    $0x28,%esp
   18f47:	8b 55 08             	mov    0x8(%ebp),%edx
   18f4a:	8b 02                	mov    (%edx),%eax
   18f4c:	8b 00                	mov    (%eax),%eax
   18f4e:	85 c0                	test   %eax,%eax
   18f50:	75 4a                	jne    18f9c <Do_Open_File+0x5b>
   18f52:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   18f59:	e8 95 81 ff ff       	call   110f3 <Set_Current_Attr>
   18f5e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   18f63:	89 44 24 18          	mov    %eax,0x18(%esp)
   18f67:	8b 45 04             	mov    0x4(%ebp),%eax
   18f6a:	89 44 24 14          	mov    %eax,0x14(%esp)
   18f6e:	c7 44 24 10 d3 00 00 	movl   $0xd3,0x10(%esp)
   18f75:	00 
   18f76:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   18f7d:	00 
   18f7e:	c7 44 24 08 2f e6 01 	movl   $0x1e62f,0x8(%esp)
   18f85:	00 
   18f86:	c7 44 24 04 20 e9 01 	movl   $0x1e920,0x4(%esp)
   18f8d:	00 
   18f8e:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   18f95:	e8 22 80 ff ff       	call   10fbc <Print>
   18f9a:	eb fe                	jmp    18f9a <Do_Open_File+0x59>
   18f9c:	8b 4d 14             	mov    0x14(%ebp),%ecx
   18f9f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
   18fa3:	8b 4d 10             	mov    0x10(%ebp),%ecx
   18fa6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
   18faa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   18fad:	89 4c 24 04          	mov    %ecx,0x4(%esp)
   18fb1:	89 14 24             	mov    %edx,(%esp)
   18fb4:	ff d0                	call   *%eax
   18fb6:	c9                   	leave  
   18fb7:	c3                   	ret    

00018fb8 <Unpack_Path>:
   18fb8:	55                   	push   %ebp
   18fb9:	89 e5                	mov    %esp,%ebp
   18fbb:	57                   	push   %edi
   18fbc:	56                   	push   %esi
   18fbd:	53                   	push   %ebx
   18fbe:	83 ec 3c             	sub    $0x3c,%esp
   18fc1:	89 c6                	mov    %eax,%esi
   18fc3:	89 55 e4             	mov    %edx,-0x1c(%ebp)
   18fc6:	89 cb                	mov    %ecx,%ebx
   18fc8:	83 3d 8c 03 02 00 00 	cmpl   $0x0,0x2038c
   18fcf:	74 10                	je     18fe1 <Unpack_Path+0x29>
   18fd1:	89 44 24 04          	mov    %eax,0x4(%esp)
   18fd5:	c7 04 24 4a e6 01 00 	movl   $0x1e64a,(%esp)
   18fdc:	e8 db 7f ff ff       	call   10fbc <Print>
   18fe1:	80 3e 2f             	cmpb   $0x2f,(%esi)
   18fe4:	0f 85 f2 00 00 00    	jne    190dc <Unpack_Path+0x124>
   18fea:	83 c6 01             	add    $0x1,%esi
   18fed:	c7 44 24 04 2f 00 00 	movl   $0x2f,0x4(%esp)
   18ff4:	00 
   18ff5:	89 34 24             	mov    %esi,(%esp)
   18ff8:	e8 9a 39 00 00       	call   1c997 <strchr>
   18ffd:	89 45 e0             	mov    %eax,-0x20(%ebp)
   19000:	85 c0                	test   %eax,%eax
   19002:	75 30                	jne    19034 <Unpack_Path+0x7c>
   19004:	89 f7                	mov    %esi,%edi
   19006:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   1900b:	f2 ae                	repnz scas %es:(%edi),%al
   1900d:	89 c8                	mov    %ecx,%eax
   1900f:	f7 d0                	not    %eax
   19011:	83 e8 02             	sub    $0x2,%eax
   19014:	83 f8 0f             	cmp    $0xf,%eax
   19017:	0f 87 bf 00 00 00    	ja     190dc <Unpack_Path+0x124>
   1901d:	89 74 24 04          	mov    %esi,0x4(%esp)
   19021:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   19024:	89 04 24             	mov    %eax,(%esp)
   19027:	e8 d1 38 00 00       	call   1c8fd <strcpy>
   1902c:	c7 03 58 e6 01 00    	movl   $0x1e658,(%ebx)
   19032:	eb 30                	jmp    19064 <Unpack_Path+0xac>
   19034:	8b 7d e0             	mov    -0x20(%ebp),%edi
   19037:	29 f7                	sub    %esi,%edi
   19039:	8d 47 ff             	lea    -0x1(%edi),%eax
   1903c:	83 f8 0f             	cmp    $0xf,%eax
   1903f:	0f 87 97 00 00 00    	ja     190dc <Unpack_Path+0x124>
   19045:	89 7c 24 08          	mov    %edi,0x8(%esp)
   19049:	89 74 24 04          	mov    %esi,0x4(%esp)
   1904d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   19050:	89 04 24             	mov    %eax,(%esp)
   19053:	e8 db 36 00 00       	call   1c733 <memcpy>
   19058:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1905b:	c6 04 38 00          	movb   $0x0,(%eax,%edi,1)
   1905f:	8b 45 e0             	mov    -0x20(%ebp),%eax
   19062:	89 03                	mov    %eax,(%ebx)
   19064:	83 3d 8c 03 02 00 00 	cmpl   $0x0,0x2038c
   1906b:	74 19                	je     19086 <Unpack_Path+0xce>
   1906d:	8b 03                	mov    (%ebx),%eax
   1906f:	89 44 24 08          	mov    %eax,0x8(%esp)
   19073:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   19076:	89 44 24 04          	mov    %eax,0x4(%esp)
   1907a:	c7 04 24 5a e6 01 00 	movl   $0x1e65a,(%esp)
   19081:	e8 36 7f ff ff       	call   10fbc <Print>
   19086:	8b 13                	mov    (%ebx),%edx
   19088:	b8 01 00 00 00       	mov    $0x1,%eax
   1908d:	80 3a 2f             	cmpb   $0x2f,(%edx)
   19090:	74 4f                	je     190e1 <Unpack_Path+0x129>
   19092:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   19099:	e8 55 80 ff ff       	call   110f3 <Set_Current_Attr>
   1909e:	a1 d0 07 02 00       	mov    0x207d0,%eax
   190a3:	89 44 24 18          	mov    %eax,0x18(%esp)
   190a7:	8b 45 04             	mov    0x4(%ebp),%eax
   190aa:	89 44 24 14          	mov    %eax,0x14(%esp)
   190ae:	c7 44 24 10 7a 00 00 	movl   $0x7a,0x10(%esp)
   190b5:	00 
   190b6:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   190bd:	00 
   190be:	c7 44 24 08 75 e6 01 	movl   $0x1e675,0x8(%esp)
   190c5:	00 
   190c6:	c7 44 24 04 f7 e8 01 	movl   $0x1e8f7,0x4(%esp)
   190cd:	00 
   190ce:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   190d5:	e8 e2 7e ff ff       	call   10fbc <Print>
   190da:	eb fe                	jmp    190da <Unpack_Path+0x122>
   190dc:	b8 00 00 00 00       	mov    $0x0,%eax
   190e1:	83 c4 3c             	add    $0x3c,%esp
   190e4:	5b                   	pop    %ebx
   190e5:	5e                   	pop    %esi
   190e6:	5f                   	pop    %edi
   190e7:	5d                   	pop    %ebp
   190e8:	c3                   	ret    

000190e9 <Lookup_Mount_Point>:
   190e9:	55                   	push   %ebp
   190ea:	89 e5                	mov    %esp,%ebp
   190ec:	56                   	push   %esi
   190ed:	53                   	push   %ebx
   190ee:	83 ec 10             	sub    $0x10,%esp
   190f1:	89 c6                	mov    %eax,%esi
   190f3:	c7 04 24 90 03 02 00 	movl   $0x20390,(%esp)
   190fa:	e8 d8 b5 ff ff       	call   146d7 <Mutex_Lock>
   190ff:	8b 1d a0 03 02 00    	mov    0x203a0,%ebx
   19105:	85 db                	test   %ebx,%ebx
   19107:	74 3a                	je     19143 <Lookup_Mount_Point+0x5a>
   19109:	83 3d 8c 03 02 00 00 	cmpl   $0x0,0x2038c
   19110:	74 17                	je     19129 <Lookup_Mount_Point+0x40>
   19112:	8b 43 04             	mov    0x4(%ebx),%eax
   19115:	89 44 24 08          	mov    %eax,0x8(%esp)
   19119:	89 74 24 04          	mov    %esi,0x4(%esp)
   1911d:	c7 04 24 74 e7 01 00 	movl   $0x1e774,(%esp)
   19124:	e8 93 7e ff ff       	call   10fbc <Print>
   19129:	8b 43 04             	mov    0x4(%ebx),%eax
   1912c:	89 44 24 04          	mov    %eax,0x4(%esp)
   19130:	89 34 24             	mov    %esi,(%esp)
   19133:	e8 a9 36 00 00       	call   1c7e1 <strcmp>
   19138:	85 c0                	test   %eax,%eax
   1913a:	74 07                	je     19143 <Lookup_Mount_Point+0x5a>
   1913c:	8b 5b 14             	mov    0x14(%ebx),%ebx
   1913f:	85 db                	test   %ebx,%ebx
   19141:	75 c6                	jne    19109 <Lookup_Mount_Point+0x20>
   19143:	c7 04 24 90 03 02 00 	movl   $0x20390,(%esp)
   1914a:	e8 c7 b6 ff ff       	call   14816 <Mutex_Unlock>
   1914f:	89 d8                	mov    %ebx,%eax
   19151:	83 c4 10             	add    $0x10,%esp
   19154:	5b                   	pop    %ebx
   19155:	5e                   	pop    %esi
   19156:	5d                   	pop    %ebp
   19157:	c3                   	ret    

00019158 <Do_Open>:
   19158:	55                   	push   %ebp
   19159:	89 e5                	mov    %esp,%ebp
   1915b:	83 ec 48             	sub    $0x48,%esp
   1915e:	89 5d f4             	mov    %ebx,-0xc(%ebp)
   19161:	89 75 f8             	mov    %esi,-0x8(%ebp)
   19164:	89 7d fc             	mov    %edi,-0x4(%ebp)
   19167:	89 d6                	mov    %edx,%esi
   19169:	89 cb                	mov    %ecx,%ebx
   1916b:	8d 4d d0             	lea    -0x30(%ebp),%ecx
   1916e:	8d 55 d7             	lea    -0x29(%ebp),%edx
   19171:	e8 42 fe ff ff       	call   18fb8 <Unpack_Path>
   19176:	84 c0                	test   %al,%al
   19178:	74 33                	je     191ad <Do_Open+0x55>
   1917a:	8d 45 d7             	lea    -0x29(%ebp),%eax
   1917d:	e8 67 ff ff ff       	call   190e9 <Lookup_Mount_Point>
   19182:	89 c7                	mov    %eax,%edi
   19184:	85 c0                	test   %eax,%eax
   19186:	74 25                	je     191ad <Do_Open+0x55>
   19188:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
   1918c:	89 74 24 08          	mov    %esi,0x8(%esp)
   19190:	8b 45 d0             	mov    -0x30(%ebp),%eax
   19193:	89 44 24 04          	mov    %eax,0x4(%esp)
   19197:	89 3c 24             	mov    %edi,(%esp)
   1919a:	ff 55 08             	call   *0x8(%ebp)
   1919d:	85 c0                	test   %eax,%eax
   1919f:	75 11                	jne    191b2 <Do_Open+0x5a>
   191a1:	8b 13                	mov    (%ebx),%edx
   191a3:	89 72 10             	mov    %esi,0x10(%edx)
   191a6:	8b 13                	mov    (%ebx),%edx
   191a8:	89 7a 14             	mov    %edi,0x14(%edx)
   191ab:	eb 05                	jmp    191b2 <Do_Open+0x5a>
   191ad:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   191b2:	8b 5d f4             	mov    -0xc(%ebp),%ebx
   191b5:	8b 75 f8             	mov    -0x8(%ebp),%esi
   191b8:	8b 7d fc             	mov    -0x4(%ebp),%edi
   191bb:	89 ec                	mov    %ebp,%esp
   191bd:	5d                   	pop    %ebp
   191be:	c3                   	ret    

000191bf <Open_Directory>:
   191bf:	55                   	push   %ebp
   191c0:	89 e5                	mov    %esp,%ebp
   191c2:	83 ec 18             	sub    $0x18,%esp
   191c5:	c7 04 24 d0 8e 01 00 	movl   $0x18ed0,(%esp)
   191cc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   191cf:	ba 00 00 00 00       	mov    $0x0,%edx
   191d4:	8b 45 08             	mov    0x8(%ebp),%eax
   191d7:	e8 7c ff ff ff       	call   19158 <Do_Open>
   191dc:	c9                   	leave  
   191dd:	c3                   	ret    

000191de <Open>:
   191de:	55                   	push   %ebp
   191df:	89 e5                	mov    %esp,%ebp
   191e1:	83 ec 18             	sub    $0x18,%esp
   191e4:	c7 04 24 41 8f 01 00 	movl   $0x18f41,(%esp)
   191eb:	8b 4d 10             	mov    0x10(%ebp),%ecx
   191ee:	8b 55 0c             	mov    0xc(%ebp),%edx
   191f1:	8b 45 08             	mov    0x8(%ebp),%eax
   191f4:	e8 5f ff ff ff       	call   19158 <Do_Open>
   191f9:	c9                   	leave  
   191fa:	c3                   	ret    

000191fb <Delete>:
   191fb:	55                   	push   %ebp
   191fc:	89 e5                	mov    %esp,%ebp
   191fe:	83 ec 38             	sub    $0x38,%esp
   19201:	8d 4d e0             	lea    -0x20(%ebp),%ecx
   19204:	8d 55 e7             	lea    -0x19(%ebp),%edx
   19207:	8b 45 08             	mov    0x8(%ebp),%eax
   1920a:	e8 a9 fd ff ff       	call   18fb8 <Unpack_Path>
   1920f:	84 c0                	test   %al,%al
   19211:	74 2a                	je     1923d <Delete+0x42>
   19213:	8d 45 e7             	lea    -0x19(%ebp),%eax
   19216:	e8 ce fe ff ff       	call   190e9 <Lookup_Mount_Point>
   1921b:	89 c2                	mov    %eax,%edx
   1921d:	85 c0                	test   %eax,%eax
   1921f:	74 1c                	je     1923d <Delete+0x42>
   19221:	8b 00                	mov    (%eax),%eax
   19223:	8b 48 14             	mov    0x14(%eax),%ecx
   19226:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
   1922b:	85 c9                	test   %ecx,%ecx
   1922d:	74 13                	je     19242 <Delete+0x47>
   1922f:	8b 45 e0             	mov    -0x20(%ebp),%eax
   19232:	89 44 24 04          	mov    %eax,0x4(%esp)
   19236:	89 14 24             	mov    %edx,(%esp)
   19239:	ff d1                	call   *%ecx
   1923b:	eb 05                	jmp    19242 <Delete+0x47>
   1923d:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   19242:	c9                   	leave  
   19243:	c3                   	ret    

00019244 <Create_Directory>:
   19244:	55                   	push   %ebp
   19245:	89 e5                	mov    %esp,%ebp
   19247:	83 ec 38             	sub    $0x38,%esp
   1924a:	8d 4d e0             	lea    -0x20(%ebp),%ecx
   1924d:	8d 55 e7             	lea    -0x19(%ebp),%edx
   19250:	8b 45 08             	mov    0x8(%ebp),%eax
   19253:	e8 60 fd ff ff       	call   18fb8 <Unpack_Path>
   19258:	84 c0                	test   %al,%al
   1925a:	74 2a                	je     19286 <Create_Directory+0x42>
   1925c:	8d 45 e7             	lea    -0x19(%ebp),%eax
   1925f:	e8 85 fe ff ff       	call   190e9 <Lookup_Mount_Point>
   19264:	89 c2                	mov    %eax,%edx
   19266:	85 c0                	test   %eax,%eax
   19268:	74 1c                	je     19286 <Create_Directory+0x42>
   1926a:	8b 00                	mov    (%eax),%eax
   1926c:	8b 48 04             	mov    0x4(%eax),%ecx
   1926f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
   19274:	85 c9                	test   %ecx,%ecx
   19276:	74 13                	je     1928b <Create_Directory+0x47>
   19278:	8b 45 e0             	mov    -0x20(%ebp),%eax
   1927b:	89 44 24 04          	mov    %eax,0x4(%esp)
   1927f:	89 14 24             	mov    %edx,(%esp)
   19282:	ff d1                	call   *%ecx
   19284:	eb 05                	jmp    1928b <Create_Directory+0x47>
   19286:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   1928b:	c9                   	leave  
   1928c:	c3                   	ret    

0001928d <Stat>:
   1928d:	55                   	push   %ebp
   1928e:	89 e5                	mov    %esp,%ebp
   19290:	53                   	push   %ebx
   19291:	83 ec 34             	sub    $0x34,%esp
   19294:	8d 4d e0             	lea    -0x20(%ebp),%ecx
   19297:	8d 55 e7             	lea    -0x19(%ebp),%edx
   1929a:	8b 45 08             	mov    0x8(%ebp),%eax
   1929d:	e8 16 fd ff ff       	call   18fb8 <Unpack_Path>
   192a2:	84 c0                	test   %al,%al
   192a4:	74 62                	je     19308 <Stat+0x7b>
   192a6:	83 3d 8c 03 02 00 00 	cmpl   $0x0,0x2038c
   192ad:	74 13                	je     192c2 <Stat+0x35>
   192af:	8d 45 e7             	lea    -0x19(%ebp),%eax
   192b2:	89 44 24 04          	mov    %eax,0x4(%esp)
   192b6:	c7 04 24 94 e7 01 00 	movl   $0x1e794,(%esp)
   192bd:	e8 fa 7c ff ff       	call   10fbc <Print>
   192c2:	8d 45 e7             	lea    -0x19(%ebp),%eax
   192c5:	e8 1f fe ff ff       	call   190e9 <Lookup_Mount_Point>
   192ca:	89 c3                	mov    %eax,%ebx
   192cc:	85 c0                	test   %eax,%eax
   192ce:	74 38                	je     19308 <Stat+0x7b>
   192d0:	83 3d 8c 03 02 00 00 	cmpl   $0x0,0x2038c
   192d7:	74 0c                	je     192e5 <Stat+0x58>
   192d9:	c7 04 24 bc e7 01 00 	movl   $0x1e7bc,(%esp)
   192e0:	e8 d7 7c ff ff       	call   10fbc <Print>
   192e5:	8b 03                	mov    (%ebx),%eax
   192e7:	8b 50 0c             	mov    0xc(%eax),%edx
   192ea:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
   192ef:	85 d2                	test   %edx,%edx
   192f1:	74 1a                	je     1930d <Stat+0x80>
   192f3:	8b 45 0c             	mov    0xc(%ebp),%eax
   192f6:	89 44 24 08          	mov    %eax,0x8(%esp)
   192fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
   192fd:	89 44 24 04          	mov    %eax,0x4(%esp)
   19301:	89 1c 24             	mov    %ebx,(%esp)
   19304:	ff d2                	call   *%edx
   19306:	eb 05                	jmp    1930d <Stat+0x80>
   19308:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   1930d:	83 c4 34             	add    $0x34,%esp
   19310:	5b                   	pop    %ebx
   19311:	5d                   	pop    %ebp
   19312:	c3                   	ret    

00019313 <Sync>:
   19313:	55                   	push   %ebp
   19314:	89 e5                	mov    %esp,%ebp
   19316:	56                   	push   %esi
   19317:	53                   	push   %ebx
   19318:	83 ec 20             	sub    $0x20,%esp
   1931b:	c7 04 24 90 03 02 00 	movl   $0x20390,(%esp)
   19322:	e8 b0 b3 ff ff       	call   146d7 <Mutex_Lock>
   19327:	8b 1d a0 03 02 00    	mov    0x203a0,%ebx
   1932d:	be 00 00 00 00       	mov    $0x0,%esi
   19332:	85 db                	test   %ebx,%ebx
   19334:	74 73                	je     193a9 <Sync+0x96>
   19336:	8b 03                	mov    (%ebx),%eax
   19338:	8b 40 10             	mov    0x10(%eax),%eax
   1933b:	85 c0                	test   %eax,%eax
   1933d:	75 55                	jne    19394 <Sync+0x81>
   1933f:	eb 09                	jmp    1934a <Sync+0x37>
   19341:	8b 03                	mov    (%ebx),%eax
   19343:	8b 40 10             	mov    0x10(%eax),%eax
   19346:	85 c0                	test   %eax,%eax
   19348:	75 4a                	jne    19394 <Sync+0x81>
   1934a:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   19351:	e8 9d 7d ff ff       	call   110f3 <Set_Current_Attr>
   19356:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1935b:	89 44 24 18          	mov    %eax,0x18(%esp)
   1935f:	8b 45 04             	mov    0x4(%ebp),%eax
   19362:	89 44 24 14          	mov    %eax,0x14(%esp)
   19366:	c7 44 24 10 c5 01 00 	movl   $0x1c5,0x10(%esp)
   1936d:	00 
   1936e:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   19375:	00 
   19376:	c7 44 24 08 86 e6 01 	movl   $0x1e686,0x8(%esp)
   1937d:	00 
   1937e:	c7 44 24 04 15 e9 01 	movl   $0x1e915,0x4(%esp)
   19385:	00 
   19386:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1938d:	e8 2a 7c ff ff       	call   10fbc <Print>
   19392:	eb fe                	jmp    19392 <Sync+0x7f>
   19394:	89 1c 24             	mov    %ebx,(%esp)
   19397:	ff d0                	call   *%eax
   19399:	89 c6                	mov    %eax,%esi
   1939b:	85 c0                	test   %eax,%eax
   1939d:	8d 76 00             	lea    0x0(%esi),%esi
   193a0:	75 07                	jne    193a9 <Sync+0x96>
   193a2:	8b 5b 14             	mov    0x14(%ebx),%ebx
   193a5:	85 db                	test   %ebx,%ebx
   193a7:	75 98                	jne    19341 <Sync+0x2e>
   193a9:	c7 04 24 90 03 02 00 	movl   $0x20390,(%esp)
   193b0:	e8 61 b4 ff ff       	call   14816 <Mutex_Unlock>
   193b5:	89 f0                	mov    %esi,%eax
   193b7:	83 c4 20             	add    $0x20,%esp
   193ba:	5b                   	pop    %ebx
   193bb:	5e                   	pop    %esi
   193bc:	5d                   	pop    %ebp
   193bd:	c3                   	ret    

000193be <Lookup_Filesystem>:
   193be:	55                   	push   %ebp
   193bf:	89 e5                	mov    %esp,%ebp
   193c1:	56                   	push   %esi
   193c2:	53                   	push   %ebx
   193c3:	83 ec 10             	sub    $0x10,%esp
   193c6:	89 c6                	mov    %eax,%esi
   193c8:	c7 04 24 90 03 02 00 	movl   $0x20390,(%esp)
   193cf:	e8 03 b3 ff ff       	call   146d7 <Mutex_Lock>
   193d4:	8b 1d a8 03 02 00    	mov    0x203a8,%ebx
   193da:	85 db                	test   %ebx,%ebx
   193dc:	74 1a                	je     193f8 <Lookup_Filesystem+0x3a>
   193de:	8d 43 04             	lea    0x4(%ebx),%eax
   193e1:	89 74 24 04          	mov    %esi,0x4(%esp)
   193e5:	89 04 24             	mov    %eax,(%esp)
   193e8:	e8 f4 33 00 00       	call   1c7e1 <strcmp>
   193ed:	85 c0                	test   %eax,%eax
   193ef:	74 07                	je     193f8 <Lookup_Filesystem+0x3a>
   193f1:	8b 5b 18             	mov    0x18(%ebx),%ebx
   193f4:	85 db                	test   %ebx,%ebx
   193f6:	75 e6                	jne    193de <Lookup_Filesystem+0x20>
   193f8:	c7 04 24 90 03 02 00 	movl   $0x20390,(%esp)
   193ff:	e8 12 b4 ff ff       	call   14816 <Mutex_Unlock>
   19404:	89 d8                	mov    %ebx,%eax
   19406:	83 c4 10             	add    $0x10,%esp
   19409:	5b                   	pop    %ebx
   1940a:	5e                   	pop    %esi
   1940b:	5d                   	pop    %ebp
   1940c:	c3                   	ret    

0001940d <Allocate_File>:
   1940d:	55                   	push   %ebp
   1940e:	89 e5                	mov    %esp,%ebp
   19410:	83 ec 18             	sub    $0x18,%esp
   19413:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
   1941a:	e8 51 a8 ff ff       	call   13c70 <Malloc>
   1941f:	85 c0                	test   %eax,%eax
   19421:	74 23                	je     19446 <Allocate_File+0x39>
   19423:	8b 55 08             	mov    0x8(%ebp),%edx
   19426:	89 10                	mov    %edx,(%eax)
   19428:	8b 55 0c             	mov    0xc(%ebp),%edx
   1942b:	89 50 04             	mov    %edx,0x4(%eax)
   1942e:	8b 55 10             	mov    0x10(%ebp),%edx
   19431:	89 50 08             	mov    %edx,0x8(%eax)
   19434:	8b 55 14             	mov    0x14(%ebp),%edx
   19437:	89 50 0c             	mov    %edx,0xc(%eax)
   1943a:	8b 55 18             	mov    0x18(%ebp),%edx
   1943d:	89 50 10             	mov    %edx,0x10(%eax)
   19440:	8b 55 1c             	mov    0x1c(%ebp),%edx
   19443:	89 50 14             	mov    %edx,0x14(%eax)
   19446:	c9                   	leave  
   19447:	c3                   	ret    

00019448 <Close>:
   19448:	55                   	push   %ebp
   19449:	89 e5                	mov    %esp,%ebp
   1944b:	56                   	push   %esi
   1944c:	53                   	push   %ebx
   1944d:	83 ec 20             	sub    $0x20,%esp
   19450:	8b 5d 08             	mov    0x8(%ebp),%ebx
   19453:	8b 03                	mov    (%ebx),%eax
   19455:	8b 40 10             	mov    0x10(%eax),%eax
   19458:	85 c0                	test   %eax,%eax
   1945a:	75 4a                	jne    194a6 <Close+0x5e>
   1945c:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   19463:	e8 8b 7c ff ff       	call   110f3 <Set_Current_Attr>
   19468:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1946d:	89 44 24 18          	mov    %eax,0x18(%esp)
   19471:	8b 45 04             	mov    0x4(%ebp),%eax
   19474:	89 44 24 14          	mov    %eax,0x14(%esp)
   19478:	c7 44 24 10 93 01 00 	movl   $0x193,0x10(%esp)
   1947f:	00 
   19480:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   19487:	00 
   19488:	c7 44 24 08 a1 e6 01 	movl   $0x1e6a1,0x8(%esp)
   1948f:	00 
   19490:	c7 44 24 04 1a e9 01 	movl   $0x1e91a,0x4(%esp)
   19497:	00 
   19498:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1949f:	e8 18 7b ff ff       	call   10fbc <Print>
   194a4:	eb fe                	jmp    194a4 <Close+0x5c>
   194a6:	89 1c 24             	mov    %ebx,(%esp)
   194a9:	ff d0                	call   *%eax
   194ab:	89 c6                	mov    %eax,%esi
   194ad:	85 c0                	test   %eax,%eax
   194af:	90                   	nop
   194b0:	75 08                	jne    194ba <Close+0x72>
   194b2:	89 1c 24             	mov    %ebx,(%esp)
   194b5:	e8 4d a9 ff ff       	call   13e07 <Free>
   194ba:	89 f0                	mov    %esi,%eax
   194bc:	83 c4 20             	add    $0x20,%esp
   194bf:	5b                   	pop    %ebx
   194c0:	5e                   	pop    %esi
   194c1:	5d                   	pop    %ebp
   194c2:	c3                   	ret    

000194c3 <Read_Fully>:
   194c3:	55                   	push   %ebp
   194c4:	89 e5                	mov    %esp,%ebp
   194c6:	57                   	push   %edi
   194c7:	56                   	push   %esi
   194c8:	53                   	push   %ebx
   194c9:	83 ec 5c             	sub    $0x5c,%esp
   194cc:	8b 75 08             	mov    0x8(%ebp),%esi
   194cf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   194d6:	8d 45 b4             	lea    -0x4c(%ebp),%eax
   194d9:	89 44 24 04          	mov    %eax,0x4(%esp)
   194dd:	89 34 24             	mov    %esi,(%esp)
   194e0:	e8 a8 fd ff ff       	call   1928d <Stat>
   194e5:	89 c3                	mov    %eax,%ebx
   194e7:	85 c0                	test   %eax,%eax
   194e9:	0f 88 90 00 00 00    	js     1957f <Read_Fully+0xbc>
   194ef:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   194f2:	89 44 24 08          	mov    %eax,0x8(%esp)
   194f6:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
   194fd:	00 
   194fe:	89 34 24             	mov    %esi,(%esp)
   19501:	e8 d8 fc ff ff       	call   191de <Open>
   19506:	89 c3                	mov    %eax,%ebx
   19508:	85 c0                	test   %eax,%eax
   1950a:	78 73                	js     1957f <Read_Fully+0xbc>
   1950c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
   1950f:	bf 00 00 00 00       	mov    $0x0,%edi
   19514:	bb fe ff ff ff       	mov    $0xfffffffe,%ebx
   19519:	85 c0                	test   %eax,%eax
   1951b:	78 67                	js     19584 <Read_Fully+0xc1>
   1951d:	89 04 24             	mov    %eax,(%esp)
   19520:	e8 4b a7 ff ff       	call   13c70 <Malloc>
   19525:	89 c7                	mov    %eax,%edi
   19527:	b3 f9                	mov    $0xf9,%bl
   19529:	85 c0                	test   %eax,%eax
   1952b:	74 57                	je     19584 <Read_Fully+0xc1>
   1952d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
   19530:	85 c0                	test   %eax,%eax
   19532:	7e 2c                	jle    19560 <Read_Fully+0x9d>
   19534:	be 00 00 00 00       	mov    $0x0,%esi
   19539:	29 f0                	sub    %esi,%eax
   1953b:	89 44 24 08          	mov    %eax,0x8(%esp)
   1953f:	8d 04 37             	lea    (%edi,%esi,1),%eax
   19542:	89 44 24 04          	mov    %eax,0x4(%esp)
   19546:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   19549:	89 04 24             	mov    %eax,(%esp)
   1954c:	e8 03 f8 ff ff       	call   18d54 <Read>
   19551:	89 c3                	mov    %eax,%ebx
   19553:	85 c0                	test   %eax,%eax
   19555:	78 2d                	js     19584 <Read_Fully+0xc1>
   19557:	01 c6                	add    %eax,%esi
   19559:	8b 45 b4             	mov    -0x4c(%ebp),%eax
   1955c:	39 f0                	cmp    %esi,%eax
   1955e:	7f d9                	jg     19539 <Read_Fully+0x76>
   19560:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   19563:	89 04 24             	mov    %eax,(%esp)
   19566:	e8 dd fe ff ff       	call   19448 <Close>
   1956b:	8b 45 0c             	mov    0xc(%ebp),%eax
   1956e:	89 38                	mov    %edi,(%eax)
   19570:	8b 55 b4             	mov    -0x4c(%ebp),%edx
   19573:	8b 45 10             	mov    0x10(%ebp),%eax
   19576:	89 10                	mov    %edx,(%eax)
   19578:	bb 00 00 00 00       	mov    $0x0,%ebx
   1957d:	eb 20                	jmp    1959f <Read_Fully+0xdc>
   1957f:	bf 00 00 00 00       	mov    $0x0,%edi
   19584:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   19587:	85 c0                	test   %eax,%eax
   19589:	74 08                	je     19593 <Read_Fully+0xd0>
   1958b:	89 04 24             	mov    %eax,(%esp)
   1958e:	e8 b5 fe ff ff       	call   19448 <Close>
   19593:	85 ff                	test   %edi,%edi
   19595:	74 08                	je     1959f <Read_Fully+0xdc>
   19597:	89 3c 24             	mov    %edi,(%esp)
   1959a:	e8 68 a8 ff ff       	call   13e07 <Free>
   1959f:	89 d8                	mov    %ebx,%eax
   195a1:	83 c4 5c             	add    $0x5c,%esp
   195a4:	5b                   	pop    %ebx
   195a5:	5e                   	pop    %esi
   195a6:	5f                   	pop    %edi
   195a7:	5d                   	pop    %ebp
   195a8:	c3                   	ret    

000195a9 <Mount>:
   195a9:	55                   	push   %ebp
   195aa:	89 e5                	mov    %esp,%ebp
   195ac:	57                   	push   %edi
   195ad:	56                   	push   %esi
   195ae:	53                   	push   %ebx
   195af:	83 ec 4c             	sub    $0x4c,%esp
   195b2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   195b5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   195bc:	80 3b 2f             	cmpb   $0x2f,(%ebx)
   195bf:	75 08                	jne    195c9 <Mount+0x20>
   195c1:	83 c3 01             	add    $0x1,%ebx
   195c4:	80 3b 2f             	cmpb   $0x2f,(%ebx)
   195c7:	74 f8                	je     195c1 <Mount+0x18>
   195c9:	89 df                	mov    %ebx,%edi
   195cb:	b8 00 00 00 00       	mov    $0x0,%eax
   195d0:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   195d5:	f2 ae                	repnz scas %es:(%edi),%al
   195d7:	f7 d1                	not    %ecx
   195d9:	83 e9 01             	sub    $0x1,%ecx
   195dc:	83 f9 10             	cmp    $0x10,%ecx
   195df:	76 0a                	jbe    195eb <Mount+0x42>
   195e1:	bf f7 ff ff ff       	mov    $0xfffffff7,%edi
   195e6:	e9 fa 01 00 00       	jmp    197e5 <Mount+0x23c>
   195eb:	8b 45 10             	mov    0x10(%ebp),%eax
   195ee:	e8 cb fd ff ff       	call   193be <Lookup_Filesystem>
   195f3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   195f6:	bf f8 ff ff ff       	mov    $0xfffffff8,%edi
   195fb:	85 c0                	test   %eax,%eax
   195fd:	0f 84 e2 01 00 00    	je     197e5 <Mount+0x23c>
   19603:	8b 00                	mov    (%eax),%eax
   19605:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
   19609:	75 4a                	jne    19655 <Mount+0xac>
   1960b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   19612:	e8 dc 7a ff ff       	call   110f3 <Set_Current_Attr>
   19617:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1961c:	89 44 24 18          	mov    %eax,0x18(%esp)
   19620:	8b 45 04             	mov    0x4(%ebp),%eax
   19623:	89 44 24 14          	mov    %eax,0x14(%esp)
   19627:	c7 44 24 10 47 01 00 	movl   $0x147,0x10(%esp)
   1962e:	00 
   1962f:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   19636:	00 
   19637:	c7 44 24 08 b7 e6 01 	movl   $0x1e6b7,0x8(%esp)
   1963e:	00 
   1963f:	c7 44 24 04 2d e9 01 	movl   $0x1e92d,0x4(%esp)
   19646:	00 
   19647:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1964e:	e8 69 79 ff ff       	call   10fbc <Print>
   19653:	eb fe                	jmp    19653 <Mount+0xaa>
   19655:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   19658:	89 44 24 04          	mov    %eax,0x4(%esp)
   1965c:	8b 7d 08             	mov    0x8(%ebp),%edi
   1965f:	89 3c 24             	mov    %edi,(%esp)
   19662:	e8 ab e9 ff ff       	call   18012 <Open_Block_Device>
   19667:	89 c7                	mov    %eax,%edi
   19669:	85 c0                	test   %eax,%eax
   1966b:	0f 88 74 01 00 00    	js     197e5 <Mount+0x23c>
   19671:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
   19678:	e8 f3 a5 ff ff       	call   13c70 <Malloc>
   1967d:	89 c6                	mov    %eax,%esi
   1967f:	bf f9 ff ff ff       	mov    $0xfffffff9,%edi
   19684:	85 c0                	test   %eax,%eax
   19686:	0f 84 4a 01 00 00    	je     197d6 <Mount+0x22d>
   1968c:	b9 06 00 00 00       	mov    $0x6,%ecx
   19691:	b8 00 00 00 00       	mov    $0x0,%eax
   19696:	89 f7                	mov    %esi,%edi
   19698:	f3 ab                	rep stos %eax,%es:(%edi)
   1969a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1969d:	89 46 08             	mov    %eax,0x8(%esi)
   196a0:	89 1c 24             	mov    %ebx,(%esp)
   196a3:	e8 49 34 00 00       	call   1caf1 <strdup>
   196a8:	89 46 04             	mov    %eax,0x4(%esi)
   196ab:	bf f9 ff ff ff       	mov    $0xfffffff9,%edi
   196b0:	85 c0                	test   %eax,%eax
   196b2:	0f 84 16 01 00 00    	je     197ce <Mount+0x225>
   196b8:	83 3d 8c 03 02 00 00 	cmpl   $0x0,0x2038c
   196bf:	74 1e                	je     196df <Mount+0x136>
   196c1:	8b 45 10             	mov    0x10(%ebp),%eax
   196c4:	89 44 24 0c          	mov    %eax,0xc(%esp)
   196c8:	89 5c 24 08          	mov    %ebx,0x8(%esp)
   196cc:	8b 55 08             	mov    0x8(%ebp),%edx
   196cf:	89 54 24 04          	mov    %edx,0x4(%esp)
   196d3:	c7 04 24 f8 e7 01 00 	movl   $0x1e7f8,(%esp)
   196da:	e8 dd 78 ff ff       	call   10fbc <Print>
   196df:	8b 7d d4             	mov    -0x2c(%ebp),%edi
   196e2:	8b 07                	mov    (%edi),%eax
   196e4:	89 34 24             	mov    %esi,(%esp)
   196e7:	ff 50 04             	call   *0x4(%eax)
   196ea:	89 c7                	mov    %eax,%edi
   196ec:	85 c0                	test   %eax,%eax
   196ee:	0f 88 cb 00 00 00    	js     197bf <Mount+0x216>
   196f4:	83 3d 8c 03 02 00 00 	cmpl   $0x0,0x2038c
   196fb:	74 0c                	je     19709 <Mount+0x160>
   196fd:	c7 04 24 cb e6 01 00 	movl   $0x1e6cb,(%esp)
   19704:	e8 b3 78 ff ff       	call   10fbc <Print>
   19709:	c7 04 24 90 03 02 00 	movl   $0x20390,(%esp)
   19710:	e8 c2 af ff ff       	call   146d7 <Mutex_Lock>
   19715:	a1 a0 03 02 00       	mov    0x203a0,%eax
   1971a:	85 c0                	test   %eax,%eax
   1971c:	0f 84 cd 00 00 00    	je     197ef <Mount+0x246>
   19722:	39 c6                	cmp    %eax,%esi
   19724:	75 0c                	jne    19732 <Mount+0x189>
   19726:	eb 16                	jmp    1973e <Mount+0x195>
   19728:	39 c6                	cmp    %eax,%esi
   1972a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   19730:	74 0c                	je     1973e <Mount+0x195>
   19732:	8b 40 14             	mov    0x14(%eax),%eax
   19735:	85 c0                	test   %eax,%eax
   19737:	75 ef                	jne    19728 <Mount+0x17f>
   19739:	e9 b1 00 00 00       	jmp    197ef <Mount+0x246>
   1973e:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   19745:	e8 a9 79 ff ff       	call   110f3 <Set_Current_Attr>
   1974a:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1974f:	89 44 24 18          	mov    %eax,0x18(%esp)
   19753:	8b 45 04             	mov    0x4(%ebp),%eax
   19756:	89 44 24 14          	mov    %eax,0x14(%esp)
   1975a:	c7 44 24 10 2a 00 00 	movl   $0x2a,0x10(%esp)
   19761:	00 
   19762:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   19769:	00 
   1976a:	c7 44 24 08 1c e8 01 	movl   $0x1e81c,0x8(%esp)
   19771:	00 
   19772:	c7 44 24 04 40 e9 01 	movl   $0x1e940,0x4(%esp)
   19779:	00 
   1977a:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   19781:	e8 36 78 ff ff       	call   10fbc <Print>
   19786:	eb fe                	jmp    19786 <Mount+0x1dd>
   19788:	89 35 a4 03 02 00    	mov    %esi,0x203a4
   1978e:	89 35 a0 03 02 00    	mov    %esi,0x203a0
   19794:	c7 46 10 00 00 00 00 	movl   $0x0,0x10(%esi)
   1979b:	eb 0f                	jmp    197ac <Mount+0x203>
   1979d:	89 70 14             	mov    %esi,0x14(%eax)
   197a0:	b8 a4 03 02 00       	mov    $0x203a4,%eax
   197a5:	8b 10                	mov    (%eax),%edx
   197a7:	89 56 10             	mov    %edx,0x10(%esi)
   197aa:	89 30                	mov    %esi,(%eax)
   197ac:	c7 04 24 90 03 02 00 	movl   $0x20390,(%esp)
   197b3:	e8 5e b0 ff ff       	call   14816 <Mutex_Unlock>
   197b8:	bf 00 00 00 00       	mov    $0x0,%edi
   197bd:	eb 26                	jmp    197e5 <Mount+0x23c>
   197bf:	8b 46 04             	mov    0x4(%esi),%eax
   197c2:	85 c0                	test   %eax,%eax
   197c4:	74 08                	je     197ce <Mount+0x225>
   197c6:	89 04 24             	mov    %eax,(%esp)
   197c9:	e8 39 a6 ff ff       	call   13e07 <Free>
   197ce:	89 34 24             	mov    %esi,(%esp)
   197d1:	e8 31 a6 ff ff       	call   13e07 <Free>
   197d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   197d9:	85 c0                	test   %eax,%eax
   197db:	74 08                	je     197e5 <Mount+0x23c>
   197dd:	89 04 24             	mov    %eax,(%esp)
   197e0:	e8 9e e7 ff ff       	call   17f83 <Close_Block_Device>
   197e5:	89 f8                	mov    %edi,%eax
   197e7:	83 c4 4c             	add    $0x4c,%esp
   197ea:	5b                   	pop    %ebx
   197eb:	5e                   	pop    %esi
   197ec:	5f                   	pop    %edi
   197ed:	5d                   	pop    %ebp
   197ee:	c3                   	ret    
   197ef:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
   197f6:	a1 a4 03 02 00       	mov    0x203a4,%eax
   197fb:	85 c0                	test   %eax,%eax
   197fd:	75 9e                	jne    1979d <Mount+0x1f4>
   197ff:	eb 87                	jmp    19788 <Mount+0x1df>

00019801 <Format>:
   19801:	55                   	push   %ebp
   19802:	89 e5                	mov    %esp,%ebp
   19804:	83 ec 38             	sub    $0x38,%esp
   19807:	89 5d f4             	mov    %ebx,-0xc(%ebp)
   1980a:	89 75 f8             	mov    %esi,-0x8(%ebp)
   1980d:	89 7d fc             	mov    %edi,-0x4(%ebp)
   19810:	8b 7d 0c             	mov    0xc(%ebp),%edi
   19813:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   1981a:	89 f8                	mov    %edi,%eax
   1981c:	e8 9d fb ff ff       	call   193be <Lookup_Filesystem>
   19821:	89 c6                	mov    %eax,%esi
   19823:	bb f8 ff ff ff       	mov    $0xfffffff8,%ebx
   19828:	85 c0                	test   %eax,%eax
   1982a:	74 70                	je     1989c <Format+0x9b>
   1982c:	83 3d 8c 03 02 00 00 	cmpl   $0x0,0x2038c
   19833:	74 10                	je     19845 <Format+0x44>
   19835:	89 7c 24 04          	mov    %edi,0x4(%esp)
   19839:	c7 04 24 50 e8 01 00 	movl   $0x1e850,(%esp)
   19840:	e8 77 77 ff ff       	call   10fbc <Print>
   19845:	8b 06                	mov    (%esi),%eax
   19847:	bb fd ff ff ff       	mov    $0xfffffffd,%ebx
   1984c:	83 38 00             	cmpl   $0x0,(%eax)
   1984f:	74 4b                	je     1989c <Format+0x9b>
   19851:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   19854:	89 44 24 04          	mov    %eax,0x4(%esp)
   19858:	8b 45 08             	mov    0x8(%ebp),%eax
   1985b:	89 04 24             	mov    %eax,(%esp)
   1985e:	e8 af e7 ff ff       	call   18012 <Open_Block_Device>
   19863:	89 c3                	mov    %eax,%ebx
   19865:	85 c0                	test   %eax,%eax
   19867:	78 33                	js     1989c <Format+0x9b>
   19869:	83 3d 8c 03 02 00 00 	cmpl   $0x0,0x2038c
   19870:	74 13                	je     19885 <Format+0x84>
   19872:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   19875:	89 44 24 04          	mov    %eax,0x4(%esp)
   19879:	c7 04 24 e2 e6 01 00 	movl   $0x1e6e2,(%esp)
   19880:	e8 37 77 ff ff       	call   10fbc <Print>
   19885:	8b 06                	mov    (%esi),%eax
   19887:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   1988a:	89 14 24             	mov    %edx,(%esp)
   1988d:	ff 10                	call   *(%eax)
   1988f:	89 c3                	mov    %eax,%ebx
   19891:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   19894:	89 04 24             	mov    %eax,(%esp)
   19897:	e8 e7 e6 ff ff       	call   17f83 <Close_Block_Device>
   1989c:	89 d8                	mov    %ebx,%eax
   1989e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
   198a1:	8b 75 f8             	mov    -0x8(%ebp),%esi
   198a4:	8b 7d fc             	mov    -0x4(%ebp),%edi
   198a7:	89 ec                	mov    %ebp,%esp
   198a9:	5d                   	pop    %ebp
   198aa:	c3                   	ret    

000198ab <Register_Filesystem>:
   198ab:	55                   	push   %ebp
   198ac:	89 e5                	mov    %esp,%ebp
   198ae:	57                   	push   %edi
   198af:	56                   	push   %esi
   198b0:	53                   	push   %ebx
   198b1:	83 ec 2c             	sub    $0x2c,%esp
   198b4:	8b 7d 08             	mov    0x8(%ebp),%edi
   198b7:	8b 75 0c             	mov    0xc(%ebp),%esi
   198ba:	85 ff                	test   %edi,%edi
   198bc:	75 4a                	jne    19908 <Register_Filesystem+0x5d>
   198be:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   198c5:	e8 29 78 ff ff       	call   110f3 <Set_Current_Attr>
   198ca:	a1 d0 07 02 00       	mov    0x207d0,%eax
   198cf:	89 44 24 18          	mov    %eax,0x18(%esp)
   198d3:	8b 45 04             	mov    0x4(%ebp),%eax
   198d6:	89 44 24 14          	mov    %eax,0x14(%esp)
   198da:	c7 44 24 10 f1 00 00 	movl   $0xf1,0x10(%esp)
   198e1:	00 
   198e2:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   198e9:	00 
   198ea:	c7 44 24 08 f9 e6 01 	movl   $0x1e6f9,0x8(%esp)
   198f1:	00 
   198f2:	c7 44 24 04 60 e9 01 	movl   $0x1e960,0x4(%esp)
   198f9:	00 
   198fa:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   19901:	e8 b6 76 ff ff       	call   10fbc <Print>
   19906:	eb fe                	jmp    19906 <Register_Filesystem+0x5b>
   19908:	85 f6                	test   %esi,%esi
   1990a:	75 4f                	jne    1995b <Register_Filesystem+0xb0>
   1990c:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   19913:	90                   	nop
   19914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   19918:	e8 d6 77 ff ff       	call   110f3 <Set_Current_Attr>
   1991d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   19922:	89 44 24 18          	mov    %eax,0x18(%esp)
   19926:	8b 45 04             	mov    0x4(%ebp),%eax
   19929:	89 44 24 14          	mov    %eax,0x14(%esp)
   1992d:	c7 44 24 10 f2 00 00 	movl   $0xf2,0x10(%esp)
   19934:	00 
   19935:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   1993c:	00 
   1993d:	c7 44 24 08 05 e7 01 	movl   $0x1e705,0x8(%esp)
   19944:	00 
   19945:	c7 44 24 04 60 e9 01 	movl   $0x1e960,0x4(%esp)
   1994c:	00 
   1994d:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   19954:	e8 63 76 ff ff       	call   10fbc <Print>
   19959:	eb fe                	jmp    19959 <Register_Filesystem+0xae>
   1995b:	83 7e 04 00          	cmpl   $0x0,0x4(%esi)
   1995f:	75 4a                	jne    199ab <Register_Filesystem+0x100>
   19961:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   19968:	e8 86 77 ff ff       	call   110f3 <Set_Current_Attr>
   1996d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   19972:	89 44 24 18          	mov    %eax,0x18(%esp)
   19976:	8b 45 04             	mov    0x4(%ebp),%eax
   19979:	89 44 24 14          	mov    %eax,0x14(%esp)
   1997d:	c7 44 24 10 f3 00 00 	movl   $0xf3,0x10(%esp)
   19984:	00 
   19985:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   1998c:	00 
   1998d:	c7 44 24 08 10 e7 01 	movl   $0x1e710,0x8(%esp)
   19994:	00 
   19995:	c7 44 24 04 60 e9 01 	movl   $0x1e960,0x4(%esp)
   1999c:	00 
   1999d:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   199a4:	e8 13 76 ff ff       	call   10fbc <Print>
   199a9:	eb fe                	jmp    199a9 <Register_Filesystem+0xfe>
   199ab:	83 3d 8c 03 02 00 00 	cmpl   $0x0,0x2038c
   199b2:	74 10                	je     199c4 <Register_Filesystem+0x119>
   199b4:	89 7c 24 04          	mov    %edi,0x4(%esp)
   199b8:	c7 04 24 70 e8 01 00 	movl   $0x1e870,(%esp)
   199bf:	e8 f8 75 ff ff       	call   10fbc <Print>
   199c4:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
   199cb:	e8 a0 a2 ff ff       	call   13c70 <Malloc>
   199d0:	89 c3                	mov    %eax,%ebx
   199d2:	b8 00 00 00 00       	mov    $0x0,%eax
   199d7:	85 db                	test   %ebx,%ebx
   199d9:	0f 84 ce 00 00 00    	je     19aad <Register_Filesystem+0x202>
   199df:	89 33                	mov    %esi,(%ebx)
   199e1:	c7 44 24 08 0f 00 00 	movl   $0xf,0x8(%esp)
   199e8:	00 
   199e9:	89 7c 24 04          	mov    %edi,0x4(%esp)
   199ed:	8d 43 04             	lea    0x4(%ebx),%eax
   199f0:	89 04 24             	mov    %eax,(%esp)
   199f3:	e8 2d 2f 00 00       	call   1c925 <strncpy>
   199f8:	c6 43 13 00          	movb   $0x0,0x13(%ebx)
   199fc:	c7 04 24 90 03 02 00 	movl   $0x20390,(%esp)
   19a03:	e8 cf ac ff ff       	call   146d7 <Mutex_Lock>
   19a08:	a1 a8 03 02 00       	mov    0x203a8,%eax
   19a0d:	85 c0                	test   %eax,%eax
   19a0f:	0f 84 a0 00 00 00    	je     19ab5 <Register_Filesystem+0x20a>
   19a15:	39 c3                	cmp    %eax,%ebx
   19a17:	75 09                	jne    19a22 <Register_Filesystem+0x177>
   19a19:	eb 13                	jmp    19a2e <Register_Filesystem+0x183>
   19a1b:	39 c3                	cmp    %eax,%ebx
   19a1d:	8d 76 00             	lea    0x0(%esi),%esi
   19a20:	74 0c                	je     19a2e <Register_Filesystem+0x183>
   19a22:	8b 40 18             	mov    0x18(%eax),%eax
   19a25:	85 c0                	test   %eax,%eax
   19a27:	75 f2                	jne    19a1b <Register_Filesystem+0x170>
   19a29:	e9 87 00 00 00       	jmp    19ab5 <Register_Filesystem+0x20a>
   19a2e:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   19a35:	e8 b9 76 ff ff       	call   110f3 <Set_Current_Attr>
   19a3a:	a1 d0 07 02 00       	mov    0x207d0,%eax
   19a3f:	89 44 24 18          	mov    %eax,0x18(%esp)
   19a43:	8b 45 04             	mov    0x4(%ebp),%eax
   19a46:	89 44 24 14          	mov    %eax,0x14(%esp)
   19a4a:	c7 44 24 10 37 00 00 	movl   $0x37,0x10(%esp)
   19a51:	00 
   19a52:	c7 44 24 0c f5 e5 01 	movl   $0x1e5f5,0xc(%esp)
   19a59:	00 
   19a5a:	c7 44 24 08 98 e8 01 	movl   $0x1e898,0x8(%esp)
   19a61:	00 
   19a62:	c7 44 24 04 74 e9 01 	movl   $0x1e974,0x4(%esp)
   19a69:	00 
   19a6a:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   19a71:	e8 46 75 ff ff       	call   10fbc <Print>
   19a76:	eb fe                	jmp    19a76 <Register_Filesystem+0x1cb>
   19a78:	89 1d ac 03 02 00    	mov    %ebx,0x203ac
   19a7e:	89 1d a8 03 02 00    	mov    %ebx,0x203a8
   19a84:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
   19a8b:	eb 0f                	jmp    19a9c <Register_Filesystem+0x1f1>
   19a8d:	89 58 18             	mov    %ebx,0x18(%eax)
   19a90:	b8 ac 03 02 00       	mov    $0x203ac,%eax
   19a95:	8b 10                	mov    (%eax),%edx
   19a97:	89 53 14             	mov    %edx,0x14(%ebx)
   19a9a:	89 18                	mov    %ebx,(%eax)
   19a9c:	c7 04 24 90 03 02 00 	movl   $0x20390,(%esp)
   19aa3:	e8 6e ad ff ff       	call   14816 <Mutex_Unlock>
   19aa8:	b8 01 00 00 00       	mov    $0x1,%eax
   19aad:	83 c4 2c             	add    $0x2c,%esp
   19ab0:	5b                   	pop    %ebx
   19ab1:	5e                   	pop    %esi
   19ab2:	5f                   	pop    %edi
   19ab3:	5d                   	pop    %ebp
   19ab4:	c3                   	ret    
   19ab5:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
   19abc:	a1 ac 03 02 00       	mov    0x203ac,%eax
   19ac1:	85 c0                	test   %eax,%eax
   19ac3:	75 c8                	jne    19a8d <Register_Filesystem+0x1e2>
   19ac5:	eb b1                	jmp    19a78 <Register_Filesystem+0x1cd>
   19ac7:	90                   	nop
   19ac8:	90                   	nop
   19ac9:	90                   	nop
   19aca:	90                   	nop
   19acb:	90                   	nop
   19acc:	90                   	nop
   19acd:	90                   	nop
   19ace:	90                   	nop
   19acf:	90                   	nop

00019ad0 <PFAT_Write>:
   19ad0:	55                   	push   %ebp
   19ad1:	89 e5                	mov    %esp,%ebp
   19ad3:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
   19ad8:	5d                   	pop    %ebp
   19ad9:	c3                   	ret    

00019ada <PFAT_Seek>:
   19ada:	55                   	push   %ebp
   19adb:	89 e5                	mov    %esp,%ebp
   19add:	8b 55 08             	mov    0x8(%ebp),%edx
   19ae0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   19ae3:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
   19ae8:	39 4a 08             	cmp    %ecx,0x8(%edx)
   19aeb:	76 08                	jbe    19af5 <PFAT_Seek+0x1b>
   19aed:	89 4a 04             	mov    %ecx,0x4(%edx)
   19af0:	b8 00 00 00 00       	mov    $0x0,%eax
   19af5:	5d                   	pop    %ebp
   19af6:	c3                   	ret    

00019af7 <PFAT_Close>:
   19af7:	55                   	push   %ebp
   19af8:	89 e5                	mov    %esp,%ebp
   19afa:	b8 00 00 00 00       	mov    $0x0,%eax
   19aff:	5d                   	pop    %ebp
   19b00:	c3                   	ret    

00019b01 <PFAT_Close_Dir>:
   19b01:	55                   	push   %ebp
   19b02:	89 e5                	mov    %esp,%ebp
   19b04:	b8 00 00 00 00       	mov    $0x0,%eax
   19b09:	5d                   	pop    %ebp
   19b0a:	c3                   	ret    

00019b0b <PFAT_Sync>:
   19b0b:	55                   	push   %ebp
   19b0c:	89 e5                	mov    %esp,%ebp
   19b0e:	b8 00 00 00 00       	mov    $0x0,%eax
   19b13:	5d                   	pop    %ebp
   19b14:	c3                   	ret    

00019b15 <PFAT_Lookup>:
   19b15:	55                   	push   %ebp
   19b16:	89 e5                	mov    %esp,%ebp
   19b18:	57                   	push   %edi
   19b19:	56                   	push   %esi
   19b1a:	53                   	push   %ebx
   19b1b:	83 ec 3c             	sub    $0x3c,%esp
   19b1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   19b21:	89 d3                	mov    %edx,%ebx
   19b23:	8b 70 20             	mov    0x20(%eax),%esi
   19b26:	80 3a 2f             	cmpb   $0x2f,(%edx)
   19b29:	74 4a                	je     19b75 <PFAT_Lookup+0x60>
   19b2b:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   19b32:	e8 bc 75 ff ff       	call   110f3 <Set_Current_Attr>
   19b37:	a1 d0 07 02 00       	mov    0x207d0,%eax
   19b3c:	89 44 24 18          	mov    %eax,0x18(%esp)
   19b40:	8b 45 04             	mov    0x4(%ebp),%eax
   19b43:	89 44 24 14          	mov    %eax,0x14(%esp)
   19b47:	c7 44 24 10 29 01 00 	movl   $0x129,0x10(%esp)
   19b4e:	00 
   19b4f:	c7 44 24 0c 93 e9 01 	movl   $0x1e993,0xc(%esp)
   19b56:	00 
   19b57:	c7 44 24 08 a8 e9 01 	movl   $0x1e9a8,0x8(%esp)
   19b5e:	00 
   19b5f:	c7 44 24 04 f3 ec 01 	movl   $0x1ecf3,0x4(%esp)
   19b66:	00 
   19b67:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   19b6e:	e8 49 74 ff ff       	call   10fbc <Print>
   19b73:	eb fe                	jmp    19b73 <PFAT_Lookup+0x5e>
   19b75:	c7 44 24 04 58 e6 01 	movl   $0x1e658,0x4(%esp)
   19b7c:	00 
   19b7d:	89 14 24             	mov    %edx,(%esp)
   19b80:	e8 5c 2c 00 00       	call   1c7e1 <strcmp>
   19b85:	85 c0                	test   %eax,%eax
   19b87:	75 08                	jne    19b91 <PFAT_Lookup+0x7c>
   19b89:	8b 7d e4             	mov    -0x1c(%ebp),%edi
   19b8c:	83 c7 24             	add    $0x24,%edi
   19b8f:	eb 55                	jmp    19be6 <PFAT_Lookup+0xd1>
   19b91:	83 c3 01             	add    $0x1,%ebx
   19b94:	89 5d e0             	mov    %ebx,-0x20(%ebp)
   19b97:	89 f3                	mov    %esi,%ebx
   19b99:	be 00 00 00 00       	mov    $0x0,%esi
   19b9e:	eb 39                	jmp    19bd9 <PFAT_Lookup+0xc4>
   19ba0:	89 df                	mov    %ebx,%edi
   19ba2:	8b 45 e0             	mov    -0x20(%ebp),%eax
   19ba5:	89 44 24 04          	mov    %eax,0x4(%esp)
   19ba9:	89 1c 24             	mov    %ebx,(%esp)
   19bac:	e8 30 2c 00 00       	call   1c7e1 <strcmp>
   19bb1:	83 c3 1c             	add    $0x1c,%ebx
   19bb4:	85 c0                	test   %eax,%eax
   19bb6:	75 1e                	jne    19bd6 <PFAT_Lookup+0xc1>
   19bb8:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   19bbf:	74 25                	je     19be6 <PFAT_Lookup+0xd1>
   19bc1:	8b 45 e0             	mov    -0x20(%ebp),%eax
   19bc4:	89 44 24 04          	mov    %eax,0x4(%esp)
   19bc8:	c7 04 24 8c ea 01 00 	movl   $0x1ea8c,(%esp)
   19bcf:	e8 e8 73 ff ff       	call   10fbc <Print>
   19bd4:	eb 10                	jmp    19be6 <PFAT_Lookup+0xd1>
   19bd6:	83 c6 01             	add    $0x1,%esi
   19bd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   19bdc:	3b 70 10             	cmp    0x10(%eax),%esi
   19bdf:	7c bf                	jl     19ba0 <PFAT_Lookup+0x8b>
   19be1:	bf 00 00 00 00       	mov    $0x0,%edi
   19be6:	89 f8                	mov    %edi,%eax
   19be8:	83 c4 3c             	add    $0x3c,%esp
   19beb:	5b                   	pop    %ebx
   19bec:	5e                   	pop    %esi
   19bed:	5f                   	pop    %edi
   19bee:	5d                   	pop    %ebp
   19bef:	c3                   	ret    

00019bf0 <Copy_Stat>:
   19bf0:	55                   	push   %ebp
   19bf1:	89 e5                	mov    %esp,%ebp
   19bf3:	83 ec 0c             	sub    $0xc,%esp
   19bf6:	89 1c 24             	mov    %ebx,(%esp)
   19bf9:	89 74 24 04          	mov    %esi,0x4(%esp)
   19bfd:	89 7c 24 08          	mov    %edi,0x8(%esp)
   19c01:	89 c3                	mov    %eax,%ebx
   19c03:	8b 42 18             	mov    0x18(%edx),%eax
   19c06:	89 03                	mov    %eax,(%ebx)
   19c08:	0f b6 4a 0c          	movzbl 0xc(%edx),%ecx
   19c0c:	c1 e1 03             	shl    $0x3,%ecx
   19c0f:	c0 e9 07             	shr    $0x7,%cl
   19c12:	0f b6 43 04          	movzbl 0x4(%ebx),%eax
   19c16:	83 e0 fc             	and    $0xfffffffc,%eax
   19c19:	09 c8                	or     %ecx,%eax
   19c1b:	88 43 04             	mov    %al,0x4(%ebx)
   19c1e:	8d 73 08             	lea    0x8(%ebx),%esi
   19c21:	b9 0a 00 00 00       	mov    $0xa,%ecx
   19c26:	b8 00 00 00 00       	mov    $0x0,%eax
   19c2b:	89 f7                	mov    %esi,%edi
   19c2d:	f3 ab                	rep stos %eax,%es:(%edi)
   19c2f:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
   19c36:	c6 43 0b 20          	movb   $0x20,0xb(%ebx)
   19c3a:	f6 42 0c 01          	testb  $0x1,0xc(%edx)
   19c3e:	75 0e                	jne    19c4e <Copy_Stat+0x5e>
   19c40:	b8 20 00 00 00       	mov    $0x20,%eax
   19c45:	83 e0 0f             	and    $0xf,%eax
   19c48:	83 c8 60             	or     $0x60,%eax
   19c4b:	88 43 0b             	mov    %al,0xb(%ebx)
   19c4e:	8b 1c 24             	mov    (%esp),%ebx
   19c51:	8b 74 24 04          	mov    0x4(%esp),%esi
   19c55:	8b 7c 24 08          	mov    0x8(%esp),%edi
   19c59:	89 ec                	mov    %ebp,%esp
   19c5b:	5d                   	pop    %ebp
   19c5c:	c3                   	ret    

00019c5d <PFAT_Stat>:
   19c5d:	55                   	push   %ebp
   19c5e:	89 e5                	mov    %esp,%ebp
   19c60:	57                   	push   %edi
   19c61:	56                   	push   %esi
   19c62:	53                   	push   %ebx
   19c63:	83 ec 2c             	sub    $0x2c,%esp
   19c66:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   19c69:	8b 7d 10             	mov    0x10(%ebp),%edi
   19c6c:	8b 45 08             	mov    0x8(%ebp),%eax
   19c6f:	8b 70 0c             	mov    0xc(%eax),%esi
   19c72:	85 db                	test   %ebx,%ebx
   19c74:	75 4a                	jne    19cc0 <PFAT_Stat+0x63>
   19c76:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   19c7d:	e8 71 74 ff ff       	call   110f3 <Set_Current_Attr>
   19c82:	a1 d0 07 02 00       	mov    0x207d0,%eax
   19c87:	89 44 24 18          	mov    %eax,0x18(%esp)
   19c8b:	8b 45 04             	mov    0x4(%ebp),%eax
   19c8e:	89 44 24 14          	mov    %eax,0x14(%esp)
   19c92:	c7 44 24 10 d9 01 00 	movl   $0x1d9,0x10(%esp)
   19c99:	00 
   19c9a:	c7 44 24 0c 93 e9 01 	movl   $0x1e993,0xc(%esp)
   19ca1:	00 
   19ca2:	c7 44 24 08 b5 e9 01 	movl   $0x1e9b5,0x8(%esp)
   19ca9:	00 
   19caa:	c7 44 24 04 e9 ec 01 	movl   $0x1ece9,0x4(%esp)
   19cb1:	00 
   19cb2:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   19cb9:	e8 fe 72 ff ff       	call   10fbc <Print>
   19cbe:	eb fe                	jmp    19cbe <PFAT_Stat+0x61>
   19cc0:	85 ff                	test   %edi,%edi
   19cc2:	75 4f                	jne    19d13 <PFAT_Stat+0xb6>
   19cc4:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   19ccb:	90                   	nop
   19ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   19cd0:	e8 1e 74 ff ff       	call   110f3 <Set_Current_Attr>
   19cd5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   19cda:	89 44 24 18          	mov    %eax,0x18(%esp)
   19cde:	8b 45 04             	mov    0x4(%ebp),%eax
   19ce1:	89 44 24 14          	mov    %eax,0x14(%esp)
   19ce5:	c7 44 24 10 da 01 00 	movl   $0x1da,0x10(%esp)
   19cec:	00 
   19ced:	c7 44 24 0c 93 e9 01 	movl   $0x1e993,0xc(%esp)
   19cf4:	00 
   19cf5:	c7 44 24 08 bf e9 01 	movl   $0x1e9bf,0x8(%esp)
   19cfc:	00 
   19cfd:	c7 44 24 04 e9 ec 01 	movl   $0x1ece9,0x4(%esp)
   19d04:	00 
   19d05:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   19d0c:	e8 ab 72 ff ff       	call   10fbc <Print>
   19d11:	eb fe                	jmp    19d11 <PFAT_Stat+0xb4>
   19d13:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   19d1a:	74 10                	je     19d2c <PFAT_Stat+0xcf>
   19d1c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
   19d20:	c7 04 24 c9 e9 01 00 	movl   $0x1e9c9,(%esp)
   19d27:	e8 90 72 ff ff       	call   10fbc <Print>
   19d2c:	89 da                	mov    %ebx,%edx
   19d2e:	89 f0                	mov    %esi,%eax
   19d30:	e8 e0 fd ff ff       	call   19b15 <PFAT_Lookup>
   19d35:	89 c2                	mov    %eax,%edx
   19d37:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   19d3c:	85 d2                	test   %edx,%edx
   19d3e:	74 0c                	je     19d4c <PFAT_Stat+0xef>
   19d40:	89 f8                	mov    %edi,%eax
   19d42:	e8 a9 fe ff ff       	call   19bf0 <Copy_Stat>
   19d47:	b8 00 00 00 00       	mov    $0x0,%eax
   19d4c:	83 c4 2c             	add    $0x2c,%esp
   19d4f:	5b                   	pop    %ebx
   19d50:	5e                   	pop    %esi
   19d51:	5f                   	pop    %edi
   19d52:	5d                   	pop    %ebp
   19d53:	c3                   	ret    

00019d54 <PFAT_FStat_Dir>:
   19d54:	55                   	push   %ebp
   19d55:	89 e5                	mov    %esp,%ebp
   19d57:	8b 45 08             	mov    0x8(%ebp),%eax
   19d5a:	8b 40 14             	mov    0x14(%eax),%eax
   19d5d:	8b 50 0c             	mov    0xc(%eax),%edx
   19d60:	83 c2 24             	add    $0x24,%edx
   19d63:	8b 45 0c             	mov    0xc(%ebp),%eax
   19d66:	e8 85 fe ff ff       	call   19bf0 <Copy_Stat>
   19d6b:	b8 00 00 00 00       	mov    $0x0,%eax
   19d70:	5d                   	pop    %ebp
   19d71:	c3                   	ret    

00019d72 <PFAT_FStat>:
   19d72:	55                   	push   %ebp
   19d73:	89 e5                	mov    %esp,%ebp
   19d75:	8b 45 08             	mov    0x8(%ebp),%eax
   19d78:	8b 40 0c             	mov    0xc(%eax),%eax
   19d7b:	8b 10                	mov    (%eax),%edx
   19d7d:	8b 45 0c             	mov    0xc(%ebp),%eax
   19d80:	e8 6b fe ff ff       	call   19bf0 <Copy_Stat>
   19d85:	b8 00 00 00 00       	mov    $0x0,%eax
   19d8a:	5d                   	pop    %ebp
   19d8b:	c3                   	ret    

00019d8c <PFAT_Open_Directory>:
   19d8c:	55                   	push   %ebp
   19d8d:	89 e5                	mov    %esp,%ebp
   19d8f:	83 ec 28             	sub    $0x28,%esp
   19d92:	89 5d f4             	mov    %ebx,-0xc(%ebp)
   19d95:	89 75 f8             	mov    %esi,-0x8(%ebp)
   19d98:	89 7d fc             	mov    %edi,-0x4(%ebp)
   19d9b:	8b 45 08             	mov    0x8(%ebp),%eax
   19d9e:	8b 58 0c             	mov    0xc(%eax),%ebx
   19da1:	8b 75 0c             	mov    0xc(%ebp),%esi
   19da4:	bf 58 e6 01 00       	mov    $0x1e658,%edi
   19da9:	b9 02 00 00 00       	mov    $0x2,%ecx
   19dae:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
   19db0:	0f 97 c2             	seta   %dl
   19db3:	0f 92 c0             	setb   %al
   19db6:	38 c2                	cmp    %al,%dl
   19db8:	74 07                	je     19dc1 <PFAT_Open_Directory+0x35>
   19dba:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   19dbf:	eb 3b                	jmp    19dfc <PFAT_Open_Directory+0x70>
   19dc1:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
   19dc8:	e8 a3 9e ff ff       	call   13c70 <Malloc>
   19dcd:	89 c2                	mov    %eax,%edx
   19dcf:	b8 f9 ff ff ff       	mov    $0xfffffff9,%eax
   19dd4:	85 d2                	test   %edx,%edx
   19dd6:	74 24                	je     19dfc <PFAT_Open_Directory+0x70>
   19dd8:	c7 02 e8 f0 01 00    	movl   $0x1f0e8,(%edx)
   19dde:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
   19de5:	8b 43 10             	mov    0x10(%ebx),%eax
   19de8:	89 42 08             	mov    %eax,0x8(%edx)
   19deb:	c7 42 0c 00 00 00 00 	movl   $0x0,0xc(%edx)
   19df2:	8b 45 10             	mov    0x10(%ebp),%eax
   19df5:	89 10                	mov    %edx,(%eax)
   19df7:	b8 00 00 00 00       	mov    $0x0,%eax
   19dfc:	8b 5d f4             	mov    -0xc(%ebp),%ebx
   19dff:	8b 75 f8             	mov    -0x8(%ebp),%esi
   19e02:	8b 7d fc             	mov    -0x4(%ebp),%edi
   19e05:	89 ec                	mov    %ebp,%esp
   19e07:	5d                   	pop    %ebp
   19e08:	c3                   	ret    

00019e09 <PFAT_Read_Entry>:
   19e09:	55                   	push   %ebp
   19e0a:	89 e5                	mov    %esp,%ebp
   19e0c:	83 ec 28             	sub    $0x28,%esp
   19e0f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
   19e12:	89 75 f8             	mov    %esi,-0x8(%ebp)
   19e15:	89 7d fc             	mov    %edi,-0x4(%ebp)
   19e18:	8b 55 08             	mov    0x8(%ebp),%edx
   19e1b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   19e1e:	8b 42 14             	mov    0x14(%edx),%eax
   19e21:	8b 78 0c             	mov    0xc(%eax),%edi
   19e24:	8b 4a 04             	mov    0x4(%edx),%ecx
   19e27:	b8 01 00 00 00       	mov    $0x1,%eax
   19e2c:	3b 4a 08             	cmp    0x8(%edx),%ecx
   19e2f:	73 36                	jae    19e67 <PFAT_Read_Entry+0x5e>
   19e31:	6b f1 1c             	imul   $0x1c,%ecx,%esi
   19e34:	03 77 20             	add    0x20(%edi),%esi
   19e37:	83 c1 01             	add    $0x1,%ecx
   19e3a:	89 4a 04             	mov    %ecx,0x4(%edx)
   19e3d:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
   19e44:	00 
   19e45:	89 74 24 04          	mov    %esi,0x4(%esp)
   19e49:	89 1c 24             	mov    %ebx,(%esp)
   19e4c:	e8 d4 2a 00 00       	call   1c925 <strncpy>
   19e51:	c6 43 0c 00          	movb   $0x0,0xc(%ebx)
   19e55:	8d 83 00 04 00 00    	lea    0x400(%ebx),%eax
   19e5b:	89 f2                	mov    %esi,%edx
   19e5d:	e8 8e fd ff ff       	call   19bf0 <Copy_Stat>
   19e62:	b8 00 00 00 00       	mov    $0x0,%eax
   19e67:	8b 5d f4             	mov    -0xc(%ebp),%ebx
   19e6a:	8b 75 f8             	mov    -0x8(%ebp),%esi
   19e6d:	8b 7d fc             	mov    -0x4(%ebp),%edi
   19e70:	89 ec                	mov    %ebp,%esp
   19e72:	5d                   	pop    %ebp
   19e73:	c3                   	ret    

00019e74 <PFAT_Read>:
   19e74:	55                   	push   %ebp
   19e75:	89 e5                	mov    %esp,%ebp
   19e77:	57                   	push   %edi
   19e78:	56                   	push   %esi
   19e79:	53                   	push   %ebx
   19e7a:	83 ec 3c             	sub    $0x3c,%esp
   19e7d:	8b 45 08             	mov    0x8(%ebp),%eax
   19e80:	8b 50 0c             	mov    0xc(%eax),%edx
   19e83:	89 c1                	mov    %eax,%ecx
   19e85:	8b 40 14             	mov    0x14(%eax),%eax
   19e88:	8b 78 0c             	mov    0xc(%eax),%edi
   19e8b:	8b 41 04             	mov    0x4(%ecx),%eax
   19e8e:	89 45 d8             	mov    %eax,-0x28(%ebp)
   19e91:	8b 4d 10             	mov    0x10(%ebp),%ecx
   19e94:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
   19e97:	85 c9                	test   %ecx,%ecx
   19e99:	0f 88 8d 01 00 00    	js     1a02c <PFAT_Read+0x1b8>
   19e9f:	8b 45 08             	mov    0x8(%ebp),%eax
   19ea2:	8b 48 08             	mov    0x8(%eax),%ecx
   19ea5:	39 4d d8             	cmp    %ecx,-0x28(%ebp)
   19ea8:	73 0f                	jae    19eb9 <PFAT_Read+0x45>
   19eaa:	8b 45 10             	mov    0x10(%ebp),%eax
   19ead:	03 45 d8             	add    -0x28(%ebp),%eax
   19eb0:	39 c8                	cmp    %ecx,%eax
   19eb2:	77 05                	ja     19eb9 <PFAT_Read+0x45>
   19eb4:	3b 45 d8             	cmp    -0x28(%ebp),%eax
   19eb7:	73 37                	jae    19ef0 <PFAT_Read+0x7c>
   19eb9:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   19ec0:	0f 84 66 01 00 00    	je     1a02c <PFAT_Read+0x1b8>
   19ec6:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
   19eca:	8b 55 10             	mov    0x10(%ebp),%edx
   19ecd:	89 54 24 08          	mov    %edx,0x8(%esp)
   19ed1:	8b 4d d8             	mov    -0x28(%ebp),%ecx
   19ed4:	89 4c 24 04          	mov    %ecx,0x4(%esp)
   19ed8:	c7 04 24 b4 ea 01 00 	movl   $0x1eab4,(%esp)
   19edf:	e8 d8 70 ff ff       	call   10fbc <Print>
   19ee4:	c7 45 d4 f4 ff ff ff 	movl   $0xfffffff4,-0x2c(%ebp)
   19eeb:	e9 43 01 00 00       	jmp    1a033 <PFAT_Read+0x1bf>
   19ef0:	a9 ff 01 00 00       	test   $0x1ff,%eax
   19ef5:	74 0a                	je     19f01 <PFAT_Read+0x8d>
   19ef7:	25 00 fe ff ff       	and    $0xfffffe00,%eax
   19efc:	05 00 02 00 00       	add    $0x200,%eax
   19f01:	89 55 e0             	mov    %edx,-0x20(%ebp)
   19f04:	c1 e8 09             	shr    $0x9,%eax
   19f07:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   19f0a:	8b 02                	mov    (%edx),%eax
   19f0c:	8b 70 14             	mov    0x14(%eax),%esi
   19f0f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
   19f13:	0f 84 dd 00 00 00    	je     19ff6 <PFAT_Read+0x182>
   19f19:	bb 00 00 00 00       	mov    $0x0,%ebx
   19f1e:	83 fe 01             	cmp    $0x1,%esi
   19f21:	77 23                	ja     19f46 <PFAT_Read+0xd2>
   19f23:	eb 05                	jmp    19f2a <PFAT_Read+0xb6>
   19f25:	83 fe 01             	cmp    $0x1,%esi
   19f28:	77 2a                	ja     19f54 <PFAT_Read+0xe0>
   19f2a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
   19f2e:	c7 04 24 f8 ea 01 00 	movl   $0x1eaf8,(%esp)
   19f35:	e8 82 70 ff ff       	call   10fbc <Print>
   19f3a:	c7 45 d4 fb ff ff ff 	movl   $0xfffffffb,-0x2c(%ebp)
   19f41:	e9 ed 00 00 00       	jmp    1a033 <PFAT_Read+0x1bf>
   19f46:	8b 45 e0             	mov    -0x20(%ebp),%eax
   19f49:	83 c0 10             	add    $0x10,%eax
   19f4c:	89 45 dc             	mov    %eax,-0x24(%ebp)
   19f4f:	bb 00 00 00 00       	mov    $0x0,%ebx
   19f54:	ba 00 00 00 00       	mov    $0x0,%edx
   19f59:	39 da                	cmp    %ebx,%edx
   19f5b:	0f 87 83 00 00 00    	ja     19fe4 <PFAT_Read+0x170>
   19f61:	8b 4d dc             	mov    -0x24(%ebp),%ecx
   19f64:	89 0c 24             	mov    %ecx,(%esp)
   19f67:	e8 6b a7 ff ff       	call   146d7 <Mutex_Lock>
   19f6c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
   19f70:	8b 55 e0             	mov    -0x20(%ebp),%edx
   19f73:	8b 42 0c             	mov    0xc(%edx),%eax
   19f76:	89 04 24             	mov    %eax,(%esp)
   19f79:	e8 6c 08 00 00       	call   1a7ea <Is_Bit_Set>
   19f7e:	84 c0                	test   %al,%al
   19f80:	75 57                	jne    19fd9 <PFAT_Read+0x165>
   19f82:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   19f89:	74 14                	je     19f9f <PFAT_Read+0x12b>
   19f8b:	89 74 24 08          	mov    %esi,0x8(%esp)
   19f8f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
   19f93:	c7 04 24 2c eb 01 00 	movl   $0x1eb2c,(%esp)
   19f9a:	e8 1d 70 ff ff       	call   10fbc <Print>
   19f9f:	89 d8                	mov    %ebx,%eax
   19fa1:	c1 e0 09             	shl    $0x9,%eax
   19fa4:	8b 4d e0             	mov    -0x20(%ebp),%ecx
   19fa7:	03 41 08             	add    0x8(%ecx),%eax
   19faa:	89 44 24 08          	mov    %eax,0x8(%esp)
   19fae:	89 74 24 04          	mov    %esi,0x4(%esp)
   19fb2:	8b 55 08             	mov    0x8(%ebp),%edx
   19fb5:	8b 42 14             	mov    0x14(%edx),%eax
   19fb8:	8b 40 08             	mov    0x8(%eax),%eax
   19fbb:	89 04 24             	mov    %eax,(%esp)
   19fbe:	e8 a2 df ff ff       	call   17f65 <Block_Read>
   19fc3:	85 c0                	test   %eax,%eax
   19fc5:	75 77                	jne    1a03e <PFAT_Read+0x1ca>
   19fc7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
   19fcb:	8b 4d e0             	mov    -0x20(%ebp),%ecx
   19fce:	8b 41 0c             	mov    0xc(%ecx),%eax
   19fd1:	89 04 24             	mov    %eax,(%esp)
   19fd4:	e8 d7 07 00 00       	call   1a7b0 <Set_Bit>
   19fd9:	8b 45 dc             	mov    -0x24(%ebp),%eax
   19fdc:	89 04 24             	mov    %eax,(%esp)
   19fdf:	e8 32 a8 ff ff       	call   14816 <Mutex_Unlock>
   19fe4:	8b 47 1c             	mov    0x1c(%edi),%eax
   19fe7:	8b 34 b0             	mov    (%eax,%esi,4),%esi
   19fea:	83 c3 01             	add    $0x1,%ebx
   19fed:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
   19ff0:	0f 87 2f ff ff ff    	ja     19f25 <PFAT_Read+0xb1>
   19ff6:	8b 45 d8             	mov    -0x28(%ebp),%eax
   19ff9:	8b 55 e0             	mov    -0x20(%ebp),%edx
   19ffc:	03 42 08             	add    0x8(%edx),%eax
   19fff:	8b 4d 10             	mov    0x10(%ebp),%ecx
   1a002:	89 4c 24 08          	mov    %ecx,0x8(%esp)
   1a006:	89 44 24 04          	mov    %eax,0x4(%esp)
   1a00a:	8b 45 0c             	mov    0xc(%ebp),%eax
   1a00d:	89 04 24             	mov    %eax,(%esp)
   1a010:	e8 1e 27 00 00       	call   1c733 <memcpy>
   1a015:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   1a01c:	74 15                	je     1a033 <PFAT_Read+0x1bf>
   1a01e:	c7 04 24 de e9 01 00 	movl   $0x1e9de,(%esp)
   1a025:	e8 92 6f ff ff       	call   10fbc <Print>
   1a02a:	eb 07                	jmp    1a033 <PFAT_Read+0x1bf>
   1a02c:	c7 45 d4 f4 ff ff ff 	movl   $0xfffffff4,-0x2c(%ebp)
   1a033:	8b 45 d4             	mov    -0x2c(%ebp),%eax
   1a036:	83 c4 3c             	add    $0x3c,%esp
   1a039:	5b                   	pop    %ebx
   1a03a:	5e                   	pop    %esi
   1a03b:	5f                   	pop    %edi
   1a03c:	5d                   	pop    %ebp
   1a03d:	c3                   	ret    
   1a03e:	89 c3                	mov    %eax,%ebx
   1a040:	8b 45 dc             	mov    -0x24(%ebp),%eax
   1a043:	89 04 24             	mov    %eax,(%esp)
   1a046:	e8 cb a7 ff ff       	call   14816 <Mutex_Unlock>
   1a04b:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
   1a04e:	eb e3                	jmp    1a033 <PFAT_Read+0x1bf>

0001a050 <PFAT_Open>:
   1a050:	55                   	push   %ebp
   1a051:	89 e5                	mov    %esp,%ebp
   1a053:	83 ec 48             	sub    $0x48,%esp
   1a056:	89 5d f4             	mov    %ebx,-0xc(%ebp)
   1a059:	89 75 f8             	mov    %esi,-0x8(%ebp)
   1a05c:	89 7d fc             	mov    %edi,-0x4(%ebp)
   1a05f:	8b 45 08             	mov    0x8(%ebp),%eax
   1a062:	8b 78 0c             	mov    0xc(%eax),%edi
   1a065:	f6 45 10 05          	testb  $0x5,0x10(%ebp)
   1a069:	0f 85 79 02 00 00    	jne    1a2e8 <PFAT_Open+0x298>
   1a06f:	8b 55 0c             	mov    0xc(%ebp),%edx
   1a072:	89 f8                	mov    %edi,%eax
   1a074:	e8 9c fa ff ff       	call   19b15 <PFAT_Lookup>
   1a079:	89 c6                	mov    %eax,%esi
   1a07b:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   1a080:	85 f6                	test   %esi,%esi
   1a082:	0f 84 65 02 00 00    	je     1a2ed <PFAT_Open+0x29d>
   1a088:	f6 46 0c 10          	testb  $0x10,0xc(%esi)
   1a08c:	0f 85 56 02 00 00    	jne    1a2e8 <PFAT_Open+0x298>
   1a092:	85 ff                	test   %edi,%edi
   1a094:	75 4d                	jne    1a0e3 <PFAT_Open+0x93>
   1a096:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1a09d:	8d 76 00             	lea    0x0(%esi),%esi
   1a0a0:	e8 4e 70 ff ff       	call   110f3 <Set_Current_Attr>
   1a0a5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1a0aa:	89 44 24 18          	mov    %eax,0x18(%esp)
   1a0ae:	8b 45 04             	mov    0x4(%ebp),%eax
   1a0b1:	89 44 24 14          	mov    %eax,0x14(%esp)
   1a0b5:	c7 44 24 10 50 01 00 	movl   $0x150,0x10(%esp)
   1a0bc:	00 
   1a0bd:	c7 44 24 0c 93 e9 01 	movl   $0x1e993,0xc(%esp)
   1a0c4:	00 
   1a0c5:	c7 44 24 08 f5 e9 01 	movl   $0x1e9f5,0x8(%esp)
   1a0cc:	00 
   1a0cd:	c7 44 24 04 ff ec 01 	movl   $0x1ecff,0x4(%esp)
   1a0d4:	00 
   1a0d5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1a0dc:	e8 db 6e ff ff       	call   10fbc <Print>
   1a0e1:	eb fe                	jmp    1a0e1 <PFAT_Open+0x91>
   1a0e3:	8d 47 40             	lea    0x40(%edi),%eax
   1a0e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
   1a0e9:	89 04 24             	mov    %eax,(%esp)
   1a0ec:	e8 e6 a5 ff ff       	call   146d7 <Mutex_Lock>
   1a0f1:	8b 5f 50             	mov    0x50(%edi),%ebx
   1a0f4:	85 db                	test   %ebx,%ebx
   1a0f6:	0f 84 fe 01 00 00    	je     1a2fa <PFAT_Open+0x2aa>
   1a0fc:	3b 33                	cmp    (%ebx),%esi
   1a0fe:	75 0e                	jne    1a10e <PFAT_Open+0xbe>
   1a100:	e9 40 02 00 00       	jmp    1a345 <PFAT_Open+0x2f5>
   1a105:	3b 33                	cmp    (%ebx),%esi
   1a107:	90                   	nop
   1a108:	0f 84 37 02 00 00    	je     1a345 <PFAT_Open+0x2f5>
   1a10e:	8b 5b 24             	mov    0x24(%ebx),%ebx
   1a111:	85 db                	test   %ebx,%ebx
   1a113:	75 f0                	jne    1a105 <PFAT_Open+0xb5>
   1a115:	e9 e0 01 00 00       	jmp    1a2fa <PFAT_Open+0x2aa>
   1a11a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1a11d:	25 00 fe ff ff       	and    $0xfffffe00,%eax
   1a122:	05 00 02 00 00       	add    $0x200,%eax
   1a127:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   1a12a:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
   1a131:	e8 3a 9b ff ff       	call   13c70 <Malloc>
   1a136:	89 c3                	mov    %eax,%ebx
   1a138:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
   1a13f:	85 c0                	test   %eax,%eax
   1a141:	0f 84 36 01 00 00    	je     1a27d <PFAT_Open+0x22d>
   1a147:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1a14a:	c1 e8 09             	shr    $0x9,%eax
   1a14d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   1a150:	c1 e0 09             	shl    $0x9,%eax
   1a153:	89 04 24             	mov    %eax,(%esp)
   1a156:	e8 15 9b ff ff       	call   13c70 <Malloc>
   1a15b:	89 45 dc             	mov    %eax,-0x24(%ebp)
   1a15e:	85 c0                	test   %eax,%eax
   1a160:	0f 84 c1 01 00 00    	je     1a327 <PFAT_Open+0x2d7>
   1a166:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1a169:	89 04 24             	mov    %eax,(%esp)
   1a16c:	e8 c7 07 00 00       	call   1a938 <Create_Bit_Set>
   1a171:	89 45 e0             	mov    %eax,-0x20(%ebp)
   1a174:	85 c0                	test   %eax,%eax
   1a176:	0f 84 b2 01 00 00    	je     1a32e <PFAT_Open+0x2de>
   1a17c:	89 33                	mov    %esi,(%ebx)
   1a17e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1a181:	89 43 04             	mov    %eax,0x4(%ebx)
   1a184:	8b 45 dc             	mov    -0x24(%ebp),%eax
   1a187:	89 43 08             	mov    %eax,0x8(%ebx)
   1a18a:	8b 45 e0             	mov    -0x20(%ebp),%eax
   1a18d:	89 43 0c             	mov    %eax,0xc(%ebx)
   1a190:	8d 43 10             	lea    0x10(%ebx),%eax
   1a193:	89 04 24             	mov    %eax,(%esp)
   1a196:	e8 95 9d ff ff       	call   13f30 <Mutex_Init>
   1a19b:	8b 47 50             	mov    0x50(%edi),%eax
   1a19e:	eb 07                	jmp    1a1a7 <PFAT_Open+0x157>
   1a1a0:	39 c3                	cmp    %eax,%ebx
   1a1a2:	74 11                	je     1a1b5 <PFAT_Open+0x165>
   1a1a4:	8b 40 24             	mov    0x24(%eax),%eax
   1a1a7:	85 c0                	test   %eax,%eax
   1a1a9:	75 f5                	jne    1a1a0 <PFAT_Open+0x150>
   1a1ab:	90                   	nop
   1a1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   1a1b0:	e9 5b 01 00 00       	jmp    1a310 <PFAT_Open+0x2c0>
   1a1b5:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1a1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   1a1c0:	e8 2e 6f ff ff       	call   110f3 <Set_Current_Attr>
   1a1c5:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1a1ca:	89 44 24 18          	mov    %eax,0x18(%esp)
   1a1ce:	8b 45 04             	mov    0x4(%ebp),%eax
   1a1d1:	89 44 24 14          	mov    %eax,0x14(%esp)
   1a1d5:	c7 44 24 10 4c 00 00 	movl   $0x4c,0x10(%esp)
   1a1dc:	00 
   1a1dd:	c7 44 24 0c 93 e9 01 	movl   $0x1e993,0xc(%esp)
   1a1e4:	00 
   1a1e5:	c7 44 24 08 60 eb 01 	movl   $0x1eb60,0x8(%esp)
   1a1ec:	00 
   1a1ed:	c7 44 24 04 0d ed 01 	movl   $0x1ed0d,0x4(%esp)
   1a1f4:	00 
   1a1f5:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1a1fc:	e8 bb 6d ff ff       	call   10fbc <Print>
   1a201:	eb fe                	jmp    1a201 <PFAT_Open+0x1b1>
   1a203:	89 5f 54             	mov    %ebx,0x54(%edi)
   1a206:	89 5f 50             	mov    %ebx,0x50(%edi)
   1a209:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
   1a210:	eb 0c                	jmp    1a21e <PFAT_Open+0x1ce>
   1a212:	89 58 24             	mov    %ebx,0x24(%eax)
   1a215:	8b 47 54             	mov    0x54(%edi),%eax
   1a218:	89 43 20             	mov    %eax,0x20(%ebx)
   1a21b:	89 5f 54             	mov    %ebx,0x54(%edi)
   1a21e:	83 7b 24 00          	cmpl   $0x0,0x24(%ebx)
   1a222:	0f 84 1d 01 00 00    	je     1a345 <PFAT_Open+0x2f5>
   1a228:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1a22f:	e8 bf 6e ff ff       	call   110f3 <Set_Current_Attr>
   1a234:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1a239:	89 44 24 18          	mov    %eax,0x18(%esp)
   1a23d:	8b 45 04             	mov    0x4(%ebp),%eax
   1a240:	89 44 24 14          	mov    %eax,0x14(%esp)
   1a244:	c7 44 24 10 76 01 00 	movl   $0x176,0x10(%esp)
   1a24b:	00 
   1a24c:	c7 44 24 0c 93 e9 01 	movl   $0x1e993,0xc(%esp)
   1a253:	00 
   1a254:	c7 44 24 08 90 eb 01 	movl   $0x1eb90,0x8(%esp)
   1a25b:	00 
   1a25c:	c7 44 24 04 ff ec 01 	movl   $0x1ecff,0x4(%esp)
   1a263:	00 
   1a264:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1a26b:	e8 4c 6d ff ff       	call   10fbc <Print>
   1a270:	eb fe                	jmp    1a270 <PFAT_Open+0x220>
   1a272:	8b 45 dc             	mov    -0x24(%ebp),%eax
   1a275:	89 04 24             	mov    %eax,(%esp)
   1a278:	e8 8a 9b ff ff       	call   13e07 <Free>
   1a27d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
   1a281:	74 0b                	je     1a28e <PFAT_Open+0x23e>
   1a283:	8b 45 e0             	mov    -0x20(%ebp),%eax
   1a286:	89 04 24             	mov    %eax,(%esp)
   1a289:	e8 79 9b ff ff       	call   13e07 <Free>
   1a28e:	8b 45 d8             	mov    -0x28(%ebp),%eax
   1a291:	89 04 24             	mov    %eax,(%esp)
   1a294:	e8 7d a5 ff ff       	call   14816 <Mutex_Unlock>
   1a299:	b8 00 00 00 00       	mov    $0x0,%eax
   1a29e:	85 db                	test   %ebx,%ebx
   1a2a0:	74 4b                	je     1a2ed <PFAT_Open+0x29d>
   1a2a2:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
   1a2a9:	00 
   1a2aa:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
   1a2b1:	00 
   1a2b2:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
   1a2b6:	8b 46 18             	mov    0x18(%esi),%eax
   1a2b9:	89 44 24 08          	mov    %eax,0x8(%esp)
   1a2bd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   1a2c4:	00 
   1a2c5:	c7 04 24 00 f1 01 00 	movl   $0x1f100,(%esp)
   1a2cc:	e8 3c f1 ff ff       	call   1940d <Allocate_File>
   1a2d1:	89 c2                	mov    %eax,%edx
   1a2d3:	b8 f9 ff ff ff       	mov    $0xfffffff9,%eax
   1a2d8:	85 d2                	test   %edx,%edx
   1a2da:	74 11                	je     1a2ed <PFAT_Open+0x29d>
   1a2dc:	8b 45 14             	mov    0x14(%ebp),%eax
   1a2df:	89 10                	mov    %edx,(%eax)
   1a2e1:	b8 00 00 00 00       	mov    $0x0,%eax
   1a2e6:	eb 05                	jmp    1a2ed <PFAT_Open+0x29d>
   1a2e8:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
   1a2ed:	8b 5d f4             	mov    -0xc(%ebp),%ebx
   1a2f0:	8b 75 f8             	mov    -0x8(%ebp),%esi
   1a2f3:	8b 7d fc             	mov    -0x4(%ebp),%edi
   1a2f6:	89 ec                	mov    %ebp,%esp
   1a2f8:	5d                   	pop    %ebp
   1a2f9:	c3                   	ret    
   1a2fa:	8b 46 18             	mov    0x18(%esi),%eax
   1a2fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   1a300:	a9 ff 01 00 00       	test   $0x1ff,%eax
   1a305:	0f 85 0f fe ff ff    	jne    1a11a <PFAT_Open+0xca>
   1a30b:	e9 1a fe ff ff       	jmp    1a12a <PFAT_Open+0xda>
   1a310:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
   1a317:	8b 47 54             	mov    0x54(%edi),%eax
   1a31a:	85 c0                	test   %eax,%eax
   1a31c:	0f 85 f0 fe ff ff    	jne    1a212 <PFAT_Open+0x1c2>
   1a322:	e9 dc fe ff ff       	jmp    1a203 <PFAT_Open+0x1b3>
   1a327:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
   1a32e:	89 1c 24             	mov    %ebx,(%esp)
   1a331:	e8 d1 9a ff ff       	call   13e07 <Free>
   1a336:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
   1a33a:	0f 85 32 ff ff ff    	jne    1a272 <PFAT_Open+0x222>
   1a340:	e9 38 ff ff ff       	jmp    1a27d <PFAT_Open+0x22d>
   1a345:	8b 45 d8             	mov    -0x28(%ebp),%eax
   1a348:	89 04 24             	mov    %eax,(%esp)
   1a34b:	90                   	nop
   1a34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   1a350:	e8 c1 a4 ff ff       	call   14816 <Mutex_Unlock>
   1a355:	e9 48 ff ff ff       	jmp    1a2a2 <PFAT_Open+0x252>

0001a35a <Init_PFAT>:
   1a35a:	55                   	push   %ebp
   1a35b:	89 e5                	mov    %esp,%ebp
   1a35d:	83 ec 18             	sub    $0x18,%esp
   1a360:	c7 44 24 04 18 f1 01 	movl   $0x1f118,0x4(%esp)
   1a367:	00 
   1a368:	c7 04 24 03 ea 01 00 	movl   $0x1ea03,(%esp)
   1a36f:	e8 37 f5 ff ff       	call   198ab <Register_Filesystem>
   1a374:	c9                   	leave  
   1a375:	c3                   	ret    

0001a376 <PFAT_Mount>:
   1a376:	55                   	push   %ebp
   1a377:	89 e5                	mov    %esp,%ebp
   1a379:	57                   	push   %edi
   1a37a:	56                   	push   %esi
   1a37b:	53                   	push   %ebx
   1a37c:	83 ec 3c             	sub    $0x3c,%esp
   1a37f:	c7 04 24 58 00 00 00 	movl   $0x58,(%esp)
   1a386:	e8 e5 98 ff ff       	call   13c70 <Malloc>
   1a38b:	89 c3                	mov    %eax,%ebx
   1a38d:	be f9 ff ff ff       	mov    $0xfffffff9,%esi
   1a392:	85 c0                	test   %eax,%eax
   1a394:	0f 84 d6 03 00 00    	je     1a770 <PFAT_Mount+0x3fa>
   1a39a:	b9 16 00 00 00       	mov    $0x16,%ecx
   1a39f:	b8 00 00 00 00       	mov    $0x0,%eax
   1a3a4:	89 df                	mov    %ebx,%edi
   1a3a6:	f3 ab                	rep stos %eax,%es:(%edi)
   1a3a8:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   1a3af:	74 0c                	je     1a3bd <PFAT_Mount+0x47>
   1a3b1:	c7 04 24 b4 eb 01 00 	movl   $0x1ebb4,(%esp)
   1a3b8:	e8 ff 6b ff ff       	call   10fbc <Print>
   1a3bd:	c7 04 24 00 02 00 00 	movl   $0x200,(%esp)
   1a3c4:	e8 a7 98 ff ff       	call   13c70 <Malloc>
   1a3c9:	89 c7                	mov    %eax,%edi
   1a3cb:	85 c0                	test   %eax,%eax
   1a3cd:	0f 84 54 03 00 00    	je     1a727 <PFAT_Mount+0x3b1>
   1a3d3:	89 44 24 08          	mov    %eax,0x8(%esp)
   1a3d7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   1a3de:	00 
   1a3df:	8b 55 08             	mov    0x8(%ebp),%edx
   1a3e2:	8b 42 08             	mov    0x8(%edx),%eax
   1a3e5:	89 04 24             	mov    %eax,(%esp)
   1a3e8:	e8 78 db ff ff       	call   17f65 <Block_Read>
   1a3ed:	89 c6                	mov    %eax,%esi
   1a3ef:	85 c0                	test   %eax,%eax
   1a3f1:	0f 88 47 03 00 00    	js     1a73e <PFAT_Mount+0x3c8>
   1a3f7:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   1a3fe:	74 0c                	je     1a40c <PFAT_Mount+0x96>
   1a400:	c7 04 24 08 ea 01 00 	movl   $0x1ea08,(%esp)
   1a407:	e8 b0 6b ff ff       	call   10fbc <Print>
   1a40c:	8d 87 e2 01 00 00    	lea    0x1e2(%edi),%eax
   1a412:	8b 10                	mov    (%eax),%edx
   1a414:	89 13                	mov    %edx,(%ebx)
   1a416:	8b 50 04             	mov    0x4(%eax),%edx
   1a419:	89 53 04             	mov    %edx,0x4(%ebx)
   1a41c:	8b 50 08             	mov    0x8(%eax),%edx
   1a41f:	89 53 08             	mov    %edx,0x8(%ebx)
   1a422:	8b 50 0c             	mov    0xc(%eax),%edx
   1a425:	89 53 0c             	mov    %edx,0xc(%ebx)
   1a428:	8b 50 10             	mov    0x10(%eax),%edx
   1a42b:	89 53 10             	mov    %edx,0x10(%ebx)
   1a42e:	8b 50 14             	mov    0x14(%eax),%edx
   1a431:	89 53 14             	mov    %edx,0x14(%ebx)
   1a434:	8b 40 18             	mov    0x18(%eax),%eax
   1a437:	89 43 18             	mov    %eax,0x18(%ebx)
   1a43a:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   1a441:	74 0c                	je     1a44f <PFAT_Mount+0xd9>
   1a443:	c7 04 24 20 ea 01 00 	movl   $0x1ea20,(%esp)
   1a44a:	e8 6d 6b ff ff       	call   10fbc <Print>
   1a44f:	8b 03                	mov    (%ebx),%eax
   1a451:	3d 00 00 32 78       	cmp    $0x78320000,%eax
   1a456:	74 1a                	je     1a472 <PFAT_Mount+0xfc>
   1a458:	89 44 24 04          	mov    %eax,0x4(%esp)
   1a45c:	c7 04 24 d4 eb 01 00 	movl   $0x1ebd4,(%esp)
   1a463:	e8 54 6b ff ff       	call   10fbc <Print>
   1a468:	be f6 ff ff ff       	mov    $0xfffffff6,%esi
   1a46d:	e9 cc 02 00 00       	jmp    1a73e <PFAT_Mount+0x3c8>
   1a472:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   1a479:	74 0c                	je     1a487 <PFAT_Mount+0x111>
   1a47b:	c7 04 24 3a ea 01 00 	movl   $0x1ea3a,(%esp)
   1a482:	e8 35 6b ff ff       	call   10fbc <Print>
   1a487:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
   1a48b:	7e 15                	jle    1a4a2 <PFAT_Mount+0x12c>
   1a48d:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
   1a491:	7e 0f                	jle    1a4a2 <PFAT_Mount+0x12c>
   1a493:	83 7b 10 00          	cmpl   $0x0,0x10(%ebx)
   1a497:	78 09                	js     1a4a2 <PFAT_Mount+0x12c>
   1a499:	83 7b 0c 00          	cmpl   $0x0,0xc(%ebx)
   1a49d:	8d 76 00             	lea    0x0(%esi),%esi
   1a4a0:	7f 16                	jg     1a4b8 <PFAT_Mount+0x142>
   1a4a2:	c7 04 24 00 ec 01 00 	movl   $0x1ec00,(%esp)
   1a4a9:	e8 0e 6b ff ff       	call   10fbc <Print>
   1a4ae:	be f6 ff ff ff       	mov    $0xfffffff6,%esi
   1a4b3:	e9 86 02 00 00       	jmp    1a73e <PFAT_Mount+0x3c8>
   1a4b8:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   1a4bf:	74 0c                	je     1a4cd <PFAT_Mount+0x157>
   1a4c1:	c7 04 24 28 ec 01 00 	movl   $0x1ec28,(%esp)
   1a4c8:	e8 ef 6a ff ff       	call   10fbc <Print>
   1a4cd:	8b 43 08             	mov    0x8(%ebx),%eax
   1a4d0:	c1 e0 09             	shl    $0x9,%eax
   1a4d3:	89 04 24             	mov    %eax,(%esp)
   1a4d6:	e8 95 97 ff ff       	call   13c70 <Malloc>
   1a4db:	89 43 1c             	mov    %eax,0x1c(%ebx)
   1a4de:	be f9 ff ff ff       	mov    $0xfffffff9,%esi
   1a4e3:	85 c0                	test   %eax,%eax
   1a4e5:	0f 84 62 02 00 00    	je     1a74d <PFAT_Mount+0x3d7>
   1a4eb:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
   1a4ef:	7e 44                	jle    1a535 <PFAT_Mount+0x1bf>
   1a4f1:	be 00 00 00 00       	mov    $0x0,%esi
   1a4f6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
   1a4f9:	89 df                	mov    %ebx,%edi
   1a4fb:	89 f3                	mov    %esi,%ebx
   1a4fd:	8b 75 08             	mov    0x8(%ebp),%esi
   1a500:	89 d8                	mov    %ebx,%eax
   1a502:	c1 e0 09             	shl    $0x9,%eax
   1a505:	03 47 1c             	add    0x1c(%edi),%eax
   1a508:	89 44 24 08          	mov    %eax,0x8(%esp)
   1a50c:	89 d8                	mov    %ebx,%eax
   1a50e:	03 47 04             	add    0x4(%edi),%eax
   1a511:	89 44 24 04          	mov    %eax,0x4(%esp)
   1a515:	8b 46 08             	mov    0x8(%esi),%eax
   1a518:	89 04 24             	mov    %eax,(%esp)
   1a51b:	e8 45 da ff ff       	call   17f65 <Block_Read>
   1a520:	85 c0                	test   %eax,%eax
   1a522:	0f 88 06 02 00 00    	js     1a72e <PFAT_Mount+0x3b8>
   1a528:	83 c3 01             	add    $0x1,%ebx
   1a52b:	39 5f 08             	cmp    %ebx,0x8(%edi)
   1a52e:	7f d0                	jg     1a500 <PFAT_Mount+0x18a>
   1a530:	89 fb                	mov    %edi,%ebx
   1a532:	8b 7d e4             	mov    -0x1c(%ebp),%edi
   1a535:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   1a53c:	74 0c                	je     1a54a <PFAT_Mount+0x1d4>
   1a53e:	c7 04 24 57 ea 01 00 	movl   $0x1ea57,(%esp)
   1a545:	e8 72 6a ff ff       	call   10fbc <Print>
   1a54a:	6b 43 10 1c          	imul   $0x1c,0x10(%ebx),%eax
   1a54e:	a9 ff 01 00 00       	test   $0x1ff,%eax
   1a553:	74 0a                	je     1a55f <PFAT_Mount+0x1e9>
   1a555:	25 00 fe ff ff       	and    $0xfffffe00,%eax
   1a55a:	05 00 02 00 00       	add    $0x200,%eax
   1a55f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   1a562:	89 04 24             	mov    %eax,(%esp)
   1a565:	e8 06 97 ff ff       	call   13c70 <Malloc>
   1a56a:	89 43 20             	mov    %eax,0x20(%ebx)
   1a56d:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   1a574:	74 13                	je     1a589 <PFAT_Mount+0x213>
   1a576:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1a579:	89 44 24 04          	mov    %eax,0x4(%esp)
   1a57d:	c7 04 24 60 ec 01 00 	movl   $0x1ec60,(%esp)
   1a584:	e8 33 6a ff ff       	call   10fbc <Print>
   1a589:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
   1a58d:	7e 51                	jle    1a5e0 <PFAT_Mount+0x26a>
   1a58f:	be 00 00 00 00       	mov    $0x0,%esi
   1a594:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
   1a59b:	89 7d dc             	mov    %edi,-0x24(%ebp)
   1a59e:	89 df                	mov    %ebx,%edi
   1a5a0:	bb 00 00 00 00       	mov    $0x0,%ebx
   1a5a5:	89 f0                	mov    %esi,%eax
   1a5a7:	03 47 20             	add    0x20(%edi),%eax
   1a5aa:	89 44 24 08          	mov    %eax,0x8(%esp)
   1a5ae:	89 d8                	mov    %ebx,%eax
   1a5b0:	03 47 0c             	add    0xc(%edi),%eax
   1a5b3:	89 44 24 04          	mov    %eax,0x4(%esp)
   1a5b7:	8b 55 08             	mov    0x8(%ebp),%edx
   1a5ba:	8b 42 08             	mov    0x8(%edx),%eax
   1a5bd:	89 04 24             	mov    %eax,(%esp)
   1a5c0:	e8 a0 d9 ff ff       	call   17f65 <Block_Read>
   1a5c5:	85 c0                	test   %eax,%eax
   1a5c7:	0f 88 6a 01 00 00    	js     1a737 <PFAT_Mount+0x3c1>
   1a5cd:	81 c3 00 02 00 00    	add    $0x200,%ebx
   1a5d3:	81 c6 00 00 70 00    	add    $0x700000,%esi
   1a5d9:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
   1a5dc:	7f c7                	jg     1a5a5 <PFAT_Mount+0x22f>
   1a5de:	89 fb                	mov    %edi,%ebx
   1a5e0:	83 3d b4 03 02 00 00 	cmpl   $0x0,0x203b4
   1a5e7:	74 0c                	je     1a5f5 <PFAT_Mount+0x27f>
   1a5e9:	c7 04 24 80 ec 01 00 	movl   $0x1ec80,(%esp)
   1a5f0:	e8 c7 69 ff ff       	call   10fbc <Print>
   1a5f5:	8d 73 24             	lea    0x24(%ebx),%esi
   1a5f8:	b9 00 00 00 00       	mov    $0x0,%ecx
   1a5fd:	ba 1c 00 00 00       	mov    $0x1c,%edx
   1a602:	b8 00 00 00 00       	mov    $0x0,%eax
   1a607:	89 0c 06             	mov    %ecx,(%esi,%eax,1)
   1a60a:	83 c0 04             	add    $0x4,%eax
   1a60d:	39 d0                	cmp    %edx,%eax
   1a60f:	72 f6                	jb     1a607 <PFAT_Mount+0x291>
   1a611:	80 4b 30 11          	orb    $0x11,0x30(%ebx)
   1a615:	6b 43 10 1c          	imul   $0x1c,0x10(%ebx),%eax
   1a619:	89 43 3c             	mov    %eax,0x3c(%ebx)
   1a61c:	8d 43 40             	lea    0x40(%ebx),%eax
   1a61f:	89 04 24             	mov    %eax,(%esp)
   1a622:	e8 09 99 ff ff       	call   13f30 <Mutex_Init>
   1a627:	c7 43 54 00 00 00 00 	movl   $0x0,0x54(%ebx)
   1a62e:	c7 43 50 00 00 00 00 	movl   $0x0,0x50(%ebx)
   1a635:	e8 bc e7 ff ff       	call   18df6 <Get_Paging_Device>
   1a63a:	85 c0                	test   %eax,%eax
   1a63c:	0f 85 d2 00 00 00    	jne    1a714 <PFAT_Mount+0x39e>
   1a642:	ba 75 ea 01 00       	mov    $0x1ea75,%edx
   1a647:	89 d8                	mov    %ebx,%eax
   1a649:	e8 c7 f4 ff ff       	call   19b15 <PFAT_Lookup>
   1a64e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   1a651:	85 c0                	test   %eax,%eax
   1a653:	0f 84 bb 00 00 00    	je     1a714 <PFAT_Mount+0x39e>
   1a659:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
   1a660:	e8 0b 96 ff ff       	call   13c70 <Malloc>
   1a665:	89 c6                	mov    %eax,%esi
   1a667:	85 c0                	test   %eax,%eax
   1a669:	0f 84 88 00 00 00    	je     1a6f7 <PFAT_Mount+0x381>
   1a66f:	8b 45 08             	mov    0x8(%ebp),%eax
   1a672:	8b 78 04             	mov    0x4(%eax),%edi
   1a675:	b8 00 00 00 00       	mov    $0x0,%eax
   1a67a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   1a67f:	f2 ae                	repnz scas %es:(%edi),%al
   1a681:	f7 d1                	not    %ecx
   1a683:	83 c1 0f             	add    $0xf,%ecx
   1a686:	89 4d e0             	mov    %ecx,-0x20(%ebp)
   1a689:	89 0c 24             	mov    %ecx,(%esp)
   1a68c:	e8 df 95 ff ff       	call   13c70 <Malloc>
   1a691:	89 c7                	mov    %eax,%edi
   1a693:	85 c0                	test   %eax,%eax
   1a695:	0f 84 df 00 00 00    	je     1a77a <PFAT_Mount+0x404>
   1a69b:	c7 44 24 10 75 ea 01 	movl   $0x1ea75,0x10(%esp)
   1a6a2:	00 
   1a6a3:	8b 55 08             	mov    0x8(%ebp),%edx
   1a6a6:	8b 42 04             	mov    0x4(%edx),%eax
   1a6a9:	89 44 24 0c          	mov    %eax,0xc(%esp)
   1a6ad:	c7 44 24 08 83 ea 01 	movl   $0x1ea83,0x8(%esp)
   1a6b4:	00 
   1a6b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
   1a6b8:	89 44 24 04          	mov    %eax,0x4(%esp)
   1a6bc:	89 3c 24             	mov    %edi,(%esp)
   1a6bf:	e8 eb 23 00 00       	call   1caaf <snprintf>
   1a6c4:	89 3e                	mov    %edi,(%esi)
   1a6c6:	8b 55 08             	mov    0x8(%ebp),%edx
   1a6c9:	8b 42 08             	mov    0x8(%edx),%eax
   1a6cc:	89 46 04             	mov    %eax,0x4(%esi)
   1a6cf:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   1a6d2:	8b 42 14             	mov    0x14(%edx),%eax
   1a6d5:	89 46 08             	mov    %eax,0x8(%esi)
   1a6d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1a6db:	8b 50 18             	mov    0x18(%eax),%edx
   1a6de:	b9 00 02 00 00       	mov    $0x200,%ecx
   1a6e3:	89 d0                	mov    %edx,%eax
   1a6e5:	c1 fa 1f             	sar    $0x1f,%edx
   1a6e8:	f7 f9                	idiv   %ecx
   1a6ea:	89 46 0c             	mov    %eax,0xc(%esi)
   1a6ed:	89 34 24             	mov    %esi,(%esp)
   1a6f0:	e8 0b e7 ff ff       	call   18e00 <Register_Paging_Device>
   1a6f5:	eb 1d                	jmp    1a714 <PFAT_Mount+0x39e>
   1a6f7:	8b 55 08             	mov    0x8(%ebp),%edx
   1a6fa:	8b 42 08             	mov    0x8(%edx),%eax
   1a6fd:	89 44 24 08          	mov    %eax,0x8(%esp)
   1a701:	8b 42 04             	mov    0x4(%edx),%eax
   1a704:	89 44 24 04          	mov    %eax,0x4(%esp)
   1a708:	c7 04 24 ac ec 01 00 	movl   $0x1ecac,(%esp)
   1a70f:	e8 a8 68 ff ff       	call   10fbc <Print>
   1a714:	8b 45 08             	mov    0x8(%ebp),%eax
   1a717:	c7 00 d0 f0 01 00    	movl   $0x1f0d0,(%eax)
   1a71d:	89 58 0c             	mov    %ebx,0xc(%eax)
   1a720:	be 00 00 00 00       	mov    $0x0,%esi
   1a725:	eb 49                	jmp    1a770 <PFAT_Mount+0x3fa>
   1a727:	be f9 ff ff ff       	mov    $0xfffffff9,%esi
   1a72c:	eb 10                	jmp    1a73e <PFAT_Mount+0x3c8>
   1a72e:	89 c6                	mov    %eax,%esi
   1a730:	89 fb                	mov    %edi,%ebx
   1a732:	8b 7d e4             	mov    -0x1c(%ebp),%edi
   1a735:	eb 07                	jmp    1a73e <PFAT_Mount+0x3c8>
   1a737:	89 c6                	mov    %eax,%esi
   1a739:	89 fb                	mov    %edi,%ebx
   1a73b:	8b 7d dc             	mov    -0x24(%ebp),%edi
   1a73e:	8b 43 1c             	mov    0x1c(%ebx),%eax
   1a741:	85 c0                	test   %eax,%eax
   1a743:	74 08                	je     1a74d <PFAT_Mount+0x3d7>
   1a745:	89 04 24             	mov    %eax,(%esp)
   1a748:	e8 ba 96 ff ff       	call   13e07 <Free>
   1a74d:	8b 43 20             	mov    0x20(%ebx),%eax
   1a750:	85 c0                	test   %eax,%eax
   1a752:	74 08                	je     1a75c <PFAT_Mount+0x3e6>
   1a754:	89 04 24             	mov    %eax,(%esp)
   1a757:	e8 ab 96 ff ff       	call   13e07 <Free>
   1a75c:	89 1c 24             	mov    %ebx,(%esp)
   1a75f:	e8 a3 96 ff ff       	call   13e07 <Free>
   1a764:	85 ff                	test   %edi,%edi
   1a766:	74 08                	je     1a770 <PFAT_Mount+0x3fa>
   1a768:	89 3c 24             	mov    %edi,(%esp)
   1a76b:	e8 97 96 ff ff       	call   13e07 <Free>
   1a770:	89 f0                	mov    %esi,%eax
   1a772:	83 c4 3c             	add    $0x3c,%esp
   1a775:	5b                   	pop    %ebx
   1a776:	5e                   	pop    %esi
   1a777:	5f                   	pop    %edi
   1a778:	5d                   	pop    %ebp
   1a779:	c3                   	ret    
   1a77a:	8b 55 08             	mov    0x8(%ebp),%edx
   1a77d:	8b 42 08             	mov    0x8(%edx),%eax
   1a780:	89 44 24 08          	mov    %eax,0x8(%esp)
   1a784:	8b 42 04             	mov    0x4(%edx),%eax
   1a787:	89 44 24 04          	mov    %eax,0x4(%esp)
   1a78b:	c7 04 24 ac ec 01 00 	movl   $0x1ecac,(%esp)
   1a792:	e8 25 68 ff ff       	call   10fbc <Print>
   1a797:	89 34 24             	mov    %esi,(%esp)
   1a79a:	e8 68 96 ff ff       	call   13e07 <Free>
   1a79f:	e9 70 ff ff ff       	jmp    1a714 <PFAT_Mount+0x39e>
   1a7a4:	90                   	nop
   1a7a5:	90                   	nop
   1a7a6:	90                   	nop
   1a7a7:	90                   	nop
   1a7a8:	90                   	nop
   1a7a9:	90                   	nop
   1a7aa:	90                   	nop
   1a7ab:	90                   	nop
   1a7ac:	90                   	nop
   1a7ad:	90                   	nop
   1a7ae:	90                   	nop
   1a7af:	90                   	nop

0001a7b0 <Set_Bit>:
   1a7b0:	55                   	push   %ebp
   1a7b1:	89 e5                	mov    %esp,%ebp
   1a7b3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   1a7b6:	89 c8                	mov    %ecx,%eax
   1a7b8:	c1 e8 03             	shr    $0x3,%eax
   1a7bb:	03 45 08             	add    0x8(%ebp),%eax
   1a7be:	83 e1 07             	and    $0x7,%ecx
   1a7c1:	ba 01 00 00 00       	mov    $0x1,%edx
   1a7c6:	d3 e2                	shl    %cl,%edx
   1a7c8:	08 10                	or     %dl,(%eax)
   1a7ca:	5d                   	pop    %ebp
   1a7cb:	c3                   	ret    

0001a7cc <Clear_Bit>:
   1a7cc:	55                   	push   %ebp
   1a7cd:	89 e5                	mov    %esp,%ebp
   1a7cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   1a7d2:	89 c8                	mov    %ecx,%eax
   1a7d4:	c1 e8 03             	shr    $0x3,%eax
   1a7d7:	03 45 08             	add    0x8(%ebp),%eax
   1a7da:	83 e1 07             	and    $0x7,%ecx
   1a7dd:	ba 01 00 00 00       	mov    $0x1,%edx
   1a7e2:	d3 e2                	shl    %cl,%edx
   1a7e4:	f7 d2                	not    %edx
   1a7e6:	20 10                	and    %dl,(%eax)
   1a7e8:	5d                   	pop    %ebp
   1a7e9:	c3                   	ret    

0001a7ea <Is_Bit_Set>:
   1a7ea:	55                   	push   %ebp
   1a7eb:	89 e5                	mov    %esp,%ebp
   1a7ed:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   1a7f0:	89 c8                	mov    %ecx,%eax
   1a7f2:	c1 e8 03             	shr    $0x3,%eax
   1a7f5:	8b 55 08             	mov    0x8(%ebp),%edx
   1a7f8:	0f b6 04 02          	movzbl (%edx,%eax,1),%eax
   1a7fc:	83 e1 07             	and    $0x7,%ecx
   1a7ff:	d3 f8                	sar    %cl,%eax
   1a801:	83 e0 01             	and    $0x1,%eax
   1a804:	5d                   	pop    %ebp
   1a805:	c3                   	ret    

0001a806 <Find_First_N_Free>:
   1a806:	55                   	push   %ebp
   1a807:	89 e5                	mov    %esp,%ebp
   1a809:	57                   	push   %edi
   1a80a:	56                   	push   %esi
   1a80b:	53                   	push   %ebx
   1a80c:	83 ec 0c             	sub    $0xc,%esp
   1a80f:	8b 7d 08             	mov    0x8(%ebp),%edi
   1a812:	8b 45 10             	mov    0x10(%ebp),%eax
   1a815:	2b 45 0c             	sub    0xc(%ebp),%eax
   1a818:	89 45 f0             	mov    %eax,-0x10(%ebp)
   1a81b:	74 4d                	je     1a86a <Find_First_N_Free+0x64>
   1a81d:	be 00 00 00 00       	mov    $0x0,%esi
   1a822:	89 74 24 04          	mov    %esi,0x4(%esp)
   1a826:	89 3c 24             	mov    %edi,(%esp)
   1a829:	e8 bc ff ff ff       	call   1a7ea <Is_Bit_Set>
   1a82e:	84 c0                	test   %al,%al
   1a830:	75 30                	jne    1a862 <Find_First_N_Free+0x5c>
   1a832:	bb 01 00 00 00       	mov    $0x1,%ebx
   1a837:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
   1a83b:	76 1b                	jbe    1a858 <Find_First_N_Free+0x52>
   1a83d:	8d 04 33             	lea    (%ebx,%esi,1),%eax
   1a840:	89 44 24 04          	mov    %eax,0x4(%esp)
   1a844:	89 3c 24             	mov    %edi,(%esp)
   1a847:	e8 9e ff ff ff       	call   1a7ea <Is_Bit_Set>
   1a84c:	84 c0                	test   %al,%al
   1a84e:	75 08                	jne    1a858 <Find_First_N_Free+0x52>
   1a850:	83 c3 01             	add    $0x1,%ebx
   1a853:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
   1a856:	77 e5                	ja     1a83d <Find_First_N_Free+0x37>
   1a858:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
   1a85b:	75 05                	jne    1a862 <Find_First_N_Free+0x5c>
   1a85d:	89 f0                	mov    %esi,%eax
   1a85f:	90                   	nop
   1a860:	eb 0d                	jmp    1a86f <Find_First_N_Free+0x69>
   1a862:	83 c6 01             	add    $0x1,%esi
   1a865:	3b 75 f0             	cmp    -0x10(%ebp),%esi
   1a868:	72 b8                	jb     1a822 <Find_First_N_Free+0x1c>
   1a86a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   1a86f:	83 c4 0c             	add    $0xc,%esp
   1a872:	5b                   	pop    %ebx
   1a873:	5e                   	pop    %esi
   1a874:	5f                   	pop    %edi
   1a875:	5d                   	pop    %ebp
   1a876:	c3                   	ret    

0001a877 <Destroy_Bit_Set>:
   1a877:	55                   	push   %ebp
   1a878:	89 e5                	mov    %esp,%ebp
   1a87a:	83 ec 18             	sub    $0x18,%esp
   1a87d:	8b 45 08             	mov    0x8(%ebp),%eax
   1a880:	89 04 24             	mov    %eax,(%esp)
   1a883:	e8 7f 95 ff ff       	call   13e07 <Free>
   1a888:	c9                   	leave  
   1a889:	c3                   	ret    

0001a88a <Find_First_Free_Bit>:
   1a88a:	55                   	push   %ebp
   1a88b:	89 e5                	mov    %esp,%ebp
   1a88d:	53                   	push   %ebx
   1a88e:	83 ec 24             	sub    $0x24,%esp
   1a891:	8b 4d 08             	mov    0x8(%ebp),%ecx
   1a894:	8b 45 0c             	mov    0xc(%ebp),%eax
   1a897:	a8 07                	test   $0x7,%al
   1a899:	0f 95 c3             	setne  %bl
   1a89c:	0f b6 db             	movzbl %bl,%ebx
   1a89f:	c1 e8 03             	shr    $0x3,%eax
   1a8a2:	01 c3                	add    %eax,%ebx
   1a8a4:	0f 84 83 00 00 00    	je     1a92d <Find_First_Free_Bit+0xa3>
   1a8aa:	0f b6 11             	movzbl (%ecx),%edx
   1a8ad:	b8 00 00 00 00       	mov    $0x0,%eax
   1a8b2:	80 fa ff             	cmp    $0xff,%dl
   1a8b5:	74 6f                	je     1a926 <Find_First_Free_Bit+0x9c>
   1a8b7:	eb 09                	jmp    1a8c2 <Find_First_Free_Bit+0x38>
   1a8b9:	0f b6 14 01          	movzbl (%ecx,%eax,1),%edx
   1a8bd:	80 fa ff             	cmp    $0xff,%dl
   1a8c0:	74 64                	je     1a926 <Find_First_Free_Bit+0x9c>
   1a8c2:	b9 00 00 00 00       	mov    $0x0,%ecx
   1a8c7:	0f b6 d2             	movzbl %dl,%edx
   1a8ca:	0f a3 ca             	bt     %ecx,%edx
   1a8cd:	72 05                	jb     1a8d4 <Find_First_Free_Bit+0x4a>
   1a8cf:	8d 04 c1             	lea    (%ecx,%eax,8),%eax
   1a8d2:	eb 5e                	jmp    1a932 <Find_First_Free_Bit+0xa8>
   1a8d4:	83 c1 01             	add    $0x1,%ecx
   1a8d7:	83 f9 08             	cmp    $0x8,%ecx
   1a8da:	75 ee                	jne    1a8ca <Find_First_Free_Bit+0x40>
   1a8dc:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1a8e3:	e8 0b 68 ff ff       	call   110f3 <Set_Current_Attr>
   1a8e8:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1a8ed:	89 44 24 18          	mov    %eax,0x18(%esp)
   1a8f1:	8b 45 04             	mov    0x4(%ebp),%eax
   1a8f4:	89 44 24 14          	mov    %eax,0x14(%esp)
   1a8f8:	c7 44 24 10 4d 00 00 	movl   $0x4d,0x10(%esp)
   1a8ff:	00 
   1a900:	c7 44 24 0c 2b ed 01 	movl   $0x1ed2b,0xc(%esp)
   1a907:	00 
   1a908:	c7 44 24 08 6b d1 01 	movl   $0x1d16b,0x8(%esp)
   1a90f:	00 
   1a910:	c7 44 24 04 42 ed 01 	movl   $0x1ed42,0x4(%esp)
   1a917:	00 
   1a918:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1a91f:	e8 98 66 ff ff       	call   10fbc <Print>
   1a924:	eb fe                	jmp    1a924 <Find_First_Free_Bit+0x9a>
   1a926:	83 c0 01             	add    $0x1,%eax
   1a929:	39 c3                	cmp    %eax,%ebx
   1a92b:	77 8c                	ja     1a8b9 <Find_First_Free_Bit+0x2f>
   1a92d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   1a932:	83 c4 24             	add    $0x24,%esp
   1a935:	5b                   	pop    %ebx
   1a936:	5d                   	pop    %ebp
   1a937:	c3                   	ret    

0001a938 <Create_Bit_Set>:
   1a938:	55                   	push   %ebp
   1a939:	89 e5                	mov    %esp,%ebp
   1a93b:	83 ec 18             	sub    $0x18,%esp
   1a93e:	89 5d f8             	mov    %ebx,-0x8(%ebp)
   1a941:	89 75 fc             	mov    %esi,-0x4(%ebp)
   1a944:	8b 75 08             	mov    0x8(%ebp),%esi
   1a947:	f7 c6 07 00 00 00    	test   $0x7,%esi
   1a94d:	0f 95 c0             	setne  %al
   1a950:	0f b6 c0             	movzbl %al,%eax
   1a953:	c1 ee 03             	shr    $0x3,%esi
   1a956:	8d 34 30             	lea    (%eax,%esi,1),%esi
   1a959:	89 34 24             	mov    %esi,(%esp)
   1a95c:	e8 0f 93 ff ff       	call   13c70 <Malloc>
   1a961:	89 c3                	mov    %eax,%ebx
   1a963:	85 c0                	test   %eax,%eax
   1a965:	74 14                	je     1a97b <Create_Bit_Set+0x43>
   1a967:	89 74 24 08          	mov    %esi,0x8(%esp)
   1a96b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   1a972:	00 
   1a973:	89 04 24             	mov    %eax,(%esp)
   1a976:	e8 95 1d 00 00       	call   1c710 <memset>
   1a97b:	89 d8                	mov    %ebx,%eax
   1a97d:	8b 5d f8             	mov    -0x8(%ebp),%ebx
   1a980:	8b 75 fc             	mov    -0x4(%ebp),%esi
   1a983:	89 ec                	mov    %ebp,%esp
   1a985:	5d                   	pop    %ebp
   1a986:	c3                   	ret    
   1a987:	90                   	nop

0001a988 <Printrap_Handler>:
   1a988:	55                   	push   %ebp
   1a989:	89 e5                	mov    %esp,%ebp
   1a98b:	83 ec 18             	sub    $0x18,%esp
   1a98e:	a1 b8 03 02 00       	mov    0x203b8,%eax
   1a993:	8b 55 08             	mov    0x8(%ebp),%edx
   1a996:	03 42 28             	add    0x28(%edx),%eax
   1a999:	89 04 24             	mov    %eax,(%esp)
   1a99c:	e8 1b 66 ff ff       	call   10fbc <Print>
   1a9a1:	c7 05 d4 07 02 00 01 	movl   $0x1,0x207d4
   1a9a8:	00 00 00 
   1a9ab:	c9                   	leave  
   1a9ac:	c3                   	ret    

0001a9ad <Spawner>:
   1a9ad:	55                   	push   %ebp
   1a9ae:	89 e5                	mov    %esp,%ebp
   1a9b0:	57                   	push   %edi
   1a9b1:	56                   	push   %esi
   1a9b2:	53                   	push   %ebx
   1a9b3:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
   1a9b9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   1a9c0:	8d 45 e0             	lea    -0x20(%ebp),%eax
   1a9c3:	89 44 24 08          	mov    %eax,0x8(%esp)
   1a9c7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   1a9ca:	89 44 24 04          	mov    %eax,0x4(%esp)
   1a9ce:	c7 04 24 56 ed 01 00 	movl   $0x1ed56,(%esp)
   1a9d5:	e8 e9 ea ff ff       	call   194c3 <Read_Fully>
   1a9da:	85 c0                	test   %eax,%eax
   1a9dc:	74 19                	je     1a9f7 <Spawner+0x4a>
   1a9de:	c7 44 24 04 56 ed 01 	movl   $0x1ed56,0x4(%esp)
   1a9e5:	00 
   1a9e6:	c7 04 24 b0 ed 01 00 	movl   $0x1edb0,(%esp)
   1a9ed:	e8 ca 65 ff ff       	call   10fbc <Print>
   1a9f2:	e9 a0 01 00 00       	jmp    1ab97 <Spawner+0x1ea>
   1a9f7:	8d 45 9c             	lea    -0x64(%ebp),%eax
   1a9fa:	89 44 24 08          	mov    %eax,0x8(%esp)
   1a9fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
   1aa01:	89 44 24 04          	mov    %eax,0x4(%esp)
   1aa05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1aa08:	89 04 24             	mov    %eax,(%esp)
   1aa0b:	e8 4c ce ff ff       	call   1785c <Parse_ELF_Executable>
   1aa10:	85 c0                	test   %eax,%eax
   1aa12:	74 11                	je     1aa25 <Spawner+0x78>
   1aa14:	c7 04 24 5f ed 01 00 	movl   $0x1ed5f,(%esp)
   1aa1b:	e8 9c 65 ff ff       	call   10fbc <Print>
   1aa20:	e9 72 01 00 00       	jmp    1ab97 <Spawner+0x1ea>
   1aa25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1aa28:	89 45 94             	mov    %eax,-0x6c(%ebp)
   1aa2b:	8b 5d d8             	mov    -0x28(%ebp),%ebx
   1aa2e:	8d 45 a4             	lea    -0x5c(%ebp),%eax
   1aa31:	bf 00 00 00 00       	mov    $0x0,%edi
   1aa36:	ba 00 00 00 00       	mov    $0x0,%edx
   1aa3b:	eb 11                	jmp    1aa4e <Spawner+0xa1>
   1aa3d:	8b 48 04             	mov    0x4(%eax),%ecx
   1aa40:	03 08                	add    (%eax),%ecx
   1aa42:	39 cf                	cmp    %ecx,%edi
   1aa44:	73 02                	jae    1aa48 <Spawner+0x9b>
   1aa46:	89 cf                	mov    %ecx,%edi
   1aa48:	83 c2 01             	add    $0x1,%edx
   1aa4b:	83 c0 14             	add    $0x14,%eax
   1aa4e:	39 da                	cmp    %ebx,%edx
   1aa50:	7c eb                	jl     1aa3d <Spawner+0x90>
   1aa52:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
   1aa58:	74 0c                	je     1aa66 <Spawner+0xb9>
   1aa5a:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
   1aa60:	81 c7 00 10 00 00    	add    $0x1000,%edi
   1aa66:	81 c7 00 10 00 00    	add    $0x1000,%edi
   1aa6c:	89 3c 24             	mov    %edi,(%esp)
   1aa6f:	e8 fc 91 ff ff       	call   13c70 <Malloc>
   1aa74:	a3 b8 03 02 00       	mov    %eax,0x203b8
   1aa79:	89 7c 24 08          	mov    %edi,0x8(%esp)
   1aa7d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   1aa84:	00 
   1aa85:	89 04 24             	mov    %eax,(%esp)
   1aa88:	e8 83 1c 00 00       	call   1c710 <memset>
   1aa8d:	8d 5d a0             	lea    -0x60(%ebp),%ebx
   1aa90:	be 00 00 00 00       	mov    $0x0,%esi
   1aa95:	eb 26                	jmp    1aabd <Spawner+0x110>
   1aa97:	a1 b8 03 02 00       	mov    0x203b8,%eax
   1aa9c:	03 43 04             	add    0x4(%ebx),%eax
   1aa9f:	8b 55 94             	mov    -0x6c(%ebp),%edx
   1aaa2:	03 53 fc             	add    -0x4(%ebx),%edx
   1aaa5:	8b 0b                	mov    (%ebx),%ecx
   1aaa7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
   1aaab:	89 54 24 04          	mov    %edx,0x4(%esp)
   1aaaf:	89 04 24             	mov    %eax,(%esp)
   1aab2:	e8 7c 1c 00 00       	call   1c733 <memcpy>
   1aab7:	83 c6 01             	add    $0x1,%esi
   1aaba:	83 c3 14             	add    $0x14,%ebx
   1aabd:	3b 75 d8             	cmp    -0x28(%ebp),%esi
   1aac0:	7c d5                	jl     1aa97 <Spawner+0xea>
   1aac2:	e8 7c 82 ff ff       	call   12d43 <Allocate_Segment_Descriptor>
   1aac7:	89 c3                	mov    %eax,%ebx
   1aac9:	89 fe                	mov    %edi,%esi
   1aacb:	c1 ee 0c             	shr    $0xc,%esi
   1aace:	83 c6 0a             	add    $0xa,%esi
   1aad1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
   1aad8:	00 
   1aad9:	89 74 24 08          	mov    %esi,0x8(%esp)
   1aadd:	a1 b8 03 02 00       	mov    0x203b8,%eax
   1aae2:	89 44 24 04          	mov    %eax,0x4(%esp)
   1aae6:	89 1c 24             	mov    %ebx,(%esp)
   1aae9:	e8 eb 87 ff ff       	call   132d9 <Init_Code_Segment_Descriptor>
   1aaee:	89 1c 24             	mov    %ebx,(%esp)
   1aaf1:	e8 ba 80 ff ff       	call   12bb0 <Get_Descriptor_Index>
   1aaf6:	89 c7                	mov    %eax,%edi
   1aaf8:	e8 46 82 ff ff       	call   12d43 <Allocate_Segment_Descriptor>
   1aafd:	89 c3                	mov    %eax,%ebx
   1aaff:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
   1ab06:	00 
   1ab07:	89 74 24 08          	mov    %esi,0x8(%esp)
   1ab0b:	a1 b8 03 02 00       	mov    0x203b8,%eax
   1ab10:	89 44 24 04          	mov    %eax,0x4(%esp)
   1ab14:	89 1c 24             	mov    %ebx,(%esp)
   1ab17:	e8 9a 86 ff ff       	call   131b6 <Init_Data_Segment_Descriptor>
   1ab1c:	89 1c 24             	mov    %ebx,(%esp)
   1ab1f:	e8 8c 80 ff ff       	call   12bb0 <Get_Descriptor_Index>
   1ab24:	89 c3                	mov    %eax,%ebx
   1ab26:	c7 44 24 04 88 a9 01 	movl   $0x1a988,0x4(%esp)
   1ab2d:	00 
   1ab2e:	c7 04 24 90 00 00 00 	movl   $0x90,(%esp)
   1ab35:	e8 0f 55 ff ff       	call   10049 <Install_Interrupt_Handler>
   1ab3a:	8b 45 dc             	mov    -0x24(%ebp),%eax
   1ab3d:	89 44 24 08          	mov    %eax,0x8(%esp)
   1ab41:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
   1ab48:	0f b7 c0             	movzwl %ax,%eax
   1ab4b:	89 44 24 04          	mov    %eax,0x4(%esp)
   1ab4f:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
   1ab56:	0f b7 c0             	movzwl %ax,%eax
   1ab59:	89 04 24             	mov    %eax,(%esp)
   1ab5c:	e8 2f 13 00 00       	call   1be90 <Trampoline>
   1ab61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   1ab64:	89 04 24             	mov    %eax,(%esp)
   1ab67:	e8 9b 92 ff ff       	call   13e07 <Free>
   1ab6c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   1ab73:	c7 04 24 d8 ed 01 00 	movl   $0x1edd8,(%esp)
   1ab7a:	e8 3d 64 ff ff       	call   10fbc <Print>
   1ab7f:	c7 04 24 7c ed 01 00 	movl   $0x1ed7c,(%esp)
   1ab86:	e8 31 64 ff ff       	call   10fbc <Print>
   1ab8b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   1ab92:	e8 8b ab ff ff       	call   15722 <Exit>
   1ab97:	e8 b5 57 ff ff       	call   10351 <Interrupts_Enabled>
   1ab9c:	84 c0                	test   %al,%al
   1ab9e:	75 4a                	jne    1abea <Spawner+0x23d>
   1aba0:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1aba7:	e8 47 65 ff ff       	call   110f3 <Set_Current_Attr>
   1abac:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1abb1:	89 44 24 18          	mov    %eax,0x18(%esp)
   1abb5:	8b 45 04             	mov    0x4(%ebp),%eax
   1abb8:	89 44 24 14          	mov    %eax,0x14(%esp)
   1abbc:	c7 44 24 10 ae 00 00 	movl   $0xae,0x10(%esp)
   1abc3:	00 
   1abc4:	c7 44 24 0c 9a ed 01 	movl   $0x1ed9a,0xc(%esp)
   1abcb:	00 
   1abcc:	c7 44 24 08 5f cd 01 	movl   $0x1cd5f,0x8(%esp)
   1abd3:	00 
   1abd4:	c7 44 24 04 02 ee 01 	movl   $0x1ee02,0x4(%esp)
   1abdb:	00 
   1abdc:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1abe3:	e8 d4 63 ff ff       	call   10fbc <Print>
   1abe8:	eb fe                	jmp    1abe8 <Spawner+0x23b>
   1abea:	fa                   	cli    
   1abeb:	a1 b8 03 02 00       	mov    0x203b8,%eax
   1abf0:	89 04 24             	mov    %eax,(%esp)
   1abf3:	e8 0f 92 ff ff       	call   13e07 <Free>
   1abf8:	e8 54 57 ff ff       	call   10351 <Interrupts_Enabled>
   1abfd:	84 c0                	test   %al,%al
   1abff:	74 4a                	je     1ac4b <Spawner+0x29e>
   1ac01:	c7 04 24 4f 00 00 00 	movl   $0x4f,(%esp)
   1ac08:	e8 e6 64 ff ff       	call   110f3 <Set_Current_Attr>
   1ac0d:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1ac12:	89 44 24 18          	mov    %eax,0x18(%esp)
   1ac16:	8b 45 04             	mov    0x4(%ebp),%eax
   1ac19:	89 44 24 14          	mov    %eax,0x14(%esp)
   1ac1d:	c7 44 24 10 b2 00 00 	movl   $0xb2,0x10(%esp)
   1ac24:	00 
   1ac25:	c7 44 24 0c 9a ed 01 	movl   $0x1ed9a,0xc(%esp)
   1ac2c:	00 
   1ac2d:	c7 44 24 08 5e cd 01 	movl   $0x1cd5e,0x8(%esp)
   1ac34:	00 
   1ac35:	c7 44 24 04 02 ee 01 	movl   $0x1ee02,0x4(%esp)
   1ac3c:	00 
   1ac3d:	c7 04 24 1c cc 01 00 	movl   $0x1cc1c,(%esp)
   1ac44:	e8 73 63 ff ff       	call   10fbc <Print>
   1ac49:	eb fe                	jmp    1ac49 <Spawner+0x29c>
   1ac4b:	fb                   	sti    
   1ac4c:	81 c4 8c 00 00 00    	add    $0x8c,%esp
   1ac52:	5b                   	pop    %ebx
   1ac53:	5e                   	pop    %esi
   1ac54:	5f                   	pop    %edi
   1ac55:	5d                   	pop    %ebp
   1ac56:	c3                   	ret    
   1ac57:	90                   	nop
   1ac58:	90                   	nop
   1ac59:	90                   	nop
   1ac5a:	90                   	nop
   1ac5b:	90                   	nop
   1ac5c:	90                   	nop
   1ac5d:	90                   	nop
   1ac5e:	90                   	nop
   1ac5f:	90                   	nop

0001ac60 <Main>:
   1ac60:	55                   	push   %ebp
   1ac61:	89 e5                	mov    %esp,%ebp
   1ac63:	83 ec 18             	sub    $0x18,%esp
   1ac66:	e8 d4 78 ff ff       	call   1253f <Init_BSS>
   1ac6b:	e8 3a 72 ff ff       	call   11eaa <Init_Screen>
   1ac70:	8b 45 08             	mov    0x8(%ebp),%eax
   1ac73:	89 04 24             	mov    %eax,(%esp)
   1ac76:	e8 d2 7a ff ff       	call   1274d <Init_Mem>
   1ac7b:	e8 08 7e ff ff       	call   12a88 <Init_CRC32>
   1ac80:	e8 95 83 ff ff       	call   1301a <Init_TSS>
   1ac85:	e8 da 56 ff ff       	call   10364 <Init_Interrupts>
   1ac8a:	e8 a8 af ff ff       	call   15c37 <Init_Scheduler>
   1ac8f:	90                   	nop
   1ac90:	e8 57 57 ff ff       	call   103ec <Init_Traps>
   1ac95:	e8 a6 73 ff ff       	call   12040 <Init_Timer>
   1ac9a:	e8 9f 5d ff ff       	call   10a3e <Init_Keyboard>
   1ac9f:	90                   	nop
   1aca0:	e8 09 bc ff ff       	call   168ae <Init_DMA>
   1aca5:	e8 7e c2 ff ff       	call   16f28 <Init_Floppy>
   1acaa:	e8 1e d8 ff ff       	call   184cd <Init_IDE>
   1acaf:	90                   	nop
   1acb0:	e8 a5 f6 ff ff       	call   1a35a <Init_PFAT>
   1acb5:	c7 44 24 08 03 ea 01 	movl   $0x1ea03,0x8(%esp)
   1acbc:	00 
   1acbd:	c7 44 24 04 02 d4 01 	movl   $0x1d402,0x4(%esp)
   1acc4:	00 
   1acc5:	c7 04 24 0a ee 01 00 	movl   $0x1ee0a,(%esp)
   1accc:	e8 d8 e8 ff ff       	call   195a9 <Mount>
   1acd1:	85 c0                	test   %eax,%eax
   1acd3:	74 0e                	je     1ace3 <Main+0x83>
   1acd5:	c7 04 24 3c ee 01 00 	movl   $0x1ee3c,(%esp)
   1acdc:	e8 db 62 ff ff       	call   10fbc <Print>
   1ace1:	eb 0c                	jmp    1acef <Main+0x8f>
   1ace3:	c7 04 24 0f ee 01 00 	movl   $0x1ee0f,(%esp)
   1acea:	e8 cd 62 ff ff       	call   10fbc <Print>
   1acef:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
   1acf6:	e8 f8 63 ff ff       	call   110f3 <Set_Current_Attr>
   1acfb:	c7 04 24 27 ee 01 00 	movl   $0x1ee27,(%esp)
   1ad02:	e8 b5 62 ff ff       	call   10fbc <Print>
   1ad07:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
   1ad0e:	e8 e0 63 ff ff       	call   110f3 <Set_Current_Attr>
   1ad13:	c7 04 24 5c ee 01 00 	movl   $0x1ee5c,(%esp)
   1ad1a:	e8 9d 62 ff ff       	call   10fbc <Print>
   1ad1f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
   1ad26:	00 
   1ad27:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
   1ad2e:	00 
   1ad2f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
   1ad36:	00 
   1ad37:	c7 04 24 ad a9 01 00 	movl   $0x1a9ad,(%esp)
   1ad3e:	e8 fd ac ff ff       	call   15a40 <Start_Kernel_Thread>
   1ad43:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   1ad4a:	e8 d3 a9 ff ff       	call   15722 <Exit>
   1ad4f:	90                   	nop

0001ad50 <Load_IDTR>:
   1ad50:	8b 44 24 04          	mov    0x4(%esp),%eax
   1ad54:	0f 01 18             	lidtl  (%eax)
   1ad57:	c3                   	ret    

0001ad58 <Load_GDTR>:
   1ad58:	8b 44 24 04          	mov    0x4(%esp),%eax
   1ad5c:	0f 01 10             	lgdtl  (%eax)
   1ad5f:	66 b8 10 00          	mov    $0x10,%ax
   1ad63:	8e d8                	mov    %eax,%ds
   1ad65:	8e c0                	mov    %eax,%es
   1ad67:	8e e0                	mov    %eax,%fs
   1ad69:	8e e8                	mov    %eax,%gs
   1ad6b:	8e d0                	mov    %eax,%ss
   1ad6d:	ea 74 ad 01 00 08 00 	ljmp   $0x8,$0x1ad74

0001ad74 <Load_GDTR.here>:
   1ad74:	c3                   	ret    
   1ad75:	90                   	nop
   1ad76:	90                   	nop
   1ad77:	90                   	nop

0001ad78 <Load_LDTR>:
   1ad78:	8b 44 24 04          	mov    0x4(%esp),%eax
   1ad7c:	0f 00 d0             	lldt   %ax
   1ad7f:	c3                   	ret    

0001ad80 <Handle_Interrupt>:
   1ad80:	50                   	push   %eax
   1ad81:	53                   	push   %ebx
   1ad82:	51                   	push   %ecx
   1ad83:	52                   	push   %edx
   1ad84:	56                   	push   %esi
   1ad85:	57                   	push   %edi
   1ad86:	55                   	push   %ebp
   1ad87:	1e                   	push   %ds
   1ad88:	06                   	push   %es
   1ad89:	0f a0                	push   %fs
   1ad8b:	0f a8                	push   %gs
   1ad8d:	66 b8 10 00          	mov    $0x10,%ax
   1ad91:	8e d8                	mov    %eax,%ds
   1ad93:	8e c0                	mov    %eax,%es
   1ad95:	b8 c0 03 02 00       	mov    $0x203c0,%eax
   1ad9a:	8b 74 24 2c          	mov    0x2c(%esp),%esi
   1ad9e:	8b 1c b0             	mov    (%eax,%esi,4),%ebx
   1ada1:	54                   	push   %esp
   1ada2:	ff d3                	call   *%ebx
   1ada4:	81 c4 04 00 00 00    	add    $0x4,%esp
   1adaa:	81 3d cc 07 02 00 00 	cmpl   $0x0,0x207cc
   1adb1:	00 00 00 
   1adb4:	75 41                	jne    1adf7 <Handle_Interrupt.restore>
   1adb6:	81 3d d4 07 02 00 00 	cmpl   $0x0,0x207d4
   1adbd:	00 00 00 
   1adc0:	74 35                	je     1adf7 <Handle_Interrupt.restore>
   1adc2:	ff 35 d0 07 02 00    	pushl  0x207d0
   1adc8:	e8 4e a3 ff ff       	call   1511b <Make_Runnable>
   1adcd:	81 c4 04 00 00 00    	add    $0x4,%esp
   1add3:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1add8:	89 20                	mov    %esp,(%eax)
   1adda:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   1ade1:	e8 97 9f ff ff       	call   14d7d <Get_Next_Runnable>
   1ade6:	a3 d0 07 02 00       	mov    %eax,0x207d0
   1adeb:	8b 20                	mov    (%eax),%esp
   1aded:	c7 05 d4 07 02 00 00 	movl   $0x0,0x207d4
   1adf4:	00 00 00 

0001adf7 <Handle_Interrupt.restore>:
   1adf7:	0f a9                	pop    %gs
   1adf9:	0f a1                	pop    %fs
   1adfb:	07                   	pop    %es
   1adfc:	1f                   	pop    %ds
   1adfd:	5d                   	pop    %ebp
   1adfe:	5f                   	pop    %edi
   1adff:	5e                   	pop    %esi
   1ae00:	5a                   	pop    %edx
   1ae01:	59                   	pop    %ecx
   1ae02:	5b                   	pop    %ebx
   1ae03:	58                   	pop    %eax
   1ae04:	81 c4 08 00 00 00    	add    $0x8,%esp
   1ae0a:	cf                   	iret   
   1ae0b:	90                   	nop
   1ae0c:	90                   	nop
   1ae0d:	90                   	nop
   1ae0e:	90                   	nop
   1ae0f:	90                   	nop

0001ae10 <Switch_To_Thread>:
   1ae10:	50                   	push   %eax
   1ae11:	8b 44 24 04          	mov    0x4(%esp),%eax
   1ae15:	89 44 24 fc          	mov    %eax,-0x4(%esp)
   1ae19:	81 c4 08 00 00 00    	add    $0x8,%esp
   1ae1f:	9c                   	pushf  
   1ae20:	8b 44 24 fc          	mov    -0x4(%esp),%eax
   1ae24:	68 08 00 00 00       	push   $0x8
   1ae29:	81 ec 04 00 00 00    	sub    $0x4,%esp
   1ae2f:	68 00 00 00 00       	push   $0x0
   1ae34:	68 00 00 00 00       	push   $0x0
   1ae39:	50                   	push   %eax
   1ae3a:	53                   	push   %ebx
   1ae3b:	51                   	push   %ecx
   1ae3c:	52                   	push   %edx
   1ae3d:	56                   	push   %esi
   1ae3e:	57                   	push   %edi
   1ae3f:	55                   	push   %ebp
   1ae40:	1e                   	push   %ds
   1ae41:	06                   	push   %es
   1ae42:	0f a0                	push   %fs
   1ae44:	0f a8                	push   %gs
   1ae46:	a1 d0 07 02 00       	mov    0x207d0,%eax
   1ae4b:	89 20                	mov    %esp,(%eax)
   1ae4d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   1ae54:	8b 44 24 40          	mov    0x40(%esp),%eax
   1ae58:	a3 d0 07 02 00       	mov    %eax,0x207d0
   1ae5d:	8b 20                	mov    (%eax),%esp
   1ae5f:	0f a9                	pop    %gs
   1ae61:	0f a1                	pop    %fs
   1ae63:	07                   	pop    %es
   1ae64:	1f                   	pop    %ds
   1ae65:	5d                   	pop    %ebp
   1ae66:	5f                   	pop    %edi
   1ae67:	5e                   	pop    %esi
   1ae68:	5a                   	pop    %edx
   1ae69:	59                   	pop    %ecx
   1ae6a:	5b                   	pop    %ebx
   1ae6b:	58                   	pop    %eax
   1ae6c:	81 c4 08 00 00 00    	add    $0x8,%esp
   1ae72:	cf                   	iret   
   1ae73:	90                   	nop
   1ae74:	90                   	nop
   1ae75:	90                   	nop
   1ae76:	90                   	nop
   1ae77:	90                   	nop
   1ae78:	90                   	nop
   1ae79:	90                   	nop
   1ae7a:	90                   	nop
   1ae7b:	90                   	nop
   1ae7c:	90                   	nop
   1ae7d:	90                   	nop
   1ae7e:	90                   	nop
   1ae7f:	90                   	nop

0001ae80 <Get_Current_EFLAGS>:
   1ae80:	9c                   	pushf  
   1ae81:	58                   	pop    %eax
   1ae82:	c3                   	ret    
   1ae83:	90                   	nop
   1ae84:	90                   	nop
   1ae85:	90                   	nop
   1ae86:	90                   	nop
   1ae87:	90                   	nop

0001ae88 <g_entryPointTableStart>:
   1ae88:	68 00 00 00 00       	push   $0x0
   1ae8d:	68 00 00 00 00       	push   $0x0
   1ae92:	e9 e9 fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1ae97:	90                   	nop

0001ae98 <Before_No_Err>:
   1ae98:	68 00 00 00 00       	push   $0x0
   1ae9d:	68 01 00 00 00       	push   $0x1
   1aea2:	e9 d9 fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1aea7:	90                   	nop

0001aea8 <After_No_Err>:
   1aea8:	68 00 00 00 00       	push   $0x0
   1aead:	68 02 00 00 00       	push   $0x2
   1aeb2:	e9 c9 fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1aeb7:	90                   	nop
   1aeb8:	68 00 00 00 00       	push   $0x0
   1aebd:	68 03 00 00 00       	push   $0x3
   1aec2:	e9 b9 fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1aec7:	90                   	nop
   1aec8:	68 00 00 00 00       	push   $0x0
   1aecd:	68 04 00 00 00       	push   $0x4
   1aed2:	e9 a9 fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1aed7:	90                   	nop
   1aed8:	68 00 00 00 00       	push   $0x0
   1aedd:	68 05 00 00 00       	push   $0x5
   1aee2:	e9 99 fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1aee7:	90                   	nop
   1aee8:	68 00 00 00 00       	push   $0x0
   1aeed:	68 06 00 00 00       	push   $0x6
   1aef2:	e9 89 fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1aef7:	90                   	nop
   1aef8:	68 00 00 00 00       	push   $0x0
   1aefd:	68 07 00 00 00       	push   $0x7
   1af02:	e9 79 fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1af07:	90                   	nop

0001af08 <Before_Err>:
   1af08:	68 08 00 00 00       	push   $0x8
   1af0d:	e9 6e fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1af12:	90                   	nop
   1af13:	90                   	nop
   1af14:	90                   	nop
   1af15:	90                   	nop
   1af16:	90                   	nop
   1af17:	90                   	nop

0001af18 <After_Err>:
   1af18:	68 00 00 00 00       	push   $0x0
   1af1d:	68 09 00 00 00       	push   $0x9
   1af22:	e9 59 fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1af27:	90                   	nop
   1af28:	68 0a 00 00 00       	push   $0xa
   1af2d:	e9 4e fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1af32:	90                   	nop
   1af33:	90                   	nop
   1af34:	90                   	nop
   1af35:	90                   	nop
   1af36:	90                   	nop
   1af37:	90                   	nop
   1af38:	68 0b 00 00 00       	push   $0xb
   1af3d:	e9 3e fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1af42:	90                   	nop
   1af43:	90                   	nop
   1af44:	90                   	nop
   1af45:	90                   	nop
   1af46:	90                   	nop
   1af47:	90                   	nop
   1af48:	68 0c 00 00 00       	push   $0xc
   1af4d:	e9 2e fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1af52:	90                   	nop
   1af53:	90                   	nop
   1af54:	90                   	nop
   1af55:	90                   	nop
   1af56:	90                   	nop
   1af57:	90                   	nop
   1af58:	68 0d 00 00 00       	push   $0xd
   1af5d:	e9 1e fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1af62:	90                   	nop
   1af63:	90                   	nop
   1af64:	90                   	nop
   1af65:	90                   	nop
   1af66:	90                   	nop
   1af67:	90                   	nop
   1af68:	68 0e 00 00 00       	push   $0xe
   1af6d:	e9 0e fe ff ff       	jmp    1ad80 <Handle_Interrupt>
   1af72:	90                   	nop
   1af73:	90                   	nop
   1af74:	90                   	nop
   1af75:	90                   	nop
   1af76:	90                   	nop
   1af77:	90                   	nop
   1af78:	68 00 00 00 00       	push   $0x0
   1af7d:	68 0f 00 00 00       	push   $0xf
   1af82:	e9 f9 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1af87:	90                   	nop
   1af88:	68 00 00 00 00       	push   $0x0
   1af8d:	68 10 00 00 00       	push   $0x10
   1af92:	e9 e9 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1af97:	90                   	nop
   1af98:	68 11 00 00 00       	push   $0x11
   1af9d:	e9 de fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1afa2:	90                   	nop
   1afa3:	90                   	nop
   1afa4:	90                   	nop
   1afa5:	90                   	nop
   1afa6:	90                   	nop
   1afa7:	90                   	nop
   1afa8:	68 00 00 00 00       	push   $0x0
   1afad:	68 12 00 00 00       	push   $0x12
   1afb2:	e9 c9 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1afb7:	90                   	nop
   1afb8:	68 00 00 00 00       	push   $0x0
   1afbd:	68 13 00 00 00       	push   $0x13
   1afc2:	e9 b9 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1afc7:	90                   	nop
   1afc8:	68 00 00 00 00       	push   $0x0
   1afcd:	68 14 00 00 00       	push   $0x14
   1afd2:	e9 a9 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1afd7:	90                   	nop
   1afd8:	68 00 00 00 00       	push   $0x0
   1afdd:	68 15 00 00 00       	push   $0x15
   1afe2:	e9 99 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1afe7:	90                   	nop
   1afe8:	68 00 00 00 00       	push   $0x0
   1afed:	68 16 00 00 00       	push   $0x16
   1aff2:	e9 89 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1aff7:	90                   	nop
   1aff8:	68 00 00 00 00       	push   $0x0
   1affd:	68 17 00 00 00       	push   $0x17
   1b002:	e9 79 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b007:	90                   	nop
   1b008:	68 00 00 00 00       	push   $0x0
   1b00d:	68 18 00 00 00       	push   $0x18
   1b012:	e9 69 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b017:	90                   	nop
   1b018:	68 00 00 00 00       	push   $0x0
   1b01d:	68 19 00 00 00       	push   $0x19
   1b022:	e9 59 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b027:	90                   	nop
   1b028:	68 00 00 00 00       	push   $0x0
   1b02d:	68 1a 00 00 00       	push   $0x1a
   1b032:	e9 49 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b037:	90                   	nop
   1b038:	68 00 00 00 00       	push   $0x0
   1b03d:	68 1b 00 00 00       	push   $0x1b
   1b042:	e9 39 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b047:	90                   	nop
   1b048:	68 00 00 00 00       	push   $0x0
   1b04d:	68 1c 00 00 00       	push   $0x1c
   1b052:	e9 29 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b057:	90                   	nop
   1b058:	68 00 00 00 00       	push   $0x0
   1b05d:	68 1d 00 00 00       	push   $0x1d
   1b062:	e9 19 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b067:	90                   	nop
   1b068:	68 00 00 00 00       	push   $0x0
   1b06d:	68 1e 00 00 00       	push   $0x1e
   1b072:	e9 09 fd ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b077:	90                   	nop
   1b078:	68 00 00 00 00       	push   $0x0
   1b07d:	68 1f 00 00 00       	push   $0x1f
   1b082:	e9 f9 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b087:	90                   	nop
   1b088:	68 00 00 00 00       	push   $0x0
   1b08d:	68 20 00 00 00       	push   $0x20
   1b092:	e9 e9 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b097:	90                   	nop
   1b098:	68 00 00 00 00       	push   $0x0
   1b09d:	68 21 00 00 00       	push   $0x21
   1b0a2:	e9 d9 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b0a7:	90                   	nop
   1b0a8:	68 00 00 00 00       	push   $0x0
   1b0ad:	68 22 00 00 00       	push   $0x22
   1b0b2:	e9 c9 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b0b7:	90                   	nop
   1b0b8:	68 00 00 00 00       	push   $0x0
   1b0bd:	68 23 00 00 00       	push   $0x23
   1b0c2:	e9 b9 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b0c7:	90                   	nop
   1b0c8:	68 00 00 00 00       	push   $0x0
   1b0cd:	68 24 00 00 00       	push   $0x24
   1b0d2:	e9 a9 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b0d7:	90                   	nop
   1b0d8:	68 00 00 00 00       	push   $0x0
   1b0dd:	68 25 00 00 00       	push   $0x25
   1b0e2:	e9 99 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b0e7:	90                   	nop
   1b0e8:	68 00 00 00 00       	push   $0x0
   1b0ed:	68 26 00 00 00       	push   $0x26
   1b0f2:	e9 89 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b0f7:	90                   	nop
   1b0f8:	68 00 00 00 00       	push   $0x0
   1b0fd:	68 27 00 00 00       	push   $0x27
   1b102:	e9 79 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b107:	90                   	nop
   1b108:	68 00 00 00 00       	push   $0x0
   1b10d:	68 28 00 00 00       	push   $0x28
   1b112:	e9 69 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b117:	90                   	nop
   1b118:	68 00 00 00 00       	push   $0x0
   1b11d:	68 29 00 00 00       	push   $0x29
   1b122:	e9 59 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b127:	90                   	nop
   1b128:	68 00 00 00 00       	push   $0x0
   1b12d:	68 2a 00 00 00       	push   $0x2a
   1b132:	e9 49 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b137:	90                   	nop
   1b138:	68 00 00 00 00       	push   $0x0
   1b13d:	68 2b 00 00 00       	push   $0x2b
   1b142:	e9 39 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b147:	90                   	nop
   1b148:	68 00 00 00 00       	push   $0x0
   1b14d:	68 2c 00 00 00       	push   $0x2c
   1b152:	e9 29 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b157:	90                   	nop
   1b158:	68 00 00 00 00       	push   $0x0
   1b15d:	68 2d 00 00 00       	push   $0x2d
   1b162:	e9 19 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b167:	90                   	nop
   1b168:	68 00 00 00 00       	push   $0x0
   1b16d:	68 2e 00 00 00       	push   $0x2e
   1b172:	e9 09 fc ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b177:	90                   	nop
   1b178:	68 00 00 00 00       	push   $0x0
   1b17d:	68 2f 00 00 00       	push   $0x2f
   1b182:	e9 f9 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b187:	90                   	nop
   1b188:	68 00 00 00 00       	push   $0x0
   1b18d:	68 30 00 00 00       	push   $0x30
   1b192:	e9 e9 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b197:	90                   	nop
   1b198:	68 00 00 00 00       	push   $0x0
   1b19d:	68 31 00 00 00       	push   $0x31
   1b1a2:	e9 d9 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b1a7:	90                   	nop
   1b1a8:	68 00 00 00 00       	push   $0x0
   1b1ad:	68 32 00 00 00       	push   $0x32
   1b1b2:	e9 c9 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b1b7:	90                   	nop
   1b1b8:	68 00 00 00 00       	push   $0x0
   1b1bd:	68 33 00 00 00       	push   $0x33
   1b1c2:	e9 b9 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b1c7:	90                   	nop
   1b1c8:	68 00 00 00 00       	push   $0x0
   1b1cd:	68 34 00 00 00       	push   $0x34
   1b1d2:	e9 a9 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b1d7:	90                   	nop
   1b1d8:	68 00 00 00 00       	push   $0x0
   1b1dd:	68 35 00 00 00       	push   $0x35
   1b1e2:	e9 99 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b1e7:	90                   	nop
   1b1e8:	68 00 00 00 00       	push   $0x0
   1b1ed:	68 36 00 00 00       	push   $0x36
   1b1f2:	e9 89 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b1f7:	90                   	nop
   1b1f8:	68 00 00 00 00       	push   $0x0
   1b1fd:	68 37 00 00 00       	push   $0x37
   1b202:	e9 79 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b207:	90                   	nop
   1b208:	68 00 00 00 00       	push   $0x0
   1b20d:	68 38 00 00 00       	push   $0x38
   1b212:	e9 69 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b217:	90                   	nop
   1b218:	68 00 00 00 00       	push   $0x0
   1b21d:	68 39 00 00 00       	push   $0x39
   1b222:	e9 59 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b227:	90                   	nop
   1b228:	68 00 00 00 00       	push   $0x0
   1b22d:	68 3a 00 00 00       	push   $0x3a
   1b232:	e9 49 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b237:	90                   	nop
   1b238:	68 00 00 00 00       	push   $0x0
   1b23d:	68 3b 00 00 00       	push   $0x3b
   1b242:	e9 39 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b247:	90                   	nop
   1b248:	68 00 00 00 00       	push   $0x0
   1b24d:	68 3c 00 00 00       	push   $0x3c
   1b252:	e9 29 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b257:	90                   	nop
   1b258:	68 00 00 00 00       	push   $0x0
   1b25d:	68 3d 00 00 00       	push   $0x3d
   1b262:	e9 19 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b267:	90                   	nop
   1b268:	68 00 00 00 00       	push   $0x0
   1b26d:	68 3e 00 00 00       	push   $0x3e
   1b272:	e9 09 fb ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b277:	90                   	nop
   1b278:	68 00 00 00 00       	push   $0x0
   1b27d:	68 3f 00 00 00       	push   $0x3f
   1b282:	e9 f9 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b287:	90                   	nop
   1b288:	68 00 00 00 00       	push   $0x0
   1b28d:	68 40 00 00 00       	push   $0x40
   1b292:	e9 e9 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b297:	90                   	nop
   1b298:	68 00 00 00 00       	push   $0x0
   1b29d:	68 41 00 00 00       	push   $0x41
   1b2a2:	e9 d9 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b2a7:	90                   	nop
   1b2a8:	68 00 00 00 00       	push   $0x0
   1b2ad:	68 42 00 00 00       	push   $0x42
   1b2b2:	e9 c9 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b2b7:	90                   	nop
   1b2b8:	68 00 00 00 00       	push   $0x0
   1b2bd:	68 43 00 00 00       	push   $0x43
   1b2c2:	e9 b9 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b2c7:	90                   	nop
   1b2c8:	68 00 00 00 00       	push   $0x0
   1b2cd:	68 44 00 00 00       	push   $0x44
   1b2d2:	e9 a9 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b2d7:	90                   	nop
   1b2d8:	68 00 00 00 00       	push   $0x0
   1b2dd:	68 45 00 00 00       	push   $0x45
   1b2e2:	e9 99 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b2e7:	90                   	nop
   1b2e8:	68 00 00 00 00       	push   $0x0
   1b2ed:	68 46 00 00 00       	push   $0x46
   1b2f2:	e9 89 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b2f7:	90                   	nop
   1b2f8:	68 00 00 00 00       	push   $0x0
   1b2fd:	68 47 00 00 00       	push   $0x47
   1b302:	e9 79 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b307:	90                   	nop
   1b308:	68 00 00 00 00       	push   $0x0
   1b30d:	68 48 00 00 00       	push   $0x48
   1b312:	e9 69 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b317:	90                   	nop
   1b318:	68 00 00 00 00       	push   $0x0
   1b31d:	68 49 00 00 00       	push   $0x49
   1b322:	e9 59 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b327:	90                   	nop
   1b328:	68 00 00 00 00       	push   $0x0
   1b32d:	68 4a 00 00 00       	push   $0x4a
   1b332:	e9 49 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b337:	90                   	nop
   1b338:	68 00 00 00 00       	push   $0x0
   1b33d:	68 4b 00 00 00       	push   $0x4b
   1b342:	e9 39 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b347:	90                   	nop
   1b348:	68 00 00 00 00       	push   $0x0
   1b34d:	68 4c 00 00 00       	push   $0x4c
   1b352:	e9 29 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b357:	90                   	nop
   1b358:	68 00 00 00 00       	push   $0x0
   1b35d:	68 4d 00 00 00       	push   $0x4d
   1b362:	e9 19 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b367:	90                   	nop
   1b368:	68 00 00 00 00       	push   $0x0
   1b36d:	68 4e 00 00 00       	push   $0x4e
   1b372:	e9 09 fa ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b377:	90                   	nop
   1b378:	68 00 00 00 00       	push   $0x0
   1b37d:	68 4f 00 00 00       	push   $0x4f
   1b382:	e9 f9 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b387:	90                   	nop
   1b388:	68 00 00 00 00       	push   $0x0
   1b38d:	68 50 00 00 00       	push   $0x50
   1b392:	e9 e9 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b397:	90                   	nop
   1b398:	68 00 00 00 00       	push   $0x0
   1b39d:	68 51 00 00 00       	push   $0x51
   1b3a2:	e9 d9 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b3a7:	90                   	nop
   1b3a8:	68 00 00 00 00       	push   $0x0
   1b3ad:	68 52 00 00 00       	push   $0x52
   1b3b2:	e9 c9 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b3b7:	90                   	nop
   1b3b8:	68 00 00 00 00       	push   $0x0
   1b3bd:	68 53 00 00 00       	push   $0x53
   1b3c2:	e9 b9 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b3c7:	90                   	nop
   1b3c8:	68 00 00 00 00       	push   $0x0
   1b3cd:	68 54 00 00 00       	push   $0x54
   1b3d2:	e9 a9 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b3d7:	90                   	nop
   1b3d8:	68 00 00 00 00       	push   $0x0
   1b3dd:	68 55 00 00 00       	push   $0x55
   1b3e2:	e9 99 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b3e7:	90                   	nop
   1b3e8:	68 00 00 00 00       	push   $0x0
   1b3ed:	68 56 00 00 00       	push   $0x56
   1b3f2:	e9 89 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b3f7:	90                   	nop
   1b3f8:	68 00 00 00 00       	push   $0x0
   1b3fd:	68 57 00 00 00       	push   $0x57
   1b402:	e9 79 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b407:	90                   	nop
   1b408:	68 00 00 00 00       	push   $0x0
   1b40d:	68 58 00 00 00       	push   $0x58
   1b412:	e9 69 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b417:	90                   	nop
   1b418:	68 00 00 00 00       	push   $0x0
   1b41d:	68 59 00 00 00       	push   $0x59
   1b422:	e9 59 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b427:	90                   	nop
   1b428:	68 00 00 00 00       	push   $0x0
   1b42d:	68 5a 00 00 00       	push   $0x5a
   1b432:	e9 49 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b437:	90                   	nop
   1b438:	68 00 00 00 00       	push   $0x0
   1b43d:	68 5b 00 00 00       	push   $0x5b
   1b442:	e9 39 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b447:	90                   	nop
   1b448:	68 00 00 00 00       	push   $0x0
   1b44d:	68 5c 00 00 00       	push   $0x5c
   1b452:	e9 29 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b457:	90                   	nop
   1b458:	68 00 00 00 00       	push   $0x0
   1b45d:	68 5d 00 00 00       	push   $0x5d
   1b462:	e9 19 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b467:	90                   	nop
   1b468:	68 00 00 00 00       	push   $0x0
   1b46d:	68 5e 00 00 00       	push   $0x5e
   1b472:	e9 09 f9 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b477:	90                   	nop
   1b478:	68 00 00 00 00       	push   $0x0
   1b47d:	68 5f 00 00 00       	push   $0x5f
   1b482:	e9 f9 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b487:	90                   	nop
   1b488:	68 00 00 00 00       	push   $0x0
   1b48d:	68 60 00 00 00       	push   $0x60
   1b492:	e9 e9 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b497:	90                   	nop
   1b498:	68 00 00 00 00       	push   $0x0
   1b49d:	68 61 00 00 00       	push   $0x61
   1b4a2:	e9 d9 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b4a7:	90                   	nop
   1b4a8:	68 00 00 00 00       	push   $0x0
   1b4ad:	68 62 00 00 00       	push   $0x62
   1b4b2:	e9 c9 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b4b7:	90                   	nop
   1b4b8:	68 00 00 00 00       	push   $0x0
   1b4bd:	68 63 00 00 00       	push   $0x63
   1b4c2:	e9 b9 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b4c7:	90                   	nop
   1b4c8:	68 00 00 00 00       	push   $0x0
   1b4cd:	68 64 00 00 00       	push   $0x64
   1b4d2:	e9 a9 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b4d7:	90                   	nop
   1b4d8:	68 00 00 00 00       	push   $0x0
   1b4dd:	68 65 00 00 00       	push   $0x65
   1b4e2:	e9 99 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b4e7:	90                   	nop
   1b4e8:	68 00 00 00 00       	push   $0x0
   1b4ed:	68 66 00 00 00       	push   $0x66
   1b4f2:	e9 89 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b4f7:	90                   	nop
   1b4f8:	68 00 00 00 00       	push   $0x0
   1b4fd:	68 67 00 00 00       	push   $0x67
   1b502:	e9 79 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b507:	90                   	nop
   1b508:	68 00 00 00 00       	push   $0x0
   1b50d:	68 68 00 00 00       	push   $0x68
   1b512:	e9 69 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b517:	90                   	nop
   1b518:	68 00 00 00 00       	push   $0x0
   1b51d:	68 69 00 00 00       	push   $0x69
   1b522:	e9 59 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b527:	90                   	nop
   1b528:	68 00 00 00 00       	push   $0x0
   1b52d:	68 6a 00 00 00       	push   $0x6a
   1b532:	e9 49 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b537:	90                   	nop
   1b538:	68 00 00 00 00       	push   $0x0
   1b53d:	68 6b 00 00 00       	push   $0x6b
   1b542:	e9 39 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b547:	90                   	nop
   1b548:	68 00 00 00 00       	push   $0x0
   1b54d:	68 6c 00 00 00       	push   $0x6c
   1b552:	e9 29 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b557:	90                   	nop
   1b558:	68 00 00 00 00       	push   $0x0
   1b55d:	68 6d 00 00 00       	push   $0x6d
   1b562:	e9 19 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b567:	90                   	nop
   1b568:	68 00 00 00 00       	push   $0x0
   1b56d:	68 6e 00 00 00       	push   $0x6e
   1b572:	e9 09 f8 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b577:	90                   	nop
   1b578:	68 00 00 00 00       	push   $0x0
   1b57d:	68 6f 00 00 00       	push   $0x6f
   1b582:	e9 f9 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b587:	90                   	nop
   1b588:	68 00 00 00 00       	push   $0x0
   1b58d:	68 70 00 00 00       	push   $0x70
   1b592:	e9 e9 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b597:	90                   	nop
   1b598:	68 00 00 00 00       	push   $0x0
   1b59d:	68 71 00 00 00       	push   $0x71
   1b5a2:	e9 d9 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b5a7:	90                   	nop
   1b5a8:	68 00 00 00 00       	push   $0x0
   1b5ad:	68 72 00 00 00       	push   $0x72
   1b5b2:	e9 c9 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b5b7:	90                   	nop
   1b5b8:	68 00 00 00 00       	push   $0x0
   1b5bd:	68 73 00 00 00       	push   $0x73
   1b5c2:	e9 b9 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b5c7:	90                   	nop
   1b5c8:	68 00 00 00 00       	push   $0x0
   1b5cd:	68 74 00 00 00       	push   $0x74
   1b5d2:	e9 a9 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b5d7:	90                   	nop
   1b5d8:	68 00 00 00 00       	push   $0x0
   1b5dd:	68 75 00 00 00       	push   $0x75
   1b5e2:	e9 99 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b5e7:	90                   	nop
   1b5e8:	68 00 00 00 00       	push   $0x0
   1b5ed:	68 76 00 00 00       	push   $0x76
   1b5f2:	e9 89 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b5f7:	90                   	nop
   1b5f8:	68 00 00 00 00       	push   $0x0
   1b5fd:	68 77 00 00 00       	push   $0x77
   1b602:	e9 79 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b607:	90                   	nop
   1b608:	68 00 00 00 00       	push   $0x0
   1b60d:	68 78 00 00 00       	push   $0x78
   1b612:	e9 69 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b617:	90                   	nop
   1b618:	68 00 00 00 00       	push   $0x0
   1b61d:	68 79 00 00 00       	push   $0x79
   1b622:	e9 59 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b627:	90                   	nop
   1b628:	68 00 00 00 00       	push   $0x0
   1b62d:	68 7a 00 00 00       	push   $0x7a
   1b632:	e9 49 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b637:	90                   	nop
   1b638:	68 00 00 00 00       	push   $0x0
   1b63d:	68 7b 00 00 00       	push   $0x7b
   1b642:	e9 39 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b647:	90                   	nop
   1b648:	68 00 00 00 00       	push   $0x0
   1b64d:	68 7c 00 00 00       	push   $0x7c
   1b652:	e9 29 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b657:	90                   	nop
   1b658:	68 00 00 00 00       	push   $0x0
   1b65d:	68 7d 00 00 00       	push   $0x7d
   1b662:	e9 19 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b667:	90                   	nop
   1b668:	68 00 00 00 00       	push   $0x0
   1b66d:	68 7e 00 00 00       	push   $0x7e
   1b672:	e9 09 f7 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b677:	90                   	nop
   1b678:	68 00 00 00 00       	push   $0x0
   1b67d:	68 7f 00 00 00       	push   $0x7f
   1b682:	e9 f9 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b687:	90                   	nop
   1b688:	68 00 00 00 00       	push   $0x0
   1b68d:	68 80 00 00 00       	push   $0x80
   1b692:	e9 e9 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b697:	90                   	nop
   1b698:	68 00 00 00 00       	push   $0x0
   1b69d:	68 81 00 00 00       	push   $0x81
   1b6a2:	e9 d9 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b6a7:	90                   	nop
   1b6a8:	68 00 00 00 00       	push   $0x0
   1b6ad:	68 82 00 00 00       	push   $0x82
   1b6b2:	e9 c9 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b6b7:	90                   	nop
   1b6b8:	68 00 00 00 00       	push   $0x0
   1b6bd:	68 83 00 00 00       	push   $0x83
   1b6c2:	e9 b9 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b6c7:	90                   	nop
   1b6c8:	68 00 00 00 00       	push   $0x0
   1b6cd:	68 84 00 00 00       	push   $0x84
   1b6d2:	e9 a9 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b6d7:	90                   	nop
   1b6d8:	68 00 00 00 00       	push   $0x0
   1b6dd:	68 85 00 00 00       	push   $0x85
   1b6e2:	e9 99 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b6e7:	90                   	nop
   1b6e8:	68 00 00 00 00       	push   $0x0
   1b6ed:	68 86 00 00 00       	push   $0x86
   1b6f2:	e9 89 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b6f7:	90                   	nop
   1b6f8:	68 00 00 00 00       	push   $0x0
   1b6fd:	68 87 00 00 00       	push   $0x87
   1b702:	e9 79 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b707:	90                   	nop
   1b708:	68 00 00 00 00       	push   $0x0
   1b70d:	68 88 00 00 00       	push   $0x88
   1b712:	e9 69 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b717:	90                   	nop
   1b718:	68 00 00 00 00       	push   $0x0
   1b71d:	68 89 00 00 00       	push   $0x89
   1b722:	e9 59 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b727:	90                   	nop
   1b728:	68 00 00 00 00       	push   $0x0
   1b72d:	68 8a 00 00 00       	push   $0x8a
   1b732:	e9 49 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b737:	90                   	nop
   1b738:	68 00 00 00 00       	push   $0x0
   1b73d:	68 8b 00 00 00       	push   $0x8b
   1b742:	e9 39 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b747:	90                   	nop
   1b748:	68 00 00 00 00       	push   $0x0
   1b74d:	68 8c 00 00 00       	push   $0x8c
   1b752:	e9 29 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b757:	90                   	nop
   1b758:	68 00 00 00 00       	push   $0x0
   1b75d:	68 8d 00 00 00       	push   $0x8d
   1b762:	e9 19 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b767:	90                   	nop
   1b768:	68 00 00 00 00       	push   $0x0
   1b76d:	68 8e 00 00 00       	push   $0x8e
   1b772:	e9 09 f6 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b777:	90                   	nop
   1b778:	68 00 00 00 00       	push   $0x0
   1b77d:	68 8f 00 00 00       	push   $0x8f
   1b782:	e9 f9 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b787:	90                   	nop
   1b788:	68 00 00 00 00       	push   $0x0
   1b78d:	68 90 00 00 00       	push   $0x90
   1b792:	e9 e9 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b797:	90                   	nop
   1b798:	68 00 00 00 00       	push   $0x0
   1b79d:	68 91 00 00 00       	push   $0x91
   1b7a2:	e9 d9 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b7a7:	90                   	nop
   1b7a8:	68 00 00 00 00       	push   $0x0
   1b7ad:	68 92 00 00 00       	push   $0x92
   1b7b2:	e9 c9 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b7b7:	90                   	nop
   1b7b8:	68 00 00 00 00       	push   $0x0
   1b7bd:	68 93 00 00 00       	push   $0x93
   1b7c2:	e9 b9 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b7c7:	90                   	nop
   1b7c8:	68 00 00 00 00       	push   $0x0
   1b7cd:	68 94 00 00 00       	push   $0x94
   1b7d2:	e9 a9 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b7d7:	90                   	nop
   1b7d8:	68 00 00 00 00       	push   $0x0
   1b7dd:	68 95 00 00 00       	push   $0x95
   1b7e2:	e9 99 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b7e7:	90                   	nop
   1b7e8:	68 00 00 00 00       	push   $0x0
   1b7ed:	68 96 00 00 00       	push   $0x96
   1b7f2:	e9 89 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b7f7:	90                   	nop
   1b7f8:	68 00 00 00 00       	push   $0x0
   1b7fd:	68 97 00 00 00       	push   $0x97
   1b802:	e9 79 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b807:	90                   	nop
   1b808:	68 00 00 00 00       	push   $0x0
   1b80d:	68 98 00 00 00       	push   $0x98
   1b812:	e9 69 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b817:	90                   	nop
   1b818:	68 00 00 00 00       	push   $0x0
   1b81d:	68 99 00 00 00       	push   $0x99
   1b822:	e9 59 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b827:	90                   	nop
   1b828:	68 00 00 00 00       	push   $0x0
   1b82d:	68 9a 00 00 00       	push   $0x9a
   1b832:	e9 49 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b837:	90                   	nop
   1b838:	68 00 00 00 00       	push   $0x0
   1b83d:	68 9b 00 00 00       	push   $0x9b
   1b842:	e9 39 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b847:	90                   	nop
   1b848:	68 00 00 00 00       	push   $0x0
   1b84d:	68 9c 00 00 00       	push   $0x9c
   1b852:	e9 29 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b857:	90                   	nop
   1b858:	68 00 00 00 00       	push   $0x0
   1b85d:	68 9d 00 00 00       	push   $0x9d
   1b862:	e9 19 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b867:	90                   	nop
   1b868:	68 00 00 00 00       	push   $0x0
   1b86d:	68 9e 00 00 00       	push   $0x9e
   1b872:	e9 09 f5 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b877:	90                   	nop
   1b878:	68 00 00 00 00       	push   $0x0
   1b87d:	68 9f 00 00 00       	push   $0x9f
   1b882:	e9 f9 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b887:	90                   	nop
   1b888:	68 00 00 00 00       	push   $0x0
   1b88d:	68 a0 00 00 00       	push   $0xa0
   1b892:	e9 e9 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b897:	90                   	nop
   1b898:	68 00 00 00 00       	push   $0x0
   1b89d:	68 a1 00 00 00       	push   $0xa1
   1b8a2:	e9 d9 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b8a7:	90                   	nop
   1b8a8:	68 00 00 00 00       	push   $0x0
   1b8ad:	68 a2 00 00 00       	push   $0xa2
   1b8b2:	e9 c9 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b8b7:	90                   	nop
   1b8b8:	68 00 00 00 00       	push   $0x0
   1b8bd:	68 a3 00 00 00       	push   $0xa3
   1b8c2:	e9 b9 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b8c7:	90                   	nop
   1b8c8:	68 00 00 00 00       	push   $0x0
   1b8cd:	68 a4 00 00 00       	push   $0xa4
   1b8d2:	e9 a9 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b8d7:	90                   	nop
   1b8d8:	68 00 00 00 00       	push   $0x0
   1b8dd:	68 a5 00 00 00       	push   $0xa5
   1b8e2:	e9 99 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b8e7:	90                   	nop
   1b8e8:	68 00 00 00 00       	push   $0x0
   1b8ed:	68 a6 00 00 00       	push   $0xa6
   1b8f2:	e9 89 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b8f7:	90                   	nop
   1b8f8:	68 00 00 00 00       	push   $0x0
   1b8fd:	68 a7 00 00 00       	push   $0xa7
   1b902:	e9 79 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b907:	90                   	nop
   1b908:	68 00 00 00 00       	push   $0x0
   1b90d:	68 a8 00 00 00       	push   $0xa8
   1b912:	e9 69 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b917:	90                   	nop
   1b918:	68 00 00 00 00       	push   $0x0
   1b91d:	68 a9 00 00 00       	push   $0xa9
   1b922:	e9 59 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b927:	90                   	nop
   1b928:	68 00 00 00 00       	push   $0x0
   1b92d:	68 aa 00 00 00       	push   $0xaa
   1b932:	e9 49 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b937:	90                   	nop
   1b938:	68 00 00 00 00       	push   $0x0
   1b93d:	68 ab 00 00 00       	push   $0xab
   1b942:	e9 39 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b947:	90                   	nop
   1b948:	68 00 00 00 00       	push   $0x0
   1b94d:	68 ac 00 00 00       	push   $0xac
   1b952:	e9 29 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b957:	90                   	nop
   1b958:	68 00 00 00 00       	push   $0x0
   1b95d:	68 ad 00 00 00       	push   $0xad
   1b962:	e9 19 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b967:	90                   	nop
   1b968:	68 00 00 00 00       	push   $0x0
   1b96d:	68 ae 00 00 00       	push   $0xae
   1b972:	e9 09 f4 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b977:	90                   	nop
   1b978:	68 00 00 00 00       	push   $0x0
   1b97d:	68 af 00 00 00       	push   $0xaf
   1b982:	e9 f9 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b987:	90                   	nop
   1b988:	68 00 00 00 00       	push   $0x0
   1b98d:	68 b0 00 00 00       	push   $0xb0
   1b992:	e9 e9 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b997:	90                   	nop
   1b998:	68 00 00 00 00       	push   $0x0
   1b99d:	68 b1 00 00 00       	push   $0xb1
   1b9a2:	e9 d9 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b9a7:	90                   	nop
   1b9a8:	68 00 00 00 00       	push   $0x0
   1b9ad:	68 b2 00 00 00       	push   $0xb2
   1b9b2:	e9 c9 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b9b7:	90                   	nop
   1b9b8:	68 00 00 00 00       	push   $0x0
   1b9bd:	68 b3 00 00 00       	push   $0xb3
   1b9c2:	e9 b9 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b9c7:	90                   	nop
   1b9c8:	68 00 00 00 00       	push   $0x0
   1b9cd:	68 b4 00 00 00       	push   $0xb4
   1b9d2:	e9 a9 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b9d7:	90                   	nop
   1b9d8:	68 00 00 00 00       	push   $0x0
   1b9dd:	68 b5 00 00 00       	push   $0xb5
   1b9e2:	e9 99 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b9e7:	90                   	nop
   1b9e8:	68 00 00 00 00       	push   $0x0
   1b9ed:	68 b6 00 00 00       	push   $0xb6
   1b9f2:	e9 89 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1b9f7:	90                   	nop
   1b9f8:	68 00 00 00 00       	push   $0x0
   1b9fd:	68 b7 00 00 00       	push   $0xb7
   1ba02:	e9 79 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1ba07:	90                   	nop
   1ba08:	68 00 00 00 00       	push   $0x0
   1ba0d:	68 b8 00 00 00       	push   $0xb8
   1ba12:	e9 69 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1ba17:	90                   	nop
   1ba18:	68 00 00 00 00       	push   $0x0
   1ba1d:	68 b9 00 00 00       	push   $0xb9
   1ba22:	e9 59 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1ba27:	90                   	nop
   1ba28:	68 00 00 00 00       	push   $0x0
   1ba2d:	68 ba 00 00 00       	push   $0xba
   1ba32:	e9 49 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1ba37:	90                   	nop
   1ba38:	68 00 00 00 00       	push   $0x0
   1ba3d:	68 bb 00 00 00       	push   $0xbb
   1ba42:	e9 39 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1ba47:	90                   	nop
   1ba48:	68 00 00 00 00       	push   $0x0
   1ba4d:	68 bc 00 00 00       	push   $0xbc
   1ba52:	e9 29 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1ba57:	90                   	nop
   1ba58:	68 00 00 00 00       	push   $0x0
   1ba5d:	68 bd 00 00 00       	push   $0xbd
   1ba62:	e9 19 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1ba67:	90                   	nop
   1ba68:	68 00 00 00 00       	push   $0x0
   1ba6d:	68 be 00 00 00       	push   $0xbe
   1ba72:	e9 09 f3 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1ba77:	90                   	nop
   1ba78:	68 00 00 00 00       	push   $0x0
   1ba7d:	68 bf 00 00 00       	push   $0xbf
   1ba82:	e9 f9 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1ba87:	90                   	nop
   1ba88:	68 00 00 00 00       	push   $0x0
   1ba8d:	68 c0 00 00 00       	push   $0xc0
   1ba92:	e9 e9 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1ba97:	90                   	nop
   1ba98:	68 00 00 00 00       	push   $0x0
   1ba9d:	68 c1 00 00 00       	push   $0xc1
   1baa2:	e9 d9 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1baa7:	90                   	nop
   1baa8:	68 00 00 00 00       	push   $0x0
   1baad:	68 c2 00 00 00       	push   $0xc2
   1bab2:	e9 c9 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bab7:	90                   	nop
   1bab8:	68 00 00 00 00       	push   $0x0
   1babd:	68 c3 00 00 00       	push   $0xc3
   1bac2:	e9 b9 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bac7:	90                   	nop
   1bac8:	68 00 00 00 00       	push   $0x0
   1bacd:	68 c4 00 00 00       	push   $0xc4
   1bad2:	e9 a9 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bad7:	90                   	nop
   1bad8:	68 00 00 00 00       	push   $0x0
   1badd:	68 c5 00 00 00       	push   $0xc5
   1bae2:	e9 99 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bae7:	90                   	nop
   1bae8:	68 00 00 00 00       	push   $0x0
   1baed:	68 c6 00 00 00       	push   $0xc6
   1baf2:	e9 89 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1baf7:	90                   	nop
   1baf8:	68 00 00 00 00       	push   $0x0
   1bafd:	68 c7 00 00 00       	push   $0xc7
   1bb02:	e9 79 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bb07:	90                   	nop
   1bb08:	68 00 00 00 00       	push   $0x0
   1bb0d:	68 c8 00 00 00       	push   $0xc8
   1bb12:	e9 69 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bb17:	90                   	nop
   1bb18:	68 00 00 00 00       	push   $0x0
   1bb1d:	68 c9 00 00 00       	push   $0xc9
   1bb22:	e9 59 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bb27:	90                   	nop
   1bb28:	68 00 00 00 00       	push   $0x0
   1bb2d:	68 ca 00 00 00       	push   $0xca
   1bb32:	e9 49 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bb37:	90                   	nop
   1bb38:	68 00 00 00 00       	push   $0x0
   1bb3d:	68 cb 00 00 00       	push   $0xcb
   1bb42:	e9 39 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bb47:	90                   	nop
   1bb48:	68 00 00 00 00       	push   $0x0
   1bb4d:	68 cc 00 00 00       	push   $0xcc
   1bb52:	e9 29 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bb57:	90                   	nop
   1bb58:	68 00 00 00 00       	push   $0x0
   1bb5d:	68 cd 00 00 00       	push   $0xcd
   1bb62:	e9 19 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bb67:	90                   	nop
   1bb68:	68 00 00 00 00       	push   $0x0
   1bb6d:	68 ce 00 00 00       	push   $0xce
   1bb72:	e9 09 f2 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bb77:	90                   	nop
   1bb78:	68 00 00 00 00       	push   $0x0
   1bb7d:	68 cf 00 00 00       	push   $0xcf
   1bb82:	e9 f9 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bb87:	90                   	nop
   1bb88:	68 00 00 00 00       	push   $0x0
   1bb8d:	68 d0 00 00 00       	push   $0xd0
   1bb92:	e9 e9 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bb97:	90                   	nop
   1bb98:	68 00 00 00 00       	push   $0x0
   1bb9d:	68 d1 00 00 00       	push   $0xd1
   1bba2:	e9 d9 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bba7:	90                   	nop
   1bba8:	68 00 00 00 00       	push   $0x0
   1bbad:	68 d2 00 00 00       	push   $0xd2
   1bbb2:	e9 c9 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bbb7:	90                   	nop
   1bbb8:	68 00 00 00 00       	push   $0x0
   1bbbd:	68 d3 00 00 00       	push   $0xd3
   1bbc2:	e9 b9 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bbc7:	90                   	nop
   1bbc8:	68 00 00 00 00       	push   $0x0
   1bbcd:	68 d4 00 00 00       	push   $0xd4
   1bbd2:	e9 a9 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bbd7:	90                   	nop
   1bbd8:	68 00 00 00 00       	push   $0x0
   1bbdd:	68 d5 00 00 00       	push   $0xd5
   1bbe2:	e9 99 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bbe7:	90                   	nop
   1bbe8:	68 00 00 00 00       	push   $0x0
   1bbed:	68 d6 00 00 00       	push   $0xd6
   1bbf2:	e9 89 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bbf7:	90                   	nop
   1bbf8:	68 00 00 00 00       	push   $0x0
   1bbfd:	68 d7 00 00 00       	push   $0xd7
   1bc02:	e9 79 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bc07:	90                   	nop
   1bc08:	68 00 00 00 00       	push   $0x0
   1bc0d:	68 d8 00 00 00       	push   $0xd8
   1bc12:	e9 69 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bc17:	90                   	nop
   1bc18:	68 00 00 00 00       	push   $0x0
   1bc1d:	68 d9 00 00 00       	push   $0xd9
   1bc22:	e9 59 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bc27:	90                   	nop
   1bc28:	68 00 00 00 00       	push   $0x0
   1bc2d:	68 da 00 00 00       	push   $0xda
   1bc32:	e9 49 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bc37:	90                   	nop
   1bc38:	68 00 00 00 00       	push   $0x0
   1bc3d:	68 db 00 00 00       	push   $0xdb
   1bc42:	e9 39 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bc47:	90                   	nop
   1bc48:	68 00 00 00 00       	push   $0x0
   1bc4d:	68 dc 00 00 00       	push   $0xdc
   1bc52:	e9 29 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bc57:	90                   	nop
   1bc58:	68 00 00 00 00       	push   $0x0
   1bc5d:	68 dd 00 00 00       	push   $0xdd
   1bc62:	e9 19 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bc67:	90                   	nop
   1bc68:	68 00 00 00 00       	push   $0x0
   1bc6d:	68 de 00 00 00       	push   $0xde
   1bc72:	e9 09 f1 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bc77:	90                   	nop
   1bc78:	68 00 00 00 00       	push   $0x0
   1bc7d:	68 df 00 00 00       	push   $0xdf
   1bc82:	e9 f9 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bc87:	90                   	nop
   1bc88:	68 00 00 00 00       	push   $0x0
   1bc8d:	68 e0 00 00 00       	push   $0xe0
   1bc92:	e9 e9 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bc97:	90                   	nop
   1bc98:	68 00 00 00 00       	push   $0x0
   1bc9d:	68 e1 00 00 00       	push   $0xe1
   1bca2:	e9 d9 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bca7:	90                   	nop
   1bca8:	68 00 00 00 00       	push   $0x0
   1bcad:	68 e2 00 00 00       	push   $0xe2
   1bcb2:	e9 c9 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bcb7:	90                   	nop
   1bcb8:	68 00 00 00 00       	push   $0x0
   1bcbd:	68 e3 00 00 00       	push   $0xe3
   1bcc2:	e9 b9 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bcc7:	90                   	nop
   1bcc8:	68 00 00 00 00       	push   $0x0
   1bccd:	68 e4 00 00 00       	push   $0xe4
   1bcd2:	e9 a9 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bcd7:	90                   	nop
   1bcd8:	68 00 00 00 00       	push   $0x0
   1bcdd:	68 e5 00 00 00       	push   $0xe5
   1bce2:	e9 99 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bce7:	90                   	nop
   1bce8:	68 00 00 00 00       	push   $0x0
   1bced:	68 e6 00 00 00       	push   $0xe6
   1bcf2:	e9 89 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bcf7:	90                   	nop
   1bcf8:	68 00 00 00 00       	push   $0x0
   1bcfd:	68 e7 00 00 00       	push   $0xe7
   1bd02:	e9 79 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bd07:	90                   	nop
   1bd08:	68 00 00 00 00       	push   $0x0
   1bd0d:	68 e8 00 00 00       	push   $0xe8
   1bd12:	e9 69 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bd17:	90                   	nop
   1bd18:	68 00 00 00 00       	push   $0x0
   1bd1d:	68 e9 00 00 00       	push   $0xe9
   1bd22:	e9 59 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bd27:	90                   	nop
   1bd28:	68 00 00 00 00       	push   $0x0
   1bd2d:	68 ea 00 00 00       	push   $0xea
   1bd32:	e9 49 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bd37:	90                   	nop
   1bd38:	68 00 00 00 00       	push   $0x0
   1bd3d:	68 eb 00 00 00       	push   $0xeb
   1bd42:	e9 39 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bd47:	90                   	nop
   1bd48:	68 00 00 00 00       	push   $0x0
   1bd4d:	68 ec 00 00 00       	push   $0xec
   1bd52:	e9 29 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bd57:	90                   	nop
   1bd58:	68 00 00 00 00       	push   $0x0
   1bd5d:	68 ed 00 00 00       	push   $0xed
   1bd62:	e9 19 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bd67:	90                   	nop
   1bd68:	68 00 00 00 00       	push   $0x0
   1bd6d:	68 ee 00 00 00       	push   $0xee
   1bd72:	e9 09 f0 ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bd77:	90                   	nop
   1bd78:	68 00 00 00 00       	push   $0x0
   1bd7d:	68 ef 00 00 00       	push   $0xef
   1bd82:	e9 f9 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bd87:	90                   	nop
   1bd88:	68 00 00 00 00       	push   $0x0
   1bd8d:	68 f0 00 00 00       	push   $0xf0
   1bd92:	e9 e9 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bd97:	90                   	nop
   1bd98:	68 00 00 00 00       	push   $0x0
   1bd9d:	68 f1 00 00 00       	push   $0xf1
   1bda2:	e9 d9 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bda7:	90                   	nop
   1bda8:	68 00 00 00 00       	push   $0x0
   1bdad:	68 f2 00 00 00       	push   $0xf2
   1bdb2:	e9 c9 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bdb7:	90                   	nop
   1bdb8:	68 00 00 00 00       	push   $0x0
   1bdbd:	68 f3 00 00 00       	push   $0xf3
   1bdc2:	e9 b9 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bdc7:	90                   	nop
   1bdc8:	68 00 00 00 00       	push   $0x0
   1bdcd:	68 f4 00 00 00       	push   $0xf4
   1bdd2:	e9 a9 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bdd7:	90                   	nop
   1bdd8:	68 00 00 00 00       	push   $0x0
   1bddd:	68 f5 00 00 00       	push   $0xf5
   1bde2:	e9 99 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bde7:	90                   	nop
   1bde8:	68 00 00 00 00       	push   $0x0
   1bded:	68 f6 00 00 00       	push   $0xf6
   1bdf2:	e9 89 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1bdf7:	90                   	nop
   1bdf8:	68 00 00 00 00       	push   $0x0
   1bdfd:	68 f7 00 00 00       	push   $0xf7
   1be02:	e9 79 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1be07:	90                   	nop
   1be08:	68 00 00 00 00       	push   $0x0
   1be0d:	68 f8 00 00 00       	push   $0xf8
   1be12:	e9 69 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1be17:	90                   	nop
   1be18:	68 00 00 00 00       	push   $0x0
   1be1d:	68 f9 00 00 00       	push   $0xf9
   1be22:	e9 59 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1be27:	90                   	nop
   1be28:	68 00 00 00 00       	push   $0x0
   1be2d:	68 fa 00 00 00       	push   $0xfa
   1be32:	e9 49 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1be37:	90                   	nop
   1be38:	68 00 00 00 00       	push   $0x0
   1be3d:	68 fb 00 00 00       	push   $0xfb
   1be42:	e9 39 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1be47:	90                   	nop
   1be48:	68 00 00 00 00       	push   $0x0
   1be4d:	68 fc 00 00 00       	push   $0xfc
   1be52:	e9 29 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1be57:	90                   	nop
   1be58:	68 00 00 00 00       	push   $0x0
   1be5d:	68 fd 00 00 00       	push   $0xfd
   1be62:	e9 19 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1be67:	90                   	nop
   1be68:	68 00 00 00 00       	push   $0x0
   1be6d:	68 fe 00 00 00       	push   $0xfe
   1be72:	e9 09 ef ff ff       	jmp    1ad80 <Handle_Interrupt>
   1be77:	90                   	nop
   1be78:	68 00 00 00 00       	push   $0x0
   1be7d:	68 ff 00 00 00       	push   $0xff
   1be82:	e9 f9 ee ff ff       	jmp    1ad80 <Handle_Interrupt>
   1be87:	90                   	nop

0001be88 <g_entryPointTableEnd>:
   1be88:	90                   	nop
   1be89:	90                   	nop
   1be8a:	90                   	nop
   1be8b:	90                   	nop
   1be8c:	90                   	nop
   1be8d:	90                   	nop
   1be8e:	90                   	nop
   1be8f:	90                   	nop

0001be90 <Trampoline>:
   1be90:	8b 5c 24 04          	mov    0x4(%esp),%ebx
   1be94:	8b 44 24 08          	mov    0x8(%esp),%eax
   1be98:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
   1be9c:	1e                   	push   %ds
   1be9d:	06                   	push   %es
   1be9e:	8e d8                	mov    %eax,%ds
   1bea0:	8e c0                	mov    %eax,%es
   1bea2:	68 08 00 00 00       	push   $0x8
   1bea7:	68 af be 01 00       	push   $0x1beaf
   1beac:	53                   	push   %ebx
   1bead:	51                   	push   %ecx
   1beae:	cb                   	lret   

0001beaf <Trampoline.backhere>:
   1beaf:	07                   	pop    %es
   1beb0:	1f                   	pop    %ds
   1beb1:	c3                   	ret    
   1beb2:	90                   	nop
   1beb3:	90                   	nop
   1beb4:	90                   	nop
   1beb5:	90                   	nop
   1beb6:	90                   	nop
   1beb7:	90                   	nop
   1beb8:	90                   	nop
   1beb9:	90                   	nop
   1beba:	90                   	nop
   1bebb:	90                   	nop
   1bebc:	90                   	nop
   1bebd:	90                   	nop
   1bebe:	90                   	nop
   1bebf:	90                   	nop

0001bec0 <Format_Output>:
   1bec0:	55                   	push   %ebp
   1bec1:	89 e5                	mov    %esp,%ebp
   1bec3:	57                   	push   %edi
   1bec4:	56                   	push   %esi
   1bec5:	53                   	push   %ebx
   1bec6:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
   1becc:	8b 5d 10             	mov    0x10(%ebp),%ebx
   1becf:	8b 55 0c             	mov    0xc(%ebp),%edx
   1bed2:	bf 00 00 00 00       	mov    $0x0,%edi
   1bed7:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
   1bede:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,-0x60(%ebp)
   1bee5:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
   1beec:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
   1bef3:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
   1befa:	e9 d8 07 00 00       	jmp    1c6d7 <Format_Output+0x817>
   1beff:	89 de                	mov    %ebx,%esi
   1bf01:	83 ff 04             	cmp    $0x4,%edi
   1bf04:	0f 87 c8 07 00 00    	ja     1c6d2 <Format_Output+0x812>
   1bf0a:	ff 24 bd 84 ee 01 00 	jmp    *0x1ee84(,%edi,4)
   1bf11:	3c 25                	cmp    $0x25,%al
   1bf13:	75 28                	jne    1bf3d <Format_Output+0x7d>
   1bf15:	89 de                	mov    %ebx,%esi
   1bf17:	bf 01 00 00 00       	mov    $0x1,%edi
   1bf1c:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
   1bf23:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,-0x60(%ebp)
   1bf2a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
   1bf31:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
   1bf38:	e9 95 07 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1bf3d:	0f be c0             	movsbl %al,%eax
   1bf40:	89 44 24 04          	mov    %eax,0x4(%esp)
   1bf44:	8b 45 08             	mov    0x8(%ebp),%eax
   1bf47:	89 04 24             	mov    %eax,(%esp)
   1bf4a:	ff 10                	call   *(%eax)
   1bf4c:	89 de                	mov    %ebx,%esi
   1bf4e:	e9 7f 07 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1bf53:	83 e8 20             	sub    $0x20,%eax
   1bf56:	3c 10                	cmp    $0x10,%al
   1bf58:	77 0d                	ja     1bf67 <Format_Output+0xa7>
   1bf5a:	0f b6 c0             	movzbl %al,%eax
   1bf5d:	8d 76 00             	lea    0x0(%esi),%esi
   1bf60:	ff 24 85 98 ee 01 00 	jmp    *0x1ee98(,%eax,4)
   1bf67:	89 55 a8             	mov    %edx,-0x58(%ebp)
   1bf6a:	89 de                	mov    %ebx,%esi
   1bf6c:	bf 02 00 00 00       	mov    $0x2,%edi
   1bf71:	e9 5c 07 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1bf76:	83 4d b4 02          	orl    $0x2,-0x4c(%ebp)
   1bf7a:	89 de                	mov    %ebx,%esi
   1bf7c:	e9 51 07 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1bf81:	83 4d b4 04          	orl    $0x4,-0x4c(%ebp)
   1bf85:	89 de                	mov    %ebx,%esi
   1bf87:	e9 46 07 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1bf8c:	83 4d b4 08          	orl    $0x8,-0x4c(%ebp)
   1bf90:	89 de                	mov    %ebx,%esi
   1bf92:	e9 3b 07 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1bf97:	83 4d b4 10          	orl    $0x10,-0x4c(%ebp)
   1bf9b:	89 de                	mov    %ebx,%esi
   1bf9d:	e9 30 07 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1bfa2:	83 4d b4 20          	orl    $0x20,-0x4c(%ebp)
   1bfa6:	89 de                	mov    %ebx,%esi
   1bfa8:	e9 25 07 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1bfad:	83 4d b4 01          	orl    $0x1,-0x4c(%ebp)
   1bfb1:	89 de                	mov    %ebx,%esi
   1bfb3:	e9 1a 07 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1bfb8:	8d 48 d0             	lea    -0x30(%eax),%ecx
   1bfbb:	80 f9 09             	cmp    $0x9,%cl
   1bfbe:	77 15                	ja     1bfd5 <Format_Output+0x115>
   1bfc0:	6b 55 a4 0a          	imul   $0xa,-0x5c(%ebp),%edx
   1bfc4:	0f be c0             	movsbl %al,%eax
   1bfc7:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
   1bfcb:	89 45 a4             	mov    %eax,-0x5c(%ebp)
   1bfce:	89 de                	mov    %ebx,%esi
   1bfd0:	e9 fd 06 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1bfd5:	3c 2a                	cmp    $0x2a,%al
   1bfd7:	75 1c                	jne    1bff5 <Format_Output+0x135>
   1bfd9:	8d 73 04             	lea    0x4(%ebx),%esi
   1bfdc:	8b 1b                	mov    (%ebx),%ebx
   1bfde:	89 5d a4             	mov    %ebx,-0x5c(%ebp)
   1bfe1:	85 db                	test   %ebx,%ebx
   1bfe3:	0f 89 e9 06 00 00    	jns    1c6d2 <Format_Output+0x812>
   1bfe9:	f7 5d a4             	negl   -0x5c(%ebp)
   1bfec:	83 4d b4 02          	orl    $0x2,-0x4c(%ebp)
   1bff0:	e9 dd 06 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1bff5:	3c 2e                	cmp    $0x2e,%al
   1bff7:	0f 85 cb 06 00 00    	jne    1c6c8 <Format_Output+0x808>
   1bffd:	89 de                	mov    %ebx,%esi
   1bfff:	bf 03 00 00 00       	mov    $0x3,%edi
   1c004:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
   1c00b:	e9 c2 06 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1c010:	8d 48 d0             	lea    -0x30(%eax),%ecx
   1c013:	80 f9 09             	cmp    $0x9,%cl
   1c016:	77 15                	ja     1c02d <Format_Output+0x16d>
   1c018:	6b 55 a0 0a          	imul   $0xa,-0x60(%ebp),%edx
   1c01c:	0f be c0             	movsbl %al,%eax
   1c01f:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
   1c023:	89 45 a0             	mov    %eax,-0x60(%ebp)
   1c026:	89 de                	mov    %ebx,%esi
   1c028:	e9 a5 06 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1c02d:	3c 2a                	cmp    $0x2a,%al
   1c02f:	0f 85 93 06 00 00    	jne    1c6c8 <Format_Output+0x808>
   1c035:	8d 73 04             	lea    0x4(%ebx),%esi
   1c038:	8b 1b                	mov    (%ebx),%ebx
   1c03a:	89 5d a0             	mov    %ebx,-0x60(%ebp)
   1c03d:	89 d8                	mov    %ebx,%eax
   1c03f:	c1 f8 1f             	sar    $0x1f,%eax
   1c042:	09 45 a0             	or     %eax,-0x60(%ebp)
   1c045:	e9 88 06 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1c04a:	8d 50 b4             	lea    -0x4c(%eax),%edx
   1c04d:	80 fa 2e             	cmp    $0x2e,%dl
   1c050:	77 39                	ja     1c08b <Format_Output+0x1cb>
   1c052:	0f b6 d2             	movzbl %dl,%edx
   1c055:	ff 24 95 dc ee 01 00 	jmp    *0x1eedc(,%edx,4)
   1c05c:	89 de                	mov    %ebx,%esi
   1c05e:	c7 45 b0 01 00 00 00 	movl   $0x1,-0x50(%ebp)
   1c065:	e9 68 06 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1c06a:	83 6d b0 01          	subl   $0x1,-0x50(%ebp)
   1c06e:	89 de                	mov    %ebx,%esi
   1c070:	e9 5d 06 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1c075:	83 45 b0 01          	addl   $0x1,-0x50(%ebp)
   1c079:	89 de                	mov    %ebx,%esi
   1c07b:	e9 52 06 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1c080:	83 45 b0 02          	addl   $0x2,-0x50(%ebp)
   1c084:	89 de                	mov    %ebx,%esi
   1c086:	e9 47 06 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1c08b:	8b 55 b0             	mov    -0x50(%ebp),%edx
   1c08e:	85 d2                	test   %edx,%edx
   1c090:	7e 05                	jle    1c097 <Format_Output+0x1d7>
   1c092:	ba 01 00 00 00       	mov    $0x1,%edx
   1c097:	89 55 b0             	mov    %edx,-0x50(%ebp)
   1c09a:	83 fa fe             	cmp    $0xfffffffe,%edx
   1c09d:	7d 07                	jge    1c0a6 <Format_Output+0x1e6>
   1c09f:	c7 45 b0 fe ff ff ff 	movl   $0xfffffffe,-0x50(%ebp)
   1c0a6:	3c 6e                	cmp    $0x6e,%al
   1c0a8:	0f 84 79 05 00 00    	je     1c627 <Format_Output+0x767>
   1c0ae:	3c 6e                	cmp    $0x6e,%al
   1c0b0:	7f 38                	jg     1c0ea <Format_Output+0x22a>
   1c0b2:	3c 63                	cmp    $0x63,%al
   1c0b4:	0f 84 6e 04 00 00    	je     1c528 <Format_Output+0x668>
   1c0ba:	3c 63                	cmp    $0x63,%al
   1c0bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   1c0c0:	7f 13                	jg     1c0d5 <Format_Output+0x215>
   1c0c2:	3c 50                	cmp    $0x50,%al
   1c0c4:	74 79                	je     1c13f <Format_Output+0x27f>
   1c0c6:	3c 58                	cmp    $0x58,%al
   1c0c8:	0f 85 d0 05 00 00    	jne    1c69e <Format_Output+0x7de>
   1c0ce:	66 90                	xchg   %ax,%ax
   1c0d0:	e9 12 01 00 00       	jmp    1c1e7 <Format_Output+0x327>
   1c0d5:	3c 64                	cmp    $0x64,%al
   1c0d7:	90                   	nop
   1c0d8:	0f 84 85 00 00 00    	je     1c163 <Format_Output+0x2a3>
   1c0de:	3c 69                	cmp    $0x69,%al
   1c0e0:	0f 85 b8 05 00 00    	jne    1c69e <Format_Output+0x7de>
   1c0e6:	66 90                	xchg   %ax,%ax
   1c0e8:	eb 79                	jmp    1c163 <Format_Output+0x2a3>
   1c0ea:	3c 73                	cmp    $0x73,%al
   1c0ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   1c0f0:	0f 84 47 04 00 00    	je     1c53d <Format_Output+0x67d>
   1c0f6:	3c 73                	cmp    $0x73,%al
   1c0f8:	7f 18                	jg     1c112 <Format_Output+0x252>
   1c0fa:	3c 6f                	cmp    $0x6f,%al
   1c0fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   1c100:	74 33                	je     1c135 <Format_Output+0x275>
   1c102:	3c 70                	cmp    $0x70,%al
   1c104:	0f 85 94 05 00 00    	jne    1c69e <Format_Output+0x7de>
   1c10a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   1c110:	eb 34                	jmp    1c146 <Format_Output+0x286>
   1c112:	3c 75                	cmp    $0x75,%al
   1c114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   1c118:	0f 84 c2 00 00 00    	je     1c1e0 <Format_Output+0x320>
   1c11e:	be 10 00 00 00       	mov    $0x10,%esi
   1c123:	3c 78                	cmp    $0x78,%al
   1c125:	0f 85 73 05 00 00    	jne    1c69e <Format_Output+0x7de>
   1c12b:	90                   	nop
   1c12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   1c130:	e9 be 00 00 00       	jmp    1c1f3 <Format_Output+0x333>
   1c135:	be 08 00 00 00       	mov    $0x8,%esi
   1c13a:	e9 b4 00 00 00       	jmp    1c1f3 <Format_Output+0x333>
   1c13f:	81 4d b4 80 00 00 00 	orl    $0x80,-0x4c(%ebp)
   1c146:	83 4d b4 20          	orl    $0x20,-0x4c(%ebp)
   1c14a:	8b 13                	mov    (%ebx),%edx
   1c14c:	89 55 94             	mov    %edx,-0x6c(%ebp)
   1c14f:	8d 5b 04             	lea    0x4(%ebx),%ebx
   1c152:	be 10 00 00 00       	mov    $0x10,%esi
   1c157:	c7 45 a0 08 00 00 00 	movl   $0x8,-0x60(%ebp)
   1c15e:	e9 e7 00 00 00       	jmp    1c24a <Format_Output+0x38a>
   1c163:	83 4d b4 40          	orl    $0x40,-0x4c(%ebp)
   1c167:	83 7d b0 ff          	cmpl   $0xffffffff,-0x50(%ebp)
   1c16b:	74 42                	je     1c1af <Format_Output+0x2ef>
   1c16d:	83 7d b0 ff          	cmpl   $0xffffffff,-0x50(%ebp)
   1c171:	7f 0f                	jg     1c182 <Format_Output+0x2c2>
   1c173:	83 7d b0 fe          	cmpl   $0xfffffffe,-0x50(%ebp)
   1c177:	75 19                	jne    1c192 <Format_Output+0x2d2>
   1c179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   1c180:	eb 1a                	jmp    1c19c <Format_Output+0x2dc>
   1c182:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
   1c186:	66 90                	xchg   %ax,%ax
   1c188:	74 38                	je     1c1c2 <Format_Output+0x302>
   1c18a:	83 7d b0 01          	cmpl   $0x1,-0x50(%ebp)
   1c18e:	66 90                	xchg   %ax,%ax
   1c190:	74 3f                	je     1c1d1 <Format_Output+0x311>
   1c192:	be 0a 00 00 00       	mov    $0xa,%esi
   1c197:	e9 ae 00 00 00       	jmp    1c24a <Format_Output+0x38a>
   1c19c:	0f be 0b             	movsbl (%ebx),%ecx
   1c19f:	89 4d 94             	mov    %ecx,-0x6c(%ebp)
   1c1a2:	8d 5b 04             	lea    0x4(%ebx),%ebx
   1c1a5:	be 0a 00 00 00       	mov    $0xa,%esi
   1c1aa:	e9 9b 00 00 00       	jmp    1c24a <Format_Output+0x38a>
   1c1af:	0f bf 03             	movswl (%ebx),%eax
   1c1b2:	89 45 94             	mov    %eax,-0x6c(%ebp)
   1c1b5:	8d 5b 04             	lea    0x4(%ebx),%ebx
   1c1b8:	be 0a 00 00 00       	mov    $0xa,%esi
   1c1bd:	e9 88 00 00 00       	jmp    1c24a <Format_Output+0x38a>
   1c1c2:	8b 13                	mov    (%ebx),%edx
   1c1c4:	89 55 94             	mov    %edx,-0x6c(%ebp)
   1c1c7:	8d 5b 04             	lea    0x4(%ebx),%ebx
   1c1ca:	be 0a 00 00 00       	mov    $0xa,%esi
   1c1cf:	eb 79                	jmp    1c24a <Format_Output+0x38a>
   1c1d1:	8b 0b                	mov    (%ebx),%ecx
   1c1d3:	89 4d 94             	mov    %ecx,-0x6c(%ebp)
   1c1d6:	8d 5b 04             	lea    0x4(%ebx),%ebx
   1c1d9:	be 0a 00 00 00       	mov    $0xa,%esi
   1c1de:	eb 6a                	jmp    1c24a <Format_Output+0x38a>
   1c1e0:	be 0a 00 00 00       	mov    $0xa,%esi
   1c1e5:	eb 0c                	jmp    1c1f3 <Format_Output+0x333>
   1c1e7:	81 4d b4 80 00 00 00 	orl    $0x80,-0x4c(%ebp)
   1c1ee:	be 10 00 00 00       	mov    $0x10,%esi
   1c1f3:	83 7d b0 ff          	cmpl   $0xffffffff,-0x50(%ebp)
   1c1f7:	74 34                	je     1c22d <Format_Output+0x36d>
   1c1f9:	83 7d b0 ff          	cmpl   $0xffffffff,-0x50(%ebp)
   1c1fd:	7f 0b                	jg     1c20a <Format_Output+0x34a>
   1c1ff:	83 7d b0 fe          	cmpl   $0xfffffffe,-0x50(%ebp)
   1c203:	75 45                	jne    1c24a <Format_Output+0x38a>
   1c205:	8d 76 00             	lea    0x0(%esi),%esi
   1c208:	eb 18                	jmp    1c222 <Format_Output+0x362>
   1c20a:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
   1c20e:	66 90                	xchg   %ax,%ax
   1c210:	74 26                	je     1c238 <Format_Output+0x378>
   1c212:	83 7d b0 01          	cmpl   $0x1,-0x50(%ebp)
   1c216:	66 90                	xchg   %ax,%ax
   1c218:	75 30                	jne    1c24a <Format_Output+0x38a>
   1c21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   1c220:	eb 20                	jmp    1c242 <Format_Output+0x382>
   1c222:	0f b6 03             	movzbl (%ebx),%eax
   1c225:	89 45 94             	mov    %eax,-0x6c(%ebp)
   1c228:	8d 5b 04             	lea    0x4(%ebx),%ebx
   1c22b:	eb 1d                	jmp    1c24a <Format_Output+0x38a>
   1c22d:	0f b7 13             	movzwl (%ebx),%edx
   1c230:	89 55 94             	mov    %edx,-0x6c(%ebp)
   1c233:	8d 5b 04             	lea    0x4(%ebx),%ebx
   1c236:	eb 12                	jmp    1c24a <Format_Output+0x38a>
   1c238:	8b 0b                	mov    (%ebx),%ecx
   1c23a:	89 4d 94             	mov    %ecx,-0x6c(%ebp)
   1c23d:	8d 5b 04             	lea    0x4(%ebx),%ebx
   1c240:	eb 08                	jmp    1c24a <Format_Output+0x38a>
   1c242:	8b 03                	mov    (%ebx),%eax
   1c244:	89 45 94             	mov    %eax,-0x6c(%ebp)
   1c247:	8d 5b 04             	lea    0x4(%ebx),%ebx
   1c24a:	c7 45 80 98 ef 01 00 	movl   $0x1ef98,-0x80(%ebp)
   1c251:	8b 55 b4             	mov    -0x4c(%ebp),%edx
   1c254:	81 e2 80 00 00 00    	and    $0x80,%edx
   1c25a:	89 55 84             	mov    %edx,-0x7c(%ebp)
   1c25d:	75 07                	jne    1c266 <Format_Output+0x3a6>
   1c25f:	c7 45 80 a9 ef 01 00 	movl   $0x1efa9,-0x80(%ebp)
   1c266:	8b 45 94             	mov    -0x6c(%ebp),%eax
   1c269:	f6 45 b4 40          	testb  $0x40,-0x4c(%ebp)
   1c26d:	74 04                	je     1c273 <Format_Output+0x3b3>
   1c26f:	85 c0                	test   %eax,%eax
   1c271:	78 0f                	js     1c282 <Format_Output+0x3c2>
   1c273:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
   1c276:	89 4d 8c             	mov    %ecx,-0x74(%ebp)
   1c279:	c7 45 88 00 00 00 00 	movl   $0x0,-0x78(%ebp)
   1c280:	eb 0c                	jmp    1c28e <Format_Output+0x3ce>
   1c282:	f7 d8                	neg    %eax
   1c284:	89 45 8c             	mov    %eax,-0x74(%ebp)
   1c287:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
   1c28e:	b9 00 00 00 00       	mov    $0x0,%ecx
   1c293:	83 7d 8c 00          	cmpl   $0x0,-0x74(%ebp)
   1c297:	74 11                	je     1c2aa <Format_Output+0x3ea>
   1c299:	8b 45 8c             	mov    -0x74(%ebp),%eax
   1c29c:	ba 00 00 00 00       	mov    $0x0,%edx
   1c2a1:	f7 f6                	div    %esi
   1c2a3:	83 c1 01             	add    $0x1,%ecx
   1c2a6:	85 c0                	test   %eax,%eax
   1c2a8:	75 f2                	jne    1c29c <Format_Output+0x3dc>
   1c2aa:	8b 45 b4             	mov    -0x4c(%ebp),%eax
   1c2ad:	c1 e8 05             	shr    $0x5,%eax
   1c2b0:	89 c2                	mov    %eax,%edx
   1c2b2:	80 e2 01             	and    $0x1,%dl
   1c2b5:	88 55 9c             	mov    %dl,-0x64(%ebp)
   1c2b8:	74 05                	je     1c2bf <Format_Output+0x3ff>
   1c2ba:	83 fe 08             	cmp    $0x8,%esi
   1c2bd:	74 05                	je     1c2c4 <Format_Output+0x404>
   1c2bf:	8b 45 a0             	mov    -0x60(%ebp),%eax
   1c2c2:	eb 0b                	jmp    1c2cf <Format_Output+0x40f>
   1c2c4:	8d 41 01             	lea    0x1(%ecx),%eax
   1c2c7:	3b 45 a0             	cmp    -0x60(%ebp),%eax
   1c2ca:	7d 03                	jge    1c2cf <Format_Output+0x40f>
   1c2cc:	8b 45 a0             	mov    -0x60(%ebp),%eax
   1c2cf:	39 c8                	cmp    %ecx,%eax
   1c2d1:	7e 04                	jle    1c2d7 <Format_Output+0x417>
   1c2d3:	89 c1                	mov    %eax,%ecx
   1c2d5:	eb 0b                	jmp    1c2e2 <Format_Output+0x422>
   1c2d7:	83 7d 8c 00          	cmpl   $0x0,-0x74(%ebp)
   1c2db:	75 05                	jne    1c2e2 <Format_Output+0x422>
   1c2dd:	b9 01 00 00 00       	mov    $0x1,%ecx
   1c2e2:	89 4d 90             	mov    %ecx,-0x70(%ebp)
   1c2e5:	f6 45 b4 08          	testb  $0x8,-0x4c(%ebp)
   1c2e9:	74 0f                	je     1c2fa <Format_Output+0x43a>
   1c2eb:	83 fe 10             	cmp    $0x10,%esi
   1c2ee:	0f 94 c0             	sete   %al
   1c2f1:	0f b6 c0             	movzbl %al,%eax
   1c2f4:	83 c0 03             	add    $0x3,%eax
   1c2f7:	89 45 90             	mov    %eax,-0x70(%ebp)
   1c2fa:	8d 51 ff             	lea    -0x1(%ecx),%edx
   1c2fd:	89 d0                	mov    %edx,%eax
   1c2ff:	c1 fa 1f             	sar    $0x1f,%edx
   1c302:	f7 7d 90             	idivl  -0x70(%ebp)
   1c305:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
   1c308:	83 7d 88 00          	cmpl   $0x0,-0x78(%ebp)
   1c30c:	75 09                	jne    1c317 <Format_Output+0x457>
   1c30e:	89 7d 98             	mov    %edi,-0x68(%ebp)
   1c311:	f6 45 b4 14          	testb  $0x14,-0x4c(%ebp)
   1c315:	74 06                	je     1c31d <Format_Output+0x45d>
   1c317:	8d 4f 01             	lea    0x1(%edi),%ecx
   1c31a:	89 4d 98             	mov    %ecx,-0x68(%ebp)
   1c31d:	83 fe 10             	cmp    $0x10,%esi
   1c320:	0f 94 c0             	sete   %al
   1c323:	22 45 9c             	and    -0x64(%ebp),%al
   1c326:	88 45 9c             	mov    %al,-0x64(%ebp)
   1c329:	74 04                	je     1c32f <Format_Output+0x46f>
   1c32b:	83 45 98 02          	addl   $0x2,-0x68(%ebp)
   1c32f:	8b 45 98             	mov    -0x68(%ebp),%eax
   1c332:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
   1c335:	0f 9f c0             	setg   %al
   1c338:	8b 55 b4             	mov    -0x4c(%ebp),%edx
   1c33b:	83 e2 03             	and    $0x3,%edx
   1c33e:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
   1c344:	75 3e                	jne    1c384 <Format_Output+0x4c4>
   1c346:	84 c0                	test   %al,%al
   1c348:	74 3a                	je     1c384 <Format_Output+0x4c4>
   1c34a:	74 38                	je     1c384 <Format_Output+0x4c4>
   1c34c:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
   1c34f:	89 4d ac             	mov    %ecx,-0x54(%ebp)
   1c352:	89 bd 78 ff ff ff    	mov    %edi,-0x88(%ebp)
   1c358:	89 f7                	mov    %esi,%edi
   1c35a:	89 de                	mov    %ebx,%esi
   1c35c:	8b 5d 08             	mov    0x8(%ebp),%ebx
   1c35f:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   1c366:	00 
   1c367:	89 1c 24             	mov    %ebx,(%esp)
   1c36a:	ff 13                	call   *(%ebx)
   1c36c:	83 6d ac 01          	subl   $0x1,-0x54(%ebp)
   1c370:	8b 45 ac             	mov    -0x54(%ebp),%eax
   1c373:	39 45 98             	cmp    %eax,-0x68(%ebp)
   1c376:	7c e7                	jl     1c35f <Format_Output+0x49f>
   1c378:	89 f3                	mov    %esi,%ebx
   1c37a:	89 fe                	mov    %edi,%esi
   1c37c:	8b bd 78 ff ff ff    	mov    -0x88(%ebp),%edi
   1c382:	eb 06                	jmp    1c38a <Format_Output+0x4ca>
   1c384:	8b 55 a4             	mov    -0x5c(%ebp),%edx
   1c387:	89 55 ac             	mov    %edx,-0x54(%ebp)
   1c38a:	83 7d 88 00          	cmpl   $0x0,-0x78(%ebp)
   1c38e:	74 12                	je     1c3a2 <Format_Output+0x4e2>
   1c390:	c7 44 24 04 2d 00 00 	movl   $0x2d,0x4(%esp)
   1c397:	00 
   1c398:	8b 4d 08             	mov    0x8(%ebp),%ecx
   1c39b:	89 0c 24             	mov    %ecx,(%esp)
   1c39e:	ff 11                	call   *(%ecx)
   1c3a0:	eb 30                	jmp    1c3d2 <Format_Output+0x512>
   1c3a2:	f6 45 b4 04          	testb  $0x4,-0x4c(%ebp)
   1c3a6:	74 12                	je     1c3ba <Format_Output+0x4fa>
   1c3a8:	c7 44 24 04 2b 00 00 	movl   $0x2b,0x4(%esp)
   1c3af:	00 
   1c3b0:	8b 45 08             	mov    0x8(%ebp),%eax
   1c3b3:	89 04 24             	mov    %eax,(%esp)
   1c3b6:	ff 10                	call   *(%eax)
   1c3b8:	eb 18                	jmp    1c3d2 <Format_Output+0x512>
   1c3ba:	f6 45 b4 10          	testb  $0x10,-0x4c(%ebp)
   1c3be:	66 90                	xchg   %ax,%ax
   1c3c0:	74 10                	je     1c3d2 <Format_Output+0x512>
   1c3c2:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   1c3c9:	00 
   1c3ca:	8b 55 08             	mov    0x8(%ebp),%edx
   1c3cd:	89 14 24             	mov    %edx,(%esp)
   1c3d0:	ff 12                	call   *(%edx)
   1c3d2:	80 7d 9c 00          	cmpb   $0x0,-0x64(%ebp)
   1c3d6:	74 2d                	je     1c405 <Format_Output+0x545>
   1c3d8:	c7 44 24 04 30 00 00 	movl   $0x30,0x4(%esp)
   1c3df:	00 
   1c3e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
   1c3e3:	89 0c 24             	mov    %ecx,(%esp)
   1c3e6:	ff 11                	call   *(%ecx)
   1c3e8:	8b 45 08             	mov    0x8(%ebp),%eax
   1c3eb:	8b 10                	mov    (%eax),%edx
   1c3ed:	83 7d 84 01          	cmpl   $0x1,-0x7c(%ebp)
   1c3f1:	19 c0                	sbb    %eax,%eax
   1c3f3:	83 e0 20             	and    $0x20,%eax
   1c3f6:	83 c0 58             	add    $0x58,%eax
   1c3f9:	89 44 24 04          	mov    %eax,0x4(%esp)
   1c3fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
   1c400:	89 0c 24             	mov    %ecx,(%esp)
   1c403:	ff d2                	call   *%edx
   1c405:	83 bd 7c ff ff ff 01 	cmpl   $0x1,-0x84(%ebp)
   1c40c:	75 3d                	jne    1c44b <Format_Output+0x58b>
   1c40e:	3b 7d ac             	cmp    -0x54(%ebp),%edi
   1c411:	7d 38                	jge    1c44b <Format_Output+0x58b>
   1c413:	8b 45 ac             	mov    -0x54(%ebp),%eax
   1c416:	39 45 98             	cmp    %eax,-0x68(%ebp)
   1c419:	7d 30                	jge    1c44b <Format_Output+0x58b>
   1c41b:	89 7d 9c             	mov    %edi,-0x64(%ebp)
   1c41e:	89 f7                	mov    %esi,%edi
   1c420:	89 de                	mov    %ebx,%esi
   1c422:	8b 5d 08             	mov    0x8(%ebp),%ebx
   1c425:	c7 44 24 04 30 00 00 	movl   $0x30,0x4(%esp)
   1c42c:	00 
   1c42d:	89 1c 24             	mov    %ebx,(%esp)
   1c430:	ff 13                	call   *(%ebx)
   1c432:	83 6d ac 01          	subl   $0x1,-0x54(%ebp)
   1c436:	8b 55 ac             	mov    -0x54(%ebp),%edx
   1c439:	39 55 98             	cmp    %edx,-0x68(%ebp)
   1c43c:	7c e7                	jl     1c425 <Format_Output+0x565>
   1c43e:	89 f3                	mov    %esi,%ebx
   1c440:	89 fe                	mov    %edi,%esi
   1c442:	8b 7d 9c             	mov    -0x64(%ebp),%edi
   1c445:	8b 4d 98             	mov    -0x68(%ebp),%ecx
   1c448:	89 4d ac             	mov    %ecx,-0x54(%ebp)
   1c44b:	83 ff 2b             	cmp    $0x2b,%edi
   1c44e:	7e 02                	jle    1c452 <Format_Output+0x592>
   1c450:	eb fe                	jmp    1c450 <Format_Output+0x590>
   1c452:	89 7d 9c             	mov    %edi,-0x64(%ebp)
   1c455:	85 ff                	test   %edi,%edi
   1c457:	7e 5e                	jle    1c4b7 <Format_Output+0x5f7>
   1c459:	8d 4d bc             	lea    -0x44(%ebp),%ecx
   1c45c:	01 f9                	add    %edi,%ecx
   1c45e:	8b 45 90             	mov    -0x70(%ebp),%eax
   1c461:	89 45 88             	mov    %eax,-0x78(%ebp)
   1c464:	89 c2                	mov    %eax,%edx
   1c466:	83 ea 01             	sub    $0x1,%edx
   1c469:	89 55 84             	mov    %edx,-0x7c(%ebp)
   1c46c:	89 75 90             	mov    %esi,-0x70(%ebp)
   1c46f:	83 7d 88 00          	cmpl   $0x0,-0x78(%ebp)
   1c473:	74 06                	je     1c47b <Format_Output+0x5bb>
   1c475:	83 6d 88 01          	subl   $0x1,-0x78(%ebp)
   1c479:	eb 0f                	jmp    1c48a <Format_Output+0x5ca>
   1c47b:	83 e9 01             	sub    $0x1,%ecx
   1c47e:	83 ef 01             	sub    $0x1,%edi
   1c481:	c6 01 5f             	movb   $0x5f,(%ecx)
   1c484:	8b 45 84             	mov    -0x7c(%ebp),%eax
   1c487:	89 45 88             	mov    %eax,-0x78(%ebp)
   1c48a:	83 e9 01             	sub    $0x1,%ecx
   1c48d:	83 ef 01             	sub    $0x1,%edi
   1c490:	8b 45 8c             	mov    -0x74(%ebp),%eax
   1c493:	ba 00 00 00 00       	mov    $0x0,%edx
   1c498:	f7 f6                	div    %esi
   1c49a:	8b 45 80             	mov    -0x80(%ebp),%eax
   1c49d:	0f b6 14 10          	movzbl (%eax,%edx,1),%edx
   1c4a1:	88 11                	mov    %dl,(%ecx)
   1c4a3:	85 ff                	test   %edi,%edi
   1c4a5:	7e 10                	jle    1c4b7 <Format_Output+0x5f7>
   1c4a7:	8b 45 8c             	mov    -0x74(%ebp),%eax
   1c4aa:	ba 00 00 00 00       	mov    $0x0,%edx
   1c4af:	f7 75 90             	divl   -0x70(%ebp)
   1c4b2:	89 45 8c             	mov    %eax,-0x74(%ebp)
   1c4b5:	eb b8                	jmp    1c46f <Format_Output+0x5af>
   1c4b7:	83 7d 9c 00          	cmpl   $0x0,-0x64(%ebp)
   1c4bb:	74 1e                	je     1c4db <Format_Output+0x61b>
   1c4bd:	be 00 00 00 00       	mov    $0x0,%esi
   1c4c2:	8b 7d 08             	mov    0x8(%ebp),%edi
   1c4c5:	0f be 44 35 bc       	movsbl -0x44(%ebp,%esi,1),%eax
   1c4ca:	89 44 24 04          	mov    %eax,0x4(%esp)
   1c4ce:	89 3c 24             	mov    %edi,(%esp)
   1c4d1:	ff 17                	call   *(%edi)
   1c4d3:	83 c6 01             	add    $0x1,%esi
   1c4d6:	39 75 9c             	cmp    %esi,-0x64(%ebp)
   1c4d9:	77 ea                	ja     1c4c5 <Format_Output+0x605>
   1c4db:	8b 45 b4             	mov    -0x4c(%ebp),%eax
   1c4de:	d1 e8                	shr    %eax
   1c4e0:	89 c2                	mov    %eax,%edx
   1c4e2:	80 e2 01             	and    $0x1,%dl
   1c4e5:	89 d6                	mov    %edx,%esi
   1c4e7:	0f 84 cb 01 00 00    	je     1c6b8 <Format_Output+0x7f8>
   1c4ed:	8b 4d ac             	mov    -0x54(%ebp),%ecx
   1c4f0:	39 4d 98             	cmp    %ecx,-0x68(%ebp)
   1c4f3:	0f 8d bf 01 00 00    	jge    1c6b8 <Format_Output+0x7f8>
   1c4f9:	89 df                	mov    %ebx,%edi
   1c4fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
   1c4fe:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   1c505:	00 
   1c506:	89 1c 24             	mov    %ebx,(%esp)
   1c509:	ff 13                	call   *(%ebx)
   1c50b:	83 6d ac 01          	subl   $0x1,-0x54(%ebp)
   1c50f:	89 f0                	mov    %esi,%eax
   1c511:	84 c0                	test   %al,%al
   1c513:	0f 84 9d 01 00 00    	je     1c6b6 <Format_Output+0x7f6>
   1c519:	8b 55 ac             	mov    -0x54(%ebp),%edx
   1c51c:	39 55 98             	cmp    %edx,-0x68(%ebp)
   1c51f:	7c dd                	jl     1c4fe <Format_Output+0x63e>
   1c521:	89 fb                	mov    %edi,%ebx
   1c523:	e9 90 01 00 00       	jmp    1c6b8 <Format_Output+0x7f8>
   1c528:	8d 73 04             	lea    0x4(%ebx),%esi
   1c52b:	8b 03                	mov    (%ebx),%eax
   1c52d:	88 45 e7             	mov    %al,-0x19(%ebp)
   1c530:	bb 01 00 00 00       	mov    $0x1,%ebx
   1c535:	8d 4d e7             	lea    -0x19(%ebp),%ecx
   1c538:	89 4d ac             	mov    %ecx,-0x54(%ebp)
   1c53b:	eb 27                	jmp    1c564 <Format_Output+0x6a4>
   1c53d:	8b 03                	mov    (%ebx),%eax
   1c53f:	89 45 ac             	mov    %eax,-0x54(%ebp)
   1c542:	85 c0                	test   %eax,%eax
   1c544:	75 07                	jne    1c54d <Format_Output+0x68d>
   1c546:	c7 45 ac 7c ee 01 00 	movl   $0x1ee7c,-0x54(%ebp)
   1c54d:	8d 73 04             	lea    0x4(%ebx),%esi
   1c550:	8b 7d ac             	mov    -0x54(%ebp),%edi
   1c553:	b8 00 00 00 00       	mov    $0x0,%eax
   1c558:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   1c55d:	f2 ae                	repnz scas %es:(%edi),%al
   1c55f:	f7 d1                	not    %ecx
   1c561:	8d 59 ff             	lea    -0x1(%ecx),%ebx
   1c564:	83 7d a0 ff          	cmpl   $0xffffffff,-0x60(%ebp)
   1c568:	74 08                	je     1c572 <Format_Output+0x6b2>
   1c56a:	3b 5d a0             	cmp    -0x60(%ebp),%ebx
   1c56d:	7e 03                	jle    1c572 <Format_Output+0x6b2>
   1c56f:	8b 5d a0             	mov    -0x60(%ebp),%ebx
   1c572:	39 5d a4             	cmp    %ebx,-0x5c(%ebp)
   1c575:	7e 43                	jle    1c5ba <Format_Output+0x6fa>
   1c577:	f6 45 b4 02          	testb  $0x2,-0x4c(%ebp)
   1c57b:	75 3d                	jne    1c5ba <Format_Output+0x6fa>
   1c57d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
   1c580:	83 e0 01             	and    $0x1,%eax
   1c583:	83 f8 01             	cmp    $0x1,%eax
   1c586:	19 c0                	sbb    %eax,%eax
   1c588:	83 e0 f0             	and    $0xfffffff0,%eax
   1c58b:	83 c0 30             	add    $0x30,%eax
   1c58e:	8b 7d a4             	mov    -0x5c(%ebp),%edi
   1c591:	0f be c0             	movsbl %al,%eax
   1c594:	89 45 a4             	mov    %eax,-0x5c(%ebp)
   1c597:	89 75 98             	mov    %esi,-0x68(%ebp)
   1c59a:	89 de                	mov    %ebx,%esi
   1c59c:	8b 5d 08             	mov    0x8(%ebp),%ebx
   1c59f:	8b 55 a4             	mov    -0x5c(%ebp),%edx
   1c5a2:	89 54 24 04          	mov    %edx,0x4(%esp)
   1c5a6:	89 1c 24             	mov    %ebx,(%esp)
   1c5a9:	ff 13                	call   *(%ebx)
   1c5ab:	83 ef 01             	sub    $0x1,%edi
   1c5ae:	39 fe                	cmp    %edi,%esi
   1c5b0:	7c ed                	jl     1c59f <Format_Output+0x6df>
   1c5b2:	89 f3                	mov    %esi,%ebx
   1c5b4:	8b 75 98             	mov    -0x68(%ebp),%esi
   1c5b7:	89 5d a4             	mov    %ebx,-0x5c(%ebp)
   1c5ba:	89 df                	mov    %ebx,%edi
   1c5bc:	eb 1e                	jmp    1c5dc <Format_Output+0x71c>
   1c5be:	8b 4d ac             	mov    -0x54(%ebp),%ecx
   1c5c1:	0f b6 01             	movzbl (%ecx),%eax
   1c5c4:	83 c1 01             	add    $0x1,%ecx
   1c5c7:	89 4d ac             	mov    %ecx,-0x54(%ebp)
   1c5ca:	0f be c0             	movsbl %al,%eax
   1c5cd:	89 44 24 04          	mov    %eax,0x4(%esp)
   1c5d1:	8b 45 08             	mov    0x8(%ebp),%eax
   1c5d4:	89 04 24             	mov    %eax,(%esp)
   1c5d7:	ff 10                	call   *(%eax)
   1c5d9:	83 ef 01             	sub    $0x1,%edi
   1c5dc:	85 ff                	test   %edi,%edi
   1c5de:	75 de                	jne    1c5be <Format_Output+0x6fe>
   1c5e0:	39 5d a4             	cmp    %ebx,-0x5c(%ebp)
   1c5e3:	0f 8e d8 00 00 00    	jle    1c6c1 <Format_Output+0x801>
   1c5e9:	f6 45 b4 02          	testb  $0x2,-0x4c(%ebp)
   1c5ed:	8d 76 00             	lea    0x0(%esi),%esi
   1c5f0:	0f 84 cb 00 00 00    	je     1c6c1 <Format_Output+0x801>
   1c5f6:	8b 7d a4             	mov    -0x5c(%ebp),%edi
   1c5f9:	89 75 ac             	mov    %esi,-0x54(%ebp)
   1c5fc:	89 de                	mov    %ebx,%esi
   1c5fe:	8b 5d 08             	mov    0x8(%ebp),%ebx
   1c601:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   1c608:	00 
   1c609:	89 1c 24             	mov    %ebx,(%esp)
   1c60c:	ff 13                	call   *(%ebx)
   1c60e:	83 ef 01             	sub    $0x1,%edi
   1c611:	39 fe                	cmp    %edi,%esi
   1c613:	7c ec                	jl     1c601 <Format_Output+0x741>
   1c615:	89 f3                	mov    %esi,%ebx
   1c617:	8b 75 ac             	mov    -0x54(%ebp),%esi
   1c61a:	89 5d a4             	mov    %ebx,-0x5c(%ebp)
   1c61d:	bf 00 00 00 00       	mov    $0x0,%edi
   1c622:	e9 ab 00 00 00       	jmp    1c6d2 <Format_Output+0x812>
   1c627:	83 7d b0 ff          	cmpl   $0xffffffff,-0x50(%ebp)
   1c62b:	74 3c                	je     1c669 <Format_Output+0x7a9>
   1c62d:	83 7d b0 ff          	cmpl   $0xffffffff,-0x50(%ebp)
   1c631:	7f 0f                	jg     1c642 <Format_Output+0x782>
   1c633:	83 7d b0 fe          	cmpl   $0xfffffffe,-0x50(%ebp)
   1c637:	75 7f                	jne    1c6b8 <Format_Output+0x7f8>
   1c639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   1c640:	eb 18                	jmp    1c65a <Format_Output+0x79a>
   1c642:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
   1c646:	66 90                	xchg   %ax,%ax
   1c648:	74 30                	je     1c67a <Format_Output+0x7ba>
   1c64a:	83 7d b0 01          	cmpl   $0x1,-0x50(%ebp)
   1c64e:	66 90                	xchg   %ax,%ax
   1c650:	75 66                	jne    1c6b8 <Format_Output+0x7f8>
   1c652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   1c658:	eb 32                	jmp    1c68c <Format_Output+0x7cc>
   1c65a:	8d 73 04             	lea    0x4(%ebx),%esi
   1c65d:	8b 03                	mov    (%ebx),%eax
   1c65f:	c6 00 00             	movb   $0x0,(%eax)
   1c662:	bf 00 00 00 00       	mov    $0x0,%edi
   1c667:	eb 69                	jmp    1c6d2 <Format_Output+0x812>
   1c669:	8d 73 04             	lea    0x4(%ebx),%esi
   1c66c:	8b 03                	mov    (%ebx),%eax
   1c66e:	66 c7 00 00 00       	movw   $0x0,(%eax)
   1c673:	bf 00 00 00 00       	mov    $0x0,%edi
   1c678:	eb 58                	jmp    1c6d2 <Format_Output+0x812>
   1c67a:	8d 73 04             	lea    0x4(%ebx),%esi
   1c67d:	8b 03                	mov    (%ebx),%eax
   1c67f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   1c685:	bf 00 00 00 00       	mov    $0x0,%edi
   1c68a:	eb 46                	jmp    1c6d2 <Format_Output+0x812>
   1c68c:	8d 73 04             	lea    0x4(%ebx),%esi
   1c68f:	8b 03                	mov    (%ebx),%eax
   1c691:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   1c697:	bf 00 00 00 00       	mov    $0x0,%edi
   1c69c:	eb 34                	jmp    1c6d2 <Format_Output+0x812>
   1c69e:	0f be c0             	movsbl %al,%eax
   1c6a1:	89 44 24 04          	mov    %eax,0x4(%esp)
   1c6a5:	8b 55 08             	mov    0x8(%ebp),%edx
   1c6a8:	89 14 24             	mov    %edx,(%esp)
   1c6ab:	ff 12                	call   *(%edx)
   1c6ad:	89 de                	mov    %ebx,%esi
   1c6af:	bf 00 00 00 00       	mov    $0x0,%edi
   1c6b4:	eb 1c                	jmp    1c6d2 <Format_Output+0x812>
   1c6b6:	89 fb                	mov    %edi,%ebx
   1c6b8:	89 de                	mov    %ebx,%esi
   1c6ba:	bf 00 00 00 00       	mov    $0x0,%edi
   1c6bf:	eb 11                	jmp    1c6d2 <Format_Output+0x812>
   1c6c1:	bf 00 00 00 00       	mov    $0x0,%edi
   1c6c6:	eb 0a                	jmp    1c6d2 <Format_Output+0x812>
   1c6c8:	89 55 a8             	mov    %edx,-0x58(%ebp)
   1c6cb:	89 de                	mov    %ebx,%esi
   1c6cd:	bf 04 00 00 00       	mov    $0x4,%edi
   1c6d2:	8b 55 a8             	mov    -0x58(%ebp),%edx
   1c6d5:	89 f3                	mov    %esi,%ebx
   1c6d7:	0f b6 02             	movzbl (%edx),%eax
   1c6da:	8d 4a 01             	lea    0x1(%edx),%ecx
   1c6dd:	89 4d a8             	mov    %ecx,-0x58(%ebp)
   1c6e0:	84 c0                	test   %al,%al
   1c6e2:	0f 85 17 f8 ff ff    	jne    1beff <Format_Output+0x3f>
   1c6e8:	8b 45 08             	mov    0x8(%ebp),%eax
   1c6eb:	89 04 24             	mov    %eax,(%esp)
   1c6ee:	ff 50 04             	call   *0x4(%eax)
   1c6f1:	b8 00 00 00 00       	mov    $0x0,%eax
   1c6f6:	81 c4 8c 00 00 00    	add    $0x8c,%esp
   1c6fc:	5b                   	pop    %ebx
   1c6fd:	5e                   	pop    %esi
   1c6fe:	5f                   	pop    %edi
   1c6ff:	5d                   	pop    %ebp
   1c700:	c3                   	ret    
   1c701:	90                   	nop
   1c702:	90                   	nop
   1c703:	90                   	nop
   1c704:	90                   	nop
   1c705:	90                   	nop
   1c706:	90                   	nop
   1c707:	90                   	nop
   1c708:	90                   	nop
   1c709:	90                   	nop
   1c70a:	90                   	nop
   1c70b:	90                   	nop
   1c70c:	90                   	nop
   1c70d:	90                   	nop
   1c70e:	90                   	nop
   1c70f:	90                   	nop

0001c710 <memset>:
   1c710:	55                   	push   %ebp
   1c711:	89 e5                	mov    %esp,%ebp
   1c713:	53                   	push   %ebx
   1c714:	8b 45 08             	mov    0x8(%ebp),%eax
   1c717:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   1c71a:	8b 4d 10             	mov    0x10(%ebp),%ecx
   1c71d:	85 c9                	test   %ecx,%ecx
   1c71f:	74 0f                	je     1c730 <memset+0x20>
   1c721:	ba 00 00 00 00       	mov    $0x0,%edx
   1c726:	88 1c 10             	mov    %bl,(%eax,%edx,1)
   1c729:	83 c2 01             	add    $0x1,%edx
   1c72c:	39 ca                	cmp    %ecx,%edx
   1c72e:	75 f6                	jne    1c726 <memset+0x16>
   1c730:	5b                   	pop    %ebx
   1c731:	5d                   	pop    %ebp
   1c732:	c3                   	ret    

0001c733 <memcpy>:
   1c733:	55                   	push   %ebp
   1c734:	89 e5                	mov    %esp,%ebp
   1c736:	56                   	push   %esi
   1c737:	53                   	push   %ebx
   1c738:	8b 45 08             	mov    0x8(%ebp),%eax
   1c73b:	8b 75 0c             	mov    0xc(%ebp),%esi
   1c73e:	8b 5d 10             	mov    0x10(%ebp),%ebx
   1c741:	85 db                	test   %ebx,%ebx
   1c743:	74 13                	je     1c758 <memcpy+0x25>
   1c745:	ba 00 00 00 00       	mov    $0x0,%edx
   1c74a:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
   1c74e:	88 0c 10             	mov    %cl,(%eax,%edx,1)
   1c751:	83 c2 01             	add    $0x1,%edx
   1c754:	39 da                	cmp    %ebx,%edx
   1c756:	75 f2                	jne    1c74a <memcpy+0x17>
   1c758:	5b                   	pop    %ebx
   1c759:	5e                   	pop    %esi
   1c75a:	5d                   	pop    %ebp
   1c75b:	c3                   	ret    

0001c75c <memcmp>:
   1c75c:	55                   	push   %ebp
   1c75d:	89 e5                	mov    %esp,%ebp
   1c75f:	56                   	push   %esi
   1c760:	53                   	push   %ebx
   1c761:	8b 5d 08             	mov    0x8(%ebp),%ebx
   1c764:	8b 75 0c             	mov    0xc(%ebp),%esi
   1c767:	b8 00 00 00 00       	mov    $0x0,%eax
   1c76c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
   1c770:	74 20                	je     1c792 <memcmp+0x36>
   1c772:	0f be 03             	movsbl (%ebx),%eax
   1c775:	0f be 16             	movsbl (%esi),%edx
   1c778:	29 d0                	sub    %edx,%eax
   1c77a:	75 16                	jne    1c792 <memcmp+0x36>
   1c77c:	ba 00 00 00 00       	mov    $0x0,%edx
   1c781:	0f be 44 13 01       	movsbl 0x1(%ebx,%edx,1),%eax
   1c786:	0f be 4c 16 01       	movsbl 0x1(%esi,%edx,1),%ecx
   1c78b:	83 c2 01             	add    $0x1,%edx
   1c78e:	29 c8                	sub    %ecx,%eax
   1c790:	74 ef                	je     1c781 <memcmp+0x25>
   1c792:	5b                   	pop    %ebx
   1c793:	5e                   	pop    %esi
   1c794:	5d                   	pop    %ebp
   1c795:	c3                   	ret    

0001c796 <strlen>:
   1c796:	55                   	push   %ebp
   1c797:	89 e5                	mov    %esp,%ebp
   1c799:	8b 55 08             	mov    0x8(%ebp),%edx
   1c79c:	b8 00 00 00 00       	mov    $0x0,%eax
   1c7a1:	80 3a 00             	cmpb   $0x0,(%edx)
   1c7a4:	74 09                	je     1c7af <strlen+0x19>
   1c7a6:	83 c0 01             	add    $0x1,%eax
   1c7a9:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
   1c7ad:	75 f7                	jne    1c7a6 <strlen+0x10>
   1c7af:	5d                   	pop    %ebp
   1c7b0:	c3                   	ret    

0001c7b1 <strnlen>:
   1c7b1:	55                   	push   %ebp
   1c7b2:	89 e5                	mov    %esp,%ebp
   1c7b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
   1c7b7:	8b 55 0c             	mov    0xc(%ebp),%edx
   1c7ba:	85 d2                	test   %edx,%edx
   1c7bc:	74 19                	je     1c7d7 <strnlen+0x26>
   1c7be:	80 39 00             	cmpb   $0x0,(%ecx)
   1c7c1:	74 14                	je     1c7d7 <strnlen+0x26>
   1c7c3:	b8 00 00 00 00       	mov    $0x0,%eax
   1c7c8:	83 c0 01             	add    $0x1,%eax
   1c7cb:	39 c2                	cmp    %eax,%edx
   1c7cd:	76 0d                	jbe    1c7dc <strnlen+0x2b>
   1c7cf:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
   1c7d3:	75 f3                	jne    1c7c8 <strnlen+0x17>
   1c7d5:	eb 05                	jmp    1c7dc <strnlen+0x2b>
   1c7d7:	b8 00 00 00 00       	mov    $0x0,%eax
   1c7dc:	5d                   	pop    %ebp
   1c7dd:	8d 76 00             	lea    0x0(%esi),%esi
   1c7e0:	c3                   	ret    

0001c7e1 <strcmp>:
   1c7e1:	55                   	push   %ebp
   1c7e2:	89 e5                	mov    %esp,%ebp
   1c7e4:	57                   	push   %edi
   1c7e5:	56                   	push   %esi
   1c7e6:	53                   	push   %ebx
   1c7e7:	83 ec 04             	sub    $0x4,%esp
   1c7ea:	8b 7d 0c             	mov    0xc(%ebp),%edi
   1c7ed:	8b 45 08             	mov    0x8(%ebp),%eax
   1c7f0:	0f b6 08             	movzbl (%eax),%ecx
   1c7f3:	0f b6 1f             	movzbl (%edi),%ebx
   1c7f6:	0f be c1             	movsbl %cl,%eax
   1c7f9:	0f be d3             	movsbl %bl,%edx
   1c7fc:	29 d0                	sub    %edx,%eax
   1c7fe:	75 22                	jne    1c822 <strcmp+0x41>
   1c800:	84 c9                	test   %cl,%cl
   1c802:	74 1e                	je     1c822 <strcmp+0x41>
   1c804:	ba 00 00 00 00       	mov    $0x0,%edx
   1c809:	84 db                	test   %bl,%bl
   1c80b:	75 1d                	jne    1c82a <strcmp+0x49>
   1c80d:	8d 76 00             	lea    0x0(%esi),%esi
   1c810:	eb 10                	jmp    1c822 <strcmp+0x41>
   1c812:	84 db                	test   %bl,%bl
   1c814:	74 0c                	je     1c822 <strcmp+0x41>
   1c816:	83 c2 01             	add    $0x1,%edx
   1c819:	89 f1                	mov    %esi,%ecx
   1c81b:	84 c9                	test   %cl,%cl
   1c81d:	8d 76 00             	lea    0x0(%esi),%esi
   1c820:	75 08                	jne    1c82a <strcmp+0x49>
   1c822:	83 c4 04             	add    $0x4,%esp
   1c825:	5b                   	pop    %ebx
   1c826:	5e                   	pop    %esi
   1c827:	5f                   	pop    %edi
   1c828:	5d                   	pop    %ebp
   1c829:	c3                   	ret    
   1c82a:	8b 45 08             	mov    0x8(%ebp),%eax
   1c82d:	0f b6 5c 10 01       	movzbl 0x1(%eax,%edx,1),%ebx
   1c832:	0f b6 74 17 01       	movzbl 0x1(%edi,%edx,1),%esi
   1c837:	0f be cb             	movsbl %bl,%ecx
   1c83a:	89 4d f0             	mov    %ecx,-0x10(%ebp)
   1c83d:	89 f0                	mov    %esi,%eax
   1c83f:	0f be c8             	movsbl %al,%ecx
   1c842:	8b 45 f0             	mov    -0x10(%ebp),%eax
   1c845:	29 c8                	sub    %ecx,%eax
   1c847:	74 c9                	je     1c812 <strcmp+0x31>
   1c849:	eb d7                	jmp    1c822 <strcmp+0x41>

0001c84b <strncmp>:
   1c84b:	55                   	push   %ebp
   1c84c:	89 e5                	mov    %esp,%ebp
   1c84e:	57                   	push   %edi
   1c84f:	56                   	push   %esi
   1c850:	53                   	push   %ebx
   1c851:	83 ec 08             	sub    $0x8,%esp
   1c854:	8b 7d 0c             	mov    0xc(%ebp),%edi
   1c857:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   1c85e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
   1c862:	74 59                	je     1c8bd <strncmp+0x72>
   1c864:	8b 55 08             	mov    0x8(%ebp),%edx
   1c867:	0f b6 02             	movzbl (%edx),%eax
   1c86a:	0f b6 17             	movzbl (%edi),%edx
   1c86d:	0f be d8             	movsbl %al,%ebx
   1c870:	0f be ca             	movsbl %dl,%ecx
   1c873:	29 cb                	sub    %ecx,%ebx
   1c875:	89 5d f0             	mov    %ebx,-0x10(%ebp)
   1c878:	75 43                	jne    1c8bd <strncmp+0x72>
   1c87a:	84 c0                	test   %al,%al
   1c87c:	74 3f                	je     1c8bd <strncmp+0x72>
   1c87e:	b8 00 00 00 00       	mov    $0x0,%eax
   1c883:	84 d2                	test   %dl,%dl
   1c885:	75 29                	jne    1c8b0 <strncmp+0x65>
   1c887:	eb 34                	jmp    1c8bd <strncmp+0x72>
   1c889:	8b 4d 08             	mov    0x8(%ebp),%ecx
   1c88c:	0f b6 1c 01          	movzbl (%ecx,%eax,1),%ebx
   1c890:	0f b6 34 07          	movzbl (%edi,%eax,1),%esi
   1c894:	0f be d3             	movsbl %bl,%edx
   1c897:	89 55 ec             	mov    %edx,-0x14(%ebp)
   1c89a:	89 f1                	mov    %esi,%ecx
   1c89c:	0f be d1             	movsbl %cl,%edx
   1c89f:	8b 4d ec             	mov    -0x14(%ebp),%ecx
   1c8a2:	29 d1                	sub    %edx,%ecx
   1c8a4:	75 14                	jne    1c8ba <strncmp+0x6f>
   1c8a6:	84 db                	test   %bl,%bl
   1c8a8:	74 10                	je     1c8ba <strncmp+0x6f>
   1c8aa:	89 f2                	mov    %esi,%edx
   1c8ac:	84 d2                	test   %dl,%dl
   1c8ae:	74 0a                	je     1c8ba <strncmp+0x6f>
   1c8b0:	83 c0 01             	add    $0x1,%eax
   1c8b3:	39 45 10             	cmp    %eax,0x10(%ebp)
   1c8b6:	77 d1                	ja     1c889 <strncmp+0x3e>
   1c8b8:	eb 03                	jmp    1c8bd <strncmp+0x72>
   1c8ba:	89 4d f0             	mov    %ecx,-0x10(%ebp)
   1c8bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
   1c8c0:	83 c4 08             	add    $0x8,%esp
   1c8c3:	5b                   	pop    %ebx
   1c8c4:	5e                   	pop    %esi
   1c8c5:	5f                   	pop    %edi
   1c8c6:	5d                   	pop    %ebp
   1c8c7:	c3                   	ret    

0001c8c8 <strcat>:
   1c8c8:	55                   	push   %ebp
   1c8c9:	89 e5                	mov    %esp,%ebp
   1c8cb:	53                   	push   %ebx
   1c8cc:	8b 45 08             	mov    0x8(%ebp),%eax
   1c8cf:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   1c8d2:	89 c2                	mov    %eax,%edx
   1c8d4:	80 38 00             	cmpb   $0x0,(%eax)
   1c8d7:	74 08                	je     1c8e1 <strcat+0x19>
   1c8d9:	83 c2 01             	add    $0x1,%edx
   1c8dc:	80 3a 00             	cmpb   $0x0,(%edx)
   1c8df:	75 f8                	jne    1c8d9 <strcat+0x11>
   1c8e1:	0f b6 0b             	movzbl (%ebx),%ecx
   1c8e4:	84 c9                	test   %cl,%cl
   1c8e6:	74 0f                	je     1c8f7 <strcat+0x2f>
   1c8e8:	88 0a                	mov    %cl,(%edx)
   1c8ea:	83 c2 01             	add    $0x1,%edx
   1c8ed:	83 c3 01             	add    $0x1,%ebx
   1c8f0:	0f b6 0b             	movzbl (%ebx),%ecx
   1c8f3:	84 c9                	test   %cl,%cl
   1c8f5:	75 f1                	jne    1c8e8 <strcat+0x20>
   1c8f7:	c6 02 00             	movb   $0x0,(%edx)
   1c8fa:	5b                   	pop    %ebx
   1c8fb:	5d                   	pop    %ebp
   1c8fc:	c3                   	ret    

0001c8fd <strcpy>:
   1c8fd:	55                   	push   %ebp
   1c8fe:	89 e5                	mov    %esp,%ebp
   1c900:	53                   	push   %ebx
   1c901:	8b 45 08             	mov    0x8(%ebp),%eax
   1c904:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   1c907:	0f b6 0b             	movzbl (%ebx),%ecx
   1c90a:	89 c2                	mov    %eax,%edx
   1c90c:	84 c9                	test   %cl,%cl
   1c90e:	74 0f                	je     1c91f <strcpy+0x22>
   1c910:	88 0a                	mov    %cl,(%edx)
   1c912:	83 c2 01             	add    $0x1,%edx
   1c915:	83 c3 01             	add    $0x1,%ebx
   1c918:	0f b6 0b             	movzbl (%ebx),%ecx
   1c91b:	84 c9                	test   %cl,%cl
   1c91d:	75 f1                	jne    1c910 <strcpy+0x13>
   1c91f:	c6 02 00             	movb   $0x0,(%edx)
   1c922:	5b                   	pop    %ebx
   1c923:	5d                   	pop    %ebp
   1c924:	c3                   	ret    

0001c925 <strncpy>:
   1c925:	55                   	push   %ebp
   1c926:	89 e5                	mov    %esp,%ebp
   1c928:	56                   	push   %esi
   1c929:	53                   	push   %ebx
   1c92a:	8b 45 08             	mov    0x8(%ebp),%eax
   1c92d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   1c930:	8b 5d 10             	mov    0x10(%ebp),%ebx
   1c933:	0f b6 11             	movzbl (%ecx),%edx
   1c936:	84 d2                	test   %dl,%dl
   1c938:	74 06                	je     1c940 <strncpy+0x1b>
   1c93a:	89 c6                	mov    %eax,%esi
   1c93c:	85 db                	test   %ebx,%ebx
   1c93e:	75 04                	jne    1c944 <strncpy+0x1f>
   1c940:	89 c6                	mov    %eax,%esi
   1c942:	eb 16                	jmp    1c95a <strncpy+0x35>
   1c944:	88 16                	mov    %dl,(%esi)
   1c946:	83 c6 01             	add    $0x1,%esi
   1c949:	83 c1 01             	add    $0x1,%ecx
   1c94c:	83 eb 01             	sub    $0x1,%ebx
   1c94f:	0f b6 11             	movzbl (%ecx),%edx
   1c952:	84 d2                	test   %dl,%dl
   1c954:	74 04                	je     1c95a <strncpy+0x35>
   1c956:	85 db                	test   %ebx,%ebx
   1c958:	75 ea                	jne    1c944 <strncpy+0x1f>
   1c95a:	85 db                	test   %ebx,%ebx
   1c95c:	74 03                	je     1c961 <strncpy+0x3c>
   1c95e:	c6 06 00             	movb   $0x0,(%esi)
   1c961:	5b                   	pop    %ebx
   1c962:	5e                   	pop    %esi
   1c963:	5d                   	pop    %ebp
   1c964:	c3                   	ret    

0001c965 <atoi>:
   1c965:	55                   	push   %ebp
   1c966:	89 e5                	mov    %esp,%ebp
   1c968:	53                   	push   %ebx
   1c969:	8b 4d 08             	mov    0x8(%ebp),%ecx
   1c96c:	0f b6 11             	movzbl (%ecx),%edx
   1c96f:	8d 5a d0             	lea    -0x30(%edx),%ebx
   1c972:	b8 00 00 00 00       	mov    $0x0,%eax
   1c977:	80 fb 09             	cmp    $0x9,%bl
   1c97a:	77 18                	ja     1c994 <atoi+0x2f>
   1c97c:	8d 04 80             	lea    (%eax,%eax,4),%eax
   1c97f:	0f be d2             	movsbl %dl,%edx
   1c982:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
   1c986:	83 c1 01             	add    $0x1,%ecx
   1c989:	0f b6 11             	movzbl (%ecx),%edx
   1c98c:	8d 5a d0             	lea    -0x30(%edx),%ebx
   1c98f:	80 fb 09             	cmp    $0x9,%bl
   1c992:	76 e8                	jbe    1c97c <atoi+0x17>
   1c994:	5b                   	pop    %ebx
   1c995:	5d                   	pop    %ebp
   1c996:	c3                   	ret    

0001c997 <strchr>:
   1c997:	55                   	push   %ebp
   1c998:	89 e5                	mov    %esp,%ebp
   1c99a:	8b 45 08             	mov    0x8(%ebp),%eax
   1c99d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   1c9a0:	0f b6 10             	movzbl (%eax),%edx
   1c9a3:	84 d2                	test   %dl,%dl
   1c9a5:	74 1a                	je     1c9c1 <strchr+0x2a>
   1c9a7:	0f be d2             	movsbl %dl,%edx
   1c9aa:	39 ca                	cmp    %ecx,%edx
   1c9ac:	75 09                	jne    1c9b7 <strchr+0x20>
   1c9ae:	eb 16                	jmp    1c9c6 <strchr+0x2f>
   1c9b0:	0f be d2             	movsbl %dl,%edx
   1c9b3:	39 ca                	cmp    %ecx,%edx
   1c9b5:	74 0f                	je     1c9c6 <strchr+0x2f>
   1c9b7:	83 c0 01             	add    $0x1,%eax
   1c9ba:	0f b6 10             	movzbl (%eax),%edx
   1c9bd:	84 d2                	test   %dl,%dl
   1c9bf:	75 ef                	jne    1c9b0 <strchr+0x19>
   1c9c1:	b8 00 00 00 00       	mov    $0x0,%eax
   1c9c6:	5d                   	pop    %ebp
   1c9c7:	c3                   	ret    

0001c9c8 <strrchr>:
   1c9c8:	55                   	push   %ebp
   1c9c9:	89 e5                	mov    %esp,%ebp
   1c9cb:	57                   	push   %edi
   1c9cc:	53                   	push   %ebx
   1c9cd:	8b 55 08             	mov    0x8(%ebp),%edx
   1c9d0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   1c9d3:	89 d7                	mov    %edx,%edi
   1c9d5:	b8 00 00 00 00       	mov    $0x0,%eax
   1c9da:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   1c9df:	f2 ae                	repnz scas %es:(%edi),%al
   1c9e1:	f7 d1                	not    %ecx
   1c9e3:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
   1c9e7:	39 c2                	cmp    %eax,%edx
   1c9e9:	73 1a                	jae    1ca05 <strrchr+0x3d>
   1c9eb:	83 e8 01             	sub    $0x1,%eax
   1c9ee:	0f be 08             	movsbl (%eax),%ecx
   1c9f1:	39 d9                	cmp    %ebx,%ecx
   1c9f3:	75 0c                	jne    1ca01 <strrchr+0x39>
   1c9f5:	eb 13                	jmp    1ca0a <strrchr+0x42>
   1c9f7:	83 e8 01             	sub    $0x1,%eax
   1c9fa:	0f be 08             	movsbl (%eax),%ecx
   1c9fd:	39 d9                	cmp    %ebx,%ecx
   1c9ff:	74 09                	je     1ca0a <strrchr+0x42>
   1ca01:	39 c2                	cmp    %eax,%edx
   1ca03:	72 f2                	jb     1c9f7 <strrchr+0x2f>
   1ca05:	b8 00 00 00 00       	mov    $0x0,%eax
   1ca0a:	5b                   	pop    %ebx
   1ca0b:	5f                   	pop    %edi
   1ca0c:	5d                   	pop    %ebp
   1ca0d:	c3                   	ret    

0001ca0e <strpbrk>:
   1ca0e:	55                   	push   %ebp
   1ca0f:	89 e5                	mov    %esp,%ebp
   1ca11:	57                   	push   %edi
   1ca12:	56                   	push   %esi
   1ca13:	53                   	push   %ebx
   1ca14:	8b 5d 08             	mov    0x8(%ebp),%ebx
   1ca17:	8b 55 0c             	mov    0xc(%ebp),%edx
   1ca1a:	89 d7                	mov    %edx,%edi
   1ca1c:	b8 00 00 00 00       	mov    $0x0,%eax
   1ca21:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   1ca26:	f2 ae                	repnz scas %es:(%edi),%al
   1ca28:	f7 d1                	not    %ecx
   1ca2a:	8d 79 ff             	lea    -0x1(%ecx),%edi
   1ca2d:	0f b6 0b             	movzbl (%ebx),%ecx
   1ca30:	be 00 00 00 00       	mov    $0x0,%esi
   1ca35:	84 c9                	test   %cl,%cl
   1ca37:	75 18                	jne    1ca51 <strpbrk+0x43>
   1ca39:	eb 27                	jmp    1ca62 <strpbrk+0x54>
   1ca3b:	3a 0c 02             	cmp    (%edx,%eax,1),%cl
   1ca3e:	74 27                	je     1ca67 <strpbrk+0x59>
   1ca40:	83 c0 01             	add    $0x1,%eax
   1ca43:	39 c7                	cmp    %eax,%edi
   1ca45:	77 f4                	ja     1ca3b <strpbrk+0x2d>
   1ca47:	83 c3 01             	add    $0x1,%ebx
   1ca4a:	0f b6 0b             	movzbl (%ebx),%ecx
   1ca4d:	84 c9                	test   %cl,%cl
   1ca4f:	74 11                	je     1ca62 <strpbrk+0x54>
   1ca51:	85 ff                	test   %edi,%edi
   1ca53:	74 f2                	je     1ca47 <strpbrk+0x39>
   1ca55:	3a 0a                	cmp    (%edx),%cl
   1ca57:	74 0e                	je     1ca67 <strpbrk+0x59>
   1ca59:	89 f0                	mov    %esi,%eax
   1ca5b:	90                   	nop
   1ca5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   1ca60:	eb de                	jmp    1ca40 <strpbrk+0x32>
   1ca62:	bb 00 00 00 00       	mov    $0x0,%ebx
   1ca67:	89 d8                	mov    %ebx,%eax
   1ca69:	5b                   	pop    %ebx
   1ca6a:	5e                   	pop    %esi
   1ca6b:	5f                   	pop    %edi
   1ca6c:	5d                   	pop    %ebp
   1ca6d:	c3                   	ret    

0001ca6e <String_Emit>:
   1ca6e:	55                   	push   %ebp
   1ca6f:	89 e5                	mov    %esp,%ebp
   1ca71:	8b 45 08             	mov    0x8(%ebp),%eax
   1ca74:	8b 50 0c             	mov    0xc(%eax),%edx
   1ca77:	3b 50 10             	cmp    0x10(%eax),%edx
   1ca7a:	73 0e                	jae    1ca8a <String_Emit+0x1c>
   1ca7c:	8b 50 08             	mov    0x8(%eax),%edx
   1ca7f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   1ca82:	88 0a                	mov    %cl,(%edx)
   1ca84:	83 c2 01             	add    $0x1,%edx
   1ca87:	89 50 08             	mov    %edx,0x8(%eax)
   1ca8a:	83 40 0c 01          	addl   $0x1,0xc(%eax)
   1ca8e:	5d                   	pop    %ebp
   1ca8f:	c3                   	ret    

0001ca90 <String_Finish>:
   1ca90:	55                   	push   %ebp
   1ca91:	89 e5                	mov    %esp,%ebp
   1ca93:	8b 45 08             	mov    0x8(%ebp),%eax
   1ca96:	8b 50 0c             	mov    0xc(%eax),%edx
   1ca99:	3b 50 10             	cmp    0x10(%eax),%edx
   1ca9c:	73 08                	jae    1caa6 <String_Finish+0x16>
   1ca9e:	8b 40 08             	mov    0x8(%eax),%eax
   1caa1:	c6 00 00             	movb   $0x0,(%eax)
   1caa4:	eb 07                	jmp    1caad <String_Finish+0x1d>
   1caa6:	8b 40 08             	mov    0x8(%eax),%eax
   1caa9:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
   1caad:	5d                   	pop    %ebp
   1caae:	c3                   	ret    

0001caaf <snprintf>:
   1caaf:	55                   	push   %ebp
   1cab0:	89 e5                	mov    %esp,%ebp
   1cab2:	83 ec 38             	sub    $0x38,%esp
   1cab5:	c7 45 e4 6e ca 01 00 	movl   $0x1ca6e,-0x1c(%ebp)
   1cabc:	c7 45 e8 90 ca 01 00 	movl   $0x1ca90,-0x18(%ebp)
   1cac3:	8b 45 08             	mov    0x8(%ebp),%eax
   1cac6:	89 45 ec             	mov    %eax,-0x14(%ebp)
   1cac9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   1cad0:	8b 45 0c             	mov    0xc(%ebp),%eax
   1cad3:	89 45 f4             	mov    %eax,-0xc(%ebp)
   1cad6:	8d 45 14             	lea    0x14(%ebp),%eax
   1cad9:	89 44 24 08          	mov    %eax,0x8(%esp)
   1cadd:	8b 45 10             	mov    0x10(%ebp),%eax
   1cae0:	89 44 24 04          	mov    %eax,0x4(%esp)
   1cae4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   1cae7:	89 04 24             	mov    %eax,(%esp)
   1caea:	e8 d1 f3 ff ff       	call   1bec0 <Format_Output>
   1caef:	c9                   	leave  
   1caf0:	c3                   	ret    

0001caf1 <strdup>:
   1caf1:	55                   	push   %ebp
   1caf2:	89 e5                	mov    %esp,%ebp
   1caf4:	83 ec 28             	sub    $0x28,%esp
   1caf7:	89 5d f4             	mov    %ebx,-0xc(%ebp)
   1cafa:	89 75 f8             	mov    %esi,-0x8(%ebp)
   1cafd:	89 7d fc             	mov    %edi,-0x4(%ebp)
   1cb00:	8b 75 08             	mov    0x8(%ebp),%esi
   1cb03:	89 f7                	mov    %esi,%edi
   1cb05:	b8 00 00 00 00       	mov    $0x0,%eax
   1cb0a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   1cb0f:	f2 ae                	repnz scas %es:(%edi),%al
   1cb11:	f7 d1                	not    %ecx
   1cb13:	89 0c 24             	mov    %ecx,(%esp)
   1cb16:	e8 55 71 ff ff       	call   13c70 <Malloc>
   1cb1b:	89 c3                	mov    %eax,%ebx
   1cb1d:	89 74 24 04          	mov    %esi,0x4(%esp)
   1cb21:	89 04 24             	mov    %eax,(%esp)
   1cb24:	e8 d4 fd ff ff       	call   1c8fd <strcpy>
   1cb29:	89 d8                	mov    %ebx,%eax
   1cb2b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
   1cb2e:	8b 75 f8             	mov    -0x8(%ebp),%esi
   1cb31:	8b 7d fc             	mov    -0x4(%ebp),%edi
   1cb34:	89 ec                	mov    %ebp,%esp
   1cb36:	5d                   	pop    %ebp
   1cb37:	c3                   	ret    

0001cb38 <memmove>:
   1cb38:	55                   	push   %ebp
   1cb39:	89 e5                	mov    %esp,%ebp
   1cb3b:	57                   	push   %edi
   1cb3c:	56                   	push   %esi
   1cb3d:	53                   	push   %ebx
   1cb3e:	83 ec 1c             	sub    $0x1c,%esp
   1cb41:	8b 45 0c             	mov    0xc(%ebp),%eax
   1cb44:	8b 75 08             	mov    0x8(%ebp),%esi
   1cb47:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
   1cb4b:	74 57                	je     1cba4 <memmove+0x6c>
   1cb4d:	89 c7                	mov    %eax,%edi
   1cb4f:	8b 55 10             	mov    0x10(%ebp),%edx
   1cb52:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
   1cb55:	39 d8                	cmp    %ebx,%eax
   1cb57:	73 07                	jae    1cb60 <memmove+0x28>
   1cb59:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
   1cb5c:	39 ce                	cmp    %ecx,%esi
   1cb5e:	72 15                	jb     1cb75 <memmove+0x3d>
   1cb60:	8b 4d 10             	mov    0x10(%ebp),%ecx
   1cb63:	89 4c 24 08          	mov    %ecx,0x8(%esp)
   1cb67:	89 7c 24 04          	mov    %edi,0x4(%esp)
   1cb6b:	89 34 24             	mov    %esi,(%esp)
   1cb6e:	e8 c0 fb ff ff       	call   1c733 <memcpy>
   1cb73:	eb 31                	jmp    1cba6 <memmove+0x6e>
   1cb75:	39 c6                	cmp    %eax,%esi
   1cb77:	73 14                	jae    1cb8d <memmove+0x55>
   1cb79:	b9 00 00 00 00       	mov    $0x0,%ecx
   1cb7e:	8b 55 08             	mov    0x8(%ebp),%edx
   1cb81:	0f b6 1c 08          	movzbl (%eax,%ecx,1),%ebx
   1cb85:	88 1c 0a             	mov    %bl,(%edx,%ecx,1)
   1cb88:	83 c1 01             	add    $0x1,%ecx
   1cb8b:	eb f4                	jmp    1cb81 <memmove+0x49>
   1cb8d:	39 c6                	cmp    %eax,%esi
   1cb8f:	76 13                	jbe    1cba4 <memmove+0x6c>
   1cb91:	b8 00 00 00 00       	mov    $0x0,%eax
   1cb96:	0f b6 54 01 ff       	movzbl -0x1(%ecx,%eax,1),%edx
   1cb9b:	88 54 03 ff          	mov    %dl,-0x1(%ebx,%eax,1)
   1cb9f:	83 e8 01             	sub    $0x1,%eax
   1cba2:	eb f2                	jmp    1cb96 <memmove+0x5e>
   1cba4:	89 f0                	mov    %esi,%eax
   1cba6:	83 c4 1c             	add    $0x1c,%esp
   1cba9:	5b                   	pop    %ebx
   1cbaa:	5e                   	pop    %esi
   1cbab:	5f                   	pop    %edi
   1cbac:	5d                   	pop    %ebp
   1cbad:	c3                   	ret    
