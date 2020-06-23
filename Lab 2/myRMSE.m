function myRMSE = myRMSE(grayScaleImage1,grayScaleImage2)
%myRMSE Computes differences between two images
%           
%
%Syntax:
%       output = myimresize(input)
%
%Input:
%       input = two grayscale images
%
%Output:
%       output = A floating point value representing the differences
%       between two grayscale images
%
%History:
%       J.Garache created and completed 10/7/2017
%

    %the rows and columns of the image
    m = size(grayScaleImage1,1);
    n = size(grayScaleImage1,2);
  
    %RMSE calculation
    myRMSE = sqrt((1/m*n)*sum(sum(double(grayScaleImage1)-double(grayScaleImage2)).^2));
    
end