#include "../test_static.isph"
// rule: skip on arch=genx32
// rule: skip on arch=genx64

static uniform float array[10];
task void foo(uniform float f) { array[0] = f; }
task void foo(uniform float f, uniform int i) { array[i] = f; }

task void f_v(uniform float RET[]) {
    launch[1] foo(12.);
    launch[1] foo(-1., 1);
    sync;
    RET[programIndex] = array[0] + array[1];
}


task void result(uniform float RET[]) {
    RET[programIndex] = 11.000000;
}
