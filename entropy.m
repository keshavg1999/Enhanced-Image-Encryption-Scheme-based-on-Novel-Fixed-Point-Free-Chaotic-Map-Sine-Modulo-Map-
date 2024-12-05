% Define the range for r values and other parameters
rStart = 0.01;             % Starting value of r
rStep = 0.004;             % Step size for r
rEnd = 2*pi;               % Ending value of r

rValues = rStart:rStep:rEnd;  % Array of r values
nPoints = length(rValues);    % Total number of r values
nIterations = 5000;           % Number of iterations for the dynamics
entropyX = zeros(1, nPoints); % Preallocate array for entropy values

x = zeros(1, nIterations + 1); % Initialize the array for x
x(1) = 0.7;                    % Initial condition for x

% Loop over each r value to calculate entropy
for k = 1:nPoints
    r = rValues(k);            % Current r value
    for i = 2:nIterations
        % Sine map iteration formula with modular arithmetic
        x(i) = mod(x(i-1) + 0.45 * sin(20 * x(i-1) + r) + 0.5, 1);
    end
    % Calculate entropy for the current sequence
    entropyX(k) = entropy(x);  % Ensure 'entropy' function is defined or available
end

% Plot the entropy against r
figure;
plot(rValues, entropyX);

% Set Y-axis limits for better visualization
ylim([7.7 7.89]);

% Set plot properties for better readability
set(gca, 'FontSize', 22, 'FontWeight', 'bold', 'LineWidth', 2);  % Larger tick labels and thicker lines
xlabel('r', 'FontSize', 26, 'FontWeight', 'bold');               % Bold X-axis label
ylabel('Entropy', 'FontSize', 26, 'FontWeight', 'bold');         % Bold Y-axis label

% Set figure size in inches: [left, bottom, width, height]
set(gcf, 'Units', 'Inches', 'Position', [1, 1, 8, 6]);

% Save the figure as a .jpeg file
saveas(gcf, 'ch_entropy4.jpeg');
