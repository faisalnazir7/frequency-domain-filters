close all
clear
clc

%% Band-pass filtering frequency domain

% Read input
A = imread('bird_2.jpg');
[m,n] = size(A);

% define filter kernal
H = zeros(m,n);
for i = 50:200
    for j = 50:200
        H(i,j) = 1;
    end
end
for i = 100:150
    for j = 100:150
        H(i,j) = 0;
    end
end

% shift image to frequency domain
A_f = fft2(A);

% apply frequency domain band pass filter
H_f = fftshift(H);
B = A_f.*H_f;
C = abs(ifft2(B));

% Display of input and output images
subplot(2,2,1), imshow(A), title('Original Image')
subplot(2,2,2), imshow(H), title('2d view H')
subplot(2,2,3), surf(H), title('3d view of H')
subplot(2,2,4), imshow(uint8(C)), title('Image after band pass')
