// Soln6_05ISO.cpp
// A program to implement a calculator accepting parentheses

// Mathematical functions are calculated by the doOperation() function.
// A math function is detected in the number function, preceding the check for parentheses.
// When parentheses are detected, the number() function check for a previous op, and
// if there was one, executes the op with the parenthesized expression as the argument.

#define _USE_MATH_DEFINES             // To access non-standard math constants such as M_PI
                                      // in  the cmath header you must define this symbol
#include <iostream>                   // For stream input/output
#include <cstdlib>                    // For the exit() function
#include <cctype>                     // For the isdigit() function
#include <cstring>                    // For the strcpy() function
#include <cmath>                      // For math functions & constants

using std::cin;
using std::cout;
using std::endl;

void eatspaces(char* str);            // Function to eliminate blanks
double expr(char* str);               // Function evaluating an expression
double term(char* str, int& index);   // Function analyzing a term
double number(char* str, int& index); // Function to recognize a number
char* extract(char* str, int& index); // Function to extract a substring
void error(int index);                // Function to identify an error
double doOperation(char* op, double value);   // Execute math function

const double degToRad = 180.0/M_PI;   // Conversion factor, degrees to radians

const int MAX(80);                    // Maximum expression length, 
                                      // including '\0'

char input[MAX];                      // Stores input string for error flagging
int inputIndex(0);                    // Save input index

int main()
{
   char buffer[MAX] = {0};    // Input area for expression to be evaluated

   cout << endl
        << "Welcome to your friendly calculator."
        << endl
        << "Enter an expression, or an empty line to quit."
        << endl;

   for(;;)
   {
      cin.getline(buffer, sizeof buffer);   // Read an input line
      eatspaces(buffer);                    // Remove blanks from input
      strcpy_s(input, buffer);              // Copy input for error flagging
      inputIndex = 0;

      if(!buffer[0])                        // Empty line ends calculator
         return 0;

      cout << "\t= " << expr(buffer)        // Output value of expression
           << endl << endl;
   }
}


// Function to eliminate spaces from a string
void eatspaces(char* str)
{
   int i(0);                              // 'Copy to' index to string
   int j(0);                              // 'Copy from' index to string

   while((*(str + i) = *(str + j++)) != '\0')  // Loop while character
                                               // copied is not \0
      if(*(str + i) != ' ')                    // Increment i as long as
         i++;                                  // character is not a space
   return;
}

// Function to evaluate an arithmetic expression
double expr(char* str)
{
  double value(0.0);                   // Store result here
  int index(0);                        // Keeps track of current character position

  value = term(str, index);            // Get first term

  for(;;)                              // Indefinite loop, all exits inside
  {
    switch(*(str + index++))           // Choose action based on current character
    {
      case '\0':                       // We're at the end of the string
         return value;                 // so return what we have got

      case '+':                        // + found so add in the
         value += term(str, index);    // next term
         break;

      case '-':                        // - found so subtract
         value -= term(str, index);    // the next term
         break;

      default:                         // If we reach here the string
         cout << endl                  // is junk
              << "Arrrgh!*#!! There's an error"
              << endl;
         error(index);
         exit(1);
    }
  }
}

// Function to get the value of a term
double term(char* str, int& index)
{
  double value(0.0);                              // Somewhere to accumulate 
                                                  // the result

  value = number(str, index);                     // Get the first number in the term

  // Loop as long as we have a good operator
  while(true)
  {

    if(*(str + index) == '*')                     // If it's multiply,
      value *= number(str, ++index);              // multiply by next number

    else if(*(str + index) == '/')                // If it's divide,
      value /= number(str, ++index);              // divide by next number
    else if(*(str + index)=='^')                  // If it's exponentiation
       value = pow(value, number(str, ++index));  // Raise to power of next number
    else
      break;
  }
  return value;                                   // We've finished, so return what 
                                                  // we've got
}

