addpath(genpath('..'));
%% Read kspace
dim = [128, 128, 256];
kspace1 = bin2mat_cv64fc2('tumor1_128x128x256_kspace.bin', dim);
kspace2 = bin2mat_cv64fc2('tumor2_128x128x256_kspace.bin', dim);
kspace3 = bin2mat_cv64fc2('tumor3_128x128x256_kspace.bin', dim);
kspace4 = bin2mat_cv64fc2('tumor4_128x128x256_kspace.bin', dim);

%% Read mask
mask_x04   = bin2mat_cv64fc2('mask_x04_128x128x256.bin', dim); 
mask_x08   = bin2mat_cv64fc2('mask_x08_128x128x256.bin', dim); 
mask_x12   = bin2mat_cv64fc2('mask_x12_128x128x256.bin', dim); 
mask_x16   = bin2mat_cv64fc2('mask_x16_128x128x256.bin', dim); 

