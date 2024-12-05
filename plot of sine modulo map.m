x = linspace(0, 1, 1000000); % Generate 1000000 points between 0 and 1
y = mod(x + 0.45*sin(500*x) + 0.5, 1); % Calculate the function values

% Plot the mod function
figure;
plot(x, y,'k.'); hold on
plot2=plot(x, x, 'r');
set(gca, 'FontSize', 18, 'FontWeight', 'bold', 'LineWidth', 2);
xlabel('x', 'FontSize', 22, 'FontWeight', 'bold');
ylabel('mod(x + 0.45*sin(500*x) + 0.5, 1)', 'FontSize', 22, 'FontWeight', 'bold');
%title('Plot of mod(x + 0.45*sin(100*x) + 0.5, 1)');
legend( plot2,'y = x', 'Location', 'northwest','FontSize', 18, 'FontWeight', 'bold');

set(gcf, 'Units', 'Inches', 'Position', [1, 1, 8, 6]);
% saveas(gcf, 'ch_plot3.jpeg');
