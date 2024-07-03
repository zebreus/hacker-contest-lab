#include <stdint.h>
#include <stdbool.h>

// Replaces some characters with other characters
// Switched the characters in the table
char *unswitch_chars(char *a1)
{
    char v2;
    int i;

    for (i = 0; i < strlen(a1); ++i)
    {
        v2 = a1[i];
        switch (v2)
        {
        case 33:
            v2 = 'a';
            break;
        case 47:
            v2 = 's';
            break;
        case 39:
            v2 = 'd';
            break;
        case 63:
            v2 = 'f';
            break;
        case 64:
            v2 = 'e';
            break;
        case 38:
            v2 = 'i';
            break;
        case 37:
            v2 = 'o';
            break;
        case 40:
            v2 = 'u';
            break;
        }
        a1[i] = v2;
    }
    return a1;
}

// Rotates numbers by five and uppercase letters by 13
// That behavior is self-inverse, so I didnt need to modify the function
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

// Code was reversed using dogbolt. Mostly used the hexrays decompiler
int32_t main(int32_t argc, char **argv, char **envp)
{
    int32_t var_c = 0;
    int32_t rax;
    if (argc != 2)
    {
        puts("Please enter a command-line argument");
        rax = 1;
    }
    else if (strlen(argv[1]) == 0x20)
    {
        char *rax_6 = argv[1];
        int64_t var_58;
        __builtin_strcpy(&var_58, "SCRAMBLED{XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX}");
        puts(unswitch_chars(unrot_chars(rax_6, &var_58)));
        rax = 0;
    }
    else
    {
        puts("please pass me a proper 32 char …");
        rax = 1;
    }
    return rax;
}