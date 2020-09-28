# ALFA-BETA-GAMMA-PARTICLE-IMAGE-PROCESSING
```
Charged particles and photons interact with the sensor in different ways. 
Due to that they create different kinds of track or hit patterns. 
```
### Identify particles and count

```
seD = strel('disk',1); % create a flat disc_shaped structural element with a radius of 1
```

```
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
```

```
% with bwareaopen 
figure(4);
A1 = bwareaopen(only_alfa,8);
imshow (A1),title('with bwareaopen');
hold on ;
 
labeledAlfa = bwlabel(A1, 4);      % Label each blob(alfa) so we can make
```

