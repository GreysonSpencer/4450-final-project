# 4450-final-project
## The team
Tom Hagedorn
Ryan Orf
Greyson Spencer
Nathan Toepke

## About
Simple Parser using Antlr4 to parse Grammar in the python language.
### Phase 1
Phase 1 includes the implementation of arithmetic operators, assignment operators, and variable definitions. The arithmetic operators that can used to performed arithmetic operations on two expressions are: "+", "-", " * ", "/", and "%". Precedence rules are taken into account, which means that operations included within parentheses are executed first. The assignment operators that can be used to assign some expression value to a variable are: "=", "+=", "-=", " * = ", and "/=". The implementation of variable definition involves applying an aforementioned assingment operator on a variable (to be demonstrated below). The parser acknowledges the following types: number (integer or float, positive or negative), boolean, string (single- or double-quoted), and array. The cases below demonstrate examples of valid expressions:
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
Phase 2 includes the implementation of if/elif/else blocks and conditional statements. An if statement can be followed in direct succession by any number of if statements, any number of elif statements, or a singular else statement. If statements can also be nested inside another if/elif/else statement. The conditional operators that can be used to compare two expressions are: "<", "<=", ">", ">=", "==", "is", and "!=". The cases below demonstrate examples of valid expressions:
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
Phase 3 includes the implementation of comments, while loops, and for loops. A comment is simply a "#" symbol followed by the rest of the characters on that line. Comments can have their own line or can start following code on a line. A while loop is defined as the "while" keyword followed by some expression to be evaluated, a colon (":"), and any number of lines of expressions indented once more so than the line containing the while expression. Similarly, a for loop is defined as the "for" keyword followed by some expression to be evaluated, a colon (":"), and any number of lines of expressions indented once more so than the line containing the for expression. Unlike the while expression, an expression used in a for expression contains the "in" keyword (see a valid example below). While and for loops can be nested. 
Example of a valid comment:
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
    x += i
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
