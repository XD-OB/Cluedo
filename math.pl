%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                       MATHEMATIQUE REGLES                                    %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fibonacci(1, 1).
fibonacci(2, 1).
fibonacci(N, Res) :- N > 2, N < 47, U is N - 1, V is N - 2,
			fibonacci(U, Ru),
			fibonacci(V, Rv),
			Res is Ru + Rv.

factoriel(0, 1).
factoriel(1, 1).
factoriel(X, Res) :- X > 1, Y is X - 1,
		factoriel(Y, R),
		Res is R * X.

pow(_, 0, 1).
pow(0, _, 0).
pow(X, Y, Res) :- Y > 0, X > 0,
	Y2 is Y - 1,
	pow(X, Y2, R),
	Res is R * X.

sum([], 0).
sum([H|T], S) :-
	sum(T, S1),
	S is S1 + H.
