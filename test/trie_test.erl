-module(trie_test).
-compile(export_all).
-include_lib("eunit/include/eunit.hrl").

init_test() ->
    Trie = trie:init(),
    ?assertEqual(Trie, dict:new()).

insert_test() ->
    T = trie:init(),
    T1 = trie:insert(<<"to">>, T),
    ?assertEqual([<<"t">>], dict:fetch_keys(T1)),

    T2 = trie:insert(<<"tea">>, T1),
    ?assertEqual([<<"t">>], dict:fetch_keys(T2)),
    ?assertEqual([<<"e">>, <<"o">>], dict:fetch_keys(dict:fetch(<<"t">>, T2))),

    T3 = trie:insert(<<"ten">>, T2),
    ?assertEqual([<<"t">>], dict:fetch_keys(T3)),
    ?assertEqual([<<"e">>, <<"o">>], dict:fetch_keys(dict:fetch(<<"t">>, T3))),
    ?assertEqual([<<"n">>], dict:fetch_keys(
        dict:fetch(
            <<"e">>, dict:fetch(
            <<"t">>, T3))
        )
    ).
