#include "../test_static.isph"
// rule: skip on cpu=TGLLP

task void f_fu(uniform float RET[], uniform float aFOO[], uniform float b) {
    float a = aFOO[programIndex]; 
    uniform double udx[5][programCount+5];
    for (uniform int i = 0; i < 5; ++i)
        for (uniform int j = 0; j < programCount+5; ++j)
            udx[i][j] = 10*i+j;

    int x = 1;
    RET[programIndex] = udx[x][programIndex+1];
}

task void result(uniform float RET[]) { RET[programIndex] = 11+programIndex; }
