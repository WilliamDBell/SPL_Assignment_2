% William Bell
% Structures of Programming Languages 
% Assignment 2

sum-list([],0).

sum-list([Head | Tail], Sum) :-
  number(Head),
  sum-list(Tail, Sum1),
  Sum is Head + Sum1.
sum-list([Head | Tail], Sum) :-
  sum-list(Tail, Sum1),
  Sum is Sum1.
  
sum-up-numbers-simple(L, N) :-
  sum-list(L, Sum),
  Sum == N.

% Base Case
sum-list-general([],0).

sum-list-general([Head | Tail], Sum) :-
  is_list(Head),
  sum-list-general(Tail, Sum1),
  sum-list-general(Head, Sum2),
  Sum is Sum1 + Sum2.
  
sum-list-general([Head | Tail], Sum) :-
  number(Head),
  sum-list-general(Tail, Sum1),
  Sum is Sum1 + Head.

sum-list-general([Head | Tail], Sum) :-
  sum-list-general(Tail, Sum1),
  Sum is Sum1.

sum-up-numbers-general(L, N) :-
  sum-list-general(L, Sum),
  Sum == N.


find_min([Head | Tail], Min) :-
  find_min(Tail, Head, Min).

find_min([], Min1, Min1).

find_min([ Head| Tail], Min1, Min0):- 
  find_min(Tail, Min1, Min0).

find_min([Head | Tail], Min1, Min0):-
  number(Head),
  Min2 is min(Head, Min1), 
  find_min(Tail, Min2, Min0).
