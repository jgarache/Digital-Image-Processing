function compute_histogram = compute_histogram(grayScaleImage)
%compute_histogram converts a gray Scale Image into a histogram
%           
%
%Syntax:
%       output = compute_histogram(grayScaleImage)
%
%Input:
%       input = grayscale image
%
%Output:
%       output = histogram of the gray Scale image
%
%History:
%       J.Garache created and completed 10/22/2017
%

    %Initializing values
    %compute_histogram is empty vector with 256 elements
    compute_histogram = zeros(256,1);
    
    %m and n are the dimensions of the image
    m = size(grayScaleImage,1);
    n = size(grayScaleImage,2);

    %calculating the histogram from the image
    for i=1:m
        for j=1:n
            temp = grayScaleImage(i,j)+1;
            compute_histogram(temp) = compute_histogram(temp)+1; 
        end
    end
    
    %dividing each element in the vector by m*n to get the values between 0
    %and 1
    compute_histogram = compute_histogram / (m*n);
    
end