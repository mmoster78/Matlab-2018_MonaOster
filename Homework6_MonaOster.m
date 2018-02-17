 % Create a logical image of a ring with specified
% inner diameter, outer diameter center, and image size.
% First create the image.

close all
clear all
imageSizeX = 100;
imageSizeY = 70;
[columnsInImage, rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);


% Next create the circle in the image.
centerX = imageSizeX/2;
centerY = imageSizeY/2;
innerRadius = 10;
outerRadius = 20;
array2D = (rowsInImage - centerY).^2 + (columnsInImage - centerX).^2;

koffka = array2D;

% generate figure 1
koffka1=koffka;

% generate a border
koffka1([1:5 65:70], :) = 1;
koffka1(:, [1:5 95:100]) = 1;

for r=5:65;
    for c = 5:50;
        if koffka(r,c) >= outerRadius.^2 % left outside of ring
            koffka1(r, c) = 2;
        elseif koffka(r,c)< innerRadius.^2 %left inside of ring
            koffka1(r, c) = 2;
        elseif koffka(r, c) >= innerRadius.^2 && koffka(r,c) <= outerRadius.^2 %ring
            koffka1(r, c) = 3;      
        end
    end
end

for r=5:65;
    for c = 51:95;
        if koffka(r,c) >= outerRadius.^2 % left outside of ring
            koffka1(r, c) = 4;
        elseif koffka(r,c)< innerRadius.^2 %left inside of ring
            koffka1(r, c) = 4;
        elseif koffka(r, c) >= innerRadius.^2 && koffka(r,c) <= outerRadius.^2 %ring
            koffka1(r, c) = 3;      
        end
    end
end



figure(1);
image(koffka1) ;
title('Koffka Ring 1', 'FontSize', 25);
colormap([1 1 1; 0.75 0.75 0.75; 0.5 0.5 0.5; 0.25 0.25 0.25]);
axis off


% generate figure 2
koffka2=koffka;

% generate a border
koffka2([1:5 65:70], :) = 1;
koffka2(:, [45:55]) = 1;

for r=5:65;
    for c = 1:45;
        if koffka(r,c) >= outerRadius.^2 % left outside of ring
            koffka2(r, c) = 2;
        elseif koffka(r,c)< innerRadius.^2 %left inside of ring
            koffka2(r, c) = 2;
        elseif koffka(r, c) >= innerRadius.^2 && koffka(r,c) <= outerRadius.^2 %ring
            koffka2(r, c) = 3;      
        end
    end
end

for r=5:65;
    for c = 55:100;
        if koffka(r,c) >= outerRadius.^2 % left outside of ring
            koffka2(r, c) = 4;
        elseif koffka(r,c)< innerRadius.^2 %left inside of ring
            koffka2(r, c) = 4;
        elseif koffka(r, c) >= innerRadius.^2 && koffka(r,c) <= outerRadius.^2 %ring
            koffka2(r, c) = 3;      
        end
    end
end



figure(2);
image(koffka2) ;
title('Koffka Ring 2', 'FontSize', 25);
colormap([1 1 1; 0.75 0.75 0.75; 0.5 0.5 0.5; 0.25 0.25 0.25]);
axis off

% generate figure 3 - I CAN'T FIGURE OUT HOW TO MOVE THE HALFS OF THE -
% MAYBE USE CIRCSHIFT!!!
% CIRCLE

koffka3=koffka;

% generate a border
koffka3(60:70, 5:50) = 1;
koffka3(1:10, 51:95) = 1;
koffka3(:, [1:5 95:100]) = 1;


for r=1:60;
    for c = 5:50;
        if koffka(r,c) >= outerRadius.^2 % left outside of ring
            koffka3(r, c) = 2;
        elseif koffka(r,c)< innerRadius.^2 %left inside of ring
            koffka3(r, c) = 2;
        elseif koffka(r, c) >= innerRadius.^2 && koffka(r,c) <= outerRadius.^2 %ring
            koffka3(r, c) = 3;      
        end
    end
end

for r=10:70;
    for c = 51:95;
        if koffka(r,c) >= outerRadius.^2 % left outside of ring
            koffka3(r, c) = 4;
        elseif koffka(r,c)< innerRadius.^2 %left inside of ring
            koffka3(r, c) = 4;
        elseif koffka(r, c) >= innerRadius.^2 && koffka(r,c) <= outerRadius.^2 %ring
            koffka3(r, c) = 3;      
        end
    end
end



figure(3);
image(koffka3) ;
title('Koffka Ring 3', 'FontSize', 25);
colormap([1 1 1; 0.75 0.75 0.75; 0.5 0.5 0.5; 0.25 0.25 0.25]);
axis off

%% Q 6.2 FUNKYSTIM

%figure 4
% create mesh 
n = 701; % size of the nxn image of a Gaussian 
nseg=6; % number of segments' 
radius=.7; % radius of the aperture 
[X,Y] = meshgrid(linspace(-1,1,n));

% create circular pattern 
theta = atan2(Y,X)./pi; 
theta=mod(theta*nseg, 1);
%create outside segment pattern
thetaO = atan2(Y,X)./pi; 
thetaO=mod(thetaO*nseg, 1);
thetaO=max(thetaO(:))-thetaO;

% create aperture 
radiusimage = sqrt(X.^2+Y.^2); 
aperture=NaN(size(radiusimage));
illusion=NaN(size(radiusimage));

aperture(radiusimage<radius)=2;
aperture(radiusimage>=radius)=1;
illusion1=theta.*aperture; 
apertureO(radiusimage>=radius)=2; 
apertureO(radiusimage<radius)=1;
illusion2 = thetaO.*apertureO;
illusion=illusion1+illusion2;

figure(4);
imagesc(illusion); 
axis square 
axis off 
colormap(gray(256)) 


%figure 5 - offset funkypattern

illusion3 = circshift(illusion2, [-4 -4]); % this is not quite right BUT I THINK I CAN USE CIRCSHIFT TO MAKE THIS WORK
illusion4=illusion1+illusion3;




figure(5);
imagesc(illusion4); 
axis square 
axis off 
colormap(gray(256)) 
