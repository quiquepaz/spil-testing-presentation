-spec test_fun(any(), fun(() -> ok), integer(), integer()) -> {float(), float()}.

test_fun(Name, TestFun, ParCount, SeqCount) ->
    RS = test_fun_x_times(Name, TestFun, SeqCount),
    RP = test_fun_x_times_parallel(Name, TestFun, ParCount, SeqCount),
    {RS, RP}.
