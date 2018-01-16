---
title: reproCSS
keywords: reprocss, css reprocessor, event-driven, virtual stylesheets, scoped styles, element queries, JIC, JS-in-CSS, jsincss, mixins, helper functions, CSS plugins
---

**A flexible CSS reprocessor using `<style>` tags**

<img src=http://tomhodgins.github.io/reprocss/reprocss-logo.svg class=float-center>

reproCSS is a CSS reprocessor that adds a `process=""` attribute to the `<style>` tag in HTML to allow authors to target JavaScript events when reprocessing CSS, as well as interpolate JavaScript.

Can you imagine if you could interpolate JS inside CSS with the `${}` syntax, and also control when and how frequently that CSS reprocessed with a `process=""` attribute on the `<style>` tag:

```html
<style process="none"></style>
<style process="once"></style>
<style process="auto"></style>
<style process="touchstart mousedown"></style>
```

If you are using reproCSS with custom events, you may also optionally use a `selector` attribute specify a list of one or more CSS selectors you would like to add event listeners for. If no `selector` attribute is found all custom events will be applied to window.

```
<style process="click" selector="#any, .css, [selector]"></style>
```

  You can add the CSS you want reprocss.js to apply to your HTML in `<style>` tags with the following values on the `process` attribute:

  - `none` means no reprocessing
  - `once` means process immediately and never again
  - `auto` runs every `resize`, `input`, and `click` event on window
  - any space-separated list of JS events you wish to listen for

## How to use reproCSS

### Github

Include the `reprocss.js` JavaScript plugin in your HTML:

```html
<script src="reprocss.js"></script>
```

### npm

If you are using reproCSS on npm you can include it in your JS modules with a line like this:

```javascript
const reprocss = require('reprocss')
```

## How to write reproCSSed CSS

To evaluate JavaScript inside the CSS as it's being reprocessed by `reprocss.js` you can use the `${}` interpolation syntax. The following `<style>` tag would always ensure the `<div>` in this example was half of the window’s height:

```html
<style process="auto">
  div {
    height: calc(${innerHeight}px / 2);
  }
</style>
```

When the browser is 1000px tall the `${innerHeight}` in our CSS will be output as `500`, leading to the following output:

```html
<style process="auto">
  div {
    height: calc(500px / 2);
  }
</style>
```

Currently this plugin only supports `<style>` tags, but it may be possible to support CSS loaded via `<link>` with a similar technique.

## Examples

### Interpolating JS-supplied values in CSS content:;

```html
<div>Hello</div>

<script>
  var user = 'Username'
</script>

<style process="once">
  div:after {
    content: ' ${user}';
  }
</style>
```

### Element Queries via a JS Selector Resolver

```html
<div id="demo">
  <p>Hello</p>
</div>

<style process="resize">
  ${demo.offsetWidth > 400 && "#demo"} {
    background: lime;
  }
  ${demo.offsetWidth > 400 && "#demo"} p {
    color: red;
  }
</style>
```

### JS interpolation in CSS

```html
<textarea id="demo"></textarea>

<style process="input">
  #demo {
    background: hsl(${demo.value.length}, 50%, 50%)
  }
</style>
```

## Demos

