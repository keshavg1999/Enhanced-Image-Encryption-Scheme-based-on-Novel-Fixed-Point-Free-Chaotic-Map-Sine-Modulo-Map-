% Define the range for r values and other parameters
rStart = 0.01;            % Starting value of r
rStep = 0.004;            % Step size for r
rEnd = 2*pi;              % Ending value of r

rValues = rStart:rStep:rEnd;  % Array of r values
nPoints = length(rValues);   % Total number of r values
nIterations = 3000;          % Number of iterations for the dynamics
LE = zeros(1, nPoints);      % Lyapunov exponent for each r value

x = zeros(1, nIterations + 1); % Initialize the array for x

x(1) = 0.7;  % Initial condition for x

% Loop over each r value to calculate the Lyapunov exponent
for k = 1:nPoints
    r = rValues(k);  % Current r value
    for i = 2:nIterations
        % Sine map iteration formula (modular arithmetic)
        x(i) = mod(x(i-1) + 0.45 * sin(100 * x(i-1) + r) + 0.5, 1);
    end
    % Calculate Lyapunov exponent for the current r value
    LE(k) = lyapunovExponent(x);
end

% Plot the Lyapunov exponent against r
figure;
plot(rStart:rStep:rEnd, LE);
% Optional: Set Y-axis limits
% ylim([0 6]);

% Set plot properties for better visualization
set(gca, 'FontSize', 22, 'FontWeight', 'bold', 'LineWidth', 2);  % Increase axis numbers and tick thickness
xlabel('r', 'FontSize', 26, 'FontWeight', 'bold');  % Larger and bold X-label
ylabel('Lyapunov Exponent', 'FontSize', 26, 'FontWeight', 'bold');  % Larger and bold Y-label
% Optional: Set title for the plot
% title('Lyapunov Exponent vs r', 'FontSize', 18, 'FontWeight', 'bold');

% Set figure size
set(gcf, 'Units', 'Inches', 'Position', [1, 1, 8, 6]);  % [left, bottom, width, height]

% Save the plot as a .jpeg image
saveas(gcf, 'ch_lyap.jpeg');
