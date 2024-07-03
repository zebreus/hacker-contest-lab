#include <stdint.h>
#include <stdbool.h>

// int32_t puts(char const* str)
// {
//     /* tailcall */
//     return puts(str);
// }

// uint64_t strlen(char const* arg1)
// {
//     /* tailcall */
//     return strlen(arg1);
// }

char *switch_chars(char *arg1)
{
    int32_t var_1c = 0;
    while (true)
    {
        if (var_1c >= strlen(arg1))
        {
            break;
        }
        char var_1d_1 = arg1[var_1c];
        switch (var_1d_1)
        {
        case 0x61:
        {
            var_1d_1 = 0x21;
            break;
        }
        case 0x64:
        {
            var_1d_1 = 0x27;
            break;
        }
        case 0x65:
        {
            var_1d_1 = 0x40;
            break;
        }
        case 0x66:
        {
            var_1d_1 = 0x3f;
            break;
        }
        case 0x69:
        {
            var_1d_1 = 0x26;
            break;
        }
        case 0x6f:
        {
            var_1d_1 = 0x25;
            break;
        }
        case 0x73:
        {
            var_1d_1 = 0x2f;
            break;
        }
        case 0x75:
        {
            var_1d_1 = 0x28;
            break;
        }
        }
        arg1[var_1c] = var_1d_1;
        var_1c = (var_1c + 1);
    }
    return arg1;
}

// ch rot_chars(char *arg1, int64_t arg2)
// {
//     int32_t var_20 = 0;
//     while (true)
//     {
//         if (var_20 >= strlen(arg1))
//         {
//             break;
//         }
//         char var_19_1 = arg1[var_20];
//         if ((var_19_1 > 0x40 && var_19_1 <= 0x5a))
//         {
//             var_19_1 = (((var_19_1 - 0x34) - (((var_19_1 - 0x34) / 0x1a) * 0x1a)) + 0x41);
//         }
//         if ((((var_19_1 <= 0x40 || (var_19_1 > 0x40 && var_19_1 > 0x5a)) && var_19_1 > 0x2f) && var_19_1 <= 0x39))
//         {
//             int32_t rax_15 = ((var_19_1 - 0x2b) / 0xa);
//             var_19_1 = (((var_19_1 - 0x2b) - (((rax_15 << 2) + rax_15) * 2)) + 0x30);
//         }
//         *(char *)((var_20 + 0xa) + arg2) = var_19_1;
//         var_20 = (var_20 + 1);
//     }
//     return arg2;
// }

int64_t rot_chars(const char *input, char *output)
{
    int i;   // [rsp+18h] [rbp-18h]
    char v4; // [rsp+1Fh] [rbp-11h]

    for (i = 0; i < strlen(input); ++i)
    {
        v4 = input[i];
        if (v4 <= 64 || v4 > 90)
        {
            if (v4 > 47 && v4 <= 57)
                v4 = (v4 - 3) % 10 + 48;
        }
        else
        {
            v4 = (v4 - 52) % 26 + 65;
        }
        output[i + 10] = v4;
    }
    return output;
}

int64_t unrot_chars(const char *input, char *output)
{
    int i;   // [rsp+18h] [rbp-18h]
    char v4; // [rsp+1Fh] [rbp-11h]

    for (i = 0; i < strlen(input); ++i)
    {
        v4 = input[i];
        if (v4 <= 64 || v4 > 90)
        {
            if (v4 > 47 && v4 <= 57)
                v4 = (v4 - 3) % 10 + 48;
        }
        else
        {
            v4 = (v4 - 52) % 26 + 65;
        }
        output[i + 10] = v4;
    }
    return output;
}

int32_t main(int32_t argc, char **argv, char **envp)
{
    int32_t var_c = 0;
    int32_t rax;
    if (argc != 2)
    {
        puts("Please enter a command-line argu…");
        rax = 1;
    }
    else if (strlen(argv[1]) == 0x20)
    {
        char *rax_6 = argv[1];
        int64_t var_58;
        __builtin_strcpy(&var_58, "SCRAMBLED{XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX}");
        puts(rot_chars(rax_6, &var_58));
        rax = 0;
    }
    else
    {
        puts("please pass me a proper 32 char …");
        rax = 1;
    }
    return rax;
}