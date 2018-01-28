%% Questions for Chapter 3

%Q 3.1: Basic calculations.

%Create the following matrix mat:

mat=[ 1 2 3 4; 4 5 6 7; 8 9 10 11]; 

%If you look at the size of mat you will see that it has 3 rows and 4 columns.

size(mat)

%a) Before typing anything in, guess what will result from:

% mat + 1
% I thought it would add one to each cell but now that I see what it did I
% realize that to add 1 to each place I would have to do some matrix math

% It does add 1 to each cell??? Does it make sense to you.

%b) Guess what you get when you type:

% 10-mat
%I thought this command deletes each cell in the matrix from 10. And this is what it did

% c) Use the command min to calculate the minimum of each column of mat
min(mat)

ans =

     1     2     3     4

% d) Use min and the transpose (‘) to calculate the minimum of each row of mat

min(mat')

ans =

     1     4     8
% e) Use min twice to calculate the minimum of the entire matrix
min(min(mat))

ans =

     1

%% Q 3.2: Calculations with vectors.

% Define the following vectors:

v1 =[1 2 3 4];
v2 =[1 0 1 0];

%Before typing anything in, guess what will result from:
% a) v1 + v2 I think it will ad element 1 to element 1, element 2 to
% element 2. Now that I ran it, that's what it did.
v1+v2

ans =

     2     2     4     4
% b) v1 .* v2 Now I it will multiply each cell with each cell and we get a
% matrix. But that is not what it does. It multiplies cell 1 with cell 1,
% cell 2 with cell 2 etc.
v1 .* v2

ans =

     1     0     3     0

% c) sum(v1.*v2) This will just sum my answer above. So I should get 4.
% That's what I got

% d) v1 * v2' This will give me the inner product, which is the same as
% the last 2 steps.
%% Q 3.5: More calculations with vectors

% Calculate the sum of all odd numbers from 1 to 99

sum(1:2:99);
%% Q 3.6: Making pi

% The number ? can be expressed as:

% ?= ?(6/1^2 +6/2^2 +6/3^2 +6/4^2 +6/5^2 +?)

% We’ll approximate this in the following steps:

% a) Generate a vector ‘a’ that counts in steps of 1 from 1 to 10,000 (don’t forget the semicolon to suppress the output!)
a=(1:1:10000);
% 
% b) Square every element of that vector and call this vector ‘b’.
b=a.^2;
% 
% c) Create a new vector (‘c’) that is 6 divided by every element of vector b
c = 6./b;
% 
% d) Create a scalar ‘d’ that is the sum of vector ‘c
d=sum(c')
% 
% e) Take the square root of scalar d.
sqrt(d)
% 
% f) For extra credit, try to do to this all in a single line!
sqrt(sum(6./((1:10000).^2))')

%% Q 3.7: Inner and Outer Products
% 
% Let the vector ‘heights’ be a list of heights in inches:

heights = [66 68 65 70 65]';
%
% a) Find the average of these heights by adding the heights and dividing by 5

sum(heights)/5

% b) use Matlab’s ‘mean’ function to get the same number
mean(heights)

% Let the vector V2 be: 

w = ([1 1 1 1 1]/5);
% 
% c) Show that the inner product of w and heights is the same as the mean. Do you see why?
% Of course the inner product and the means are the same because with the
% inner product I am multiplying the first cell in heights with the first cell in w etc. and then I am adding all of them together.
% Since I am multiplying each cell of heights by 1/5th, the result is the
% same as adding all heights and then dividing them by 5.
heights' * w'


% d)  Now let 
w = [1 1 1 0 1]/4;
% 
% Show that the inner product of w and heights is the mean height after taking out the fourth value.
heights1=heights([1 2 3 5])';
w1=w([1 2 3 5])';
heights1 * w1
mean(heights1)
