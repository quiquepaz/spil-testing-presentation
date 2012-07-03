-module(sample).

-compile(export_all).

-spec sample(boolean()) -> ok | {error, false}.
% Returns an error when the given argument is false
sample(true) ->
    ok;
sample(false) ->
    {error, false}.
