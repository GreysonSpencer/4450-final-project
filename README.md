# 4450-final-project


## About
Simple Parser using Antlr4 to parse Grammar
### Phase 1
Basic arithmetic expressions can be parsed such as 
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
    # Code here
```
## Running and Installation
TODO: Put full instructions here
