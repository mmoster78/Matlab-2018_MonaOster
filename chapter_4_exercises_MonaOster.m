%exercises chapter 4
% MO 1.30.18

%% Q 4.1 Matrixes 
A = ones(5);
for i = 3:5 
     A(i, :) = 2 
end 
 
B = zeros(5);
for i = 1:5 
     B(i, 1:2) = 1
     B(i, end)=1
end 

C= ones(6, 5)
for i = 1:5
    C(2:4, 2:3) = 0
end

D = ones(5)
for i=1:5
    D(i,1:end) = i
end

E = ones(5); 
for i = 1:5
    M(i,i:end) = 2
end

f=(0:5:20)
F=repmat(f,5, 1)

g = 1:1:25;
G=reshape(g,5,5)

H = zeros(8);
for i=1:8
    H (i,1:end) = [i+1 i i+1 i i+1 i i+1 i] - i 
end

I = zeros(8);
for i = [1;3;5;7] 
     I( i, i) = 1 %this is not quite right. I get ones in all of the columns
end 
 
J = zeros(5);
for i=1:5
    j=1:5
    J( i,j) = (i+j)-2
end

K = zeros(5);
for i=1:5
    j=1:5
    K( i,j) = i*j
end

l = 1:1:25;
L=reshape(l,5,5)'

%% Q 4.2
% a)
M3D=zeros(3,3,3)
M3D(2,2,:)=1

% b
M5 = zeros(5,5,5)
M5(2:4,2:4,:)=1

%% Q 4.3
% a)
M4x3 = zeros(4, 3);
for i=1:4
    j=1:3
    M4x3( i,j) = (i+j)
end


M4x3(3, 2)

% b)
[rr,cc]=find(M4x3==7)

%% Q 4.4

% a)
x = -2
if x > 0
    disp('x is positive')
    
elseif x < 0
    disp('x is negative')
end

%b)
x = 2.5

if x <2 | x > pi
    disp('ture')
else
    disp ('false')
end


% c)

x = 3; y = 3; z = 1;
 
if x > 2 & y < 4 
       disp ('success') 
elseif z == 0
       disp ('success')
end

%% Q 4.5

%I just can't figure this one out! this has multiple issues and I feel
%completely stuck!

dice = randi([1 6], [1 6])
% while dice(1,2) ~ [1,1] 
%       roll = ceil(rand(1, 2)); %this always returns 0 0 -- why?????
%       dice = roll;
% end

%disp([' n = ', sum(roll)]);  %and this display solution is not correct
%either. Do I need to make a variable that counts the number of rolls?