%{
//any needed C++ code (think variables you want to use later,  includes, etc…
%}
%option noyywrap //keep this, it keeps flex from misbehaving/making your life more difficult
%%
//here go the patterns and actions
PATTERN                         {//code response}
%%
//code goes here (main)
int main()
{
    FlexLexer* lexer = new yyFlexLexer;
    while(lexer->yylex() != 0)
        ;
    return 0;
}
