grammar PyGrammar;

program: (expression NEWLINE)+;

expression:
	| variable
	| assignment
	;

function:
	| variable
	| variable ('+' | '-') function
	| variable ('*' | '/') function
	;

variable:
	| INT
	| IDENT
	| DOUBLE
	;

assignment: IDENT '=' function;

IDENT: [a-zA-Z0-9]+;

INT: [0-9]+;

DOUBLE: [0-9]+ ('.' [0-9]+)?;

NEWLINE: [\r\n]+;

WHITESPACE:
	[ \t]+ -> skip; //Currently ignored, will need to fix for deliverable 2
