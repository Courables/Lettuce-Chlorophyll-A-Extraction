%%
% Folder for augmented images
folder = '/Users/anthonytanvelasquez/Documents/MATLAB/Computer Vision/Augmented Images';
filePattern = fullfile(folder, '*.png');
pngFiles = dir(filePattern);
%%
% HSV values and image names
H = zeros(numel(pngFiles), 1);
S = zeros(numel(pngFiles), 1);
V = zeros(numel(pngFiles), 1);
imageNames = cell(numel(pngFiles), 1);
%%
% Loop through each image file and extract HSV values
for i = 1:numel(pngFiles)
    % Load the image
    filename = fullfile(folder, pngFiles(i).name);
    image = imread(filename);
    
    % Convert the image to HSV
    hsvImage = rgb2hsv(image);
    
    % Extract the HSV values
    H(i) = mean2(hsvImage(:, :, 1)); % hue channel
    S(i) = mean2(hsvImage(:, :, 2)); % saturation channel
    V(i) = mean2(hsvImage(:, :, 3)); % value channel
    
    % Save the image name
    imageNames{i} = pngFiles(i).name;
end
%%
% Create a bar graph of the HSV values
hsvData = [H, S, V];
h = bar(hsvData);
xlabel('Image Number')
ylabel('HSV Value (0-1)')

% Set the colors of the bars and legend
h(1).FaceColor = [1 1 0]; % yellow
h(2).FaceColor = [0 1 1]; % cyan
h(3).FaceColor = [1 0 1]; % magenta
legend({'Hue', 'Saturation', 'Value'}, 'Location', 'northwest')

% Remove the image names from the x-axis
set(gca, 'XTickLabel', {})
%%
% Save the HSV data to an Excel file
hsvDataWithLabels = [imageNames, num2cell(hsvData)];
hsvTable = cell2table(hsvDataWithLabels, 'VariableNames', {'Image', 'Hue', 'Saturation', 'Value'});
writetable(hsvTable, fullfile(folder, 'HSV_Values.xlsx'));
