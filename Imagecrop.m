
%% Define the parent directory
parent_dir = "/media/vinayak-amd/Backup/Home/KKS_Dataset/27808_1_1_truncated";
% Change to 1_1_truncated for processing 1_1 , 1_3 and 1_2 already
% processed...
%% Define the extension of the filename that you want

tiffiles = dir(fullfile(parent_dir, '/*.tif'));

%% Define the target directory where you want to save the images

target_dir = "/media/vinayak-amd/Backup/Home/KKS_Dataset/27808_1_1_cropped";

%% Define the range of cropping(hard coded)
% Refer =
% [https://github.com/vinayapathak/Optical_Tweezer/blob/main/README.md]

% minY = 277; 
% maxY = 676;
% minX = 392;
% maxX = 816;

%% For different dataset we have different cropping limits() as follows

minY = 3;
maxY = 689;
minX = 398;
maxX = 1020;
%% Read a sample image and set a target cropped image
figure;
sample_img = imread(fullfile(parent_dir, "Img000000.tif"));
cropped_img = sample_img(minY:maxY, minX:maxX);
imshow(cropped_img)

%%  Crop each image from the parent directory and 
% save it in the target directory

for i = 1:length(tiffiles)
    
    filename = tiffiles(i).name;
    img = imread(fullfile(parent_dir, filename));
    imgcrop = img(minY:maxY, minX:maxX);
    fileformat = ".tiff";
    targetname = strcat(filename(1:end-4), "_cropped", fileformat);
    imwrite(imgcrop, fullfile(target_dir,targetname));

end