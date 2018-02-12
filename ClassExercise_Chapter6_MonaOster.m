%% chapter 6 exercises
% I used the solutions to work on these questions.

% 1) Lightness constancy illusion

n = 101; 

[X,Y] = meshgrid(linspace(-1,1,n)); 
X(30:40, 10:90)=.1; 
X(60:70, 10:90)=.8; 

subplot (3,1,1);
imagesc(X); 
axis off
colormap(gray(256)) 


%% 2) Peripheral drift illusion
% create mesh 
n = 701; % size of the nxn image of a Gaussian 
nseg=6; % number of segments' 
radius=.7; % radius of the aperture 
[X,Y] = meshgrid(linspace(-1,1,n));

% create segment pattern 
theta = atan2(Y,X)./pi; 
theta=mod(theta*nseg, 1);


% create aperture 
radiusimage = sqrt(X.^2+Y.^2); 
aperture=NaN(size(radiusimage)); 
aperture(radiusimage<radius)=1; 
aperture(radiusimage>=radius)=0; 
illusion=theta.*aperture; 

subplot (3,1,2);
imagesc(illusion); 
axis square 
axis off 
colormap(gray(256)) 

%% FLIP THE DIRECTION 

% create mesh 
n = 701; % size of the nxn image of a Gaussian 
nseg=6; % number of segments' 
radius=.7; % radius of the aperture 
[X,Y] = meshgrid(linspace(-1,1,n));

% create segment pattern 
theta = atan2(Y,X)./pi; 
theta=mod(theta*nseg, 1);
theta=max(theta(:))-theta;

% create aperture 
radiusimage = sqrt(X.^2+Y.^2); 
aperture=NaN(size(radiusimage)); 
aperture(radiusimage<radius)=1; 
aperture(radiusimage>=radius)=0; 
illusion=theta.*aperture; 
subplot (3,1,3);
imagesc(illusion); 
axis square 
axis off 
colormap(gray(256)) 

