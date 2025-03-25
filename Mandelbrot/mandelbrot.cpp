#include "mandelbrot_ispc.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

#include <iostream>


using namespace ispc;

int main() {
    unsigned int width = 768, height = 512;
    float x0 = -2., x1 = 1.;
    float y0 = -1., y1 = 1.;
    int maxIterations = 256;
    int *buf = new int[width*height];

    mandelbrot_ispc(x0, y0, x1, y1, width, height, maxIterations, buf);

    std::cout << "MANDELBROT DONE";

    int channels = 1;
    stbi_write_png("test.png", width, height, channels, buf, width*channels);

    std::cout << "WRITE DONE";
}
