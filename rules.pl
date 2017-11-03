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

/* first cousins, the base case */
nthcousin(A,B,1):-
    parent(P1,A),
    parent(P2,B),
    sibling(P1,P2).

/* recursively define nth-cousins */
nthcousin(A,B,N):-
    parent(P1,A),
    parent(P2,B),
    I is N-1,
    nthcousin(P1,P2,I).

/* nth/k-removed base case */
nthcousinkremoved(A,B,N,0):-
    nthcousin(A,B,N).

/* recursive definition */
nthcousinkremoved(X,Y,N,K):-
    parent(P_maybe, Y),
    I is K-1,
    nthcousinkremoved(X,P_maybe,N,I).

/* get descendants of a parent at a specific level */
/* base case */
kthlevel_child(X,Y,0):-
    child(Y,X).

/* recursive definition */
kthlevel_child(X,Y,K):-
    child(Z,X),
    I is K-1,
    kthchild(Z,Y,I).

/* list of children of P */
children(P,Cn):-
    findall(X,child(X,P),Cn). 

/* children of P but sorted by age() */
sortedchildren(P,ByAge):-
    children(P,Cn),
    map_list_to_pairs(age,Cn,Pairs),
    keysort(Pairs,SortedBackwards),
    reverse(SortedBackwards,Sorted),
    pairs_values(Sorted, ByAge).

/* kth-child of P, pass K starting at 0 */
/* so k=0 for first child, k=1 for second, etc */
kthchild(KthChild,P,K):-
    sortedchildren(P,ByAge),
    nth0(K,ByAge,KthChild).

