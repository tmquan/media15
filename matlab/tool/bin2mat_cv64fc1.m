function [data] = bin2mat_cv64fc1(filename, dim)
%BIN2MAT Summary of this function goes here
%   Detailed explanation goes here
    %%
    total = 1;
    for k = 1:numel(dim)
        total = total * dim(k);
    end
    fid = fopen(filename, 'rb');
    same_real = fread(fid, total, '*double');
    %% Make complex
    data = (same_real);
    fclose(fid);
    data = reshape(data, dim);
return

