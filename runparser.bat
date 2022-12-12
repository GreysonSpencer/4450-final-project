:: Generate
java -cp ".\antlr-4.9.2-complete.jar;%CLASSPATH%" org.antlr.v4.Tool PyGrammar.g4

:: Compile
javac -cp ".\antlr-4.9.2-complete.jar;%CLASSPATH%" PyGrammar*.java

:: Execute the code on the given python script
type %* | java -cp ".\antlr-4.9.2-complete.jar;%CLASSPATH%" org.antlr.v4.gui.TestRig PyGrammar program -gui