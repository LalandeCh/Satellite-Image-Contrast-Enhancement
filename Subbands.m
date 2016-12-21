function [ LL, HL, LH, HH, Sub_Im ] = Subbands( image )
%The Subband function performs DWT to obtain 4 subbands of an image.
%   Input: image
%   Output: LL, HL, LH, HH subbands obtained by performing Discrete Wavelet Transform (DWT). 
%           Sub_Im which is an array containing the 4 subbands

image = double(image); % the data should be in double precision value format
[LL, HL, LH, HH] = dwt2 ( image, 'db1' );  % perform DWT to obtain the 4 subbands
[H, W] = size(LL); % obtain height(H) and width(W) of subband LL to know the size of the array.
Sub_Im = zeros (2*H, 2*W); % initializing an array with H and W dimensions that will contain all 4 subbands.

  Sub_Im ( 1 : H , 1 : W ) = LL;
  Sub_Im ( 1 : H , (W+1 : W*2) ) = HL;
  Sub_Im ( (H+1 : H*2) , 1:W ) = LH;
  Sub_Im ( (H+1 : H*2) , (W+1 : W*2) ) = HH;
  
end

