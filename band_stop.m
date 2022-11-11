close all
clear
clc

%% band-stop filtering domain

A = imread('bird_1.jpg');
[m,n] = size(A);

% define filter kernel 
H = ones(m,n);
for i = 50:200
    for j = 50:200
        H(i,j) = 0;
    end
end
for i = 100:150
    for j = 100:150
        H(i,j) = 1;
    end
end

% shift image to frequency domain
A_f =fft2(A);

% apply band-stop filter
H_f = fftshift(H);
B = (A_f.*H_f);
C = abs(ifft2(B));

% display input and output image\
subplot(2,2,1), imshow(A), title('Original Image')
subplot(2,2,2), imshow(H), title('2d view H')
subplot(2,2,3), surf(H), title('3d view of H')
subplot(2,2,4), imshow(uint8(C)), title('Image after band-stop frequency')
