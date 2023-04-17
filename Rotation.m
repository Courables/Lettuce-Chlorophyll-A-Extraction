% set the path to the input and output folders
input_folder = '/Users/anthonytanvelasquez/Documents/MATLAB/Computer Vision/Original Pictures';
output_folder = '/Users/anthonytanvelasquez/Documents/MATLAB/Computer Vision/Temporary';

% get a list of all image files in the input folder
file_list = dir(fullfile(input_folder, '*.png'));

% loop through all image files and rotate them
for i = 1:numel(file_list)
    
    % read the image file
    img = imread(fullfile(input_folder, file_list(i).name));
    
    % rotate the image by 0, 45, 90, 135, 180, 225, 270, and 315 degrees
    for angle = [0, 45, 90, 135, 180, 225, 270, 315]
        
        % rotate the image
        rotated_img = imrotate(img, angle);
        
        % create a new file name indicating the rotation angle
        [~, name, ext] = fileparts(file_list(i).name);
        new_file_name = sprintf('%s_%d%s', name, angle, ext);
        
        % save the rotated image in the output folder
        imwrite(rotated_img, fullfile(output_folder, new_file_name));
    end
end
