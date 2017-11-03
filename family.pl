/* I consulted with Grant as to why my program did not */
/* return all possible siblings. He showed me I was hitting */
/* enter instead of space, ending the query instead of continuing */

/* my nuclear family */
age(kirk, 22).
age(andrew, 19).
age(peter, 60).
child(kirk, peter).
child(andrew, peter).

/* peter's nuclear family */
age(margaret, 100).
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
age(david, 23).
age(sarah, 25).
child(david, jane).
child(sarah, jane).

/* liz's family */
age(peter2, 40).
age(johanna, 42).
age(michael, 43).
child(johanna, liz).
child(peter2, liz).
child(michael, liz).

/* johanna family */
age(wesley, 13).
age(callie, 10).
child(wesley, johanna).
child(cally, johanna).

/* peter2 family */
age(susan, 12).
age(josie, 11).
age(kelsey, 9).
child(susan, peter2).
child(josie, peter2).
child(kelsey, peter2).

/* mary family */
age(david2, 39).
child(david2, mary).

/* great-grandchilds */
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


