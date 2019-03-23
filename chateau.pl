%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                       MATHEMATIQUE REGLES                                    %
%                                                                              %
%  Max a un chat.                                                              %
%  Eric n est pas en pavillon.                                                 %
%  Luc habite un studio mais le cheval n y est pas.                            %
%  Chacun habite une maison différente et possède un animal distinct.          %
%                                                                              %
%  Max a un chat.                                                              %
%  La problématique à résoudre est :                                           %
%  Qui habite le château et qui a le poisson ?                                 %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

maison(chateau).
maison(studio).
maison(pavillon).

animal(chat).
animal(poisson).
animal(cheval).

relation(max,M,chat) :- maison(M).
relation(luc,studio,A) :- animal(A), A\==cheval.
relation(eric,M,A):- animal(A), maison(M), M\==pavillon.

different(A, B, C) :- A\==B, B\==C, C\==A.

resoudre(MM, EM, EA, LA) :-
	relation(max, MM, chat),
	relation(eric, EM, EA),
	relation(luc, studio, LA),
	different(MM, EM, studio),
	different(chat, EA, LA).
