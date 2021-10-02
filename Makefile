default:
	clear
	flex -l main.flex
	bison -dv parser.y
	gcc -o output parser.tab.c lex.yy.c -lfl