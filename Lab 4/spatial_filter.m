function filteredImage = spatial_filter(grayScaleImage,filter)
%spatial_filter Applies a filter onto a grayscale image
%           
%
%Syntax:
%       output = spatial_filter(grayScaleImage,filter)
%
%Input:
%       input = (grayScaleImage, filter)
%
%Output:
%       output = filtered grayscale image of type double
%
%History:
%       J.Garache created and completed 11/11/2017
%
    %Dimension of grayscale image
    M = size(grayScaleImage,1);
    N = size(grayScaleImage,2);

    %Dimension of filter
    m = size(filter,1);
    n = size(filter,2);
    
    %type cast grayScaleImage to double
    grayScaleImage = double(grayScaleImage);
    
    %Sets resulting matrix to the same dimensions as input
    filteredImage = zeros([M N]);
    
    %grayScaleImage coordinates
    for i = 1:M
        for j = 1:N
            
            %resets summation
            g = 0;
            
            %filter coordinates
            for k = 1:m
                for l = 1:n
                    
                    %determining filter position    
                    filtPosI = i -k+ceil(m/2);
                    filtPosJ = j -l+ceil(n/2);
                   
                    %determine if position is within the MxN
                    if (filtPosI < M + 1 && filtPosI > 0 && filtPosJ < N + 1 && filtPosJ > 0)

                        %Summation of all surrouding values
                        g = g + filter(k,l) * grayScaleImage(filtPosI,filtPosJ);
                    end
                end
            end
            
            %Fills output with summations
            filteredImage(i,j) = g; 
        end
    end

end