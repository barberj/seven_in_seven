-module(day_one).
-export([wc/1]).
-export([diez/1]).
-export([notify/1]).

% http://erlang.org
% http://www.erlang.org/doc/design_principles/users_guide.html
% http://erlang.org/doc/reference_manual/users_guide.html
% http://www.erlang.org/doc/apps/stdlib/index.html

% Problem 1
array_length([]) -> 0;
array_length(String) ->
  [_ | Tail] = String,
  1 + array_length(Tail).

wc(String) -> array_length(re:split(String, " ")).

% Problem 2
count_until(Val, Max) when Val == Max ->
  io:fwrite("~w~n", [Val]);
count_until(Val, Max) when Val < Max ->
  io:fwrite("~w~n", [Val]),
  count_until(Val + 1, Max);
count_until(Val, Max) when Val > Max ->
  io:fwrite("~w~n", [Val]),
  count_until(Val - 1, Max).

diez(N) -> count_until(N, 10).

% Problem 3
notify(success) -> io:fwrite("Success~n");
notify({error, Message}) -> io:fwrite("error: ~w~n", [Message]).
