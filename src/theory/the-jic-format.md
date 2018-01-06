# The `.jic` Format

If you haven't heard about JS-in-CSS or JIC stylesheets before, the idea is very simple: treat a CSS stylesheet like a JavaScript template string. If you've never written a JIC stylesheet before, they can be a _lot of fun!_

This document is intended for developers who might need to work with `.jic` files, or build tools to read/write them. For a more author-friendly explanation of what you can do _with_ JIC stylesheets, [click here](what-is-a-jic-stylesheet.html)

Here's what a `.jic` file is all about:

- a CSS stylesheet
- includes JS interpolation anywhere via `${}`
- saved with a `.jic` extension
- loaded by JavaScript
- interpreted as a JavaScript template string
- output as CSS

### Example

```css
html:before {
  content: '${innerWidth} x ${innerHeight}';
}
```

## Writing JIC Stylesheets

Start with an empty file, use CSS syntax highlighting and write global styles anywhere. Leverage JavaScript interpolation anywhere using `${}`. Everything inside the brackets is JavaScript, so you're able to use JavaScript logic to:

- toggle the inclusion or exclusion of CSS text (could be a value, property, rule, or even a whole stylesheet)
- use JavaScript variables anywhere in CSS
- use JavaScript's awareness of the browser and DOM when styling
- call JavaScript functions and include the returned result in the stylesheet

### Examples of JIC stylesheets

- [Container Queries using the JS-in-CSS pattern](https://codepen.io/tomhodgins/pen/bYgLmQ)
- [3 Levels of style scoping](https://codepen.io/tomhodgins/pen/dZYRdv)
- [JIC stylesheet (from Qompile)](https://gist.github.com/tomhodgins/94fc1dc73ec0fc9d3dfc6722192924a8#file-input-css-css)

## Extending JIC stylesheets with mixins

Mixins for `.jic` stylesheets can be written in pure JavaScript. The most basic mixin, which simply returns a bit of CSS, could be written like this:

```js
function border(selector) {
  return `${selector} { border: 1px solid red; }`
}
```

If you were writing a JIC stylesheet and that function was available to you at the time of interpolation, you could make use of it anywhere inside your JIC stylesheet with `${border()}`, here in this example we'll add a red border to every element using the `*` universal selector:

```css
${border('*')}
```

Which when interpolated, should turn into:

```css
* { border: 1px solid red; }
```

#### Use of `$this` in mixins

The `$this` keyword has no special meaning in a JIC file, but many JIC-compatible mixins make use of a `$this` keyword in their own internal stylesheets as a placeholder for each individual element in case of style scoping. Not every mixin will involve style scoping, but if you are creating a mixin that handles a stylesheet that will apply to individual elements matching a selector or test, choosing to use `$this` as a placeholder for each element in your internal stylesheet can be a helpful shorthand.

### Examples of JIC mixins

- [Container Queries mixin](https://gist.github.com/tomhodgins/fc42b334beaafc75a271b1ef7c8e33ee)
- [Cascading JS Variables](https://github.com/tomhodgins/cascading-js-variables)
- [Element-based units mixin (`ew`, `eh`, `emin`, `emax`)](https://codepen.io/tomhodgins/pen/wqRzmZ)
- [respec](https://github.com/tomhodgins/respec)
- [reproCSS/ancestor-selector](https://github.com/tomhodgins/reprocss#ancestor-selector-mixin)
- [reproCSS/aspect-ratio](https://github.com/tomhodgins/reprocss/blob/master/mixins/aspect-ratio.js)
- [reproCSS/auto-expand](https://github.com/tomhodgins/reprocss/blob/master/mixins/auto-expand.js)
- [reproCSS/closest-selector](https://github.com/tomhodgins/reprocss/blob/master/mixins/closest-selector.js)
- [reproCSS/container-queries](https://github.com/tomhodgins/reprocss/blob/master/mixins/container-queries.js)
- [reproCSS/elder-selector](https://github.com/tomhodgins/reprocss#elder-selector-mixin)
- [reproCSS/parent-selector](https://github.com/tomhodgins/reprocss/blob/master/mixins/parent-selector.js)
- [reproCSS/prev-selector](https://github.com/tomhodgins/reprocss/blob/master/mixins/prev-selector.js)
- [reproCSS/scoped-eval](https://github.com/tomhodgins/reprocss/blob/master/mixins/scoped-eval.js)
- [reproCSS/xpath-selector](https://github.com/tomhodgins/reprocss/blob/master/mixins/xpath-selector.js)

## Reading JS-in-CSS Stylesheets

In order for a JIC stylesheet to be read by JavaScript it must first exist as a regular JavaScript string. (This allows you to include JavaScript interpolation in your string, but control the exact moment at which it is evaluated by Javascript).

To turn a regular string into a JS template string, you can `return` the original string as a JS template string from a function.

```
new Function('return `' + jic + '`')
```

When this function is evaluated, the JIC stylesheet will be be interpolated, all of the JavaScript parts will be evaluated and the result will be a pure CSS stylesheet that can be attached to the DOM, added directly to the CSSOM by JavaScript, or output as a regular CSS file.

### Example JIC plugins

There are a number of CSS reprocessors that can all make use of JIC-formatted stylesheets. Now that there's a common file format for them, compatibility between these plugins and their mixins should increase in the future, as well as the number of JIC-aware plugins increasing too.

#### The JS-in-CSS Pattern

The [JS-in-CSS](https://github.com/tomhodgins/js-in-css) pattern relies on JIC-formatted stylesheets being present inline in JavaScript. It's compatible with all JIC mixins, and the simplest way to get started with JIC-formatted stylesheets.

#### JIC.js

You can use [jic.js](https://gist.github.com/tomhodgins/b8697d6599b2cda60bb7e77e5f2387fe) to load JIC-formatted stylesheets from inside `<style>` tags, and from external files using `<link>` tags. Compatible with all JIC mixins.

#### reproCSS

[reproCSS](https://github.com/tomhodgins/reprocss) offers a fallback implementation of JS template strings that's weaker and simpler than the full range of what you can nest inside real JS template strings, but with broader browser support than JS template strings going back to IE10. Compatible with all JIC mixins. 

#### Qompile

Qompile uses JIC stylesheets. With minor modifications, can be made to work with any JIC mixin.