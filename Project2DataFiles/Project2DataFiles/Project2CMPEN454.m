

[CamOneCoord, CamTwoCoord] = ThreeDtoTwoDConversion('Parameters_V1.mat','Parameters_V2.mat');


imOne = imread('im1corrected.jpg');



imshow(imOne);
axis on;
hold on;

%Plots locations of mocap data onto image 1
plot(CamOneCoord(1,:),CamOneCoord(2,:),'r+','MarkerSize',10);