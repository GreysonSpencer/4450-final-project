grammar PyGrammar;

program: (function NEWLINE)*;


function: ifstatement | assignment | expression;

ifstatement:
  if_block (elif_block)* (else_block)?;

block:
	TAB function (NEWLINE TAB function)* NEWLINE?;

if_block:
  ('if') expression (':') NEWLINE block;

elif_block:
  ('elif') expression (':') NEWLINE block;

else_block:
  ('else:') NEWLINE block;

expression:
	expression ('*' | '/' | '%') expression
	| expression ('+' | '-') expression
	| expression COMPARISON expression
	| ('not')+ expression
	| expression 'and' expression
	| expression 'or' expression
	| '(' expression ')'
	| IDENT
	| BOOLEAN
	| STRING
	| ('-')? NUMBER;

assignment: IDENT ASSIGNMENT expression;

ASSIGNMENT: '=' | '+=' | '-=' | '*=' | '/=';

COMPARISON: '>' | '>=' | '<' | '<=' | '==';

IDENT: [a-zA-Z_] [a-zA-Z0-9_]*;

NUMBER: [0-9]+ ('.' [0-9]+)?;

BOOLEAN: 'True' | 'False';

STRING: STRING_SINGLE | STRING_DOUBLE;

STRING_DOUBLE: '"' ~["]* '"';

STRING_SINGLE: '\'' ~[']* '\'';

NEWLINE: [\r\n]+;

TAB: '\t';

WHITESPACE:
	[ ]+ -> skip; 

//COMMENT: '#' ~NEWLINE; Currently ignored, will be fully implemented for deliverable 3