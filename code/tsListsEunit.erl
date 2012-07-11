simple_cases_test_() ->
    [ ?_assertEqual([], ts_lists:remove_duplicates([])),
        % Bad testcase (dependent / forcing on the implementation!!)
        ?_assertEqual([1, 2, 3, 4, 5], ts_lists:remove_duplicates([1, 2, 2, 3, 4, 4, 5])) ].
load_lists_from_file_test_() ->
    {setup,
        % SETUP creates a valid file with 2 lists and ensures InvalidFile does not exist
        fun() -> setup_files() end,
        fun ({ValidFile, _InvalidFile}) -> ok=file:delete(ValidFile) end,
        fun ({ValidFile, InvalidFile}) ->
            [ ?_assertEqual({ok, [[1, 2, -2, -2, -1], [-2, 2, 2, 1]]}, ts_lists:load_lists_from_file(ValidFile)),
              ?_assertEqual({error, enoent}, ts_lists:load_lists_from_file(InvalidFile)) ]
        end
    }.
remove_duplicates_from_lists_file_test_() ->
    {setup,
        fun() -> setup_files() end,
        fun ({ValidFile, _InvalidFile}) -> ok=file:delete(ValidFile) end,
        fun ({ValidFile, InvalidFile}) ->
            [ ?_assertEqual({error, enoent}, ts_lists:remove_duplicates_from_lists_file(InvalidFile)),
              ?_assertMatch({ok, [L1, L2]} when is_list(L1) and is_list(L2) , ts_lists:remove_duplicates_from_lists_file(ValidFile)) ]
        end}.

