static inline int mandel(float c_re, float c_im, int count) {
    float z_re = c_re, z_im = c_im;
    int i;
    for (i = 0; i < count; ++i) {
        if (z_re * z_re + z_im * z_im > 4.)
            break;
        float new_re = z_re*z_re - z_im*z_im;
        float new_im = 2.f * z_re * z_im;
        z_re = c_re + new_re;
        z_im = c_im + new_im;
    }
    return i;
}

export void mandelbrot_rgb(uniform float x0, uniform float y0,
                           uniform float x1, uniform float y1,
                           uniform int width, uniform int height,
                           uniform int maxIterations,
                           uniform uint32 output[]) {
    float dx = (x1 - x0) / width;
    float dy = (y1 - y0) / height;

    for (uniform int j = 0; j < height; j++) {
        foreach (i = 0 ... width) {
            float x = x0 + i * dx;
            float y = y0 + j * dy;

            int index = j * width + i;
            int iterations = mandel(x, y, maxIterations);

            uint32 color = 0xFF000000;

            if (iterations < maxIterations) {
                uint8 r = (uint8) iterations * 2;
                uint8 g = (uint8) iterations * 4;
                uint8 b = (uint8) iterations * 8;

                color = (((uint32)255 << 24) |
                         ((uint32)b << 16) |
                         ((uint32)g << 8)  |
                          (uint32)r);
            }

            output[index] = color;
        }
    }
}