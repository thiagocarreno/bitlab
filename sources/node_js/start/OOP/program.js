// Generated by CoffeeScript 1.9.0
'use strict';
var Person, Program;

Person = require('./Person');

Program = (function() {
  function Program() {
    this.init();
  }

  Program.prototype.init = function() {
    var person;
    person = new Person('Name of Person');
    console.log(person.getName());
  };

  return Program;

})();

new Program;
