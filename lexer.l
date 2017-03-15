%{
  //any needed C++ code (think variables you want to use later,  includes, etc…
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <iterator>
using namespace std;

  vector<string> symbolTable;
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
\n				{cout << "<NL>\n";}
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

int symbolTable(string key, string value)
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
	  itKey = find(itKey++, symbolTable.end(), key);
	}
    }

  // If it's not found, add it.
  symbolTable.push_back(key);
  symbolTable.push_back(value);

  return (symbolTable.size() / 2) + 1;
}
