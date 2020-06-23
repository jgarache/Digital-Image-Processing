function plot_histogram = plot_histogram(histogram)
%plot_histogram plots the histogram
%           
%
%Syntax:
%       output = plot_histogram(histogram)
%
%Input:
%       input = histogram
%
%Output:
%       output = none
%
%History:
%       J.Garache created and completed 10/22/2017
%

    %Bar graph of the histogram
    bar(histogram);
    
    %Labeling Axis
    xlabel('Intensity Value');
    ylabel('PMF');
    
    %Setting min/max for each axis
    %Max of the y is the max value of the histogram
    axis([0 255 0 max(histogram)]);
    
end