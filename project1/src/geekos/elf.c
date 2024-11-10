/*
 * ELF executable loading
 * Copyright (c) 2003, Jeffrey K. Hollingsworth <hollings@cs.umd.edu>
 * Copyright (c) 2003, David H. Hovemeyer <daveho@cs.umd.edu>
 * $Revision: 1.29 $
 * 
 * This is free software.  You are permitted to use,
 * redistribute, and modify it as specified in the file "COPYING".
 */

#include <geekos/errno.h>
#include <geekos/kassert.h>
#include <geekos/ktypes.h>
#include <geekos/screen.h>  /* for debug Print() statements */
#include <geekos/pfat.h>
#include <geekos/malloc.h>
#include <geekos/string.h>
#include <geekos/elf.h>


/**
 * From the data of an ELF executable, determine how its segments
 * need to be loaded into memory.
 * @param exeFileData buffer containing the executable file
 * @param exeFileLength length of the executable file in bytes
 * @param exeFormat structure describing the executable's segments
 *   and entry address; to be filled in
 * @return 0 if successful, < 0 on error
 */
int Parse_ELF_Executable(char *exeFileData, ulong_t exeFileLength, struct Exe_Format *exeFormat)
//zh:解析ELF格式的可执行文件，获取可执行文件长度，代码段，数据段等信息，并打印输出
{
    elfHeader* elf_head = (elfHeader*) exeFileData; //zh:定义一个指向ELF文件头的指针
    programHeader* program_head = (programHeader*)(exeFileData + elf_head->phoff); //zh:定义一个指向程序头的指针
    
    KASSERT(exeFileData); //zh:确保exeFileData不为空
    
    exeFormat->numSegments = elf_head->phnum; //zh:填充Exe_Format数据结构中的numSegments值域
    exeFormat->entryAddr = elf_head->entry; //zh:填充Exe_Format数据结构中的entryAddr值域

    // 打印ELF文件头信息
    Print("ELF Header:\n");
    Print("  Type: %u\n", elf_head->type);
    Print("  Machine: %u\n", elf_head->machine);
    Print("  Version: %u\n", elf_head->version);
    Print("  Program Header Offset: %u\n", elf_head->phoff);
    Print("  Number of Program Headers: %u\n", elf_head->phnum);
    Print("  Number of Section Headers: %u\n", elf_head->shnum);

    /*
    Print("ELF 头信息:\n");
    Print("  类型: %u\n", elf_head->type);
    Print("  机器: %u\n", elf_head->machine);
    Print("  版本: %u\n", elf_head->version);
    Print("  程序头偏移: %u\n", elf_head->phoff);
    Print("  程序头数量: %u\n", elf_head->phnum);
    Print("  节头数量: %u\n", elf_head->shnum);
    */

    int i;
    for (i = 0; i < elf_head->phnum; ++i) //zh:遍历所有的程序头
    {
        Print("Program Header %d:\n", i);
        Print("  Offset in File: %u\n", program_head->offset);
        Print("  Length in File: %u\n", program_head->fileSize);
        Print("  Start Address: 0x%lx\n", program_head->vaddr);
        Print("  Size in Memory: %u\n", program_head->memSize);
        Print("  Protection Flags: %u\n", program_head->flags);
        /*
        Print("程序头 %d:\n", i);
        Print("  文件偏移: %u\n", program_head->offset);
        Print("  文件长度: %u\n", program_head->fileSize);
        Print("  起始地址: 0x%lx\n", program_head->vaddr);
        Print("  内存大小: %u\n", program_head->memSize);
        Print("  权限标志: %u\n", program_head->flags);
        */

        exeFormat->segmentList[i].offsetInFile = program_head->offset; //zh:填充Exe_Format数据结构中的offsetInFile值域
        exeFormat->segmentList[i].lengthInFile = program_head->fileSize; //zh:填充Exe_Format数据结构中的lengthInFile值域
        exeFormat->segmentList[i].startAddress = program_head->vaddr; //zh:填充Exe_Format数据结构中的startAddress值域
        exeFormat->segmentList[i].sizeInMemory = program_head->memSize; //zh:填充Exe_Format数据结构中的sizeInMemory值域
        exeFormat->segmentList[i].protFlags = program_head->flags; //zh:填充Exe_Format数据结构中的protFlags值域
        ++program_head;
    }
    return 0;
}
