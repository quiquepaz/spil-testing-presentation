test_fun_x_times(Name, Fun, SeqCount) ->
    Tick = now(),
    lists:foreach(fun(_) ->
            Fun()
        end, lists:seq(1, SeqCount)),
    Tock = now(),
    AvgTime = timer:now_diff(Tock, Tick)/1000,
    Speed = SeqCount*1000/AvgTime,
    io:format("~40p req/sec ~.1f ~n", [Name, Speed]),
    Speed.
