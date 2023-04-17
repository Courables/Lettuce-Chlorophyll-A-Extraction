%%
% Folder for augmented images
folder = '/Users/anthonytanvelasquez/Documents/MATLAB/Computer Vision/Augmented Images';
filePattern = fullfile(folder, '*.png');
pngFiles = dir(filePattern);

%%
% RGB values and image names
R = zeros(numel(pngFiles), 1);
G = zeros(numel(pngFiles), 1);
B = zeros(numel(pngFiles), 1);
imageNames = cell(numel(pngFiles), 1);
%%
% Loop through each image file and extract RGB values
for i = 1:numel(pngFiles)
    % Load the image
    filename = fullfile(folder, pngFiles(i).name);
    image = imread(filename);
    
    % Extract the RGB values
    R(i) = mean2(image(:, :, 1)); % red channel
    G(i) = mean2(image(:, :, 2)); % green channel
    B(i) = mean2(image(:, :, 3)); % blue channel
    
    % Save the image name
    imageNames{i} = pngFiles(i).name;
end
%%
% Create a bar graph of the RGB values
rgbData = [R, G, B];
h = bar(rgbData);
xlabel('Image Number')
ylabel('RGB Value (0-255)')

% Set the colors of the bars and legend
h(1).FaceColor = [1 0 0]; % red
h(2).FaceColor = [0 1 0]; % green
h(3).FaceColor = [0 0 1]; % blue
legend({'Red', 'Green', 'Blue'}, 'Location', 'northwest')

% Remove the image names from the x-axis
set(gca, 'XTickLabel', {})
%%
% Save the RGB data to an Excel file
rgbDataWithLabels = [imageNames, num2cell(rgbData)];
rgbTable = cell2table(rgbDataWithLabels, 'VariableNames', {'Image', 'Red', 'Green', 'Blue'});
writetable(rgbTable, fullfile(folder, 'RGB_Values.xlsx'));
