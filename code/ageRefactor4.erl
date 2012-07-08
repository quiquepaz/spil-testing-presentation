-spec get_age(#date{}) -> non_neg_integer().
get_age(#date{year=0, month=_, day=_}) ->
    0;
get_age(#date{year=Y, month=_, day=_}=Dob) ->
    {{NY, NM, ND}, _} = calendar:now_to_datetime(os:timestamp()),
    case is_birthday_gone(Dob, NM, ND) of
        true -> NY - Y;
        false -> NY - Y -1
    end.

-spec is_birthday_gone(#date{}, pos_integer(), pos_integer()) -> boolean().
is_birthday_gone(#date{month=M, day=D}, CurrentMonth, CurrentDay) ->
    (M*100+D) =< (CurrentMonth*100+CurrentDay).

