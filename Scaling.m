% set the path to the input and output folders
input_folder = '/Users/anthonytanvelasquez/Documents/MATLAB/Computer Vision/Original Pictures';
output_folder = '/Users/anthonytanvelasquez/Documents/MATLAB/Computer Vision/Scaled';


% set the desired scaling factor
scaling_factor = 0.5; % adjust as needed

% get a list of all image files in the input folder
file_list = dir(fullfile(input_folder, '*.png'));

% loop through all image files and scale them
for i = 1:numel(file_list)
    
    % read the image file
    img = imread(fullfile(input_folder, file_list(i).name));
    
    % scale the image
    scaled_img = imresize(img, scaling_factor);
    
    % create a new file name with "_scaled" suffix
    [~, name, ext] = fileparts(file_list(i).name);
    new_file_name = sprintf('%s_scaled%s', name, ext);
    
    % save the scaled image in the output folder
    imwrite(scaled_img, fullfile(output_folder, new_file_name));
end
