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
    double v = double4((-9.424777984619141d0),(4.000000000000000d0),(10.000000000000000d0),(-10.000000000000000d0));
    double ref = double4((8.069951564564043d-05),(54.598150033144236d0),(22026.465794806718d0),(4.5399929762484854d-05));
    RET[programIndex] = ok(exp(v), ref) ? 1. : 0.;
}
task void result(uniform float RET[]) { RET[programIndex] = 1.; }
