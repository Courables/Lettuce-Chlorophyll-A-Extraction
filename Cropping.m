% set the path to the input and output folders
input_folder = '/Users/anthonytanvelasquez/Documents/MATLAB/Computer Vision/Original Pictures';
output_folder = '/Users/anthonytanvelasquez/Documents/MATLAB/Computer Vision/Cropped';

% get a list of all image files in the input folder
file_list = dir(fullfile(input_folder, '*.png'));

% loop through all image files and crop them
for i = 1:numel(file_list)
    
    % read the image file
    img = imread(fullfile(input_folder, file_list(i).name));
    
    % crop the image to the center square
    [h, w, ~] = size(img);
    crop_size = min(h, w);
    x = floor((w - crop_size) / 2) + 1;
    y = floor((h - crop_size) / 2) + 1;
    cropped_img = img(y:y+crop_size-1, x:x+crop_size-1, :);
    
    % create a new file name with "_cropped" suffix
    [~, name, ext] = fileparts(file_list(i).name);
    new_file_name = sprintf('%s_cropped%s', name, ext);
    
    % save the cropped image in the output folder
    imwrite(cropped_img, fullfile(output_folder, new_file_name));
end



