all:
	flex++ lexer.l
	g++ lex.yy.cc -o lexer
clean:
	rm lex.yy.cc
	rm lexer
