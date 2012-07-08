simple_cases_test_() ->
    [
        ?_assertEqual([], ts_lists:remove_duplicates([])),
        % Conceptually wrong testcase!!
        ?_assertEqual([1, 2, 3, 4, 5], ts_lists:remove_duplicates([5, 1, 2, 2, 3, 4, 4]))
    ].

lists_from_file_test_() ->
    {setup, fun() ->
            ok=filelib:ensure_dir(?VALID_TEST_FILE),
            ok=file:write_file(?VALID_TEST_FILE,"[1, 2, -2, -2, -1].[-2, 2, 2, 1]."),
            file:delete(?INVALID_TEST_FILE),
            {?VALID_TEST_FILE, ?INVALID_TEST_FILE}
        end,
        fun ({F, F2}) -> ok=file:delete(F) end,
        fun ({F, F2}) -> [
            ?_assertEqual({ok, [[1, 2, -2, -2, -1], [-2, 2, 2, 1]]}, ts_lists:load_lists_from_file(F)),
            ?_assertEqual({error, enoent}, ts_lists:load_lists_from_file(F2)),
            ?_test(begin
                {ok, [L1, L2]} = ts_lists:remove_duplicates_from_lists_file(F),
                ?assertEqual(4, length(L1)), ?assertEqual(3, length(L2))
        end)]
    end}.


