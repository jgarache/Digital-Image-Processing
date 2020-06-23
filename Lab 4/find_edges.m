function find_edges = find_edges(grayScaleImage,threshold)
%find_edges Detects the edges in a grayscale image and changes values to
%           255 for edges and 0 for everything else
%
%Syntax:
%       output = find_edges(grayScaleImage,threshold)
%
%Input:
%       input = (grayScaleImage,threshold)
%
%Output:
%       output = matrix filled with 0's and 255, or the edge detected
%       version of grayscale image
%
%History:
%       J.Garache created and completed 11/11/2017
%        
    %Computes gradient magnitude of grayScaleImage
    find_edges = gradient_magnitude(grayScaleImage);
    
    %Dimension of grayscale image
    M = size(find_edges,1);
    N = size(find_edges,2);
    
    %Detect edges and set them to value of 255 and 0 else where
    for i = 1:M
        for j = 1:N
            if (find_edges(i,j) > threshold)
                find_edges(i,j) = 255; %white
            else
                find_edges(i,j) = 0;%black
            end
        end
    end
    
    %Type casting to uin8
    find_edges = uint8(find_edges);
end