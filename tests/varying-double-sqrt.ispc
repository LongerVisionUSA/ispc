#include "../test_static.isph"
// rule: skip on cpu=TGLLP

task void f_f(uniform float RET[], uniform float aFOO[]) {
    varying double f = programIndex;
    varying double calc = sqrt(f) * sqrt(f) - programIndex;
    if (calc < 0.) calc = -calc;
    if (calc < 1e-14)
    {
        RET[programIndex] = 1;
    }
    else
    {
        RET[programIndex] = 0;
    }
}

task void result(uniform float RET[]) {
    RET[programIndex] = 1;
}
