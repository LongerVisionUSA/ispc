#include "../test_static.isph"
// rule: skip on cpu=TGLLP

task void f_v(uniform float RET[]) {
#define width 4ul
#define maxProgramCount 64ul
    assert(programCount <= maxProgramCount);

//CO    const uniform int width = 4;
//CO    const uniform int maxProgramCount = 16;
    uniform double a[width*maxProgramCount], r[width*maxProgramCount];
    for (uniform int i = 0; i < width*maxProgramCount; ++i)
        a[i] = i;

    double x=-1, y=-1, z=-1, w=-1;
    aos_to_soa4(a, &x, &y, &z, &w);

    int errs = 0;
    if (x != width * programIndex) ++errs;
    if (y != 1 + width * programIndex) ++errs;
    if (z != 2 + width * programIndex) ++errs;
    if (w != 3 + width * programIndex) ++errs;
    //print("programIndex = %: x = %, y = %, z = %, w = %\n", programIndex, x, y, z, w);

    RET[programIndex] = errs;
}

task void result(uniform float RET[]) {
    RET[programIndex] = 0;
}
