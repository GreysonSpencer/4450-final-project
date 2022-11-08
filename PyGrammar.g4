grammar PyGrammar;

sum : INT '+' INT;

assignment:
    | NAME NEWLINE
    | NAME '=' INT
    ;

NAME : [a-z0-9]+;

INT : [0-9]+;

NEWLINE : [\n]+;