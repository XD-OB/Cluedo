femme(X) :- member(X, [anne, betty, lisa, sylvie, eve, julie, valerie]).

homme(X) :- member(X, [marc, luc, jean, jules, leon, loic, gerard, jacques, paul, herve]).

mari_de(M, F) :- member((M, F), [
			(marc, anne),
			(luc, betty),
			(jules, lisa),
			(leon, sylvie),
			(loic, eve),
			(paul, julie)
			]).

femme_de(Y, X) :- mari_de(X, Y).

enfant_de(E, P) :- member((E, P), [
			(jean, marc), (jean, anne),
			(jules, marc), (jules, anne),
			(leon, marc), (leon, anne),
			(lisa, luc), (lisa, betty),
			(loic, luc), (loic, betty),
			(gerard, luc), (gerard, betty),
			(jacques, jules), (jacques, lisa),
			(herve, leon), (herve, sylvie),
			(julie, leon), (julie, sylvie),
			(paul, loic), (paul, eve),
			(valerie, loic), (valerie, eve)
			]).

beaupere_de(X, Z) :- homme(Z), homme(X), femme_de(Y, Z), enfant_de(Y, X), !.
beaupere_de(X, Z) :- femme(Z), homme(X), mari_de(Y, Z), enfant_de(Y, X).
bellemere_de(X, Z) :- homme(Z), femme(X), femme_de(Y, Z), enfant_de(Y, X), !.
bellemere_de(X, Z) :- femme(Z), femme(X), mari_de(Y, Z), enfant_de(Y, X).

ancetre_de(X, Z) :- enfant_de(Z, X).
ancetre_de(X, Z) :- enfant_de(Z, Y),
			ancetre_de(X, Y).
