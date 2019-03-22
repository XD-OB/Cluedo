change(gauche, droite).
change(droite, gauche).

/* peon, loup, chevre, chou */

/* Déplacer le loup avec le peon */
deplacer([X,X,Chevre,Chou], loup,[Y,Y,Chevre,Chou]) :- change(X,Y).

/* Déplacer la chèvre avec le peon */
deplacer([X,Loup,X,Chou], chevre,[Y,Loup,Y,Chou]) :- change(X,Y).

/* Déplacer le chou avec le fermier */
deplacer([X,Loup,Chevre,X], chou,[Y,Loup,Chevre,Y]) :- change(X,Y).

/* Déplacee le peon seul */
deplacer([X,Loup,Chevre,Chou], peon,[Y,Loup,Chevre,Chou]) :- change(X,Y).

/* Le Peon soit toujours avec les éléments sensibles */
avec(X,X,_).
avec(X,_,X).

/* Assurer que tout est sûr pour le mouvement */
assurer([Peon, Loup, Chevre, Chou]) :- avec(Peon, Loup, Chevre), avec(Peon, Chevre, Chou).

/* Appel de la fonction de résolution de notre problème*/
solution([droite, droite, droite, droite], []).
solution(Etat,[Bouge|Autres]) :-
deplacer(Etat, Bouge, Suivant),
assurer(Suivant),
solution(Suivant, Autres).

message(X) :- X\== 'peon', format("~w avec peon.~n", [X]), !.
message(_) :- write('peon seul.'), nl.

affiche([], _).
affiche([H|T], D) :- D =:= 1, write(' ==>> '),
		message(H),
		affiche(T, D - 1), !.
affiche([H|T], D) :- D =:= 0, write('                          <<== '),
		message(H),
		affiche(T, D + 1), !.

la_solution :- length(L, 7),
		solution([gauche, gauche, gauche, gauche], L),
		affiche(L, 1), 
		nl, write('        _Sans effusion de sang_'), nl, !.
