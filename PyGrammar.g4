grammar PyGrammar;

program: (function NEWLINE)*; //changed from + to * since python should be able to parse an empty file ig.

function: ifstatement | assignment | expression;

ifstatement:
  if_block (elif_block)* (else_block)?;

block:
	(TAB+ function NEWLINE?)+
	;

if_block:
  ('if') expression (':') NEWLINE block+ //Not sure on the function on the end. Maybe "codeblock" or something? needs further tests.
;

elif_block:
  ('else if') expression (':') NEWLINE block
;

else_block:
  ('else:') NEWLINE ('\t') function
;
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
	[ ]+ -> skip; //Currently ignored, will need to fix for deliverable 2

//COMMENT: '#' ~NEWLINE; Currently ignored, will be fully implemented for deliverable 3