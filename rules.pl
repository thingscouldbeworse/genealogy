/* rules */
sibling(A,B):-
    child(A,P),
    child(B,P),
    A\=B.

parent(P,C):-child(C,P).

grandparent(G,C):-
    parent(X,C),
    parent(G,X).

greatgrandparent(GG,C):-
    parent(X,C),
    parent(X2,X),
    parent(GG,X2).

/* first cousins */
nthcousin(A,B,1):-
    parent(P1,A),
    parent(P2,B),
    sibling(P1,P2).

/* recursively define nth-cousins */
/*  */
nthcousin(A,B,N):-
    parent(P1,A),
    parent(P2,B),
    I is N-1,
    nthcousin(P1,P2,I).

nthcousinkremoved(A,B,N,0):-
    nthcousin(A,B,N).

nthcousinkremoved(X,Y,N,K):-
    parent(P_maybe, Y),
    I is K-1,
    nthcousinkremoved(X,P_maybe,N,I).

kthlevel_child(X,Y,0):-
    child(Y,X).

kth_levelchild(X,Y,K):-
    child(Z,X),
    I is K-1,
    kthchild(Z,Y,I).

/* list of children of P */
children(P,Cn):-
    findall(X,child(X,P),Cn). 

sortedchildren(P,ByAge):-
    children(P,Cn),
    map_list_to_pairs(age,Cn,Pairs),
    keysort(Pairs,SortedBackwards),
    reverse(SortedBackwards,Sorted),
    pairs_values(Sorted, ByAge).

older(X,Y):-
    age(X,A1),
    age(Y,A2),
    A1>A2.

firstchild(P,First):-
    children(P,[First|_]).

secondchild(P,Second):-
    children(P,[_,Second|_]).

kthchild(P,K,KthChild):-
    sortedchildren(P,ByAge),
    %N is K-1,
    nth0(N,ByAge,KthChild).
