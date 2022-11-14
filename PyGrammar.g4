grammar PyGrammar;

program: (function NEWLINE)+;

function: 
    | assignment 
    | expression;

expression:
	//arithmeticExpression (assignment arithmeticExpression)*; arithmeticExpression:
	multiplicationExpression (
		('+' | '-') multiplicationExpression
	)*;

multiplicationExpression:
	precedenceExpression (('*' | '/' | '%') precedenceExpression)*;

precedenceExpression: '(' expression ')' | IDENT | NUMBER;

assignment:
	| IDENT '=' expression
	| IDENT '+=' expression
	| IDENT '-=' expression
	| IDENT '*=' expression
	| IDENT '/=' expression;

IDENT: [a-zA-Z_] [a-zA-Z0-9_]*;

NUMBER: '-'? [0-9]+ ('.' [0-9]+)?;

NEWLINE: [\r\n]+;

WHITESPACE:
	[ \t]+ -> skip; //Currently ignored, will need to fix for deliverable 2