// Function to recognize a number in a string
double number(char* str, int& index)
{
  double value(0.0);                   // Store the resulting value

  // Look for a math function name up to 5 characters long
  char op[6];                          // Name 5 characters max
  int ip = 0;
  while (index<6 && isalpha(*(str+index)))      // Copy the function name
    op[ip++] = *(str+index++);
  op[ip] = '\0';                       // Append terminator

  if(*(str + index) == '(')            // Start of parentheses
  {
    int oldIndex = inputIndex;         // Save current for restoring later
    inputIndex += index + 1;           // Record index position for error flagging
    char* psubstr(nullptr);            // Pointer for substring
    psubstr = extract(str, ++index);   // Extract substring in brackets
    value = expr(psubstr);             // Get the value of the substring

    // If we have a math operation saved, go and do it
    if(op[0])
      value = doOperation(op, value);

    delete[]psubstr;                   // Clean up the free store
    inputIndex = oldIndex;             // Restore old index
    return value;                      // Return substring value
  }

  // There must be at least one digit...
  if(!isdigit(*(str + index)))
  { // There's no digits so input is junk...
    cout << endl                  
         << "Arrrgh!*#!! There's an error"
         << endl;
    error(index);
    exit(1);
  }

  while(isdigit(*(str + index)))       // Loop accumulating leading digits
    value = 10*value + (*(str + index++) - '0');

                                       // Not a digit when we get to here
  if(*(str + index) != '.')            // so check for decimal point
    return value;                      // and if not, return value

  double factor(1.0);                  // Factor for decimal places
  while(isdigit(*(str + (++index))))   // Loop as long as we have digits
  {
    factor *= 0.1;                     // Decrease factor by factor of 10
    value = value + (*(str + index) - '0')*factor;   // Add decimal place
  }

  return value;                        // On loop exit we are done
}

// Function to extract a substring between parentheses 
// (requires cstring)
char* extract(char* str, int& index)
{
  char buffer[MAX];                   // Temporary space for substring
  char* pstr(nullptr);                // Pointer to new string for return
  int numL(0);                        // Count of left parentheses found
  int bufindex(index);                // Save starting value for index
  do
  {
    buffer[index - bufindex] = *(str + index);
    switch(buffer[index - bufindex])
    {
      case ')':
        if(0 == numL)
        {
          size_t size = index - bufindex;
          buffer[index - bufindex] = '\0';  // Replace ')' with '\0' 
          ++index;
          pstr = new char[index - bufindex];
          if(!pstr)
          {
            cout << "Memory allocation failed,"
                 << " program terminated.";
            exit(1);
          }
          strcpy_s(pstr, index-bufindex, buffer); // Copy substring to new memory
          return pstr;                 // Return substring in new memory
        }
        else
          numL--;                      // Reduce count of '(' to be matched
          break;

      case '(':
        numL++;                        // Increase count of '(' to be 
                                   // matched
        break;
      }
  } while(*(str + index++) != '\0'); // Loop - don't overrun end of string

  cout << "Ran off the end of the expression, must be bad input!"
       << endl;
  error(0);

  exit(1);
}

// Function to identify an error
void error(int index)
{
   cout << input << endl;
   for (int i = 0; i < inputIndex + index; i++)
      cout << ' ';
   cout << '^' << endl;
}

// Execute math function
double doOperation(char* op, double value)
{
   if (!_stricmp(op, "sin"))
      return sin(value);
   else if (!_stricmp(op, "sind"))
      return sin(value/degToRad);
   else if (!_stricmp(op, "cos"))
      return cos(value);
   else if (!_stricmp(op, "cosd"))
      return cos(value/degToRad);
   else if (!_stricmp(op, "tan"))
      return tan(value);
   else if (!_stricmp(op, "tand"))
      return tan(value/degToRad);
   else if (!_stricmp(op, "sqrt"))
      return sqrt(value);
   else
   {
     error(0);
      cout << "Error: unknown operation '" << op << "'" << endl;
      exit(1);
   }
   return 0;
}
