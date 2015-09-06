-module(coroner).
-export([loop/0]).

loop() ->
  % When trap_exit is set to true, exit signals arriving to a process are converted to {'EXIT', From, Reason} messages,
  % which can be received as ordinary messages. If trap_exit is set to false, the process exits if it receives
  % an exit signal other than normal and the exit signal is propagated to its linked processes.
  % Application processes should normally not trap exits.
  process_flag(trap_exit, true),
  receive
    {monitor, Process} ->
      link(Process),
      io:format("Monitoring process.~n"),
      loop();
    {'EXIT', From, Reason} ->
      io:format("The shooter ~p died with reason ~p.", [From, Reason]),
      io:format("Start another one.~n"),
      loop()
  end.
