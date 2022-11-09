grammar PyGrammar;

program: (expression NEWLINE)+;

expression:
	| variable
	| assignment
	;

function:
	| variable
	| sum 
	| subtract function
	| multiply function
	| division function
	;

variable:
	| INT
	| IDENT
	;

sum: variable '+' variable;

subtract: variable '-' variable;

multiply: variable '*' variable;

division: variable '/' variable;

assignment: IDENT '=' function;

IDENT: [a-zA-Z0-9]+;

INT: [0-9]+;

DOUBLE: [0-9]+ ('.' [0-9]+)?;

NEWLINE: [\r\n]+;

WHITESPACE:
	[ \t]+ -> skip; //Currently ignored, will need to fix for deliverable 2
