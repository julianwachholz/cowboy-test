-module(hello_handler).
-behaviour(cowboy_http_handler).

-export([init/3, handle/2, terminate/3]).


init(_Type, Req, []) ->
    {ok, Req, undefined}.


handle(Req, State) ->
    {ok, Req2} = cowboy_req:reply(200, [
        {<<"content-type">>, <<"text/plain">>}
    ], <<"Hello world from Cowboy!">>, Req),
    {ok, Req2, State}.


terminate(_Reason, _Req, _State) ->
    ok.
