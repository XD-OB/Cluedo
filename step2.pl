%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                       EINSTEIN RIDDLE                                        %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

droite_de(X, Y, [Y,X|_]).
droite_de(X, Y, [_|R]) :- droite_de(X, Y, R).
gauche_de(X , Y, [X,Y|_]).
gauche_de(X , Y, [_|R]) :- gauche_de(X, Y, R).
cote_de(X, Y, Z) :- droite_de(X, Y, Z); gauche_de(X, Y, Z).

/*  Position, Couleur, Nationalite, Animal, Boisson, Cigare  */

maisons([	[1, _, _, _, _, _],
		[2, _, _, _, _, _],
		[3, _, _, _, _, _],
		[4, _, _, _, _, _],
		[5, _, _, _, _, _]
	]).

enigme_maisons(Maisons) :- maisons(Maisons),
		member([_, rouge, anglais, _, _, _], Maisons),
		member([_, _, suedois, chiens, _, _], Maisons),
		member([_, _, danois, _, the, _], Maisons),
		gauche_de([_, vert, _, _, _, _], [_, blanche, _, _, _, _], Maisons),
		member([_, vert, _, _, cafe, _], Maisons),
		member([_, _, _, oiseaux, _, pallmall], Maisons),
		member([_, jaune, _, _, _, dunhill], Maisons),
		member([3, _, _, _, lait, _], Maisons),
		member([1, _, norvegien, _, _, _], Maisons),
		cote_de([_, _, _, _, _, blend], [_, _, _, chats, _, _], Maisons),
		cote_de([_, _, _, cheval, _, _], [_, _, _, _, _, dunhill], Maisons),
		member([_, _, _, _, biere, bluemaster], Maisons),
		member([_, _, allemand, _, _, prince], Maisons),
		member([2, bleue, _, _, _, _], Maisons),
		cote_de([_, _, _, _, _, blend], [_, _, _, _, eau, _], Maisons).

qui_a_le_poisson(X) :- enigme_maisons(Maisons), member([_, _, X, poisson, _, _], Maisons), !.
