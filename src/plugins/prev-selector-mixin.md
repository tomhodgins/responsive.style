---
title: Previous Selector Mixin
keywords: previous element, previous selector, mixin, helper function, plugin
---

This JavaScript function lets you define a CSS selector list and apply a CSS rule to the previous sibling node of any matching tags in your document.

## Syntax

```javascript
prev(selector, rule)
```

- `selector` is a CSS selector
- `rule` is one or more CSS declarations separated by semicolons

## Example

Input:

```javascript
prev('li:nth-of-type(2)', 'background: lime;')
```

Output:

```css
/* li:prev */
[data-prev-unique="0"] {
  background: lime;
}
```

## Code

```javascript

function prev(selector, rule) {

  var tag = document.querySelectorAll(selector)
  var style = ''
  var count = 0

  for (var i = 0; i < tag.length; i++) {

    var attr = selector.replace(/\W+/g, '')

    tag[i].previousElementSibling.setAttribute('data-prev-' + attr, count)

    style += '\n/* ' + selector + ':prev */\n'
             + '[data-prev-' + attr + '="' + count + '"] {\n'
             + '  ' + rule + '\n'
             + '}\n'

    count++

  }

  return style

}
```

## Techniques Capable

- [Select the Previous Sibling of an Element](../techniques/previous-sibling-of-element.html)

## Links

- [Source Code on Github](https://github.com/tomhodgins/reprocss/blob/master/mixins/prev-selector.js)
- [Prev Selector Mixin Demo](https://tomhodgins.github.io/reprocss/test/prev-selector-mixin.html)