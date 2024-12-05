clear;

% Define parameters
scale = 10000;        % Level of rounding for precision in detecting unique values
maxpoints = 200;      % Maximum points to save for plotting
N = 3000;             % Number of "r" values to simulate
a = 0;                % Starting value of "r"
b = 2*pi;             % Final value of "r" (higher values may cause divergence)
rs = linspace(a, b, N); % Vector of "r" values
M = 500;              % Number of iterations for the sine map
x_init = 0.2;         % Initial condition for the map (between 0 and 1)

% Initialize output cell array to store unique values
out = cell(1, length(rs));

% Loop through each "r" value to simulate the sine map dynamics
for j = 1:length(rs)
    r = rs(j);        % Current "r" value
    x = zeros(M, 1);  % Preallocate memory for the sine map sequence
    x(1) = x_init;    % Set initial condition

    % Iterate the sine map
    for i = 2:M
        x(i) = mod(x(i-1) + 0.45 * sin(100 * x(i-1) + r) + 0.5, 1);
    end

    % Extract and save unique, rounded values from the last iterations
    out{j} = unique(round(scale * x(end-maxpoints:end)));
end

% Rearrange the output cell array into a matrix for plotting
data = [];
for k = 1:length(rs)
    n = length(out{k});
    data = [data; rs(k) * ones(n, 1), out{k}];
end

% Plot the bifurcation diagram
figure;
h = plot(data(:, 1), data(:, 2) / scale, 'k.');
set(h, 'MarkerSize', 1);

% Set plot properties for better visualization
axis tight;
set(gca, 'FontSize', 22, 'FontWeight', 'bold', 'LineWidth', 2); % Thicker axis lines and larger font size
xlabel('r', 'FontSize', 26, 'FontWeight', 'bold');              % Bold X-axis label
ylabel('v', 'FontSize', 26, 'FontWeight', 'bold');              % Bold Y-axis label

% Set figure size and position
set(gcf, 'Units', 'Inches', 'Position', [1, 1, 8, 6]);

% Save the figure as a .jpeg file
saveas(gcf, 'ch_bifur.jpeg');
