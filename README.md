trie-erl
========

[![Build Status](https://travis-ci.org/mtchavez/trie-rb.png?branch=master)](https://travis-ci.org/mtchavez/trie-rb)

Fredkin trie algorithm in Erlang

## Initializing

Initialize a new tree/dictionary for the Trie.

```erlang
C("src/trie").
T = trie:init().
% {dict,0,16,16,8,80,48,
%      {[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]},
%      {{[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]}}}
```

## Inserting

Insert some values using binary lists ie. ```<<"word">>```

```erlang
c("src/trie").
T1 = trie:init().
T2 = trie:insert(<<"to">>, T1).
T3 = trie:insert(<<"tea">>, T2).

dict:fetch_keys(T3).
% [<<"t">>]

dict:fetch_keys( dict:fetch(<<"t">>, T3) ).
% [<<"e">>,<<"o">>]
```

## Tests

Run using ```make test``` or ```rebar eunit```

## License

Written by Chavez

Released under the MIT License: http://www.opensource.org/licenses/mit-license.php
