clear
% Example usage:

% Read the original image
originalImage = imread('D:\IC_Design_files\ic_design_image.jpg');  % Replace 'your_image.jpg' with the actual path to your image

% Convert to grayscale using the preferred function:
grayImage = rgb2gray(originalImage);  % Most common method
% Alternatively, you can use:
% grayImage = im2gray(originalImage);

% Display the grayscale image
figure;
imshow(grayImage);
title('Grayscale Image');

writematrix(grayImage, 'D:\IC_Design_files\grayscale.csv')


% Read the CSV file
data = csvread('D:\IC_Design_files\grayscale.csv');

% Ensure the data is 40x40
assert(all(size(data) == [40, 40]), 'Data must be a 40x40 matrix');

% Convert the data to hexadecimal
hex_data = cellfun(@dec2hex, num2cell(data), 'UniformOutput', false);

% Write the hexadecimal data to a text file
fid = fopen('outputf.txt', 'w');
for i = 1:40
    fprintf(fid, '%s ', hex_data{i, :});
    fprintf(fid, '\n');
end
fclose(fid);
