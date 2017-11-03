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

kthchild(C,P,0):-
    child(C,P).

kthchild(C,P,K):-
    child(C,P),
    I is K-1,
    kthchild(Y,C,I).

