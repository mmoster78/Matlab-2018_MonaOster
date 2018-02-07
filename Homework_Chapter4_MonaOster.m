%% Homework Chapter 4

%MO 
 
%% Q 4.1: Making matrices
 
% Create the following matrices without typing in the numbers by hand:

% mat1=[5     0     0     0     0; ...
%      0    10     0     0     0; ...
%      0     0    15     0     0; ...
%      0     0     0    20     0; ...
%      0     0     0     0    25];
 
 mat1 = zeros(5); 
 for i = 1:5 
     mat1( i, i) = 5*i 
 end 


%   mat2=[5     5     5     5     5; ...
%     10    10    10    10    10; ...
%     15    15    15    15    15; ...
%     20    20    20    20    20; ...
%     25    25    25    25    25];

mat2 = zeros(5);
for i = 1:5 
     mat2(i,1:end) = 5*i 
 end 
% 
% mat3=[4     3     2     1     0; ...
%      9     8     7     6     5; ...
%     14    13    12    11    10; ...
%     19    18    17    16    15; ...
%     24    23    22    21    20];
% 

mat3 = zeros(5);
for i = 1:5 
     mat3(i,:) =  i*[5 4 3 2 1] -1
end
 
% mat4=[1     2     3     4     5; ...
%      6     7     8     9    10; ...
%     11    12    13    14    15; ...
%     16    17    18    19    20];

vec = 1:1:20;
mat4=reshape(vec,5,4)'

% mat5=[19    18    17    16    15; ...
%     14    13    12    11    10; ...
%      9     8     7     6     5; ...
%      4     3     2     1     0]; ...
%
vec1 = 19:-1:0;
mat5=reshape(vec1,5,4)'

% mat6=[0     0     0     0     0; ...
%     10    10    10    10    10; ...
%     20    20    20    20    20; ...
%     30    30    30    30    30];

mat6 = zeros(4, 5);
for i = 1:4 
     mat6(i,:) =  [-10 -10 -10 -10 -10]+(i*10)
end
    
% 
% mat7=[0     1     0     1     0; ...
%      1     0     1     0     1; ...
%      0     1     0     1     0; ...
%      1     0     1     0     1];


mat7 = zeros(2, 5); %I know that there has to be a better way, but somehow I can't get it into just 1 or 2 for loops.
for i=1
    mat7 (i,1:end) = [i i+1 i i+1 i] - i 
    for i=2
        mat7(i,1:end) = [i+1 i i+1 i i+1] - i 
    end
end
repmat(mat7, 2, 1)

%or here's another way. Also not very elelgant
mat7=zeros(4,5)
mat7([1,3],1:2:end)=1
mat7([2,4],2:2:end)=1

%% Q 4.2: Indexing, matrices, length and for
%You run an experiment and the data is collected into 
% the following 3D matrix

mat(:,:,1) = [9    16    16    18     4; ...
     6    16    11    11     6; ...
    10    13     7    12     9; ...
    10     8    19    12     5]

mat(:,:,2) = [17     5     9     9    12; ...
     4     9     4     2     5; ...
     5     6    18     5    12; ...
     3    18    20     8    14]

% The rows represent repeated measurements, 
% the columns represent subjects, 
% and the 3rd dimension represents whether the subject 
% had drunk a cup of tea before the experiment.
% So each subject did the experiment 8 times, 
% four times with a cup of tea, four times without.

% a) Find out how many scores there are greater or 
% equal to 15.
[rr, cc] = find( mat > 14);
[rr, cc]


% b) Find out how many scores greater or equal to 15 
% there were among people who didn’t get the cup of tea.

[rr, cc] = find( mat(:,:,2) > 14);
[rr, cc]



%c) Set all the values less than or equal to 4 to NaN.
mat(mat <= 4) = NaN


% d) Calculate the mean for each subject 
% (not including values less than or equal to 4).
% If you feel very brave do it without using nonanmean from 
% the github account
nanmean(mat) % First I tried this: mean(mat (~ isnan(mat))) ---- I don't understand why this doesn't return the mean along the columns but rather the inner product



% e) write a script where you go through each column 
% (subject) of data, and display for each subject
%       (i) how many NaN there are in that subject’s data, and
%       (ii) how many values there are that are greater or equal to 15.


    
% (i) this is not very elegant but works

TF = isnan(mat);
subnan=sum(TF,1);
subnan = sum(subnan,3)

% (ii) Again, this isn't elegant at all. But works. I tried if and for
% loops but couldn't figure out how to do it.

mat(mat<15)=0;
mat(isnan(mat)) = 0;
mat(mat >=15) = 1;

sub15 = sum(mat,1);
sub15 = sum(sub15,3)
        
      
       
        
%% Q 4.3: Logical operations, mod.

% Write a script so that if x is:

x= 4


 % 0, 2, 4, 6  … etc.  
 % The script prints “x is an even integer”
 % 1 3 5 7  … etc.  
% The script prints “x is an odd integer”
if mod(x,2)==0 
    disp('x is an even integer')
elseif rem(x,2) == 1
    disp('x is an odd integer')
    
    
% A positive non-integer (e.g. 3.2)
 % the script prints “x is a positive non-integer”
 
elseif rem(x,2) ~= 1 && rem(x,2) >0
       disp('x is a positive non-integer')
%     
% % A negative non-integer (e.g. -2.2) 
% % the script prints “x is a negative non-integer”
elseif rem(x,2) ~= 1 && rem(x,2) < 0
     disp('x is a negative non-integer')

end


%% Q 4.4: While

% Write a script that on each loop rolls four dice and
% displays the sum of the four dice. 
% The program should count the number of rolls until
% the sum of the four dice is equal to 20.

roll = [1 , 1, 1, 1];
Ct=0;
while sum(roll) ~=20
      roll = ceil(6*rand([1,4])); 
      Ct = Ct+1;
end
      disp(['rolled ', num2str(Ct), ' times']);

%% and for the brave among you (xtra credit)

clear all

nsub=20;
% generate a random group of men and women
men=69+randn(nsub, 1)*3;
women=66+randn(nsub, 1)*3;
% calculate the real difference between them
realdiff=mean(men)-mean(women);
% throw all heights into a cauldron.

all=[men ;women];

% calculated the expected distribution of differences in means between men and women with a sample of 20 
% if there was no genuine height difference
for r=1:1000
    % stir the cauldron
    all=shuffle(all);
    % assume first 20 are men, second 20 are women
    m_men(r)=mean(all(1:nsub));
    m_women(r)=mean(all(nsub+1:end));
    m_diff(r)=m_men(r)-m_women(r);
end

% Modify the code to find out whether the height difference between men and women would be significant 
% with 10 individuals, 20, 100. (in matlab the command is ttest).

% in a group of 100 individuals, of whom 50 were male, 50 female. 
% How many of the 50 tallest people would be female?

 	 