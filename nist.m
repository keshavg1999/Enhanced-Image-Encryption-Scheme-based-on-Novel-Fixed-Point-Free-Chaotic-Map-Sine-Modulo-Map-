

% Preallocate cell array for results
X = cell(1000, 1);

% Main loop
parfor m = 1:1000  % Use parallel for loop
    x = zeros(1, 66667);
    x(1) = rand;
    
    % Iterate to generate chaotic sequence
    for i = 2:66667
        x(i) = mod(x(i-1) + 0.45 * sin(18 * x(i-1) + 0.6) + 0.5, 1);
    end
    
    % Compute Hk and Mk in a vectorized manner
    Hk = mod(floor(10^12 * x'), 2^30);
    Mk = de2bi(Hk, 30, 'left-msb');
    
    % Compute Bk using XOR operation
    X{m} = xor(Mk(:, 1:15), Mk(:, 16:30));
end

% Convert cell array to matrix
X = cell2mat(X);

% Open file for writing
fileID = fopen('t1.txt', 'w');

% Convert matrix X to binary strings
binaryStrings = cell(size(X, 1), 1);
parfor i = 1:size(X, 1)  % Use parallel for loop
    binaryStrings{i} = num2str(X(i, :), '%1d');
end

% Write binary strings to file in one go
fprintf(fileID, '%s\n', binaryStrings{:});

% Close the file
fclose(fileID);

% Note: NIST SP800-22 tests are applied on the binary data available in 'ti.txt' file.
% To use NIST SP800-22, download the NIST Statistical Test Suite from the official website:
% https://csrc.nist.gov/projects/random-bit-generation/documentation-and-software
% The binary data should be formatted as a continuous sequence of 0s and 1s.

