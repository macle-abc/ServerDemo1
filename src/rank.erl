-module(rank).
-author("macle").
-export([top100_by_level/1, test/0]).

top100_by_level(PlayersLevelInfo) when is_list(PlayersLevelInfo) ->
    try
        lists:sublist(lists:sort(fun({_, ALevel}, {_, BLevel}) -> ALevel > BLevel end, PlayersLevelInfo), 1, 100)
    catch
        error:function_clause -> false
    end;
top100_by_level(_) -> false.

test() ->
    List = [{"apple", 75}, {"orange", 80}],
    false = top100_by_level(123),
    false = top100_by_level([1, 2, 3]),
    [{"orange", 80}, {"apple", 75}] = top100_by_level(List),
    ok.