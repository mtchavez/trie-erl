-module(app_test).
-compile(export_all).
-include_lib("eunit/include/eunit.hrl").

start_test() ->
    ok = application:start(trie),
    ?assertNot(undefined == whereis(trie_sup)),
    application:stop(trie).

stop_test() ->
    ok = application:start(trie),
    ?assertEqual(ok, application:stop(trie)).
