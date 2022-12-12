# 4450-final-project
## The Team
Tom Hagedorn
Ryan Orf
Greyson Spencer
Nathan Toepke

## About
This is a simple parser which utilizes ANTLR4 in Java to parse a file written in the python3 language into a grammar visualized by a parse tree.
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
Phase 2 includes the implementation of if/elif/else blocks and conditional statements. An if statement can be followed in direct succession by any number of if statements, any number of elif statements, or a singular else statement. If statements can also be nested inside another if/elif/else statement. The conditional operators that can be used to compare two expressions are: "<", "<=", ">", ">=", "==", "is", "!=", "and", "or", and "not". The cases below demonstrate examples of valid expressions:
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
Phase 3 includes the implementation of comments, while loops, and for loops. A comment is simply a "#" symbol followed by the rest of the characters on that line. Comments can have their own line or can start following code on a line. A while loop is defined as the "while" keyword followed by some expression to be evaluated, a colon (":"), and any number of lines of expressions indented once more so than the line containing the while expression. Similarly, a for loop is defined as the "for" keyword followed by some expression to be evaluated, a colon (":"), and any number of lines of expressions indented once more so than the line containing the for expression. Unlike the while expression, an expression used in a for expression contains the "in" keyword (see a valid example below). While and for loops can be nested as well. Additionally, "break" and "continue" statmenets are also permitted.
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
Phase 4 supports function implementations and function calls. A function is defined as the "def" keyword, followed by the name of the function (which follows the same naming convention as a variable name) that is immediately followed by a set of parentheses, and inside said parentheses is a comma-separated list of parameters that can be variables or assignments, followed by a colon (":") and any number of lines of expressions indented once more so than the line containing the function definition ("def") expression. It is important to note that, in line with proper function definition practices in python3, all and any variable parameters must precede all and any assignment parameters. Functions can also be nested, as is the case in python3. A function call involves the name of a function, immediately followed by a set of parentheses, and inside said parentheses is a comma-separated list of arguments that can be an assignment or expression. Note that a function call is evaluated as an expression. (Note that the inclusion of function calls allow for "in range()" statements to be used in for loops. Additionally, "return" statements are also permitted.
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

## Parser Requirements
TODO: Put requirements (Python3, Java, and ANTLR4???)

## Running and Installation
TODO: Put full instructions here

## Demo Video
Please find below a link to a YouTube video demonstrating our parser:
TODO: (REPLACE THIS LINE WITH YOUTUBE VIDEO LINK)
