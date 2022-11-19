grammar PyGrammar;

program: (line)*; //changed from + to * since python should be able to parse an empty file ig.

function: ifstatement | assignment | expression;

ifstatement:
  if_block (elif_block)* (else_block)?;

// block:
// 	| TAB+ function (NEWLINE TAB+ function)* 
// 	| (NEWLINE TAB+ block)*
// 	;   // TAB FUNCTION TAB FUNCTION?

line: function NEWLINE?;

block:
	| (TAB TAB TAB line)*
	| (TAB TAB line)*
	| (TAB line)*
	;

// block2:
// 	| TAB function (NEWLINE TAB TAB function)*
// 	| (NEWLINE TAB TAB block)*
// 	;

/*
Idea: two things that will be created in parallel

tabs
blocks

each line gets a tab for each block it's nested under

block
tab
tab
tabblock
tabtab
tabtab

 */


if_block:
  ('if') expression (':') NEWLINE block //Not sure on the function on the end. Maybe "codeblock" or something? needs further tests.
;

elif_block:
  ('else if') expression (':') NEWLINE block
;

else_block:
  ('else:') NEWLINE ('\t') block
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