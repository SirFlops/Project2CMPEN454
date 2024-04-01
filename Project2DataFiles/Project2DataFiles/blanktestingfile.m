worldCoordNew = [1539.28; 958.096; 1543.46; 1 ];
CamLocation = [4409.35745775187;-5557.48364224849;-1900.90609939507;0];

Transform = worldCoordNew - CamLocation;
XYZ = RMatrix * Transform;
%PerspectiveProj = FocalMatrix * XYZ;
%XYZBalanced = XYZ/XYZ(3);
XYZThree = [XYZ(1); XYZ(2); XYZ(3)];
pixloc = KmatrixOne * XYZThree;



pixlocNew = pixloc/pixloc(3);


u = -foclength * (XYZ(1)/XYZ(3)) + KmatrixOne(1,3);
v = -foclength * (XYZ(2)/XYZ(3)) + KmatrixOne(2,3);