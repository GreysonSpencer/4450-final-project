grammar PyGrammar;

program: (function NEWLINE)+;

function:
    | assignment
    | expression;

expression:
	| NUMBER
	| IDENT
    | '(' expression ')'
	| expression '+' expression
	| expression '-' expression
	| expression '*' expression
	| expression '/' expression
    | expression '%' expression;

assignment: 
    | IDENT '=' expression
    | IDENT '+=' expression
    | IDENT '-=' expression
    | IDENT '*=' expression
    | IDENT '/=' expression;

IDENT: [a-zA-Z0-9]+;

NUMBER: [0-9]+ ('.' [0-9]+)?;

NEWLINE: [\r\n]+;

WHITESPACE:
	[ \t]+ -> skip; //Currently ignored, will need to fix for deliverable 2
