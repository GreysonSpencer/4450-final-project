grammar PyGrammar;

//program: (function NEWLINE)*;
program: block[0];

function: /*control_statement |*/ assignment | expression;

//control_statement: while_loop | for_loop | if_statement;

//while_loop: (t+=TAB)* 'while' expression ':' NEWLINE block[t];

//for_loop: (t+=TAB)* 'for' expression ':' NEWLINE block[t];

//if_statement: if_block (NEWLINE elif_block)* (NEWLINE else_block)?;

//block: TAB function (NEWLINE TAB function)* NEWLINE?;

// block:
// // Recursive block definition
// 	//| (TAB block)+ NEWLINE
// // Adding as many lines in the block as you need
// 	| (TAB function NEWLINE)* TAB function
//	;

// x = number of tabs for the current block
// block
// [int x]: 
// 	| (t+=TAB)+ {$x==t}? function NEWLINE
// 	| {$x+1==t} block[{$x+1}] NEWLINE;

block
[int x]: 
	|
	( (t+=TAB)* {$x==$t.size()}? 'if' expression ':' NEWLINE block[$t.size()+1] ({$x==$t.size()}? 'elif' expression ':' NEWLINE block[$t.size()+1])* {$x==$t.size()}? ('else:' NEWLINE block[$t.size()+1])?
	| (t+=TAB)* {$x==$t.size()}? 'while' expression ':' NEWLINE block[$t.size()+1] {$t.clear();}
	| (t+=TAB)* {$x==$t.size()}? 'for' expression ':' NEWLINE block[$t.size()+1] {$t.clear();}
	| ((t+=TAB)* {$x==$t.size()}? function NEWLINE {$t.clear();})+
	)*
	;

//data: ( c+=CHARACTER)+ {$c.size()<=4}? ;

//if_block: (t+=TAB)* ('if') expression (':') NEWLINE block[t];

//elif_block: (t+=TAB)* ('elif') expression (':') NEWLINE block[t];

//else_block: (t+=TAB)* ('else:') NEWLINE block[t];

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

TAB: '    ' | '\t';

WHITESPACE: [ ]+ -> skip;

COMMENT: '#' ~[\r\n]* NEWLINE -> skip;