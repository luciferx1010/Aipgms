edge(a, b, 2).
edge(a, c, 1).
edge(b, d, 5).
edge(c, d, 3).
edge(c, e, 6).
edge(d, e, 4).
best_first_search(Start, Goal, Path) :-
 best_first_search_util([[Start]], Goal, RevPath),
 reverse(RevPath, Path).
best_first_search_util([[Goal|Path]|_], Goal, [Goal|Path]).
best_first_search_util([Path|Paths], Goal, FinalPath) :-
 extend(Path, NewPaths),
 append(Paths, NewPaths, UpdatedPaths),
 sort_paths(UpdatedPaths, SortedPaths),
 best_first_search_util(SortedPaths, Goal, FinalPath).
extend([Node|Path], NewPaths) :-
 findall([NewNode, Node|Path],
 (edge(Node, NewNode, _), \+ member(NewNode, Path)),
 NewPaths).
sort_paths(Paths, SortedPaths) :-
 predsort(comparePaths, Paths, SortedPaths).
comparePaths(Result, Path1, Path2) :-
 heuristic(Path1, H1),
 heuristic(Path2, H2),
 compare(Result, H1, H2).
heuristic([Goal|_], 0). 




# for run type "swipl -s bestfirst.pl", hit enter
# then after "1 ?-" this icon type "best_first_search(a, e, path)." hit enter