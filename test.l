
/*** Definition Section has one variable 
which can be accessed inside yylex()  
and main() ***/
%{ 
int nchars = 0;
int nlines = 0;
int nid = 0;
int ndigits=0;
%} 
  
/*** Rule Section has three rules, first rule  
matches with capital letters, second rule 
matches with any character except newline and  
third rule does not take input after the enter***/
%% 

end   {return 0;} 
if    {printf("%s IF detected\n",yytext);}
else  {printf("else detect\n");}
else[ ]if  {printf("else if detected\n");}
^[-+]?[0-9]*  {printf("int detected\n");ndigits++;}
^[-+]?[0-9]*[.][0-9]+  {printf("float dtetct\n");}

[

.   {nchars++;}

[a-zA-Z][a-zA-Z0-9]* {printf("new id %s\n", yytext);nid++;}

\n    {nlines++;} 


%% 
  
/*** Code Section prints the number of 
capital letter present in the given input***/
int yywrap(){} 
int main(){ 
  
// Explanation: 
// yywrap() - wraps the above rule section 
/* yyin - takes the file pointer  
          which contains the input*/
/* yylex() - this is the main flex function 
          which runs the Rule Section*/
// yytext is the text in the buffer 
  
// Uncomment the lines below  
// to take input from file 
// FILE *fp; 
// char filename[50]; 
// printf("Enter the filename: \n"); 
// scanf("%s",filename); 
// fp = fopen(filename,"r"); 
// yyin = fp; 
  
yylex(); 
printf("\nID: %d\n Lines: %d\n Digits: %d\n Chars: %d\n", nid,nlines,ndigits,nchars); 

return 0; 
} 