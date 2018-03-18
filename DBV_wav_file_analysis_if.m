% this program will do the following:
%
% TMR ANALYSIS ***This is a work in progress. It works alright but is not
% quite as slick and versatile as I would like it to be, yet.***
%
% 1. read in multiple sound files from different categories: e.g. baseline F,
% baseline M, asynchrony cues (40, 72, 75), AM cue (40, 72, 75), combined cues (40,
%    72, 75); currently this has to be changed manually but can easily be
%    adjusted for different sound files.
%
% 2. subtract the baseline amplitudes from the cue amplitudes 
%
% 
% 3. plot the subtracted results: I decided to eliminate this step, since
% it is not really that informative for my analysis.
%
%
% 4. for each combination, calculate the percentage of time that the
%    amplitudes are at, above and below the expected TMR (-20, 12, 15)
%
% 4. store that information in an excel file
%
%
% MO 3/18


%% load competing talker files
% do I want a vector that contains the vowel labels? What would that do to
% help me organize this data?

clear all

vowelList={'c'  'i' 'u' 'xe' 'xi' 'xq' 'xu'};

cd F_stim
d = dir('*.wav'); % get list of all competing talker files

for i = 1:length(d)             % load up infant directed samples and extract envelope
    [y,fs] = audioread(d(i).name); 
    female_baseline{i} = y;
   
end

t = (1:length(y))*(400/17640); % compute time label

T1=cell2mat(female_baseline);

Pa_ref = 20e-6;     %reference pressure for SPL

T1dB = 20*log10 (T1 / Pa_ref); 

T1dB(isinf(T1dB))=0;


%% load the files I want to evaluate
cd M_AS_100_72                  % folder needs to be contained in previous folder for this to run smoothly
% try using uigetdir or uigetfile

d = dir('*.wav');               % get list of all target talker files

for i = 1:length(d)             % load up infant directed samples and extract envelope
    [y,fs] = audioread(d(i).name); 
    M_AS_100_72{i} = y;
end

M_AS_100_72=cell2mat(M_AS_100_72);
M_AS_100_72_dB =20*log10(M_AS_100_72 / Pa_ref);
M_AS_100_72_dB(isinf(M_AS_100_72_dB))=0;


%% Subtract the target talker intensity for each vowel from competing talker intensity for each vowel

for i=1:length(vowelList)
        eval(['AS_72_dif.',vowelList{i}, '=M_AS_100_72_dB(:,1)-T1dB(:,i)']);
end

%% calculate % of subtracted vowel being equal, below or above the desired TMR 
TMR=12;
%I think I should be able to do this more efficiently, maybe within a structure. However, I was unable to
%figure out how to do this in a strucutre or cell array.
% Or maybe I could have makde a script to clean up the main code? I think I
% might try and make a script as a next step.

for i=1:length(vowelList)

eval(['TMRref.',vowelList{i},'(1,:)=(sum(AS_72_dif.', vowelList{i},'(4410:length(y),:) == TMR))/(length(y)-4410)']); %since these are asynchronous vowels, I'm only considering time points after the second vowel starts
eval(['TMRref.',vowelList{i},'(2,:)=(sum(AS_72_dif.', vowelList{i},'(4410:length(y),:) > TMR))/(length(y)-4410)']);
eval(['TMRref.',vowelList{i},'(3,:)=(sum(AS_72_dif.', vowelList{i},'(4410:length(y),:) < TMR))/(length(y)-4410)']);
eval(['AS100_72.', vowelList{i}, '=TMRref.', vowelList{i}]);
end

outfile=struct2cell(AS100_72);


%%
% I've tried unsuccessfully to include row and column labels to my exported
% file. I've tried adding vectors / cell arrays to the my structure, which
% didn't work b/c the row and column labels are different in size from the
% rest of the data and so can't be concattenated or turned into a table.
% I've tried writing the data and the column and row headers to different
% parts of the sheet but that approach failed as well. Please let me know
% if you have any suggestions!


% xlswrite('test.xlsx',col_header,'Sheet2','A1');     %Write column header
% xlswrite('test.xlsx',row_header,'Sheet2', 'A2');      %Write row labels

cellArray = {'Male','c','I','U','e', 'i', 'q', 'u'};
opList={'=' '>' '<'};


for i = 1:length(vowelList)
    ct = 2;
    for j=1:3
    cellArray{ct, 1} = opList{j}; 
    eval(['cellArray{ct, i+1} = AS100_72.', vowelList{i}, '(j);']);
    ct=ct+1;
    end
end
xlswrite('AS100_12TMR.xlsx', cellArray); %write data

