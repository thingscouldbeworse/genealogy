parent(peter,kirk).
parent(peter,X).

child(kirk,peter).
child(peter,X).

sibling(peter,jim).
sibling(peter,X).

/* N is a number between 1 (first cousin) and 2 (highest cousin order in DB)  */
/* list 1st cousins of 'kirk' */
nthcousin(kirk,X,1).
/* list second cousins of kirk */
nthcousin(kirk,X,2).

/* list pairs of first cousins once removed */
nthcousinkremoved(X,Y,1,1).
/* list pairs of second cousins */
nthcousinkremoved(X,Y,2,0).
/* list pairs of second cousins once removed */
nthcousinkremoved(X,Y,2,1).

/* list children ordered by K for parent 'peter' */
kthchild(C,peter,K).
/* running without P specified will output all people in family tree ordered by age */
kthchild(C,P,K).
/* list 2nd child of parent 'peter2' */
/* array starts at 0, so first child k=0, second child k=1, etc */
kthchild(C,peter2,1).

