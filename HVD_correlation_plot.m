% Read the encrypted image
enc_img = enc; % Replace with your encrypted image file

% Define the limits for x and y axes
x_limit = [0 255];
y_limit = [0 255];

% Define the font size for the labels
fontSize = 14;

% Plot and save diagonal correlation
figure;
plot(enc_img(1:end-1, 1:end-1), enc_img(2:end, 2:end), '.', 'color', 'k');
xlabel('Pixel value on location (x,y)', 'FontSize', fontSize);
ylabel('Pixel value on location (x+1,y+1)', 'FontSize', fontSize);
xlim(x_limit);
ylim(y_limit);
frame = getframe(gcf);
imwrite(frame.cdata, 'diagonal_correlation.png');

% Plot and save vertical correlation
figure;
plot(enc_img(1:end-1, :), enc_img(2:end, :), '.', 'color', 'k');
xlabel('Pixel value on location (x,y)', 'FontSize', fontSize);
ylabel('Pixel value on location (x+1,y)', 'FontSize', fontSize);
xlim(x_limit);
ylim(y_limit);
frame = getframe(gcf);
imwrite(frame.cdata, 'vertical_correlation.png');

% Plot and save horizontal correlation
figure;
plot(enc_img(:, 1:end-1), enc_img(:, 2:end), '.', 'color', 'k');
xlabel('Pixel value on location (x,y)', 'FontSize', fontSize);
ylabel('Pixel value on location (x,y+1)', 'FontSize', fontSize);
xlim(x_limit);
ylim(y_limit);
frame = getframe(gcf);
imwrite(frame.cdata, 'horizontal_correlation.png');
