clear all;   clc;  close all 

A = load('alfa_1.txt'); 
Beta = load('beta.txt'); 
Gamma = load('gamma.txt'); 

hold on  

% Source of alfa particles
figure(1);
imshow(A), title('Source of alfa particles') 
hold on;
% only alfa
seD = strel('disk',1); % create a flat disc_shaped structural element with a radius of 1

only_alfa = imerode(A,seD); 
figure(2), imshow(only_alfa), title('Only alfa particles') % display the image after corrosion
%Source of alfa particles with boundary 
figure(3);
bw=imbinarize(only_alfa);
[Ba,L] = bwboundaries(bw,'noholes');
imshow(label2rgb(L,@jet,[.5 .5 .5]));
hold on;
for k = 1:length (Ba)
    boundary = Ba{k};
    plot(boundary(:,2),boundary(:,1),'w');
    title(' with boundary');
end 
% with bwareaopen 
figure(4);
A1 = bwareaopen(only_alfa,8);
imshow (A1),title('with bwareaopen');
hold on ;

labeledAlfa = bwlabel(A1, 4);      % Label each blob(alfa) so we can make measurements of it 

Alfa_particles = max(labeledAlfa(:));      %returns number of particles (alfa)
%__________________________________________________________________________________________________________
 
% Source of BETA particles
figure(5);
imshow(Beta), title('Source of BETA particles') 
hold on;
% only BETA
seD = strel('disk',1); % create a flat disc_shaped structural element with a radius of 1

only_BETA = imerode(Beta,seD); 
figure(6), imshow(only_BETA), title('Only BETA particles') % display the image after corrosion
%Source of BETA particles with boundary 
figure(7);
bw1=imbinarize(only_BETA);
[Bg,L] = bwboundaries(bw1,'noholes');
imshow(label2rgb(L,@jet,[.5 .5 .5]));
hold on;
for k3 = 1:length (Bg)
    boundary = Bg{k3};
    plot(boundary(:,2),boundary(:,1),'w');
    title(' with boundary');
end 
% % with bwareaopen 
% figure(8);
% A2 = bwareaopen(only_BETA,2);
% imshow (A2),title('with bwareaopen');
% hold on ;

labeledBETA = bwlabel(Beta,4);      % Label each blob(BETA) so we can make measurements of it 

Beta_particles = max(labeledBETA(:));      %returns number of particles (BETA)
%________________________________________________________________________________________________________

% Source of gamma particles
figure(9);
imshow(Gamma), title('Source of GAMMA particles') 
hold on;
% only GAMMA
seD = strel('disk',1); % create a flat disc_shaped structural element with a radius of 1

only_GAMMA = imerode(Gamma,seD); 
figure(10), imshow(only_GAMMA), title('Only GAMMA particles') % display the image after corrosion
%Source of GAMMA particles with boundary 
figure(11);
bw2=imbinarize(only_GAMMA);
[Bb,L] = bwboundaries(bw2,'noholes');
imshow(label2rgb(L,@jet,[.5 .5 .5]));
hold on;
for k2 = 1:length (Bb)
    boundary = Bb{k2};
    plot(boundary(:,2),boundary(:,1),'w');
    title(' with boundary');
end 
% with bwareaopen 
% figure(12);
% A3 = bwareaopen(only_GAMMA,2);
% imshow (A3),title('with bwareaopen');
% hold on ;

labeledGAMMA = bwlabel(Gamma, 4);      % Label each blob(gamma) so we can make measurements of it 

GAMMA_particles = max(labeledGAMMA(:));      %returns number of particles (gamma)



 
    

 