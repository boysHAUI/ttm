function letter=Letter_detection(snap)
S = load ('training.mat')
snap=imresize(snap,[42 24]); 
rec=[ ];

for n=1:length(S)
    cor=corr2(S{1,n},snap); 
    rec=[rec cor]; 
end

ind=find(rec==max(rec));
display(ind);

% Alphabets listings.
if ind==1 || ind==2
    letter='A';
elseif ind==3 || ind==4
    letter='B';
elseif ind==5
    letter='C';
elseif ind==6 || ind==7
    letter='D';
elseif ind==8
    letter='E';
elseif ind==9
    letter='F';
elseif ind==10
    letter='G';
elseif ind==11
    letter='H';
elseif ind==12
    letter='I';
elseif ind==13
    letter='J';
elseif ind==14
    letter='K';
elseif ind==15
    letter='L';
elseif ind==16
    letter='M';
elseif ind==17
    letter='N';
elseif ind==18 || ind==19
    letter='O';
elseif ind==20 || ind==21
    letter='P';
elseif ind==22 || ind==23
    letter='Q';
elseif ind==24
    letter='R';
elseif ind==25
    letter='S';
elseif ind==26
    letter='T';
elseif ind==27
    letter='U';
elseif ind==28
    letter='V';
elseif ind==29
    letter='W';
elseif ind==30
    letter='X';
elseif ind==31
    letter='Y';
elseif ind==32
    letter='Z';
    %*-*-*-*-*
% Numerals listings.
elseif ind==33
    letter='1';
elseif ind==34
    letter='2';
elseif ind==35
    letter='3';
elseif ind==36 || ind==37
    letter='4';
elseif ind==38
    letter='5';
elseif ind==39 || ind==40 || ind==41
    letter='6';
elseif ind==42
    letter='7';
elseif ind==43 || ind==44
    letter='8';
elseif ind==45 || ind==46 || ind==47
    letter='9';
else
    letter='0';
end
end