test_fun_x_times_parallel(Name, Fun, ParCount, SeqCount) ->
    Tick = now(),
    pmap(fun(_) ->
            lists:foreach(fun(_) ->
                    Fun()
                end, lists:seq(1, SeqCount))
        end, lists:seq(1, ParCount), 250000), %timeout
    Tock = now(),
    AvgTime = timer:now_diff(Tock, Tick)/1000,
    Speed = ParCount*SeqCount*1000/AvgTime,
    io:format("~40p req/sec ~10.1f ~n", [Name, Speed]),
    Speed.

