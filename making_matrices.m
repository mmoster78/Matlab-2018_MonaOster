%% making matrices
% provides examples of ways to make metrices 
% written MO 1/22/2018

mat1= zeros(5,4);
mat2=mat1;
mat2(1:5, 3)=1;

mat2=mat1;
mat2(1:end, 3)=6

mat2=mat1;
mat2(:, 3)=6

mat2=mat1;
mat(4,1:4)=1

%now to something interesting
mat=zeros(4),
for i=1:4
    mat(i,i)=i %first time I run this, i=1. Then on subsequent runs i=2, 3, 4
    pause
end

%%

tic
mat=zeros(6)
for i=1:6
    mat(i, :)= [-2 0 1 -1 2 3]
   
end
toc % gives me the time it took

%%
mat=zeros(5)
for i=1:5
    mat(i, :)= [ 0 0 1 1 0]+i
end

%%
mat=zeros(3, 4)
for i=1:3
        for j=1:4   %we go through this inner loop before going through the outer loop. In this example, j advances from 1-4 while i stays at 1. Then it repreats
            mat(i,j) = i+j
            pause
        end  
end

%%
mat=zeros(3, 4)
for i=1:3
        for j=1:4
            mat(i,j) = ((i-1)*4)+j
            
        end
end

%%
mat=zeros(3, 4)
for i=1:3
    mat(i,:) = ((i-1)*4)+ [1:4]
end

v=mat(:) %getting rid of the loop
mat2=mat'; mat2(:)

v=1:12
mat2=reshape(v, 4, 3)'

mat2=reshape(1:12, 4, 3)' %same loop in one line

mat=[ 1 2 3; 4 5 6;7 8 9];
vect=mat(:)

ind=sub2ind(size(mat),3,2) % finding a specific number from the matrix if I want to know what postition it would be in the vector. "given the size of mat, what is the index in this vector"
                            % if this matrix was a vector, which number
                            % would this be; this helps with cutting down
                            % computing time
[r,c]=ind2sub(size(mat), 6) %same as above only the other way around

v=[1:20];
mat45=reshape(v, 4, 5)
mat210=reshape(v, 2, 10)
reshape(mat45, 2, 10)

[r,c]=ind2sub(size(mat210), 10)  %go from index into subscript in a vector
[r,c]=ind2sub(size(mat45), 10)
%% repmat command to replicate matrices

x=[1 5 3 2 5]
size(x)
X = repmat(x, 3, 2)
size(X)

X=[2 3 4; 5 6 7];
size(X)
Y=repmat(X,3, 2)
size(Y)

%%
n1=2; n2=4;
n1==3.2
n1==n2
n1~=n2

n1=1; n2=2; n3=3;
n1<n2 && n1>n3
n1<n2 || n1>n3 %"or" statement

%%
rmat=rand(5,5)
rmat2=rand(5,5)

for iRow=1:size(rmat,1)
        for iCol=1:size(rmat, 2)
            if rmat(iRow, iCol) < rmat2(iRow, iCol)
                rmat(iRow, iCol) = rmat2(iRow, iCol) %this replaces the value in the mats with the max
            end
        end
end

%%
n=1
if  n<0                     %this is only executed if the statement is true. Otherwise matlab just skips this
    disp('bye bye sweetie');      
   
elseif n
     disp('hi there cutie pants');
else
    disp('hi there dearie');
end


%%
n=10
if n<=0.6
    disp('I love Calvin and Hobbes')
elseif n<=0
    disp('Garfield sucks')
elseif n>0 && n<=0.6
    disp('muchas smoochas')
else
    disp('snuggle-puppy');
end

%%
n=0;
while n<1   %really useful for experiments. For example, if I want to stop a trial when a key is pressed
    n=randn(1);
    disp(n)
end

tic %timing in second
while toc<3
    :
end
