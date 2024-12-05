% Define the range for r values and other parameters
rStart = 0.01;            % Starting value of r
rStep = 0.04;             % Step size for r
rEnd = 2*pi;              % Ending value of r

rValues = rStart:rStep:rEnd;  % Array of r values
nPoints = length(rValues);    % Total number of r values
nIterations = 1000;           % Number of iterations for the dynamics
entropyX = zeros(1, nPoints); % Preallocate array for entropy values

x = zeros(1, nIterations + 1); % Initialize the array for x
x(1) = 0.7;                    % Initial condition for x

% Loop over each r value to calculate approximate entropy
for k = 1:nPoints
    r = rValues(k);            % Current r value
    for i = 2:nIterations
        % Sine map iteration with specified parameters
        x(i) = mod(x(i-1) + 0.45 * sin(6 * pi * x(i-1) + r) + 0.5, 1);
    end
    % Calculate approximate entropy for the current sequence
    entropyX(k) = approximateEntropy(x);
end

% Plot the approximate entropy against r
figure;
plot(rValues, entropyX);

% Optional: Set Y-axis limits
% ylim([0 2]);

% Set plot properties for better visualization
set(gca, 'FontSize', 22, 'FontWeight', 'bold', 'LineWidth', 2);  % Larger tick labels and thicker lines
xlabel('r', 'FontSize', 26, 'FontWeight', 'bold');               % Bold X-axis label
ylabel('Approximate Entropy', 'FontSize', 26, 'FontWeight', 'bold');  % Bold Y-axis label

% Set figure size in inches: [left, bottom, width, height]
set(gcf, 'Units', 'Inches', 'Position', [1, 1, 8, 6]);

% Save the plot as a .jpeg file
saveas(gcf, 'app_entropy_pi.jpeg');
