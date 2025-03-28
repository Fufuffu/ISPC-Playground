#include "mandelbrot_ispc.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

#include <iostream>


using namespace ispc;

int main() {
    unsigned int width = 1920, height = 1080;
    float x0 = -2., x1 = 1.;
    float y0 = -1., y1 = 1.;
    int maxIterations = 512;
    // Each uint32_t is a color: a b g r (as uint8_t)
    uint32_t *buf = new uint32_t[width*height];

    mandelbrot_rgb(x0, y0, x1, y1, width, height, maxIterations, buf);

    std::cout << "MANDELBROT DONE \n";

    int colorChannels = 4;
    stbi_write_png("test.png", width, height, colorChannels, reinterpret_cast<uint8_t*> (buf), width*colorChannels);

    std::cout << "WRITE DONE";
}
