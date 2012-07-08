-spec get_age(#date{}) -> non_neg_integer().

get_age(#date{year=0, month=0, day=0}) ->
    0;
get_age(#date{year=Y, month=M, day=D}) ->
    BirthGregorianDays=calendar:date_to_gregorian_days({Y, M, D}),
    {NowDate, _} = calendar:now_to_datetime(os:timestamp()),
    CurrentGregorianDays=calendar:date_to_gregorian_days(NowDate),
    (CurrentGregorianDays-BirthGregorianDays) div 365.

