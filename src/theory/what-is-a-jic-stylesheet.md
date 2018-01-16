---
title: What is a JIC Stylesheet?
subtitle: a format and mixin guideline for JS-in-CSS
keywords: JSinCSS, JIC, file format, hybrid stylesheet, hybrid file format, template string
---

Everything in a JIC stylesheet revolves around the use of a very special pair of brackets that look like this `${}`. They open with a `${`, and close with a `}`. In a JIC stylesheet everything _outside_ these brackets is CSS, and everything _inside_ these brackets is JavaScript.

You might think of it as a CSS stylesheet that functions like a JavaScript template string, because in the end that's how it will be interpreted.

When you combine CSS and JavaScript this way, you are able to leverage the 100% of the features of CSS, _and_ add 100% of the features of JavaScript to it. There are many ways CSS and JavaScript can communicate, using a JIC-formatted stylesheet is one of the most flexible and succinct syntaxes for expressing your styles. And makes it very easy to extend the features of CSS by writing simple JavaScript functions called called 'JIC mixins'.

To show you what this idea is all, about let's look at a small example. Here is a JIC stylesheet that displays the browser's viewport dimensions as CSS content for a pseudo-element on the HTML element.

```css
html:before {
  content: '${innerWidth} x ${innerHeight}';
}
```

When this JIC stylesheet is interpreted, the content being displayed will be the values of whatever the inner width and height of the browser are at that exact moment.

There are a few ways expressing JavaScript and CSS together can be helpful, let's look at four main ways to use JavaScript to your advantage when writing a JIC stylesheet.

## How to write a JIC stylesheet

```css
/* Inline Values */
.username:before { content: '${firstName}'; }

/* JavaScript One-liners */
body { background: ${Math.random() > .5 ? 'red' : 'orange'}; }

/* Nested Stylesheets */
${someValue ? `
  
  /* I'm also a JIC stylesheet */

` : ''}

/* Calling Functions */
${helper('.example')}
```

Let's look at a few ways these different types of interactions can be useful.

### Inline Values

When you use the special brackets in a JIC stylesheet you are able to replace any variable name the browser is aware of and have its value output in the resulting CSS. While the example above used the brackets inside of what becomes a CSS property value, you can use the brackets anywhere in a JIC stylesheet. It's just as easy for you to replace part of a property name, selector, or even inside of media query.

```css
/* As a property name */
.example {
  ${prefix}appearance: none;
}

/* Inside a selector */
.${teamName}.avatar {
  border: 5px solid red;
}

/* Inside of a media query */
@media (min-width: ${desktop}) {
  .sidebar {
    display: block;
  }
}
```

### JavaScript One-liners

If using JavaScript variables anywhere inside CSS stylesheets is exciting, it's just as easy to use JavaScript expressions in your stylesheets as well. This allows you to use any values JavaScript is aware of (or can measure) anywhere in your styles.

```css
/* Reading properties from the DOM */
#demoVideo {
  width: 100%;
  height: calc(${demoVideo.offsetWidth}px / (16/9));
}

/* Random numbers */
body {
  background: hsl(${Math.random() * 360}, 75%, 50%)
}
```

### Nested Stylesheets

One really useful feature of JavaScript template strings is that they can contain other JS template strings inside of the special brackets. Something like this would be invisible to our final CSS and just behave like we had only written `html { background: lime; }`.

```css
${ ` html { background: lime; } ` }
```

This becomes a very easy place for us to add a bit of JavaScript logic to toggle whether we should include a part of a stylesheet inside of a larger stylesheet. The following two examples are equivalent:

```css
${(true) ? `/* JIC stylesheet */` : ''}

${(true) && `/* JIC stylesheet */` || ''}
```

If the first expression is `true`, the nested stylesheet will be included in the original JIC stylesheet, otherwise nothing will be added.

### Calling Functions

