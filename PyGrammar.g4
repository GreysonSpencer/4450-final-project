grammar PyGrammar;

program: (expression NEWLINE)+;

expression:
	| NUMBER
	| IDENT
	| expression '+' expression
	| expression subtract expression
	| expression multiply expression
	| expression division expression
	| assignment;

sum: NUMBER '+' NUMBER;

subtract: NUMBER '-' NUMBER;

multiply: NUMBER '*' NUMBER;

division: NUMBER '/' NUMBER;

assignment: IDENT '=' function;

IDENT: [a-zA-Z0-9]+;

NUMBER: [0-9]+ ('.' [0-9]+)?;

NEWLINE: [\r\n]+;

WHITESPACE:
	[ \t]+ -> skip; //Currently ignored, will need to fix for deliverable 2
