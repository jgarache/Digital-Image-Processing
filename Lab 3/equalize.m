function equalize = equalize(grayScaleImage)
%equalize creates equalized histogram
%           
%
%Syntax:
%       output = equalize(grayScaleImage)
%
%Input:
%       input = grayscale image
%
%Output:
%       output = none
%
%History:
%       J.Garache created and completed 10/22/2017
%

    %dimension of image
    m = size(grayScaleImage,1);
    n = size(grayScaleImage,2);
    
    %computes histogram
    histogram = compute_histogram(grayScaleImage);
    
    %plots histogram
    plot_histogram(histogram);
    figure();
    
    %transformation function
    T = histogram_transform(histogram);
    
    %calculation for equalized histogram
    T = round(T);
    
    equalizedImage = zeros([m n],'uint8');
    %converting histogram to image
    for i =1: m
        for j = 1:n
            equalizedImage(i,j) = T(grayScaleImage(i,j) + 1);
        end
    end
    
    %Displays equalized image
    imshow(equalizedImage);
    figure();
    
    %compute histogram from equalized image
    equalizedHistogram = compute_histogram(equalizedImage);
    
    %plot histogram from equalized image
    plot_histogram(equalizedHistogram);
    
    %mean and standard deviation of original histogram
    originalImageVector = double(grayScaleImage(:));
    
    disp("Mean of original image: ");
    disp(mean(originalImageVector));
    
    disp("Standard Deviation of original image: ");
    disp(std(originalImageVector));
   
    %mean and standard deviation of equalized image
    equalizedImageVector = double(equalizedImage(:));
    
    disp("Mean of equalized image: ");
    disp(mean(equalizedImageVector));
    
    disp("Standard Deviation of equalized image: ");
    disp(std(equalizedImageVector));
    
end