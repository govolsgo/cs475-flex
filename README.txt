Flex Lexical Analysis Assignment
Carter Crews

Running the lexer:
1. Navigate to the directory containing the lexer.
2. bash$ make
3. bash$ ./lexer
4. Provide input file. A sample file, input.txt, is included.

One of the things I decided to do was to try and follow the logic and flow of the tokenizer I wrote in Python. I decided to use vectors to store the symbol table, since I’m used to them and it’d be pretty easy to deal with. I used the same strategy of always pushing two new strings into the table when adding an entry. I encapsulated the symbol table checker in it’s own function to make the pattern code more readable. In the spirit of following the Python assignment, I modified the lexer main code to ask for and read in from a file rather than stdin. I also made my output follow the exact same format. In fact, when parsing the test file that is included, both the Python tokenizer and this lexer output the exact same result. I ran both programs and saved the output to different files. Then I used comm in the terminal to check the files. They were exactly the same.