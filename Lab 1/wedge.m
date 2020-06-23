function wedgeImage = wedge()
%halftone Converts a grayscale image into a binary image using 1 of 
%         10 dot patterns to transform an image
%
%Syntax:
%       output = wedge()
%
%Input:
%       input = no input is required
%
%Output:
%       output = a 256x256 image which has the values gradually increasing
%       from a column of 0's, column of 1's, all the way to column of 255's
%
%History:
%       J.Garache created and completed 9/18/2017
%

    wedgeImage = uint8(zeros(256,256)); % creates an matrix of 256x256 with 0's in each position
    gradient = 0;   
    
    for i = 1:1:256      % # of rows i
        for j = 1:1:256  % # of columns j
            wedgeImage(i,j) =  gradient;    %sets values from left to right of one row to 0,1,2,...,255
            gradient = gradient + 1;
            if(j == 256)
                gradient = 0; %resets so that the next row can starts overiding values from 0 to 0,1,2,...,255
            end
        end
    end
    
end