I consulted with Grant Sparks as to why my program did not  return all possible siblings. He showed me I was hitting  enter instead of space, ending the query instead of continuing. I also discussed some basic questions about completion times for recursive queries with him, mostly centered around the difference between a child(X, kirk) vs a child(kirk, X) call. We discussed other "high-level" topics of the assignment concerning run-times and general approaches.

My approach to sorting the kth-children list by age is more or less an adapted version of the example given in the swi-prolog documentation for the `keysort` function, found here: http://www.swi-prolog.org/pldoc/man?predicate=keysort/2

# Files
`family.pl` contains the genealogy database consisting of child(C,P) and age(P,X) definitions. `rules.pl` contains the prlog rules I used. `script.pl` is a sanity-check script used to verify predicates by listing relationships that should return True and queries that return all possible solutions.

# Sanity Check
`script.pl` can be consulted after `consult(family).` and `consult(rules).` to run a quick sanity check, returning true for answers being found. Individual commands from this file are run in script mode fo the results and sanity check per predicate, ie in the swipl interpreter type `consult(family).`, then `consult(rules).`, and write queries such as `nthcousin(kirk,X,2).` for finding all 2nd-cousins of 'kirk'.
    
# Learning Outcome

I learned how useful a language like Prolog could be to work with these sort of queries, although I do wonder if my solutions could be changed to be more in line with the "attitude" of Prolog. While the solutions to nth-cousins used recursion in such a way that feels in line with how I was "supposed" to solve things, the solution to kth-children feels like an adapted version of something I would write in Python. The list of children is retrieved, then sorted, then reversed, then the values are stripped from the keys. This use of state I feel could be removed in a rewrite, and I'd like to take what I learned from the assignment (in mindset as much as in syntax) and refactor that code at a later date.

Unrelated, I learned to definitively clarify the assignment goals early. I wasted time creating functions to retrieve the nth-descendants of a person because that's what I originally thought "kth-children" meant.

