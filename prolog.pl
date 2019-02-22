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