Another helpful way to use CSS and JavaScript together is to use a JavaScript function as a helper, either for reducing the amount of CSS you need to write, for simplifying your stylesheets, re-using similar logic in multiple places or stylesheets, or just to work with a nicer interface when you're writing styles. It's so easy to create JavaScript functions for almost anything, so being able to use them anywhere in JIC stylesheets means there's no end to the possibilities of how and where helper functions can be used. Here's an example of a helper function that clamps a scalable value between a minimum and maximum value, called a 'number clamp':

```js
function clamp(min, mid, max) {
  
  return Math.min(Math.max(min, mid), max)

}
```

This would let us write a value in our JIC stylesheet like this:

```css
h1 {
  font-size: ${clamp(20, header.offsetWidth/20, 75)}px;
}
```

### JIC Mixins

A 'JIC Mixin' is a JavaScript function that usually takes a CSS selector, and optionally a CSS rule or CSS stylesheet to process.

```js
mixin(selector [, …any other arguments here])

ruleMixin(selector, […any other arguments here,] rule)

stylesheetMixin(selector, […any other arguments here,] stylesheet)
```

#### Simple Mixins

The smallest type of mixin is a function that usually takes a CSS selector, plus any additional arguments the function needs.

```css
${aspectRatio('iframe', 16/9)}
```

There's no rule or stylesheet being passed in, but in this case the `aspectRatio()` function is able to query the document for all iframe tags that match the selector, and based on their current width, assign a height value using the ratio supplied to the function in the second argument.

This type of mixin returns one or more CSS rules to the original JIC stylesheet.

#### Rule Mixins

A rule-level mixin usually takes a CSS selector, plus a CSS rule to apply to elements matching that selector, plus any additional arguments the function needs.

```css
${closest('.target', '.ancestor', `

  background: lime;

`)}
```

In this case we're using a JavaScript function inside our special brackets, and containing more CSS inside of it. It doesn't take up much more space than a CSS selector would in our CSS stylesheet, it's just expressed in a different language.

Our example here will look for all elements in the document with a class of "target", and looks at the elements containing it. If it finds an ancestor element with a class of "ancestor", it will apply the CSS rule given as the last argument which will make the background of that element green.

A rule mixin returns one or more CSS rules to the original JIC stylesheet, usually formatted like this.

```css
${selector} { ${rule} }
```

#### Stylesheet Mixins

A stylesheet-level mixin usually takes a CSS selector, plus a stylesheet (often with `$this` used as a placeholder for each matching element), plus any additional arguments the function needs.

You can think of both the rule-level mixins and the stylesheet-level mixins kind of like the 'Nested Stylesheet' example above, where the JS logic required to toggle the stylesheet is too long to write in the JIC stylesheet itself (or where you want to re-use the same functionality).

```css
${containerQuery('div', el => el.offsetWidth > 500, `
  
  $this {
    background: lime;
  }
  $this .button {
    font-size: 20pt;
  }

`)}
```

In this example we have a container query plugin that is looking for every DIV element in the document. The second argument is a JavaScript function in arrow notation. It's equivalent to the following function

```js
function(el) { return el.offsetWidth > 500 }
```

When we give a function like this an element to test, it will either return `true` or `false`, which with this mixin is like a switch to determine whether a copy of the contained CSS stylesheet should be output for that DIV element.

A stylesheet mixin returns a CSS stylesheet to the original JIC stylesheet

## Extending CSS

If you're wondering how this approach makes extending CSS flexible, consider what it would take to invent support for a new CSS feature. Let's say we wanted a custom at-rule that would toggle different styles on different days of the week. There's nothing like this currently in CSS, so let's imagine it with a syntax like this:

```css
@time (day: friday) {

  body {
    background: lime;
  }

}
```

In order for your website to be pink on Fridays with other approaches you'd either have to write some JavaScript and CSS separately (maybe using JavaScript to check the date and apply a class to the BODY element on Fridays and then add a rule in your CSS stylesheet for the BODY element when it has your special Friday class. Maybe you could use CSS variables and have JavaScript set the value differently on Fridays.

