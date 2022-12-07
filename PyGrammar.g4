grammar PyGrammar;

program: block[0, false] EOF;

loc: assignment | expression;

// x = number of tabs for the current block
// is_func indicates if the block is within a function
block
[int x, boolean is_func]
locals [int i = 0]: 
	( 
	  {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}System.out.println($i);}} {$x==$i}? (t+=TAB)* 'def ' IDENT '(' (IDENT ',')* (IDENT | assignment)? (','assignment)* '):' NEWLINE block[$x+1, true]

	| {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}System.out.println($i);}} {$x==$i}? (t+=TAB)* 'if' expression ':' NEWLINE block[$x+1, $is_func]
	  ({$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}System.out.println($i);}} {$x==$i}? (t+=TAB)* 'elif' expression ':' NEWLINE block[$x+1, $is_func])* 
	  ({$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}System.out.println($i);}} {$x==$i}? (t+=TAB)* 'else:' NEWLINE block[$x+1, $is_func])? NEWLINE?

	| {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}System.out.println($i);}} {$x==$i}? (t+=TAB)* 'while' expression ':' NEWLINE block[$x+1, $is_func]
	| {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}System.out.println($i);}} {$x==$i}? (t+=TAB)* 'for' iterative_statement ':' NEWLINE block[$x+1, $is_func]
	| {$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}System.out.println($i);}} {$x==$i && $is_func}? (t+=TAB)* 'return' expression? NEWLINE
	| ({$i=0;if(_input.LT($i+1).getType() == TAB){while(_input.LT($i+1).getType() == TAB){$i++;}System.out.println($i);}} {$x==$i}? (t+=TAB)* loc NEWLINE)+
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