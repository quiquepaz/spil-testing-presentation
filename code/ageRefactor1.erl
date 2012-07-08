get_age_test_() ->
    [
        ?_assertEqual(47, su_user:get_age(#date{year=1965, month=2, day=1})),
        ?_assertEqual(27, su_user:get_age(#date{year=1984, month=6, day=27}))
    ].

