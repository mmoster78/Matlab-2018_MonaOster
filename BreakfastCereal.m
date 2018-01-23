% BreakfastCereal
%
% Provides examples of fun things you can do with cereal boxes.
% Inspired by
%
% written MO 1/3/2018 for Matlab 2018

frosted='FROSTED FLAKES';
cheerios = 'CHEERIOS';

frosted_scrambled = frosted;
frosted_scrambled(9) = 'E';

frosted_scrambled([6 13])=['F' 'F'];
disp (frosted_scrambled);

ff=find('FROSTED FLAKES' == 'F'); %"this funcition determines what letters are Fs and assign 1s then find says"these are the Fs"
ff=find(frosted == 'F'); %same as above
disp (ff);

%%
% Chapter 2: Replacing Letters
% a) 

cherios_funny = 'cherios';
cherios_funny(1) = 'o';
cherios_funny(4) = 'p';
disp(cherios_funny);

%b)
chemistry = 'CHEMISTRY';
chemistry_funny = chemistry;
chemistry_funny(1) = 'O';
chemistry_funny(8) = 'B';

disp(chemistry_funny);

%% Q 2.2
str = 'MACARONI AND CHEESE';
id1 = ([1 2 7 13:19]);
a = str(id1);
disp (a);

id2 = ([15 16 5 9 1 8 7 12 9 8 18 9 14 15 8 7 17 18 17]);
b = str(id2);
disp (b);

%% Q 2.3
vecta = [1:10]

vecta1=linspace(1,10,10)

vectb= [10:2:18]

vectb1=linspace(10,18,5)

vectc= [19:-1:15]

vectc1=linspace(19,15,5)

vectd= [10:-2:-4]

vectd1=linspace(10,-4,8)

vecte= [0:3.1416:15.7080]

vecte1=linspace(0,15.7080,6)

vectf= [0:pi:5*pi]

vectf1=linspace(0,5*pi,6)
%% Q 2.4
str = 'aaaaaaaaaaaaaaaaaaaa';

V5=(3:3:20);
str(V5)=['c' 'c' 'c' 'c' 'c' 'c']

V6=(2:3:20);
str(V6) = ['b' 'b' 'b' 'b' 'b' 'b' 'b']

str(3)

V7=(4:6);
str(V7) = ['d' 'e' 'f']

%V8=([10:12 16:18]);
str([10:12 16:18]) = ['d' 'e' 'f' 'd' 'e' 'f']

str([6 12 18])

%% Q 2.5

exper = linspace(12,59.97,40); % should be 20 measurements, starting 1.2, also separated by 2.36 seconds
exper=1.2:
exper(5)
exper(end)

%% Q 2.6
resp ='rerekererererererererererererererererere';
idx=find(ismember(resp,'k'))
resp(5)=['r']

