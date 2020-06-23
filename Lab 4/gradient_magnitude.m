function gradient_magnitude = gradient_magnitude(grayScaleImage)
%gradient_magnitude Computes the magnitude of the gradient of a grayscale
%                   image
%
%Syntax:
%       output = gradient_magnitude(grayScaleImage)
%
%Input:
%       input = grayScaleImage
%
%Output:
%       output = matrix, type double, of magnitude of gradient
%
%History:
%       J.Garache created and completed 11/11/2017
%    
    %Sobel x and y kernels (3x3)
    kernX = [1 0 -1; 2 0 -2; 1 0 -2];
    kernY = [1 2 1; 0 0 0; -1 -2 -1]; 
    
    %convolution of kernels with grayScaleImage
    Gx = spatial_filter(grayScaleImage, kernX);
    Gy = spatial_filter(grayScaleImage, kernY);
    
    %gradient Magnitude
    gradient_magnitude = sqrt(Gx.^2 + Gy.^2);
    
end