% Read the image
img = enc; 

% Convert the image to grayscale if it is not already
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Get the size of the image
[rows, cols] = size(img);

% Initialize variables to store pixel pairs
horizontal_pairs = [];
vertical_pairs = [];
diagonal_pairs = [];

% Extract horizontal pixel pairs
for i = 1:rows
    for j = 1:cols-1
        horizontal_pairs = [horizontal_pairs; double(img(i, j)), double(img(i, j+1))];
    end
end

% Extract vertical pixel pairs
for i = 1:rows-1
    for j = 1:cols
        vertical_pairs = [vertical_pairs; double(img(i, j)), double(img(i+1, j))];
    end
end

% Extract diagonal pixel pairs
for i = 1:rows-1
    for j = 1:cols-1
        diagonal_pairs = [diagonal_pairs; double(img(i, j)), double(img(i+1, j+1))];
    end
end

% Calculate correlation coefficients
horizontal_corr = corrcoef(horizontal_pairs);
vertical_corr = corrcoef(vertical_pairs);
diagonal_corr = corrcoef(diagonal_pairs);

% Display the results
fprintf('Horizontal Correlation: %.4f\n', horizontal_corr(1, 2));
fprintf('Vertical Correlation: %.4f\n', vertical_corr(1, 2));
fprintf('Diagonal Correlation: %.4f\n', diagonal_corr(1, 2));
