-module(matching_function).
-export([number/1]).

% 1> matching_function:number(one).
% 1
% 2> matching_function:number(five).
% ** exception error: no function clause matching matching_function:number(five) (matching_function.erl, line 4)

number(one) -> 1;
number(two) -> 2;
number(three) -> 3.
