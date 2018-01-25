%% paintpots

img=1:5
pp1=[0 0 0; .25 .25 .25; .5 .5 .5; .75 .75 .75; 1 1 1] %[red green blue;.....]
pp2 = [0 0 1; .5 .2 .3; 0 .1 .7; 1 0 1; .5 .25 .75]

pp2(5, :)=[0 0 0]

figure(1)
image(img)
colormap(pp1) %give each "paintpot" a proportion of the paint in the three different pots
colormap(pp2) 
colormap(hot(5)) %tells matlab how many colors to use 