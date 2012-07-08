prop_remove_duplicates_keeps_all_elements() ->
    numtests(1000, ?FORALL(L, ne_list(integer()),
        begin
            Processed=ts_lists:remove_duplicates(L),
            ?WHENFAIL(
                io:format("L=~p, Processed=~p~n", [L, Processed]),
                lists:all(fun (N) -> lists:member(N, Processed) end, L)
            )
        end
    )).

prop_remove_duplicates_contains_no_duplicates() ->
    numtests(1000, ?FORALL(Original, ne_list(integer()),
        begin
            L=ts_lists:remove_duplicates(Original),
            Seq=lists:seq(1, length(L)),
            ?WHENFAIL(io:format("Original=~p, Processed=~p~n", [Original, L]),
                lists:all(fun (N) ->
                        Elem=lists:nth(N, L),
                        {_Before, [Elem|After]} = lists:splitwith(fun (X) -> X/=Elem end, L),
                        not lists:member(Elem, After)
                    end, Seq)
            )
        end
    )).

