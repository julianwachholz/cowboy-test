-module(chunked_handler).
-behaviour(cowboy_http_handler).

-export([init/3, handle/2, terminate/3]).


init(_Type, Req, []) ->
    {ok, Req, undefined}.


handle(Req, State) ->
    {ok, Req2} = cowboy_req:chunked_reply(200, Req),
    ok = cowboy_req:chunk("Hello\r\n", Req2),
    ok = timer:sleep(1000),
    ok = cowboy_req:chunk("World\r\n", Req2),
    ok = timer:sleep(1000),
    ok = cowboy_req:chunk("Chunked\r\n", Req2),
    {ok, Req2, State}.


terminate(_Reason, _Req, _State) ->
    ok.
