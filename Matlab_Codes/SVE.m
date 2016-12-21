function [ equalized_image ] = SVE ( image )
%   In this singular value equalization (SVE) method the intensity of
%   the image is equalized by performing SVD and equalizing the singular
%   value of sigma.
%%%   input  =  low contrast image
%%%   output = intensity equalized image 


%% PREPARING THE IMAGE 
image = double(image);

%% PERFORMING SVD ON THE ORIGINAL IMAGE
[U, S, V] = svd(image); 

%% OBTAINING THE ZETA COEFFICIENT
zeta = max(S)/max(image);   % zeta coefficient= max singular value of sigma / max value of image

%% CALCULATING NEW SIGMA
new_sigma = zeta * S; %updating the new singular value matrix(sigma)

%% RECONSTRUCT NEW ENHANCED IMAGE 
equalized_image = (U * new_sigma * V') ; %reconstructing new image by multiplying the 3 matrices.



end

