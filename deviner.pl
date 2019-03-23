%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                       DEVINER LE NOMBRE                                      %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

deviner_le_nombre :- write('Deviner le nombre entre 1 et 100'), nl,
			random(1, 100, Guess),
			read(N),
			msg(N, Guess),
			deviner(N, Guess).

deviner(N, G) :- N =\= G,
	write('Deviner le nombre entre 1 et 100'), nl,
	read(X),
	msg(X, G),
	deviner(X, G).

msg(N, G) :- N =:= G, write('Vous Avez GAGNEE le number est: '), write(G), nl, !.
msg(N, G) :- N > G, write('Le nombre est plus grand!'), nl.
msg(N, G) :- N < G, write('Le nombre est plus petit!'), nl.
