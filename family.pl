/* I consulted with Grant as to why my program did not */
/* return all possible siblings. He showed me I was hitting */
/* enter instead of space, ending the query instead of continuing */

/* my nuclear family */
age(kirk, 22).
age(andrew, 19).
age(peter, 60).
age(gail, 55).
child(kirk, peter).
child(andrew, peter).

/* peter's nuclear family */
age(margaret, 100).
age(john, 105).
age(jim, 75).
age(jane, 63).
age(mary, 67).
age(liz, 71).
child(peter, margaret).
child(jim, margaret).
child(jane, margaret).
child(mary, margaret).
child(liz, margaret).

/* jane's family */
age(keith, 63).
age(david, 23).
age(sarah, 25).
child(david, jane).
child(sarah, jane).

/* liz's family */
age(doug, 71).
age(peter2, 40).
age(johanna, 42).
age(michael, 43).
child(johanna, liz).
child(peter2, liz).
child(michael, liz).

/* johanna family */
age(mike, 41).
age(wesley, 13).
age(cally, 10).
child(wesley, johanna).
child(cally, johanna).

/* great-grandchilds */
age(frank, 130).
age(agnes, 129).
age(imaginary_grandaunt, 101).
child(margaret, frank).
child(imaginary_grandaunt, frank).

/* made up line */
age(imaginary_secondaunt, 69).
age(imaginary_secondcousin, 39).
age(imaginary_secondcousinonce, 15).
child(imaginary_secondaunt, imaginary_grandaunt).
child(imaginary_secondcousin, imaginary_secondaunt).
child(imaginary_secondcousinonce, imaginary_secondcousin).


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
firstcousin(A,B):-
    parent(P1,A),
    parent(P2,B),
    sibling(P1,P2).
firstcousinonceremoved(A,B):-
    child(A,C1),
    firstcousin(C1,B).


