tet = 0:0.001:1*pi;
ONE= ones(size(tet));
N = 16;
d = 0.6;
ang = 90; %to observe grating lobes, change this value
alf= cos(ang*pi./180);

%% CASE 1: 16 elements, each spaced at 0.6λ

%Define the "Array Factor" consisting of "16 elements"
AF1 = @ (tet) (((sin((N/2).*2.*pi.*d.*(cos(tet)-alf)))./(sin((1/2).*2.*pi.*d.*(cos(tet)-alf)))).*sin(tet));
%AF1 = max(AF1(tet),0)
AF1N= @(tet) (AF1(tet)./ max(AF1(tet)));
max(AF1(tet))
AF1dB = 10*log10((AF1N(tet)).^2);
AF1dB = max(AF1dB,-30);
figure(1)
polarplot(tet,AF1N(tet))
title("AF Pattern 16 elements")
figure(2);
polarplot(tet,AF1dB);
rlim([-30, 0]);
title("Normalized AF Pattern for 16 elements(dB)");

%Define the "Element Factor" which is of an "Isotropic Antenna"
EF1 = ONE;
EF1dB= 10*log10((EF1).^2);
EF1dB = max(EF1dB,-30);
figure(3)
polarplot(tet,EF1);
%rlim([-30 0]);
title("Normalized EF Pattern Isotropic");

pattern1 = 10*log10((AF1N(tet).*EF1).^2);
pattern1 = max(pattern1,-30); 
figure(4);
polarplot(tet,pattern1);
rlim([-30,0]);
title("Normalized Radiation Pattern for 16 uniform elements(dB)");

pattern1g = 10*log10((AF1(tet).*EF1).^2);
pattern1g = max(pattern1g,-30); 
figure(13);
polarplot(tet,pattern1g);
rlim([-30,30]);
title("Radiation Pattern for 16 elements");

%% CASE 2: 8 _super elements_, each composed of 2 elements spaced at 0.6λ, and these super-elements spaced at 1.2λ

%Define the "New Element Factor" consisting of "2 elements"
d=0.6;
EF2 = @ (tet) ((sin((2/2).*2.*pi.*d.*(cos(tet)-alf)))./(sin((1/2).*2.*pi.*d.*(cos(tet)-alf))));

%Define the "New Array Factor" consisting of "8 super elements"
d=1.2;
N=8;
AF2 = @ (tet) ((sin((N/2).*2.*pi.*d.*(cos(tet)-alf)))./(sin((1/2).*2.*pi.*d.*(cos(tet)-alf))));
figure(5)
AF2N= @(tet) (AF2(tet)./ max(AF2(tet)));
AF2dB = 10*log10((AF2N(tet)).^2);
AF2dB = max(AF2dB,-30);
polarplot(tet,AF2dB);
rlim([-30, 0]);
title("Normalized AF Pattern for 8 super elements(dB)");

figure (6)
EF2N= EF2(tet)/max(EF2(tet));
EF2dB= 10*log10((EF2N).^2);
EF2dB = max(EF2dB,-30);
polarplot(tet,EF2dB);
rlim([-30 0]);
title("Normalized EF Pattern for a super element consisting of 2 elements (dB)");

pattern2 = 10*log10((AF2N(tet).*EF2N).^2);
pattern2 = max(pattern2,-30); 
figure(7);
polarplot(tet,pattern2);
rlim([-30,0]);
title("Normalized Radiation Pattern for 8 super elements(dB)");
pattern2g = 10*log10((AF2(tet).*EF2(tet)).^2);
pattern2g = max(pattern2g,-30); 
figure(8);
polarplot(tet,pattern2g);
rlim([-30,30]);
title("Radiation Pattern for 8 super elements");
%%%%%%%%%%

%% CASE 3: 4 _super elements_, each composed of 4 elements spaced at 0.6λ, and these super-elements spaced at 2.4 λ

%Define the "New Element Factor" consisting of "4 elements"
d=0.6;
EF3 = @ (tet) ((sin((4/2).*2.*pi.*d.*(cos(tet)-alf)))./(sin((1/2).*2.*pi.*d.*(cos(tet)-alf))));

%Define the "New Array Factor" consisting of "4 super elements"
d=2.4;
N=4;
AF3 = @ (tet) ((sin((N/2).*2.*pi.*d.*(cos(tet)-alf)))./(sin((1/2).*2.*pi.*d.*(cos(tet)-alf))));
figure(9)
AF3N= @(tet) (AF3(tet)./ max(AF3(tet)));
AF3dB = 10*log10((AF3N(tet)).^2);
AF3dB = max(AF3dB,-30);
polarplot(tet,AF3dB);
rlim([-30, 0]);
title(" Normalized AF Pattern for 4 super elements(dB)");

figure (10)
EF3N= EF3(tet)/max(EF3(tet));
EF3dB= 10*log10((EF3N).^2);
EF3dB = max(EF3dB,-30);
polarplot(tet,EF3dB);
rlim([-30 0]);
title("Normalized EF Pattern for a super element consisting of 4 elements (dB)");

pattern3 = 10*log10((AF3N(tet).*EF3N).^2);
pattern3 = max(pattern3,-30); 
figure(11);
polarplot(tet,pattern3);
rlim([-30,0]);
title("Normalized Radiation Pattern for 4 super elements(dB)");

pattern3g = 10*log10((AF3(tet).*EF3(tet)).^2);
pattern3g = max(pattern3g,-30); 
figure(12);
polarplot(tet,pattern3g);
rlim([-30,30]);
title("Radiation Pattern for 4 super elements");

