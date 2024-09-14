homme(odilon).
homme(roger).
homme(vincent).
homme(arnaud).
homme(marcel).
homme(blaise).
homme(edouard).
homme(marius).

femme(melanie).
femme(genevieve).
femme(roseline).
femme(agnes).
femme(paule).
femme(martine).
femme(tatiana).
femme(prisca).
femme(pauline).

enfant(melanie,1).
enfant(pauline,1).
enfant(edouard,1).

enfant(roseline,2).
enfant(marcel,2).

enfant(prisca,3).
enfant(marius,3).

enfant(agnes,4).
enfant(arnaud,4).
enfant(martine,5).
enfant(blaise,5).



couple(2,roger,melanie).
couple(4,vincent,roseline).
couple(3,edouard,tatiana).
couple(5,marcel,paule).
couple(1,odilon,genevieve).



pere(X,Y):-enfant(Y,Z),couple(Z,X,_),homme(X).
mere(X,Y):-enfant(Y,Z),couple(Z,_,X),femme(X).
% enfant(X,I):-couple(I,Y,Z),(pere(Y,X);mere(Z,X)).
soeur(X,Y):-femme(X), enfant(X,I),enfant(Y,I),X\=Y.
frere(X,Y):-enfant(Y,I),enfant(X,I),homme(X),X\=Y.
frere_ou_soeur(X,Y):-soeur(X,Y);frere(X,Y).
oncle(X,Y):-(pere(Z,Y);mere(Z,Y)),frere(X,Z).
tante(X,Y):-(pere(Z,Y);mere(Z,Y)),soeur(X,Z).

grand_pere(X,Y):- (pere(X,Z),pere(Z,Y));(pere(X,Z),mere(Z,Y)).
grand_mere(X,Y):- (mere(X,Z),pere(Z,Y));(mere(X,Z),mere(Z,Y)).
grand_parent(X,Y):-grand_mere(X,Y);grand_pere(X,Y).
cousin_cousine(X,Y):-grand_parent(Z,X),grand_parent(Z,Y),not(frere_ou_soeur(X,Y)),X\=Y.