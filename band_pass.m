close all
clear
clc

%% Band-pass filtering frequency domain

% Read input
I = imread('bird_2.jpg');
[x,y] = size(I);
A = imresize(I, [256 256]);
[m,n] = size(A);

% define filter kernal
M = zeros(m,n);
for i = 50:200
    for j = 50:200
        M(i,j) = 1;
    end
end
for i = 100:150
    for j = 100:150
        M(i,j) = 0;
    end
end
H = imresize(M, [256 256]);
[m,n] = size(H);

% shift image to frequency domain
A_f = fft2(A);

% apply frequency domain band pass filter
H_f = fftshift(H);
B = A_f.*H_f;
C = abs(ifft2(B));

% Display of input and output images
subplot(2,2,1), imshow(A), title('Original Image')
subplot(2,2,4), imshow(uint8(C)), title('Image after band pass')
