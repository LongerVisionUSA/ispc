#include "../test_static.isph"
// rule: skip on cpu=TGLLP

static double double4(uniform double a, uniform double b, uniform double c, 
                    uniform double d) {
    double ret = 0;
    for (uniform int i = 0; i < programCount; i += 4) {
        ret = insert(ret, i + 0, a);
        ret = insert(ret, i + 1, b);
        ret = insert(ret, i + 2, c);
        ret = insert(ret, i + 3, d);
    }
    return ret;
}



bool ok(double x, double ref) { return (abs(x - ref) < 1d-15) || abs((x-ref)/ref) < 1d-14; }

task void f_v(uniform float RET[]) {
    double v = double4((14.300000190734863d0),(-6.699999809265137d0),(-21.200000762939453d0),(9.000000000000000d0));
    double ref = double4((0.9867719333537206d0),(-0.40484974621184605d0),(-0.7111606865372466d0),(0.4121184852417566d0));
    RET[programIndex] = ok(sin(v), ref) ? 1. : 0.;
}
task void result(uniform float RET[]) { RET[programIndex] = 1.; }
