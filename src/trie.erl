-module (trie).
-export ([init/0, insert/2]).

init() ->
    {root, dict:new()}.

insert(Val, {Node, T}=Tree) ->
    {Size, N} = case Node == root of
        true ->
            erlang:display("ROOT"),
            {erlang:size(Val), Val};
        false ->
            {erlang:size(Node), Node}
        end,

    List = binary:bin_to_list(N),
    if
        (Size == 1) ->
            Tree;
        true ->
            [Key|Tail] = List,
            BinVal = binary:list_to_bin([Key]),
            TailVal = binary:list_to_bin(Tail),
            case dict:is_key(Key, T) of
                true ->
                    {BinVal, insert(Val, {TailVal, T})};
                false ->
                    {BinVal, insert(Val, {TailVal, dict:new()})}
            end
    end.
