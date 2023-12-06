:- dynamic visited/1.
:- dynamic unvisited/1.
:- dynamic current/1.
:- dynamic length/1.

solve_tsp(Start, Visited, TotalLength) :-
    retractall(visited(_)),
    retractall(unvisited(_)),
    retractall(current(_)),
    retractall(length(_)),

    assert(current(Start)),
    assert(length(0)),

    assert(visited(Start)),
    findall(X, edge(Start, X), Neighbors),
    assert(unvisited(Neighbors)),

    tsp(TotalLength).

tsp(TotalLength) :-
    \+ (current(X), unvisited(Neighbors), member(Y, Neighbors)),
    !,
    current(Last),
    edge(Last, X),
    assert(length(L + 1)),
    length(L),
    TotalLength is L + 1.

tsp(TotalLength) :-
    current(X),
    unvisited(Neighbors),
    select(Y, Neighbors, RemainingNeighbors),
    assert(current(Y)),
    assert(length(L + D)),
    length(L),
    edge(X, Y),
    assert(visited(Y)),
    retract(unvisited(Neighbors)),
    assert(unvisited(RemainingNeighbors)),

    tsp(TotalLength).

% Edge lengths (example data)
edge(1, 2). % A
edge(1, 3). % B
edge(1, 4). % C
edge(2, 3). % D
edge(2, 4). % E
edge(3, 4). % F


# Dont use this program for normal purpose 
# iif its emergency then u can use it; if its not then u can use other programs ;-)

# for run type "swipl -s salesman.pl", hit enter
# then after "1 ?-" this icon type "tsp_solution(Tour, TotalDistance)." hit enter