grammar PyGrammar;

program: (function NEWLINE)+;

function: 
	| assignment 
	| expression;

expression: 
	| expression 'or' expression
	| expression 'and' expression
	| 'not' expression
	| expression COMPARISON expression
	| expression ('*' | '/' | '%') expression
	| expression ('+' | '-') expression
	| '(' expression ')'
	| IDENT
	| VALUE;

assignment:
	| IDENT '=' expression
	| IDENT '+=' expression
	| IDENT '-=' expression
	| IDENT '*=' expression
	| IDENT '/=' expression;

COMPARISON: '<' | '<=' | '>' | '>=' | '==' | '!=';

IDENT: [a-zA-Z_] [a-zA-Z0-9_]*;

VALUE: (NUMBER | BOOLEAN | STRING) NEWLINE; 

NUMBER: '-'? [0-9]+ ('.' [0-9]+)?;

BOOLEAN: 'True' | 'False';

STRING: STRING_SINGLE | STRING_DOUBLE;

STRING_DOUBLE: '"' ~["]* '"' ;

STRING_SINGLE: '\'' ~[']* '\'';

NEWLINE: [\r\n]+;

WHITESPACE:
	[ ]+ -> skip; //Currently ignored, will need to fix for deliverable 2

//COMMENT: '#' ~NEWLINE; Currently ignored, will be fully implemented for deliverable 3