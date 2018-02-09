% Homework Chapter 5 
% MO

% 5.1 Union Jack 
%Fill in the missing bits of code to make the series of figures

clear all
flagsize=15;
saltire=zeros(flagsize);

for i=1:flagsize
    saltire(i, i)=1;
    saltire((flagsize+1)-i, i)=1;
end

figure(1)
image(saltire+1)
cmap=[0 0 1; 1 1 1]
colormap(cmap)


figure(2)
image(saltire+1)
cmap= [1 0 0 ; 1 1 1]
colormap(cmap)

george=zeros(flagsize);
george(ceil(flagsize/2), :)=1;
george(:, ceil(flagsize/2))=1;
figure(3)
image(george+1)
cmap=[ 1 1 1 ; 1 0 0];
colormap(cmap)



union=(saltire+(2*george))+1;
union(union>3)=3;
figure(4)
image(union)
cmap(1, :)= [ 0 0 1];
cmap(2, :)= [ 1 0 0];
cmap(3, :)= [ 1 0 0];
colormap(cmap)

bars=[ceil(flagsize/2)-1 ceil(flagsize/2)+1];
union(bars, :)=union(bars, :)+3;
union(:,bars)=union(:, bars)+3;
union(union>6)=union(union>6)-3; 
% convert all values greater than 6 to 6
figure(5)
image(union)
cmap(4, :)= [1 1 1];
cmap(5, :)= [1 1 1];
cmap(6, :)= [1 0 0];
colormap(cmap)

for i=1:flagsize
    for j=1:flagsize
        if i==j-1 | j==i-1 || i==j+1 || j==i+1 
            if union(i, j)<6
                union(i, j)=5;
                union(i, (flagsize+1)-j)=5;
            end
        end
    end
end

figure(6)
image(union)
colormap(cmap)
axis off; axis equal

%% 5.2 Indexing into a linear array in real world co-ordinates
%Miguel collects data for an EEG experiment.  Each session of data consists of 30 trials, each lasting 5s. The EEG machine records data every 2ms. Strangely his data looks like a perfect sinusoid, with 0 mean normally distributed noise. 

clear all
close all

ntrials=30;
durtrial=5*1000;
timevec=0:2:durtrial*ntrials;
data=sin((2*pi* timevec)/(durtrial))+.1*randn(size(timevec));
plot(timevec, data, '-')

% I am certain that there is a better way than my solutions. This took me hours to figure
    % out. It works though.

%generate a vector that contains the trial index for each time point
trial = ones(size(timevec));
for i=1:29
    trial(1/2*i*(durtrial)+1:1/2*(i+1)*(durtrial))=i+1;
end

%generate a vector with the time index for each trial
timepts1=(0:2:durtrial);
timepts2=(2:2:durtrial);
timepts2=(repmat(timepts2,1,29));
timepts=[timepts1,timepts2];

%a)  What is the mean response during all the data points that are within the first ½ second of every trial 
    

timpetshalf=timepts;
timeptshalf(timepts <=500)=1;
timeptshalf(timepts >500) = NaN;
a=data(timeptshalf ==1);
mean(a);
disp(['mean response during all the data points that are within the first ½ second of every trial = ', num2str(mean(a))]) 

%b) What is the mean response during the interval 2-2.5s of each trial?




timepts2k=timepts;
timepts2k(timepts<2000) = NaN;
timepts2k(timepts>2500) = NaN;
b=data(~isnan(timepts2k));
meanmat=reshape(b,251,30);

for i=1:30
    meanresp=mean(meanmat);
    disp(['mean response during interval 2-2.5s on trial ', num2str(i), ' = ', num2str(meanresp(i))]);
end       

% c) during which timepoints does the EEG response have values greater than 0.9?
data09=data;
data09(data >0.9)=1;
data09 (data<=0.9)=NaN;
tmpts09=timevec(data09 ==1);

% d) during which timepoints does the EEG response have values between 0.7 and 0.8?

data78=data;
data78(data<=0.7) = NaN;
data78(data>=0.8) = NaN;
tpts78=timevec(~isnan(data78));

%(obviously you will get different answers each time because your data will vary each time).

%% 5.3 Indexing into a matrix using real world co-ordinates
%Sam Lin collects data on 70 rats. 20 of them were duds and their data were thrown away. 
clear all
close all

ratID=randperm(70); ratID=sort(ratID(1:50));  %shuffle wouldn't work since I don't have that function. I used randperm instead

%On the remaining rats he collects 10000 trials, and he calculates the % correct across each bin of 100 trials.
ratID=randperm(70); ratID=sort(ratID(1:50)); 
binsteps=1:100:10000;
[X, Y]=meshgrid(1:length(ratID), 1:length(binsteps));
per=Y+randi(10, size(Y))-5;
per(per>100)=100; per(per<0)=0;


% a) image the rats performance in a matrix with trials along the x axis and rats along the y axis using a colormap that varies between white for 100% correct and black for 0% correct (not using imagesc)

perim=per';

figure(1)
image(binsteps, ratID, perim)
colormap (gray(100));

% b) change the colormap so that values above 90% are white and values below 10% are black.

%it's hard to tell but I think the image is changed...
figure(2)
image(binsteps, ratID, perim)
colormap (gray(100));
for i=1:9    
    colormap(i, :)= [0 0 0];
end
for i=91:100;
    colormap(i, :)= [1 1 1];
end



% c) how many rats performed above 66% correct between trials 6001-7001?
% d) which rats were they?
limtrial = per(60:70, :);
x=zeros(1,50);
ID=zeros(1,50);
for i=1:50
    if any(limtrial(i)>= 66)
        x(i)=1;
        ID(i)=i;
    elseif any(limtrial(i)< 66)
        x(i)=0;
        ID(i)=0;
    end 
end

disp([num2str(sum(x)), ' rats performed above 66% correct between trials 6001-7001'])
ID(ID >0)


% e) How many trials would be needed for 40/50 rats to be performing above 80%.

xi=zeros(1,50);
while sum(xi)~=40
    
    for i=10000:20000
        ratID=randperm(70); ratID=sort(ratID(1:50)); 
        binsteps=1:i/100:i;
        [X, Y]=meshgrid(1:length(ratID), 1:length(binsteps));
        peri=Y+randi(10, size(Y))-5;
        peri(peri>100)=100; peri(peri<0)=0;
% 
% 

            for j=1:50
                tmp=squeeze(peri(:,j));
                if any(tmp(:)> 80)
                     xi(j)=1;
                 elseif any(tmp(:)<= 80)
                    xi(j)=0;
                end 
    
            end
            sum(xi);
    end
  
end

disp(['It would take ', num2str(i), ' trials for 40/50 rats to performed above 80% correct '])

% this does not work properly. First I solved this by manually changing the # of trials. 
% But I thought I would try to put this into a simulation to make it more
% accurate / elegant. I'm hoping you can help me figure out what my mistake
% was here. Is it the order of the while and for loops? Does it need a
% truth statement to trigger matlab to "check" that sum(xi) has reached the
% threshold?

% f) It turns out that for the rats with even ID numbers (2, 4, 6 10 etc.) the recording machine was on the blink for an interval between the 5678th trial and the 7533rd trial. Convert those numbers to NaN.
% 
for i=1:25
per(56:75, 2*i)=NaN; %I'm not quite sure if the expectation was to make this more accurate. I could probably change per to get rid of the bins and look at the indiviudal trials.
end
