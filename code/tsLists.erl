-spec remove_duplicates([integer()]) -> [integer()].

remove_duplicates([]) ->
    [];
remove_duplicates(L) when is_list(L) ->
    lists:usort(L).

remove_duplicates_from_lists_file(File) ->
    case load_lists_from_file(File) of
        {error, Reason} ->
            {error, Reason};
        {ok, Lists} ->
            {ok, [remove_duplicates(L) || L <- Lists]}
    end.

%% Internal functions

load_lists_from_file(File) ->
    case file:consult(File) of
        {error, Reason} ->
            {error, Reason};
        {ok, Terms} ->
            {ok, [L || L <- Terms, is_list(L)]}
    end.
