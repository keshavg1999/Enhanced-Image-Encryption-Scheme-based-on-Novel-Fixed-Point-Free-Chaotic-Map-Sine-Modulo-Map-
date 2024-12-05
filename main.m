clc; clear all; close all;

% Input Image
I = imread('cameraman.tif');      % Load input image
figure; imshow(I);                % Display original image
title('Original Image');

[m, n, d] = size(I);              % Get image dimensions
M = m * n;                        % Total number of pixels

% Generate Sine modulo map map sequence
x = zeros(1, 2 * M);              % Preallocate sequence
x(1) = 0.2;                       % Initial condition

for i = 2:2*M
    x(i) = mod(x(i-1) + 0.45 * sin(100 * x(i-1)) + 0.5, 1);
end

% Split chaotic sequence
x1 = x(1:M);                      % For permutation
x2 = x(M+1:end);                  % For diffusion

% Generate diffusion mask
d1 = mod(floor(10^15 * x2), 256); % Scale and mod to get 8-bit values
d1 = uint8(reshape(d1, [m, n]));  % Reshape to match image dimensions

% Permutation
[~, idx1] = sort(x1);             % Sorting indices
I1 = I(:);                        % Flatten image
I2 = I1(idx1);                    % Permute pixels
I3 = reshape(I2, [m, n]);         % Reshape back to original dimensions

% Encryption using XOR
enc = bitxor(I3, d1);             % XOR with diffusion mask
figure; imshow(enc);              % Display encrypted image
title('Encrypted Image');
% imwrite(enc, 'enc_cameraman.tif'); % Save encrypted image (optional)

% Decryption
D = bitxor(enc, d1);              % Reverse XOR operation
[~, idx2] = sort(idx1);           % Reverse permutation indices
D1 = D(:);
D2 = D1(idx2);                    % Reverse permutation
D3 = reshape(D2, [m, n]);         % Reshape to original dimensions

figure; imshow(D3);               % Display decrypted image
title('Decrypted Image');
% imwrite(D3, 'cameraman_recovered.tif'); % Save decrypted image (optional)
