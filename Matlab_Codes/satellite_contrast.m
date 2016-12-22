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
%% best options are: sat2.png / sat3.png / sat7.jpg / space3.png / fovea3.png / fovea5.png
original_img = imread('orion1.jpg');  %reading the image 
original_img = rgb2gray(original_img); % converting to greyscale image


%----------------------------------------------------------------------
%% APPLYING DIFFERENT CONTRAST ENAHNCEMENT METHODS
%----------------------------------------------------------------------
[ proposed_method_img ] = SVD_DWT (original_img); %Proposed Method

GHE_img = histeq(original_img, 256); %General Histogram Equalization 


CLHE_img = adapthisteq(original_img); %Contrast Limited Histogram Equalization

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

% subplot(2,3,3), imshow(LHE_img);
% title('Local Histogram Equalization');

subplot(2,3,4), imshow(BPDHE_img);
title('Brightness Preserving Dynamic Histogram');

subplot(2,3,5), imshow( uint8 (SVE_img));
title('Singular Value Equalization');

subplot(2,3,6), imshow(uint8 (proposed_method_img) );
title('Proposed Method');

%----------------------------------------------------------------------
%% QUANTITATIVE RESULTS
%----------------------------------------------------------------------
figure
subplot(2,3,1);
original_mean =  mean2(original_img);
original_std = std2(original_img);
histogram(original_img, 'Normalization','pdf');
title(strcat('Original [ Mean: ', num2str(original_mean),', Standart Dev: ', num2str(original_std), ' ]'));
xlim([0, 255]);

subplot(2,3,2);
GHE_mean =  mean2(GHE_img);
GHE_std = std2(GHE_img);
histogram(GHE_img,'Normalization','pdf'); 
title(strcat('GHE [ Mean: ', num2str(GHE_mean),', Standart Dev: ', num2str(GHE_std), ' ]'));
xlim([0, 255]);

% subplot(2,3,3);
% histogram(LHE_img,'Normalization','pdf'); 
% title('Local Histogram Equalization');

subplot(2,3,4);
BPDHE_mean =  mean2(BPDHE_img);
BPDHE_std = std2(BPDHE_img);
histogram(BPDHE_img,'Normalization','pdf'); 
title(strcat('BPDHE [ Mean: ', num2str(BPDHE_mean),', Standart Dev: ', num2str(BPDHE_std), ' ]'));
xlim([0, 255]);

subplot(2,3,5);
SVE_mean =  mean2(SVE_img);
SVE_std = std2(SVE_img);
histogram(SVE_img,'Normalization','pdf');
title(strcat('SVE [ Mean: ', num2str(SVE_mean),', Standart Dev: ', num2str(SVE_std), ' ]'));
xlim([0, 255]);

subplot(2,3,6);
proposed_method_mean =  mean2(proposed_method_img);
proposed_method_std = std2(proposed_method_img);
histogram(proposed_method_img,'Normalization','pdf') 
title(strcat('Proposed Method [ Mean: ', num2str(proposed_method_mean),', Standart Dev: ', num2str(proposed_method_std), ' ]'));
xlim([0, 255]);







