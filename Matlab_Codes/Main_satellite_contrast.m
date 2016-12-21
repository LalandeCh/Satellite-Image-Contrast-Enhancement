%%%%%%%%  SATELLITE IMAGE CONTRAST ENHACEMENT  %%%%%%%%%
%%% Authors: Benjamin Chatain  and Katherine Sheran
%%% Master in Medical Imaging and Applications (MAIA)

%%% Based on the article: 
% "Satellite Image Contrast Enhancement Based On Discrete Wavelet Transform and Singular Value Decomposition".
% By Hasan Demirel, Cagri Ozcinar & Gholamreza Anbarjafari
%----------------------------------------------------------------------
% Start cleaning everything
%----------------------------------------------------------------------
clear       %no variables
close all   %no figures
clc         %empty command window
%----------------------------------------------------------------------
%% LOADING THE LOW CONTRAST IMAGE
%----------------------------------------------------------------------
%% images provided are:  sat1.png / sat2.jpg / space3.png / eye1.png / eye2.png / eye3.png
original_img = imread('fovea7.png');  %reading the image 
original_img = rgb2gray(original_img); % converting to greyscale image


%----------------------------------------------------------------------
%% APPLYING DIFFERENT CONTRAST ENAHNCEMENT METHODS
%----------------------------------------------------------------------
[ SVD_DWT_img ] = SVD_DWT (original_img); %Proposed Method

GHE_img = histeq(original_img, 256); %General Histogram Equalization 

CLAHE_img = adapthisteq(original_img); % Contrast Limited Adaptive Histogram Equalization

BPDHE_img = BPDHE(original_img); %Brightness Preserving Dynamic Histogram

SVE_img = SVE(original_img); %Singular Value Equalization


%----------------------------------------------------------------------
%% QUALITATIVE RESULTS
%----------------------------------------------------------------------
figure
subplot(2,3,1), imshow(original_img)
title('Original Image');

subplot(2,3,2), imshow( GHE_img );
title('General Histogram Equalization');

subplot(2,3,3), imshow(CLAHE_img);
title('Contrast Limited Adaptive Histogram Equalization');

subplot(2,3,4), imshow(BPDHE_img);
title('Brightness Preserving Dynamic Histogram Equalization');

subplot(2,3,5), imshow( uint8 (SVE_img));
title('Singular Value Equalization');

subplot(2,3,6), imshow(uint8 (SVD_DWT_img) );
title('Proposed Method: SVD & DWT');

%----------------------------------------------------------------------
%% QUANTITATIVE RESULTS
%----------------------------------------------------------------------
figure
subplot(2,3,1);
h1 = histogram(original_img, 'Normalization','pdf');
h1.NumBins = 50;
title('Original Image');

subplot(2,3,2);
h2 = histogram(GHE_img,'Normalization','pdf');
h2.NumBins = 70;
title('General Histogram Equalization');

subplot(2,3,3);
h3 = histogram(CLAHE_img,'Normalization','pdf'); 
h3.NumBins = 70;
title('Contrast Limited Adaptive Histogram Equalization');

subplot(2,3,4);
h4 = histogram(BPDHE_img,'Normalization','pdf'); 
h4.NumBins = 70;
title('Brightness Preserving Dynamic Histogram Equalization');

subplot(2,3,5);
h5 = histogram(SVE_img,'Normalization','pdf');
h5.NumBins = 70;
title('Singular Value Equalization');

subplot(2,3,6);
h6 = histogram(SVD_DWT_img,'Normalization','pdf');
h6.NumBins = 70;
title('Proposed Method: SVD & DWT');





