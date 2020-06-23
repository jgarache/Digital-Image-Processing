function halfToneImage = halftone(grayScaleImage)
%halftone Converts a grayscale image into a binary image using 1 of 
%         10 dot patterns to transform an image
%
%Syntax:
%       output = halftone(input)
%
%Input:
%       input = the grayscale image that will be converted into a binary
%               image. The image should be of type uint8. Each individual 
%               pixel should have a value from 0-255. 
%
%Output:
%       output = binary image of the grayscale image where all values have
%       been converted from 0-255 to either 0 or 1 
%
%History:
%       J.Garache created and completed 9/18/2017
%

    halfToneImage = grayScaleImage;
    
    row = size(grayScaleImage,1);
    column = size(grayScaleImage,2);
    
    for i = 1:3:row      % # of rows i
        for j = 1:3:column  % # of columns j

            pixelValue = sum(sum(grayScaleImage(i:(min(row,i+2)),j:(min(column,j+2))))); % value of a pixel (value fits in 1 of 10 ranges)
            
            %cases where the pixel is out of range from either rows &
            %columns, rows, or columns. If any of these cases are met, then
            %add the pixelValue the sumation of the adjacent pixels values
            %that help make a 3x3 pixel within the image
            
            if (i+2 > row && j+2 > column)              % checks if pixel is the bottom left corner of the image
                pixelValue = pixelValue + sum(sum(grayScaleImage(row-2:i,column-2:j)));
            elseif(i+2 > row)                           %checks if the pixel is out of the range of rows
                pixelValue = pixelValue + sum(sum(grayScaleImage(row-2:i,j:j+2)));
            elseif (j+2 > column)                       %checks if the pixel is out of the range of columns
                pixelValue = pixelValue + sum(sum(grayScaleImage(i:i+2,column-2:j)));
            end
            
            transformValue = floor((pixelValue)*10)/(2295); % converting pixelValue to transformationValue (transformation 0- transformation 9)
            
            halfToneImage(i:(min(row,i+2)),j:(min(column,j+2))) = 0; %Sets each pixel to all black or transformation 0
            if(transformValue >= 1 && i <= row && j+1 <= column)    %top middle to white
                halfToneImage(i,j+1) = 1; 
            end
            
            %dot pattern transformation 0-9
            if(transformValue >= 2 && i+2 <= row && j+2 <= column)     %bottom right corner to white
                halfToneImage(i+2,j+2) = 1; 
            end
            if(transformValue >= 3 && i <= row && j <= column)    %top left corner to white
                halfToneImage(i,j) = 1; 
            end
            
            if(transformValue >= 4 && i+2 <= row && j <= column)    %bottom left corner to white
                halfToneImage(i+2,j) = 1; 
            end
            if(transformValue >= 5 && i <= row && j+2 <= column)    %top right corner to white
                halfToneImage(i,j+2) = 1; 
            end
            if(transformValue >= 6 && i+1 <= row && j+2 <= column)    %middle row right to white
                halfToneImage(i+1,j+2) = 1; 
            end
            if(transformValue >= 7 && i+2 <= row && j+1 <= column)    %bottom row middle to white
                halfToneImage(i+2,j+1) = 1; 
            end
            if(transformValue >= 8 && i+1 <= row && j <= column)    %middle row left to white
                halfToneImage(i+1,j) = 1; 
            end
            if(transformValue >= 9 && i+1 <= row && j+1 <= column)    %middle row middle to white
                halfToneImage(i+1,j+1) = 1; 
            end
            
        end
    end
    
    
end