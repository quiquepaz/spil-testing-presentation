get_age_test_() ->
    [
        ?_assertEqual(47, su_user:get_age(#date{year=1965, month=2, day=1}))
    ].
is_birthday_gone_test_() ->
    Dob=#date{year=1972, month=4, day=21},
    [
        ?_assertEqual(false, su_user:is_birthday_gone(Dob, 4, 20))
        ?_assertEqual(true, su_user:is_birthday_gone(Dob, 4, 22)),
        ?_assertEqual(true, su_user:is_birthday_gone(Dob, 4, 21)),
    ].

