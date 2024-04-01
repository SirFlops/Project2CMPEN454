worldCoordNew = mocapPosition(:,1);
CamLocation = [4409.35745775187;-5557.48364224849;-1900.90609939507];

Transform = worldCoordNew - CamLocation;
XYZ = rotationOne * Transform;
PerspectiveProj = FocalMatrix * XYZ;

XYZBalanced = XYZ/XYZ(3);

pixloc = KmatrixOne * XYZBalanced;



pixlocNew = pixloc/pixloc(3);


u = -foclength * (XYZ(1)/XYZ(3)) + KmatrixOne(1,3);
v = -foclength * (XYZ(2)/XYZ(3)) + KmatrixOne(2,3);