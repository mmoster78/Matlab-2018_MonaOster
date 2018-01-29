% Fake Brain 

TR = 2; % taking a picture of head
t = 1:TR:239; %seconds
brain = randn(64, 64, 28, 120); 
% happy = repmat(0, 10, 1); 
% sad = repmat(1, 10, 1); 
% happysad = [happy;  sad];
% happysad = happysad(:); 
% design=repmat(happysad, 6, 1); 

design = repmat([repmat(0, 10, 1); repmat(1, 10, 1)], 6, 1); %tightening commented code above

% ROI = region of interest 

ROI = [20: 30, 12:40, 18:23]; %slice - rows go from top to bottom 

brain(20: 30, 12:40, 18:23, find(design)) = ...
    brain(20: 30, 12:40, 18:23, find(design))- 1;
subplot (1,2,1)
imagesc(brain(:, :, 20, 13)); 
sad = mean(brain(:, :, 20, find(design)), 4);%average over all sad points
happy = mean(brain(:, :, 20, find(~design)), 4); 
subplot(1, 2, 2)
imagesc(sad)
%appy=mean(brain(:, :, 20, find(design==0)),)
%axis equal