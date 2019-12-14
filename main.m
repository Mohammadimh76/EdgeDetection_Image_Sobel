clc; clear; close all; warning off; 

I=imread('lena.bmp');
I=im2double(I);
I=imnoise(I, 'gaussian', 0, 0.001);
figure(1);
imshow(I);title('org img');

[height width R]=size(I);

for i=2:height-1
    for j=2:width-1
        Dx(i,j)=[I(i+1,j-1)-I(i-1,j-1)]+2*[I(i+1,j)-I(i-1,j)]+[I(i+1,j+1)-I(i-1,j+1)];
        Dy(i,j)=[I(i-1,j+1)-I(i-1,j-1)]+2*[I(i,j+1)-I(i,j-1)]+[I(i+1,j+1)-I(i+1,j-1)];
        S(i,j)=sqrt(Dx(i,j)^2+Dy(i,j)^2);
        if Dx(i,j)<1
            Dx(i,j)=0;
        else Dx(i,j)=1;
        end
        if Dy(i,j)<1
            Dy(i,j)=0;
        else Dy(i,j)=1;
        end
    end
end
figure(2);
imshow(Dx,[]);

figure(3);
imshow(Dy,[]);

for i=1:255
    for j=1:255
       if (S(i,j)<1)
            S(i,j)=0;
        else S(i,j)=1;
        end
    end
end
figure(4);
imshow(S,[]);