function [data] = bin2mat_cv64fc2(filename, dim)
%BIN2MAT Summary of this function goes here
%   Detailed explanation goes here
    %%
    total = 1;
    for k = 1:numel(dim)
        total = total * dim(k);
    end
    fid = fopen(filename, 'rb');
    same_real = fread(fid, total, '*double', 8);
    fseek(fid, 8, 'bof');
    same_imag = fread(fid, total, '*double', 8);
    %% Make complex
    data = complex(same_real, same_imag);
    fclose(fid);
    data = reshape(data, dim);
return

