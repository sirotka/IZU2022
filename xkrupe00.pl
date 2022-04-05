% Zadání č. 38:
% Napište program řešící úkol daný predikátem u38(LIN), kde LIN je vstupní 
% celočíselný seznam. Predikát je pravdivý (má hodnotu true), pokud 
% se v seznamu LIN opakuje nějaké liché číslo větší než nula, jinak je 
% predikát nepravdivý (má hodnotu false).

% Testovací predikáty:
u38_1:- u38([4,-3,1,8,3,-8,0]).				% false.
u38_2:- u38([4,-3,3,8,3,8,0]).				% true.
u38_3:- u38([]).					% false.
u38_r:- write('Zadej LIN: '),read(LIN),u38(LIN).

positive(X) :- X > 0.

odd(X) :- X mod 2 =\= 0.

pos_odd_num(X) :- positive(X), odd(X).

member(X, [H|_]) :- X =:= H, !.
member(X, [_|T]) :- member(X, T).

func([H|T]) :- pos_odd_num(H) -> member(H, T), !.
func([_|T]) :- func(T). 

u38(LIN) :- func(LIN).