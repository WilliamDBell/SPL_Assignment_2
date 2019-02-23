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

find_min_above_val([Head | Tail], Val, Min) :-
  number(Head),
  Head =< Val,
  find_min_above_val(Tail, Val, Min).

find_min_above_val([Head | Tail], Val, Min) :-
  number(Head),
  Head > Val,
  find_min_above_val(Tail, Val, Head, Min).

find_min_above_val([Head | Tail], Val, Min) :-
  find_min_above_val(Tail, Val, Min).

find_min_above_val([], Val, Min0, Min):-
    Min is Min0. 

find_min_above_val([Head | Tail], Val, Min0, Min) :-
  number(Head),
  Head > Val,
  Min1 is min(Head, Min0), 
  find_min_above_val(Tail, Val, Min1, Min).
  
find_min_above_val([Head | Tail], Val, Min0, Min) :-
  number(Head),
  Head < Val,
  find_min_above_val(Tail, Val, Min0, Min).
    
 find_min_above_val([Head | Tail], Val, Min0, Min) :-
  find_min_above_val(Tail, Val, Min0, Min).


min-above-min(L1, L2, N) :-
    find_min(L2, M0),
    find_min_above_val(L1, M0, M1), 
    M1 == N.
