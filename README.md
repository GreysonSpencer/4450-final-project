# 4450-final-project
## The team
Tom Hagedorn
Ryan Orf
Greyson Spencer
Nathan Toepke

## About
Simple Parser using Antlr4 to parse Grammar in the python language.
### Phase 1
Phase 1 includes the implementation of arithmetic operators, assignment operators, and variable definitions. The arithmetic operators that can used to performed arithmetic operations on two expressions are: "+", "-", "*", "/", and "%". Precedence rules are taken into account, which means that operations included within parentheses are executed first. The assignment operators that can be used to assign some expression value to a variable are: "=", "+=", "-=", "*=", and "/=". The implementation of variable definition involves applying an aforementioned assingment operator on a variable (to be demonstrated below). The parser acknowledges the following types: number (integer or float, positive or negative), boolean, string (single- or double-quoted), and array. The cases below demonstrate examples of valid expressions:
```
Variable1 = 1
Variable2 = Variable1 + 2
Variable3 = Variable2 / Variable2
```
There are cases of invalid expressions that include
```
Variable1 = (variable2 = 3) + 1
Variable3 = 1 +*/ 3
```
### Phase 2
Implementation of If/Elif/Else statements and comparison statements
```
if Variable1 == True :
    Variable2 = True
elif Variable3 <= 7:
    Variable2 = False
else:
    Variable2 = 5
```
Conditional statements can be evaluated now too:
```
if Variable1 >= 5 and not Variable2 :
    Variable3 = 7
```
### Phase 3
Implementation of comments, for and while.
Example of a valid comment
```
# This is a comment example!
if True:
    x = 1
```
Example of a valid for and while loop
```
while True:
    x += 1

for i in variable:
    i++
```

Examples of invalid for and while Loops
```
for x + 1:
    x+=x

while:
    y = 7 + 2
```
### Phase 4
Support for function calls and function implementations
Example of a function definition:
```
def newFunc(x,y,z):
    z = x + y
    return z - 5
```
Example of a function call
```
Variable1 = newFunc(1,2,3)
```

## Running and Installation
TODO: Put full instructions here
