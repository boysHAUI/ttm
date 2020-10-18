%Alphabets
A=imread('alpha/A.bmp');B=imread('alpha/B.bmp');C=imread('alpha/C.bmp');
D=imread('alpha/D.bmp');E=imread('alpha/E.bmp');F=imread('alpha/F.bmp');
G=imread('alpha/G.bmp');H=imread('alpha/H.bmp');I=imread('alpha/I.bmp');
J=imread('alpha/J.bmp');K=imread('alpha/K.bmp');L=imread('alpha/L.bmp');
M=imread('alpha/M.bmp');N=imread('alpha/N.bmp');O=imread('alpha/O.bmp');
P=imread('alpha/P.bmp');Q=imread('alpha/Q.bmp');R=imread('alpha/R.bmp');
S=imread('alpha/S.bmp');T=imread('alpha/T.bmp');U=imread('alpha/U.bmp');
V=imread('alpha/V.bmp');W=imread('alpha/W.bmp');X=imread('alpha/X.bmp');
Y=imread('alpha/Y.bmp');Z=imread('alpha/Z.bmp');
Afill=imread('alpha/fillA.bmp');
Bfill=imread('alpha/fillB.bmp');
Dfill=imread('alpha/fillD.bmp');
Ofill=imread('alpha/fillO.bmp');
Pfill=imread('alpha/fillP.bmp');
Qfill=imread('alpha/fillQ.bmp');

%Natural Numbers
one=imread('alpha/1.bmp');two=imread('alpha/2.bmp');
three=imread('alpha/3.bmp');four=imread('alpha/4.bmp');
five=imread('alpha/5.bmp'); six=imread('alpha/6.bmp');
seven=imread('alpha/7.bmp');eight=imread('alpha/8.bmp');
nine=imread('alpha/9.bmp'); zero=imread('alpha/0.bmp');
zerofill=imread('alpha/fill0.bmp');
fourfill=imread('alpha/fill4.bmp');
sixfill=imread('alpha/fill6.bmp');
sixfill2=imread('alpha/fill6_2.bmp');
eightfill=imread('alpha/fill8.bmp');
ninefill=imread('alpha/fill9.bmp');
ninefill2=imread('alpha/fill9_2.bmp');

%Creating Array for Alphabets
letter=[A Afill B Bfill C D Dfill E F G H I J K L M N O Ofill P Pfill Q Qfill R S T U V W X Y Z ];

%Creating Array for Numbers
number=[one two three four fourfill five six sixfill sixfill2 seven eight eightfill nine ninefill ninefill2 zero zerofill 
         ];

training=[letter number];

save ('training','training')
clc