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
