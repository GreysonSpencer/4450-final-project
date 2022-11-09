grammar PyGrammar;

program: (expression NEWLINE)+;

expression:
	| INT
	| IDENT
	| expression sum expression
	| expression subtract expression
	| expression multiply expression
	| expression division expression
    | assignment
    ;

sum: INT '+' INT;

subtract: INT '-' INT;

multiply: INT '*' INT;

division: INT '/' INT;

assignment: IDENT '=' expression;

IDENT: [a-zA-Z0-9]+;

INT: [0-9]+;

DOUBLE: [0-9]+ ('.' [0-9]+)?;

NEWLINE: [\r\n]+;

WHITESPACE:
	[ \t]+ -> skip; //Currently ignored, will need to fix for deliverable 2
