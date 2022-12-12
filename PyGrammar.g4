grammar PyGrammar;

program: block[0, false, false] EOF;

loc: assignment | expression;

// x = number of tabs for the current block
// is_func indicates if the block is within a function
// is_iterable indicates if the block is within a for or while loop
block
[int x, boolean is_func, boolean is_iterable]
locals [int i = 0]: 
	( 
	  {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}}} {$x==$i}?<fail={"exit"}> (t+=TAB)* 'def ' IDENT '(' (IDENT ',')* (IDENT | assignment)? (','assignment)* '):' NEWLINE block[$x+1, true, $is_iterable]

	| {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}}} {$x==$i}?<fail={"exit"}> (t+=TAB)* 'if' expression ':' NEWLINE block[$x+1, $is_func, $is_iterable]
	  ({$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}}} {$x==$i}?<fail={"exit"}> (t+=TAB)* 'elif' expression ':' NEWLINE block[$x+1, $is_func, $is_iterable])* 
	  ({$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}}} {$x==$i}?<fail={"exit"}> (t+=TAB)* 'else:' NEWLINE block[$x+1, $is_func, $is_iterable])? NEWLINE?

	| {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}}} {$x==$i}?<fail={"exit"}> (t+=TAB)* 'while' expression ':' NEWLINE block[$x+1, $is_func, true]
	| {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}}} {$x==$i}?<fail={"exit"}> (t+=TAB)* 'for' iterative_statement ':' NEWLINE block[$x+1, $is_func, true]

	| ({$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}}} {$x==$i}?<fail={"exit"}> (t+=TAB)* loc NEWLINE?)+

	| {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}}} {$x==$i && $is_func}?<fail={"exit"}> (t+=TAB)* 'return' expression? NEWLINE
	| {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}}} {$x==$i && $is_iterable}?<fail={"exit"}> (t+=TAB)* 'break' expression? NEWLINE
	| {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}}} {$x==$i && $is_iterable}?<fail={"exit"}> (t+=TAB)* 'continue' expression? NEWLINE
	)+
	;

iterative_statement:
	| IDENT 'in' IDENT
	| IDENT 'in range('(NUMBER | IDENT)')'
	| IDENT 'in' arraydef
;

expression:
	expression ('*' | '/' | '%') expression
	| expression ('+' | '-') expression
	| expression COMPARISON expression
	| ('not')+ expression
	| expression 'and' expression
	| expression 'or' expression
	| functioncall
	| '(' expression ')'
	| IDENT
	| BOOLEAN
	| STRING
	| ('-')? NUMBER;

functioncall:
	IDENT '(' (loc ',')* (loc)? ')';

assignment: 
	IDENT ASSIGNMENT arraydef
	| IDENT ASSIGNMENT expression 
	;

arraydef: '[' (IDENT | NUMBER) (',' (IDENT | NUMBER))* ']';

ASSIGNMENT: '=' | '+=' | '-=' | '*=' | '/=';

COMPARISON: '>' | '>=' | '<' | '<=' | '==' | 'is';

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