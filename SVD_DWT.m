function [ contrast_enhanced_img ] = SVD_DWT( low_contrast_img )
%%% Applys DWT and SVD to obtain a contrast enhaced image
% The technique decomposes the input image into the Discrete Wavelet Transform (DWT) subbands, 
% updates the singular value matrix (SVD)  of the LL subband 
% and reconstructs the image by Inverse Discrete Wavelet Transform (IDWT). 
%%%   input = low contrast image
%%%   output = contrast enhanced image 
%
%%% Based on the article: 
% "Satellite Image Contrast Enhancement Based On Discrete Wavelet Transform and Singular Value Decomposition".
% By Hasan Demirel, Cagri Ozcinar & Gholamreza Anbarjafari
%----------------------------------------------------------


%% OBTAINING THE LL SUBBAND OF ORIGINAL IMAGE
[LL_orig, HL_orig, LH_orig, HH_orig, bands_orig] = Subbands (low_contrast_img);

%% PERFORMING SINGULAR VALUE DECOMPOSITION (SVD) ON THE LL SUBBAND OF ORIGINAL IMAGE
[U_orig, S_orig, V_orig] = svd (LL_orig); 

%% PERFORMING GENERAL HISTOGRAM EQUALIZATION (GHE)
ghe_img = histeq(low_contrast_img, 256); 

%% OBTAINING LL SUBBAND OF EQUALIZED IMAGE
[LL_ghe, HL_ghe, LH_ghe, HH_ghe, bands_ghe] = Subbands (ghe_img);

%% PERFORMING SVD ON LL SUBBAND OF EQUALIZED IMAGE
[U_ghe, S_ghe, V_ghe] = svd(LL_ghe); 

%% OBTAINING THE ZETA COEFFICIENT
Z = max(S_ghe) / max(S_orig); % dividing the max singular value of equalized img / max singular value of original img

%% CALCULATING NEW SIGMA
new_sigma = Z * S_orig; %updating the new singular value matrix

%% OBAINING NEW LL SUBBAND
new_LL = abs( U_orig * new_sigma * V_orig' ); % obtaining the new LL subband

%% RECONSTRUCT NEW ENHANCED IMAGE BY IDWT 
 contrast_enhanced_img = idwt2 (new_LL, HL_orig, LH_orig, HH_orig, 'db1'); %constructing the new enhaced image

end

