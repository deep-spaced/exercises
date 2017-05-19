/**
Using Default Arguments

Refactor the following code to use default function arguments.  Be sure to remove any unused code after you refactor it.

function sum(a, b) {
  if (a === undefined) {
    a = 0;
  }

  if (b === undefined) {
    b = 0;
  }

  return a + b;
}
*/

function sum(a = 0, b = 0) {
  return a + b;
}

/*
Dumping Unused Code

Refactor the following code to use default function arguments.  Be sure to remove any unused code after you refactor it.

function addOffset(style) {
  if (!style) {
    style = {};
  }

  style.offset = '10px';

  return style;
}
*/

function addOffset(style = {offset: '10px'}) {
  return style;
}
