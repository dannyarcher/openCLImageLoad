<<<<<<< HEAD
__kernel void sobel(__read_only image2d_t srcImg,
                    __write_only image2d_t dstImg,
                    sampler_t sampler,
                    int width, int height)
{
    // Gaussian Kernel is:
    // 1  2  1
    // 2  4  2
    // 1  2  1
    //    float kernelWeights[9] = { 1.0f, 2.0f, 1.0f,
    //        2.0f, 4.0f, 2.0f,
    //        1.0f, 2.0f, 1.0f };
    //    int2 startImageCoord = (int2) (get_global_id(0) - 1,
    //                                   get_global_id(1) - 1);
    //    int2 endImageCoord   = (int2) (get_global_id(0) + 1,
    //                                   get_global_id(1) + 1);
    //    int2 outImageCoord = (int2) (get_global_id(0),
    //                                 get_global_id(1));
    //    if (outImageCoord.x < width && outImageCoord.y < height)
    //    {
    //        int weight = 0;
    //        float4 outColor = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
    //        for(int y = startImageCoord.y; y <= endImageCoord.y; y++)
    //        {
    //            for(int x= startImageCoord.x; x <= endImageCoord.x; x++)
    //            {
    //                outColor +=
    //                (read_imagef(srcImg, sampler, (int2)(x, y)) *
    //                 (kernelWeights[weight] / 16.0f));
    //                weight += 1;
    //                // Write the output value to image
    //                write_imagef(dstImg, outImageCoord, outColor);
    //            }
    //        } 
    //    }
    
    int2 startImageCoord = (int2) (get_global_id(0) - 1,
                                   get_global_id(1) - 1);
    int2 endImageCoord   = (int2) (get_global_id(0) + 1,
                                   get_global_id(1) + 1);
    int2 outImageCoord = (int2) (get_global_id(0),
                                 get_global_id(1));
    if (outImageCoord.x < width && outImageCoord.y < height)
    {
        float4 outColor = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
        for(int y = startImageCoord.y; y <= endImageCoord.y; y++)
        {
            for(int x= startImageCoord.x; x <= endImageCoord.x; x++)
            {
                outColor = read_imagef(srcImg, sampler, (int2)(x, y));
                // Write the output value to image
                write_imagef(dstImg, outImageCoord, outColor);
            }
        } 
    }
}
=======
const int order = 1;


__kernel void sobel(__global float2 *in, __global float2 *out, __local float *sMemx, __local float *sMemy) {

}


>>>>>>> 878e75955ad3ce30d2a00293626a1dfcbd1fd960
