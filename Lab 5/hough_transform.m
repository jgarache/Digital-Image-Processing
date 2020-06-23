function [theta_out, rho_out, accumulator] = hough_transform(i_edge)
%hough_transform Determine the rho and theta values of an edged detected
%                image to create a sinsoidal graph representing which
%                common points were calculated and lines detected within
%                the image
%
%Syntax:
%       output = [theta_out, rho_out, accumulator]
%
%Input:
%       input = i_edge
%
%Output:
%       output = greatest theta and rho pair inside of the accumulator
%       along with the accumulator itself
%
%History:
%       J.Garache created and completed 11/30/2017
%        

    %rows and columns of input image
	M = size(i_edge,1); 
    N = size(i_edge,2);
    
    %diagnoal of input image
    D = sqrt(M.^2 + N.^2);
    
    %rounds to accomodate whole numbers
    D = round(D);
    
    %accumulator with rows and columns of diagnoal of input image
    %and 180 columns
    accumulator = zeros([2*D+1 180]);
    
    %initializing theta rho highest value to find maximum value in
    %accumulator
    theta_out = 0;
    rho_out = 0;
    highest_value = 0;
    
    %hough transform algorithm
    for i = 1:M
        for j =1:N
            
            %detects a white pixel in i_edge
            if(i_edge(i,j) == 255)
                
                %theta values from -89 to 90
                for theta = -89:90
                    
                    %calculate rho with normal equation
                    rho = i*cosd(theta)+j*sind(theta);
                    
                    %accomodates rounding
                    rho = round(rho);
                    
                    %save occurances of calculated rho,theta pair
                    %when saved it needs to be saved in a positive value
                    %inside accumulator. Accumulator(-89,anything) doesn't
                    %exist so the following needs to be done:
                    %rho+D+1 because rho goes from -D to D
                    %theta+90 becuase theta goes from -89 to 90
                    accumulator(rho+D+1,theta+90) = accumulator(rho+D+1,theta+90) + 1;
                    
                end 
            end
        end
    end
    
    %find maximum value within accumulator
    for i = 1: size(accumulator,1)
        for j = 1: size(accumulator,2)
            
            %compare values to highest_value
            if( accumulator(i,j) > highest_value)
            
                %set corresponding values to output
                highest_value = accumulator(i,j);
                
                %revert value back to its original value prior to chaning
                %it with theta+90 and rho+d+1
                theta_out = j-90;
                rho_out = i-D-1;
            
            end
        end
    end
    
end