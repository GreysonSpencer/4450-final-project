grammar PyGrammar;

sum: INT '+' INT;

subtract: INT '-' INT;

multiply: INT '*' INT;

division: INT '/' INT;

assignment: | IDENT NEWLINE | IDENT '=' INT;

IDENT: [a-z0-9]+;

INT: [0-9]+;

NEWLINE: [\n]+;