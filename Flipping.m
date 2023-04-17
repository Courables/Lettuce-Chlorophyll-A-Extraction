% set the path to the input and output folders
input_folder = '/Users/anthonytanvelasquez/Documents/MATLAB/Computer Vision/Temporary';
output_folder = '/Users/anthonytanvelasquez/Documents/MATLAB/Computer Vision/Augmented Images';

% get a list of all image files in the input folder
file_list = dir(fullfile(input_folder, '*.png'));

% loop through all image files and flip them
for i = 1:numel(file_list)
    
    % read the image file
    img = imread(fullfile(input_folder, file_list(i).name));
    
    % flip the image horizontally
    flipped_img = flip(img, 2);
    
    % create a new file name with "_flipped" suffix
    [~, name, ext] = fileparts(file_list(i).name);
    new_file_name = sprintf('%s_flipped%s', name, ext);
    
    % save the flipped image in the output folder
    imwrite(flipped_img, fullfile(output_folder, new_file_name));
end
