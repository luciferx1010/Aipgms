depthfirst( Path, Node, [Node | Path] ) :-
 goal( Node).
depthfirst( Path, Node, Sol) :-
 s( Node, Node1),
 \+ member( Node1, Path), % Prevent a cycle
 depthfirst( [Node | Path], Node1, Sol).
depthfirst2( Node, [Node], _) :-
 goal( Node).
depthfirst2( Node, [Node | Sol], Maxdepth) :-
 Maxdepth > 0,
 s( Node, Node1),
 Max1 is Maxdepth - 1,
 depthfirst2( Node1, Sol, Max1).
goal(f).
goal(j).
s(a,b).
s(a,c).
s(b,d).
s(b,e).
s(c,f).
s(c,g).
s(d,h).
s(e,i).
s(e,j).


for run type "swipl -s depthfirst.pl", hit enter
then after "1 ?-" this icon type "goal(f)." hit enter