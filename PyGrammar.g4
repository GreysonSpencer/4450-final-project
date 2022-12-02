grammar PyGrammar;

program: block[0] EOF;

function: assignment | expression;

// x = number of tabs for the current block
block
[int x]: 
	( (t+=TAB)* {$x==$t.size()}? 'if' expression ':' NEWLINE block[$x+1] {$t.clear();}
	  ((a+=TAB)* {$x==$a.size()}? 'elif' expression ':' NEWLINE block[$x+1] {$a.clear();})* 
	  ((b+=TAB)* {$x==$b.size()}? 'else:' NEWLINE block[$x+1] {$b.clear();})? NEWLINE?

	| (t+=TAB)* {$x==$t.size()}? 'while' expression ':' NEWLINE block[$t.size()+1] {$t.clear();}
	| (t+=TAB)* {$x==$t.size()}? 'for' expression ':' NEWLINE block[$t.size()+1] {$t.clear();}
	| ((t+=TAB)* {$x==$t.size()}? function NEWLINE {$t.clear();})+
	)+
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

COMPARISON: '>' | '>=' | '<' | '<=' | '==' | 'is' | 'in';

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