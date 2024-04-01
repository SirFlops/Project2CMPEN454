ParamOneObject = matfile('Parameters_V1.mat');
ParamTwoObject = matfile('Parameters_V2.mat');


positionOne = getfield(ParamOneObject.Parameters(1,1),'position');
rotationOne = getfield(ParamOneObject.Parameters(1,1),'Rmat');
KmatrixOne = getfield(ParamOneObject.Parameters(1,1),'Kmat');
SMatrix = [1 0 0 -positionOne(1);0 1 0 -positionOne(2); 0 0 1 -positionOne(3); 0 0 0 1];
foclength = getfield(ParamOneObject.Parameters(1,1),'foclen');
RMatrix = [rotationOne(1,1) rotationOne(1,2) rotationOne(1,3) 0;rotationOne(2,1) rotationOne(2,2) rotationOne(2,3) 0;rotationOne(3,1) rotationOne(3,2) rotationOne(3,3) 0;0 0 0 1];
FocalMatrix = [foclength 0 0 0; 0 foclength 0 0;0 0 1 0];
Orientation = getfield(ParamOneObject.Parameters(1,1),'orientation');
Pmat = RMatrix * SMatrix;
Kmat = KmatrixOne * FocalMatrix;
WorldtoCamMatrix = KmatrixOne * FocalMatrix * RMatrix * SMatrix;
mocapData = matfile('mocapPoints3D.mat');
mocapPosition = mocapData.pts3D;



CamOneCoord = zeros(3,39);

[M,N] = size(mocapPosition);

for i=1:N 
    U = mocapPosition(1,i);
    V = mocapPosition(2,i);
    W = mocapPosition(3,i);
    WorldCoord = [U; V; W; 1];
    CamShift = WorldCoord - [positionOne(1); positionOne(2); positionOne(3); 0];
    CamCoord = RMatrix * CamShift;
    CamOneCoord(1,i) = PixCoord(1);
    CamOneCoord(2,i) = PixCoord(2);
    CamOneCoord(3,i) = 1;
end

imOne = imread('im1corrected.jpg');

imshow(imOne);
axis on;
hold on;

plot(u,v,'r+','MarkerSize',10)