- [Element Queries with reproCSS](https://tomhodgins.github.io/reprocss/test/element-queries.html)
- [Min/Max Font Size](https://codepen.io/tomhodgins/pen/ZyraEQ)
- [Attribute Values as Numbers](https://codepen.io/tomhodgins/pen/QgQqwx)
- [Regex Search on Attribute Value](https://codepen.io/tomhodgins/pen/MoQmdY)
- [Cursor Tracking](https://codepen.io/tomhodgins/pen/MoQmLY)
- [Scalable Iframe](https://codepen.io/tomhodgins/pen/awqWNz)

- [View reproCSS demos on CodePen](https://codepen.io/search/pens/?q=reprocss)

## Mixins

Writing mixins for reproCSS is easy, any JavaScript function that outputs code that can be used in CSS can be called from anywhere in the stylesheet reproCSS is processing using JS interpolation with `${}`.

An example of a common mixin template might look like this:

```javascript
function mixin(selector, rule) {

  // Find tags in document matching selector
  var tag = document.querySelectorAll(selector)

  // Begin with an empty style
  var style = ''

  // Begin counting matching tags at 0
  var count = 0

  // For each tag matching our selector
  for (var i=0; i<tag.length; i++) {

    // Create an identifier based on the selector used
    var attr = selector.replace(/\W+/g, '')

    // Mark tag with a custom attribute containing identifier and count
    tag[i].setAttribute('data-mixin-' + attr, count)

    // Add a copy of the CSS rule to the style using a selector for this tag's unique attribute
    style += '\n[data-mixin-' + attr + '="' + count + '"] {\n'
             + '  ' + rule + '\n'
             + '}\n'

    // Increment the tag counter by +1
    count++

  }

  // Return all generated styles as CSS text
  return style

}
```

If you were going to create a mixin starting from the template above the first thing you'd want to do is change the function name (currently `mixin()`) to something unique, as well as update the mentions of `mixin` inside the mixin logic where it’s used to name the elements the mixin is styling, `data-mixin`. Once you have changed the name of the function, you can pass a CSS selector or a list of CSS selectors into to the plugin, along with CSS properties and values as a string to be processed and added to new rules. This basic template can be extended in many ways to support different things. Here are some examples of reproCSS mixins and helper functions:

## Mixins

- [Ancestor Selector Mixin](ancestor-selector-mixin.html)
- [Aspect Ratio Mixin](aspect-ratio-mixin.html)
- [Auto-Expand Mixin](auto-expand-mixin.html)
- [Closest Selector Mixin](closest-selector-mixin.html)
- [Container Queries Mixin](container-queries-mixin.html)
- [Elder Selector Mixin](elder-selector-mixin.html)
- [Parent Selector Mixin](parent-selector-mixin.html)
- [Previous Selector Mixin](prev-selector-mixin.html)
- [Scoped Eval Mixin](scoped-eval-mixin.html)
- [XPath Selector Mixin](xpath-selector-mixin.html)

## Techniques Capable

- [Element Queries](../techniques/element-queries.html)
- [Container Queries](../techniques/container-queries.html)
- [Using an Element’s Width](../techniques/element-width.html)
- [Using an Element’s Height](../techniques/element-height.html)
- [Using an Element’s Text Characters](../techniques/element-characters.html)
- [Using an Element’s Child Elements](../techniques/element-children.html)
- [Using an Element’s Scroll Position](../techniques/element-scroll.html)
- [Using an Element’s Aspect Ratio](../techniques/element-aspect-ratio.html)
- [Using an Element’s Orientation](../techniques/element-orientation.html)
- [Element-Based Units](../techniques/element-based-units.html)
- [Select the First Element Matching a Selector](../techniques/first-selector-in-document.html)
- [Select the Ancestor of an Element](../techniques/ancestor-of-element.html)
- [Select the Parent of an Element](../techniques/parent-of-element.html)
- [Select Elder Siblings of an Element](../techniques/elder-siblings-of-element.html)
- [Select the Previous Sibling of an Element](../techniques/previous-sibling-of-element.html)
- [Select an Element by a Child it Contains](../techniques/child-element.html)
- [Select an Element by Text Content](../techniques/text-content.html)
- [Select Void Tags When Empty](../techniques/empty-void-tags.html)
- [Select Elements with a Partial Tag Name](../techniques/partial-tag-name-match.html)
- [Select Elements with a Partial Attribute Name](../techniques/partial-attribute-name-match.html)
- [Scaling any HTML Element](../techniques/scalable-element.html)
- [Compare Attribute Values as Numbers](../techniques/number-comparisons-for-attribute-values.html)

## Links

- [reproCSS website](https://tomhodgins.github.io/reprocss/)
- [reproCSS on Github](https://github.com/tomhodgins/reprocss)
- [reproCSS demos on CodePen](https://codepen.io/collection/nVmzEO/)