Another approach might be to use a CSS preprocessor, where you'd have to teach the preprocessor how to parse CSS, how to parse your custom CSS and extract the information from our `@time (unit: value)` syntax, we'd have to write a JavaScript plugin to do the transformation, and finally output CSS.

But consider how flexible our JIC stylesheet is. We can express the same functionality as CSS media queries like this:

```css
@media (min-width: 500px) {

  body {
    background: lime;
  }

}

${innerWidth >= 500 ? `

  body {
    background: lime;
  }

` : ''}
```

So if we want to add support for our custom `@time (day: friday)` logic, in JavaScript we only need to test `new Date().getDay() === 5` to tell `true` or `false` if it's Friday.

```css
/* Doesn't work */
@time (day: friday) {

  body {
    background: lime;
  }

}

/* Does work! */
${new Date().getDay() === 5 ? `

  body {
    background: lime;
  }

` : ''}
```

And if you'd rather make a simple helper function instead of repeating this kind of logic throughout out stylesheet we can easily create a helper function like this to return `true` or `false`, and make what we have write as simple as `day(5)`.

```js
function day(number) {
  
  return new Date().getDay() === number

}
```

Now we can call that from our JIC stylesheet instead.

```css
${day(5) ? `

  body {
    background: lime;
  }

` : ''}
```

If you want to take it further and make it into a JIC mixin rather that include these styles as a Nested Stylesheet, we can make it even cleaner in our JIC stylesheet my writing a function like this:

```js
function time(option, stylesheet) {

  var day = ['sunday',
             'monday',
             'tuesday',
             'wednesday',
             'thursday',
             'friday', 
             'saturday']

  return option.day === day[new Date().getDay()] ? stylesheet : ''

}
```

It's a pretty simple function, we've created a nice interface to use where we can give it an object like `{day: 'monday'}` as an argument and it will test that name against the current day, returning the stylesheet if it's `true`. This function allows us to express our custom `@time` at-rule logic in our JIC stylesheet in a pretty way as:

```css
${time ({day: 'friday'}, `
  
  body {
    background: lime;
  }

`)}
```

It's not quite as simple as `@time (day:) {}`, but it's kind of amazing how simply we can invent `${time ({day:},``)}` out of nothing, make it work with only a few lines of standard CSS and standard JavaScript. No new syntax needs to be invented or parsed, and no new features need to be added to either language to make a new abstraction like this work for us in our stylesheet.

You can play around with a running demo of this here, be sure to update the day of the week to today: [Custom At-Rule with JIC Stylesheet](https://codepen.io/tomhodgins/pen/MONbOr)

If you wanted to take it in a different direction, another way you might expose the logic in your stylesheets might be by creating `true`/`false` helper functions. Suppose we wanted to add special styles only on Christmas day (December 25th). We could create two helper functions, `month()` and `date()`, and chain them together with `$$` to write logic for a nested stylesheet in a nice readable way:

```js
function month(name) {

  return ['january',
          'february',
          'march',
          'april',
          'may',
          'june',
          'july',
          'august',
          'september',
          'october',
          'november',
          'december'].indexOf(name) === new Date().getMonth()

}

function date(number) {

  return number === new Date().getDate()

}
```

Then use these in our JIC stylesheet like this:

```css
${month('december') && date(25) ? `

  html {
    color: green;
    background: red;
  }

`:''}
```

When both `month('december')` and `date(25)` are `true`, the nested stylesheet will apply. If you had a number of simple `true`/`false` functions, you could string them together in infinite ways, allowing you to express precisely what you're trying to target in a succinct way. Without having to define these functions for you, can you imagine what the following stylesheets might do:

```css
${browser('safari') && os('ios') ? ` … `:''}
```

Or how about:

```css
${officeHours(false) && user('frank') ? `

  .support-desk form {
    display: none;
  }

`:''}
```

The flexibility of JS-in-CSS lets you express yourself in a natural way, and allows you to easily create the abstractions and interfaces you want to work with when you're approaching design. Most importantly, JIS stylesheets let you harness and benefit from all of the CSS and JavaScript knowledge you already have, and lets you put them to work for styling.