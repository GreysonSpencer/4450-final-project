grammar PyGrammar;

program: (expression NEWLINE)+;

expression:
	| NUMBER
	| IDENT
	| expression '+' expression
	| expression '-' expression
	| expression '*' expression
	| expression '/' expression
	| assignment;

assignment: IDENT '=' expression;

IDENT: [a-zA-Z0-9]+;

NUMBER: [0-9]+ ('.' [0-9]+)?;

NEWLINE: [\r\n]+;

WHITESPACE:
	[ \t]+ -> skip; //Currently ignored, will need to fix for deliverable 2
