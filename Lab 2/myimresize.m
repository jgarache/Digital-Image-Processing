function myimresize = myimresize(grayScaleImage, rows, columns, string)    
    %Nearest Neighbor Interpolation
    if(string == "nearest")
        for i = 1:rows
            for j = 1:columns
                
                %calculates neighboring pixel
                k = round((i/rows) * size(grayScaleImage,1));
                l = round((j/columns) * size(grayScaleImage,2));
                
                if(k < 1) k =1; end
                if(l < 1) l =1; end
                
                %setting values
                myimresize(i,j) = grayScaleImage(k, l);
            end
        end
    end
    
    %Bilinear Interpolation
    if(string == "bilinear")
        for i = 1:rows
            for j = 1:columns
                
                %interpolated pixel location
                x = (j/columns) * size(grayScaleImage,2);
                y = (i/rows) * size(grayScaleImage,1);
                
                %If the values of the new image, downsampled or upsample, fall
                %into the same value as the original image, set that value
                %to the already existing value
                if(round(x) == round(x,4) && round(y) == round(y,4))
                    myimresize(i,j) = grayScaleImage(round(y),round(x));
                else
                    %pixel locations
                    x1 = floor(x);
                    y1 = floor(y);
                    x2 = ceil(x);
                    y2 = ceil(y);
                    
                    % A check to make sure everything is
                    %within the dimension of the image. If it is not, set
                    %the position to be within the image
                    if (x1 == 0) x1 = 1; end
                    if (y1 == 0) y1 = 1; end
                    if (x2 > columns) x2 = columns; end
                    if (y2 > rows) y2 = rows; end
                    
                    %pixel values
                    p1 = grayScaleImage(y1,x1);
                    p2 = grayScaleImage(y1,x2);
                    p3 = grayScaleImage(y2,x1);
                    p4 = grayScaleImage(y2,x2);

                    %sending pixel locations, pixel values, location of
                    %interpolated pixel to be bilinearly interpolated
                    myimresize(i,j) = bilinearInterp(x1,y1,x2,y2,p1,p2,p3,p4, [x y]);
                end
            end
        end
    end
end
    
 function bilinearInterp = bilinearInterp(x1,y1,x2,y2,p1,p2,p3,p4, interpPix)
    %first linear interpolation
    f1 = p1 + (interpPix(2) - y1)/(y2 - y1)*(p3 - p1);
    
    %second linear interpolation
    f2 = p2 + (interpPix(2) - y1)/(y2 - y1)*(p4 - p2);
    
    %third linear interpolation that concludes the bilinear interpolation
    bilinearInterp = f1 + (interpPix(1) - x2)/(x2 - x1)*(f2 - f1);
 end