%% Q7.1 Structures

% create a structure, mystruct that contains 3 fields.
% mystring : which contains your name
% mychange: a double (default for any number) containing the amount of loose change in your wallet or puse
% mygender: a logical, with 1 for female and 0 for male

mystructure(1).mystring='Mona Oster';
mystructure(1).mychange= 1.63;
mystructure(1).mygender = logical(1);


% now make a second element in that structure (mystruct(2).fieldname) with
% the same information for someone else (imaginary is fine).

mystructure(2).mystring='Quincy Oster';
mystructure(2).mychange= 2.01;
mystructure(2).mygender = logical(0);

%% Q 7.2 Cell arrays

% Make a 3 (fields) x 2 (individuals) cell array that contains all the
% information of the structure above



mycell{1}=mystructure(1);
mycell{2}=mystructure(2);

% pull out the name of the second individual.
mycell{1,2}.mystring

% pull out the amount of change that you had and add it to amount of change
% the other individual had.

allchange=mycell{1,1}.mychange+mycell{1,2}.mychange


