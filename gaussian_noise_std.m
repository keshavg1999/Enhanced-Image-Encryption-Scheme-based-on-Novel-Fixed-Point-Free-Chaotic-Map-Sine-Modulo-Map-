% Assuming 'enc' is your original image and 'd1' is another image for bitwise XOR
std_levels = [0.01, 0.05, 0.08, 0.12]; % Standard deviation levels for Gaussian noise
mean = 0;  % Mean for Gaussian noise

% Get the size of the original image
[m, n] = size(enc);

% Loop over different standard deviation levels
for i = 1:length(std_levels)
    % Convert standard deviation to variance
    variance = std_levels(i)^2;
    
    % Add Gaussian noise to the image
    noisy_enc = imnoise(enc, 'gaussian', mean, variance);
    
    % Perform bitwise XOR
    D = bitxor(noisy_enc, d1);
    
    % Sort and reshape operations
    [~, idx2] = sort(idx1);
    D1 = D(:);
    D2 = D1(idx2);
    D3 = reshape(D2, m, n);
    
    % Save the noisy image using imwrite
    imwrite(D3, sprintf('gaussian_noise_std_%.2f.png', std_levels(i)));
end
