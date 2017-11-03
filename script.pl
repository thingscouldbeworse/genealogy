:- parent(peter,kirk),
parent(peter,A),

child(kirk,peter),
child(peter,B),

sibling(peter,jim),
sibling(peter,C),

/* N is a number between 1 (first cousin) and 2 (highest cousin order in DB)  */
/* list 1st cousins of 'kirk' */
nthcousin(kirk,X1,1),
/* list second cousins of 'kirk' */
nthcousin(kirk,X2,2),

/* list pairs of first cousins once removed */
nthcousinkremoved(X3,Y3,1,1),
/* list pairs of second cousins */
nthcousinkremoved(X4,Y4,2,0),
/* list pairs of second cousins once removed */
nthcousinkremoved(X5,Y5,2,1),

/* list children ordered by K for parent 'peter' */
kthchild(C1,peter,K1),
/* running without P specified will output all people in family tree ordered by age */
kthchild(C2,P2,K2),
/* list 2nd child of parent 'peter2' */
/* array starts at 0, so first child k=0, second child k=1, etc */
kthchild(C3,peter2,1).

