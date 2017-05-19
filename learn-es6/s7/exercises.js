/*
 * Distance Traveled

Use the 'reduce' helper to find the sum of all the distances traveled.  Assign the result to the variable 'totalDistance'
*/

var trips = [{ distance: 34 }, { distance: 12 } , { distance: 1 }];

var totalDistance = trips.reduce(function(previous, trip) {
  return previous + trip.distance;
}, 0);

/*
 * Reducing Properties

Use the 'reduce' helper to create an object that tallies the number of sitting and standing desks.  The object returned should have the form '{ sitting: 3, standing: 2 }'.  The initial value has been provided to you.
Hint: Don't forget to return the accumulator object (the first argument to the iterator function)
*/

var desks = [
  { type: 'sitting' },
  { type: 'standing' },
  { type: 'sitting' },
  { type: 'sitting' },
  { type: 'standing' }
];

var deskTypes = desks.reduce(function(prev, desk) {
  if(desk.type === "sitting") { ++prev.sitting; }
  if(desk.type === "standing") { ++prev.standing; }
  return prev;
}, { sitting: 0, standing: 0 });

/*
 * Hardmode: Custom 'Unique' Helper

Another really hard one!  Write a function called 'unique' that will remove all the duplicate values from an array.

For example, given the following array:
var numbers = [1, 1, 2, 3, 4, 4];
Your function should return
[1, 2, 3, 4]
Hint: Use the 'reduce' and 'find' helpers.
*/

function unique(array) {
  return array.reduce(function(previous, el) {
    var foundEl = previous.find(function(prevEl) { return prevEl === el; });
    if(!foundEl) { previous.push(el); }
    return previous;
  }, []);
}

var numbers = [1, 1, 2, 3, 4, 4];
unique(numbers) === [1,2,3,4];

