grammar PyGrammar;

program: (function NEWLINE)+;

// NOTE to Greyson for formatting (because Prettier messes it up): had these on their own lines 
function: | assignment | expression;

// NOTE to Greyson for formatting (because Prettier messes it up): move 'orExpression;' to its own line
expression: orExpression;

// NOTE to Greyson for formatting (because Prettier messes it up): move the expression passed 'orExpression:' to its own line
orExpression: andExpression ('or' andExpression)*;

andExpression:
	arithmeticExpression ('and' arithmeticExpression)*;

// NOTE to Greyson for formatting (because Prettier messes it up): had this expression on 1 line, not 3
arithmeticExpression:
	multiplicationExpression (
		('+' | '-') multiplicationExpression
	)*;

multiplicationExpression:
	precedenceExpression (('*' | '/' | '%') precedenceExpression)*;

precedenceExpression:
	// TODO: implement 'not' in a way that maintains the expression flow and includes the correct precedence
	| '(' expression ')'
	| IDENT
	| NUMBER;

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

//COMMENT: '#' ~NEWLINE; Currently ignored, will be fully implemented for deliverable 3