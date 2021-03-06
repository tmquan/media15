function [data] = bin2mat_cv32fc2(filename, dim)
%BIN2MAT Summary of this function goes here
%   Detailed explanation goes here
    %%
    total = 1;
    for k = 1:numel(dim)
        total = total * dim(k);
    end
    fid = fopen(filename, 'rb');
    same_real = fread(fid, total, '*single', 4); 
    fseek(fid, 4, 'bof');
    same_imag = fread(fid, total, '*single', 4); 
    %% Make complex
    data = complex(same_real, same_imag);
    fclose(fid);
    data = reshape(data, dim);
return

