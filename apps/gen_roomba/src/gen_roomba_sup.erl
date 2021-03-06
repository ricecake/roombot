%%%-------------------------------------------------------------------
%% @doc gen_roomba top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module('gen_roomba_sup').

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    {ok, { {simple_one_for_one, 0, 1}, [
        {gen_roomba_srv, {gen_roomba_srv, start_link, []}, permanent, 5000, worker, [gen_roomba_srv]}
    ]} }.

%%====================================================================
%% Internal functions
%%====================================================================
