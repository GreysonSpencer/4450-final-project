:: Generate
java org.antlr.v4.Tool PyGrammar.g4

:: Compile
javac PyGrammar*.java

:: Execute the code on the given python script
type %* | java org.antlr.v4.gui.TestRig PyGrammar program -gui