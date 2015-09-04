-module(day_one).
-export([wc/1]).
-export([diez/1]).

array_length([]) -> 0;
array_length(String) ->
  [_ | Tail] = String,
  1 + array_length(Tail).

wc(String) -> array_length(re:split(String, " ")).

count_until(Val, Max) when Val == Max ->
  io:fwrite("~w~n", [Val]);
count_until(Val, Max) when Val < Max ->
  io:fwrite("~w~n", [Val]),
  count_until(Val + 1, Max);
count_until(Val, Max) when Val > Max ->
  io:fwrite("~w~n", [Val]),
  count_until(Val - 1, Max).

diez(N) -> count_until(N, 10).
