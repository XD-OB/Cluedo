%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                       SPORTIVES ENIGME                                       %
%                                                                              %
% Cinq sportifs sont dans la salle d attente d un médecin spécialisé.          %
% Retrouvez grâce aux indications suivantes leur ordre d arrivée,              %
%   le sport pratiqué par chacun ainsi que la raison de leur présence.         %
% Jean qui est arrivé en dernier, ne pratique ni la gymnastique ni le basket.  %
%   Il ne vient pas se faire établir un certificat                             %
% Christian, venu pour un soin, ne pratique pas non plus la gymnastique        %
% Grégoire, qui est arrivé avant Laurent mais après celui qui pratique         %
%   la gymnastique fait du patinage.                                           %
%   Il n est venu ni pour un certificat,                                       %
%   ni chercher un renouvellement d ordonnance                                 %
% Celui qui pratique le football est arrivé le troisième, avant Christian.     %
%   Il est venu chercher une dispense                                          %
% Remi est un sportif.                                                         %
% Le rugby est un sport.                                                       %
% La visite est un motif de consultation.                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

arriver_avant(A, B, L) :- append(_, [A|X], L), append(_, [B|_], X).

appartient(X, L) :- append(_, [X|_], L).

dernier(X, L) :- append(_, [X], L).

/*       Nom, Sport, Motif de presence       */

liste_des_sportifs([
		[_, _, _],
		[_, _, _],
		[_, _, _],
		[_, _, _],
		[_, _, _]
	]).

enigme(SPORTIFS) :- liste_des_sportifs(SPORTIFS),
	member([_, _, visite], SPORTIFS),
	member([_, _, certificat], SPORTIFS),
	member([_, _, renouvlement], SPORTIFS),
	member([_, rugby, _], SPORTIFS),
	member([_, basket, _], SPORTIFS),
	member([remi, _, _], SPORTIFS),
	dernier([jean, SJEAN, MJEAN], SPORTIFS),
	SJEAN \== gymnastique,
	SJEAN \== basket,
	MJEAN \== certificat,
	member([christian, SCHRIST, soin], SPORTIFS),
	SCHRIST \== gymnastique,
	arriver_avant([_, gymnastique, _], [gregoire, _, _], SPORTIFS),
	arriver_avant([gregoire, patinage, MGREG], [laurent, _, _], SPORTIFS),
	MGREG \== certificat,
	MGREG \== renouvlement,
	SPORTIFS = [_, _, [_, football, dispense], _, _],
	arriver_avant([_, football, _], [christian, _, _], SPORTIFS).

affiche([]) :- !.
affiche([H|T]) :- writeln(H),
	affiche(T).

affichez_l_ordre :- enigme(S), nl,
		writeln("-----------Solution------------"),
		affiche(S).
