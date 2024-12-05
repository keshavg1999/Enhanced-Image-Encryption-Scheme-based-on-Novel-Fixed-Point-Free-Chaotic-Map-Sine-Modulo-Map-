% Assuming 'enc' is your original image and 'd1' is another image for bitwise XOR
int = [0.01, 0.05, 0.1, 0.2];

% Get the size of the original image
[m, n] = size(enc);

% Loop over different noise intensities
for i = 1:length(int)
    % Add salt & pepper noise to the image
    noisy_enc = imnoise(enc, 'salt & pepper', int(i));
    
    % Perform bitwise XOR
    D = bitxor(noisy_enc, d1);
    
    % Sort and reshape operations
    [~, idx2] = sort(idx1);
    D1 = D(:);
    D2 = D1(idx2);
    D3 = reshape(D2, m, n);
    
    % Save the noisy image using imwrite
    imwrite(D3, sprintf('noise_intensity_%.0f_percent.png', int(i)*100));
end
