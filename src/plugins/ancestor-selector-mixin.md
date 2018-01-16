---
title: Ancestor Selector Mixin
keywords: CSS, ancestor, mixin, helper function
---

This mixin lets CSS authors apply styles to all ancestor elements matching a CSS selector to another element matching a given CSS selector. You can use this to style all matching ancestors.

## Syntax

```javascript
ancestor(selector, ancestor, rule)
```

- `selector` is a CSS selector
- `ancestor` is a CSS selector
- `rule` is one or more CSS declarations separated by semicolons

## Example

Input:

```javascript
ancestor('#start', '.target', `border-color: lime`)
```

Output:

```css
/* #start:ancestor(.target) */
[data-ancestor-unique="0"] {
  border-color: lime;
}
```

## Code

```javascript
function ancestor(selector, ancestor, rule) {

  var tag = document.querySelectorAll(ancestor)
  var style = ''
  var count = 0

  for (var i=0; i<tag.length; i++) {

    var descendant = tag[i].querySelector(selector)

    if (descendant) {

      var attr = (selector+ancestor).replace(/\W+/g, '')

      tag[i].setAttribute('data-ancestor-' + attr, count)

      style += '\n/* ' + selector + ':ancestor(' + ancestor + ') */\n'
             + '[data-ancestor-' + attr + '="' + count + '"] {\n'
             + '  ' + rule + '\n'
             + '}\n'

      count ++

    }

  }

  return style

}
```

## Techniques Capable

- [Selecting the Ancestor of an Element](../techniques/ancestor-of-element.html)
- [Selecting the Parent of an Element](../techniques/parent-of-element.html)

## Links

- [Source Code on Github](https://github.com/tomhodgins/reprocss/blob/master/mixins/ancestor-selector.js)
- [Ancestor Selector Mixin Demo](https://tomhodgins.github.io/reprocss/test/ancestor-selector-mixin.html)