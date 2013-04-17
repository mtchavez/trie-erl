-module (trie).
-export ([init/0, insert/2, find/2]).

init() ->
    dict:new().

insert(Val, Dict) ->
    Size = erlang:size(Val),
    List = binary:bin_to_list(Val),
    [Key|Tail] = List,
    BinVal = binary:list_to_bin([Key]),
    if
        (Size == 1) ->
            dict:from_list([{BinVal, dict:new()}]);
        true ->
            TailVal = binary:list_to_bin(Tail),
            case dict:is_key(BinVal, Dict) of
                true ->
                    Existing = dict:fetch(BinVal, Dict),
                    dict:store(BinVal, insert(TailVal, Existing), Dict);
                false ->
                    dict:store(BinVal, insert(TailVal, dict:new()), Dict)
            end
    end.

find(Val, Dict) ->
    Matching = find(Val, Dict, []),
    MatchList = binary:list_to_bin(Matching),
    if
        (MatchList == Val) ->
            {ok, Val};
        true ->
            {notfound, Val}
    end.

find(Val, Dict, Matching) ->
    Size = erlang:size(Val),
    List = binary:bin_to_list(Val),
    if
        (Size == 0) ->
            Matching;
        true ->
            [Key|Tail] = List,
            BinVal = binary:list_to_bin([Key]),
            TailVal = binary:list_to_bin(Tail),
            case dict:is_key(BinVal, Dict) of
                true ->
                    Existing = dict:fetch(BinVal, Dict),
                    find(TailVal, Existing, lists:append(Matching, [Key]));
                false ->
                    []
            end
    end.
