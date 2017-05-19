// Fat arrows!
//
// https://www.sitepoint.com/es6-arrow-functions-new-fat-concise-syntax-javascript/

// Simple function declaration.
var multiply = (x, y) => { return x * y; }

// No parameters? No problems!
var printNothing = () { console.log(' '); }

// Just do some mapping!
// Fat arrows make use of lexical `this`. They make the value of `this`
// behave and work as we expect.
['Bob', 'Sally', 'Mack'].map((name) => { console.log(name); });

/*
 * Refactoring Keyword Functions

The function below uses the 'function' keyword.  There's nothing wrong with using the 'function' keyword here, but it might look a bit nicer if we refactor it to use the fat arrow syntax instead.

Refactor the code below to use a fat arrow function.  Remember the rules of fat arrow functions:

If the function has a single expression in its body, the curly braces and 'return' keyword can be removed
If the function has a single argument, the parentheses around the argument list can be removed
*/

const fibonacci = n => {
  if (n < 3) return 1;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

/*
 * Arrow Functions Aren't Always a Solution

Arrow functions bind the value of 'this' to the surrounding context, and sometimes this isn't the behavior we expect.  The code below has an object that represents a users profile.  The profile has a 'name' currently.  Add another key to this object called 'getName'.  'getName' should be a function that returns the profiles name, using 'this.name'.  Does the solution work with a fat arrow function or will you have to use a function keyword instead?
*/

const profile = {
    name: 'Alex',
    getName: () => {
        this.name;
    }
};
