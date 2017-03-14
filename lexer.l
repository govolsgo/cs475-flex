%{
  //any needed C++ code (think variables you want to use later,  includes, etc…
#include <iostream>
  %}
%option noyywrap //keep this, it keeps flex from misbehaving/making your life more difficult
%%
//here go the patterns and actions
//PATTERN                         {//code response}
int				{cout << "<INT>";}
float				{cout << "<FLOAT>";}
\d+\.\d+			{}
[\d]+				{}
\[				{cout << "<LSQB>";}
\]				{cout << "<RSQB>";}
=				{cout << "<EQUAL>";}
\t				{cout << "<TAB>";}
\n",				{cout << "<NL>\n";}
<=|!=|>=|==|<|>]		{}
\+=|-=|\*=|/=			{}
[*/+-]				{}
\(				{cout << "<LPAREN>";}
\)				{cout << "<RPAREN>";}
\{				{cout << "<LCURL>";}
\}				{cout << "<RCURL>";}
if				{cout << "<IF>";}
([\w\d_])+			{}
%%
//code goes here (main)
int main()
{
    FlexLexer* lexer = new yyFlexLexer;
    while(lexer->yylex() != 0)
        ;
    return 0;
}
