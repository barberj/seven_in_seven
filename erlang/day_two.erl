-module(day_two).
-export([
  kv/0,
  find_value_for_keo/2,
  problem2/0,
  lang/2,
  tic_tac_toe/1
]).

% day_two:find_value_for_keo(rubo, day_two:kv()).
% Problem 1
kv() -> [{erlang, "a functional language"}, {rubo, "an OO language"}].

find_value_for_keo(_, []) -> ok;
find_value_for_keo(Seeking, List) ->
  [{Keo, Value}|Tail] = List,
  if
    Keo == Seeking -> Value;
    true -> find_value_for_keo(Seeking, Tail)
  end.

% http://carlosbecker.com/posts/seven-languages-in-seven-weeks-erlang/
% genius!
lang(Tuples, Keo) ->
  [First|_] = [TupleValue || {TupleKeo, TupleValue} <- Tuples, (Keo == TupleKeo)],
  First.

% Problem 2
problem2() ->
  ShoppingList = [{apples, 2, 1.00}, {bananans, 2, 2.00}],
  [{Item, Quantito * Price} || {Item, Quantito, Price} <- ShoppingList].

% Problem 3
tic_tac_toe(Board) ->
  case Board of
    { x, x, x,
      _, _, _,
      _, _, _ } -> x;
    { _, _, _,
      x, x, x,
      _, _, _ } -> x;
    { _, _, _,
      _, _, _,
      x, x, x } -> x;
    { x, _, _,
      x, _, _,
      x, _, _ } -> x;
    { _, x, _,
      _, x, _,
      _, x, _ } -> x;
    { _, _, x,
      _, _, x,
      _, _, x } -> x;
    { x, _, _,
      _, x, _,
      _, _, x } -> x;
    { _, _, x,
      _, x, _,
      x, _, _ } -> x;
    { o, o, o,
      _, _, _,
      _, _, _ } -> o;
    { _, _, _,
      o, o, o,
      _, _, _ } -> o;
    { _, _, _,
      _, _, _,
      o, o, o } -> o;
    { o, _, _,
      o, _, _,
      o, _, _ } -> o;
    { _, o, _,
      _, o, _,
      _, o, _ } -> o;
    { _, _, o,
      _, _, o,
      _, _, o } -> o;
    { o, _, _,
      _, o, _,
      _, _, o } -> o;
    { _, _, o,
      _, o, _,
      o, _, _ } -> o;
    { A, B, C,
      D, E, F,
      G, H, I } when A =/= undefined, B =/= undefined, C =/= undefined,
                     D =/= undefined, E =/= undefined, F =/= undefined,
                     G =/= undefined, H =/= undefined, I =/= undefined -> cat;
    _ -> no_winner
  end.
