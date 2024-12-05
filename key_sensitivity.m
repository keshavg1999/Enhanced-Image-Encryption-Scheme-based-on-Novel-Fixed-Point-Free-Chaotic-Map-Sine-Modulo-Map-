% Input Image
I = imread('cameraman.tif');   % Load grayscale image

[m, n, d] = size(I);           % Get image dimensions (m = rows, n = columns)
M = m * n;                     % Total number of pixels
alt = 10^(-14);                % Small key alterantion for chaotic map

% Generate chaotic sequences
x = zeros(1, 2 * M);           % Preallocate chaotic sequence
x(1) = 0.2;                    % Initial condition (between 0 and 1)

% Chaotic map iteration
for i = 2:2*M
    x(i) = mod(x(i-1) + 0.45 * sin(100 * x(i-1) + alt) + 0.5, 1);
end

% Split chaotic sequence for encryption
x1 = x(1:M);                   % First half of the sequence
x2 = x(M+1:2*M);               % Second half for diffusion

d1 = mod(floor(10^15 * x2), 256); % Generate diffusion mask (0-255 range)
d1 = uint8(reshape(d1, [m, n]));  % Reshape mask to image dimensions

% Pixel permutation using x1
[~, idx1] = sort(x1);          % Sort indices based on chaotic sequence
I1 = I(:);                     % Flatten image to 1D
I2 = I1(idx1);                 % Permute pixels using sorted indices
I3 = reshape(I2, m, n);        % Reshape back to image dimensions

% Encryption with bitwise XOR
enc1 = bitxor(I3, d1);         % XOR permuted image with diffusion mask

% UACI and NPCR calculations comparing the encrypted images
u = uaci(enc, enc1);           % UACI calculation (enc from main.m)
n = npcr(enc, enc1);           % NPCR calculation (enc from main.m)

% Display results
disp(['UACI: ', num2str(u)]);
disp(['NPCR: ', num2str(n)]);
