%exciting color maps
img=reshape(1:64, 8, 8)
image(img); colormap(gray(64));
axis square %make x and y equal; if I use axis equal I make the tick marks spaced equally far apart
axis off

drawnow %hold execution until graphics is executed
pause

for i=1:200
    pp=rand(64,3)
    colormap(pp)
    drawnow; %refresh the image before drawing again
end
