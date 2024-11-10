#include <geekos/bootinfo.h>
#include <geekos/string.h>
#include <geekos/screen.h>
#include <geekos/mem.h>
#include <geekos/crc32.h>
#include <geekos/tss.h>
#include <geekos/int.h>
#include <geekos/kthread.h>
#include <geekos/trap.h>
#include <geekos/timer.h>
#include <geekos/keyboard.h>

#define MAX_CHAR_COUNT 256

/*
 * 键盘输入处理线程。
 */
void print_key(ulong_t arg)
{
    Keycode keycode;
    char ch;
    int charCount[MAX_CHAR_COUNT] = {0};
    int i;
    while (true) {
        // 等待键盘输入
        keycode = Wait_For_Key();

        // 检查是否为松开事件
        if (keycode & KEY_RELEASE_FLAG) {
            continue;
        }

        // 检查是否为 Ctrl + d
        if ((keycode & 0xFF) == 'd' && (keycode & KEY_CTRL_FLAG)) {
            break;
        }

        // 将键码转换为字符并显示
        ch = (char)(keycode & 0xFF);
        Print("%c", ch);

        // 更新字符计数
        if (ch >= 0 && ch < MAX_CHAR_COUNT) {
            charCount[(int)ch]++;
        }
    }

    // 显示最终的字符计数结果
    Print("\nCharacter Count:\n");
    for (i = 0; i < MAX_CHAR_COUNT; i++) {
        if (charCount[i] > 0) {
            Print("%c: %d\n", i, charCount[i]);
        }
    }
}

/*
 * 内核 C 代码入口点。
 * 初始化内核子系统，挂载文件系统，
 * 并生成 init 进程。
 */
void Main(struct Boot_Info* bootInfo)
{
    Init_BSS();
    Init_Screen();
    Init_Mem(bootInfo);
    Init_CRC32();
    Init_TSS();
    Init_Interrupts();
    Init_Scheduler();
    Init_Traps();
    Init_Timer();
    Init_Keyboard();

    Set_Current_Attr(ATTRIB(BLACK, GREEN|BRIGHT));
    Print("Welcome to GeekOS!\n");
    Set_Current_Attr(ATTRIB(BLACK, GRAY));

    // 启动一个内核线程以回显按下的键并打印计数
    Start_Kernel_Thread(print_key, 0, PRIORITY_NORMAL, true);

    /* 现在这个线程已经完成。 */
    Exit(0);
}
