-module(day_two).
-export([kv/0]).
-export([find_value_for_key/2]).
-export([problem2/0]).
-export([lang/2]).
-export([tic_tac_toe/1]).

% day_two:find_value_for_key(ruby, day_two:kv()).
% Problem 1
kv() -> [{erlang, "a functional language"}, {ruby, "an OO language"}].

find_value_for_key(_, []) -> ok;
find_value_for_key(Seeking, List) ->
  [{Key, Value}|Tail] = List,
  if
    Key == Seeking -> Value;
    true -> find_value_for_key(Seeking, Tail)
  end.

% http://carlosbecker.com/posts/seven-languages-in-seven-weeks-erlang/
% genius!
lang(Tuples, Key) ->
  [First|_] = [TupleValue || {TupleKey, TupleValue} <- Tuples, (Key == TupleKey)],
  First.

% Problem 2
problem2() ->
  ShoppingList = [{apples, 2, 1.00}, {bananans, 2, 2.00}],
  [{Item, Quantity * Price} || {Item, Quantity, Price} <- ShoppingList].

% Problem 3
tic_tac_toe([]) -> no_winner.
