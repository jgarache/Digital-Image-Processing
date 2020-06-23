function histogram_transform = histogram_transform(histogram)
%histogram_transform converts histogram values with a transform function 
%           
%
%Syntax:
%       output = histogram_transform(histogram)
%
%Input:
%       input = histogram
%
%Output:
%       output = transformed histogram vector
%
%History:
%       J.Garache created and completed 10/22/2017
%
    %creates vector of 256 elements
    histogram_transform = zeros(256,1);
    
    %L is number of intensities
    L = 256;
    
    %nk is the number of pixels per intensity
    nk =0;
    
    %transformation function
    for i=1:L
        nk = nk + histogram(i);
        histogram_transform(i) = (L-1)*nk;
    end 
    
end