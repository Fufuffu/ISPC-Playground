ispc -g --target=avx mandelbrot.ispc -o objs/mandelbrot_ispc.obj -h objs/mandelbrot_ispc.h
cl /EHsc /W4 /DEBUG /I objs\ mandelbrot.cpp objs\mandelbrot_ispc.obj /link /out:mandelbrot.exe