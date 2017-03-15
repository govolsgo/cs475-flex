%{
  //any needed C++ code (think variables you want to use later,  includes, etc…
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <iterator>
using namespace std;

int symbolTableLoc(string key, string value);

vector<string> symbolTable;
%}
%option noyywrap 
%%
int				{cout << "<INT>";}
float				{cout << "<FLOAT>";}
[0-9]+\.[0-9]+			{cout << "<REAL," << symbolTableLoc("REAL",yytext) << ">";}
[0-9]+				{cout << "<INTEGER," << symbolTableLoc("INTEGER",yytext) << ">";}
\[				{cout << "<LSQB>";}
\]				{cout << "<RSQB>";}
=				{cout << "<EQUAL,=>";}
\t				{cout << "<TAB>";}
\n				{cout << "<NL>\n";}
(<=|!=|>=|==|<|>)		{cout << "<COMPARISON," << yytext << ">";}
(\+=|\-=|\*=|\/=)		{cout << "<COMBO," << yytext << ">";}
[*/+-]				{cout << "<OP," << yytext << ">";}
\(				{cout << "<LPAREN>";}
\)				{cout << "<RPAREN>";}
\{				{cout << "<LCURL>";}
\}				{cout << "<RCURL>";}
if				{cout << "<IF>";}
[a-zA-Z0-9_]+			{cout << "<ID," << symbolTableLoc("ID",yytext) << ">";}
[[:blank:]]			{}
%%
//code goes here (main)
int main()
{
    FlexLexer* lexer = new yyFlexLexer;
    while(lexer->yylex() != 0);
    return 0;
}

int symbolTableLoc(string key, string value)
{
  vector<string>::iterator itKey;
  vector<string>::iterator itVal;
  
  itKey = find(symbolTable.begin(), symbolTable.end(), key);

  while(itKey != symbolTable.end())
    {
      itVal = itKey + 1;

      if(*itVal == value)
	{
	  // Return location.
	  return (distance(symbolTable.begin(), itKey) / 2) + 1;
	}
      else
	{
	  itKey++;
	  itKey = find(itKey, symbolTable.end(), key);
	}
    }

  // If it's not found, add it.
  symbolTable.push_back(key);
  symbolTable.push_back(value);

  return (symbolTable.size() / 2);
}
