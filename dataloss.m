% Assuming 'enc' is your original image and 'd1' is another image for bitwise XOR
loss_levels = [0.05, 0.10, 0.20, 0.40];  % Data loss percentages

% Get the size of the original image
[m, n] = size(enc); % enc is the encrypted image

% Loop over different data loss levels
for i = 1:length(loss_levels)
    % Create a copy of the original image to introduce data loss
    noisy_enc = enc;
    
    % Calculate the side length of the square area to lose
    area_to_lose = round(sqrt(loss_levels(i) * m * n));
    
    % Zero out the square area in the top left corner
    noisy_enc(1:area_to_lose, 1:area_to_lose) = 0;
    
    % Save the noisy image
    imwrite(noisy_enc, sprintf('data_loss_%.0f_percent.png', loss_levels(i) * 100));
    
    % Perform bitwise XOR
    D = bitxor(noisy_enc, d1);
    
    % Sort and reshape operations
    [~, idx2] = sort(idx1);
    D1 = D(:);
    D2 = D1(idx2);
    recovered_enc = reshape(D2, m, n);
    
    % Save the recovered image
    imwrite(recovered_enc, sprintf('recovered_data_loss_%.0f_percent.png', loss_levels(i) * 100));
end
