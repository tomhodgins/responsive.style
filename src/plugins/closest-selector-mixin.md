# Closest Selector Mixin

This mixin lets CSS authors apply styles to the nearest element matching a CSS selector to another element matching a given CSS selector. You can use this to find the nearest matching ancestor.

## Syntax

```javascript
closest(selector, ancestor, rule)
```

- `selector` is a CSS selector
- `ancestor` is a CSS selector
- `rule` is one or more CSS declarations separated by semicolons

## Example

Input:

```javascript
closest('#start', '.target', `border-color: lime`)
```

Output:

```css
/* #start:closest(.target) */
[data-closest-unique="0"] {
  border-color: lime
}
```

## Code

```javascript

function closest(selector, ancestor, rule) {

  var tag = document.querySelectorAll(selector)
  var style = ''
  var count = 0

  for (var i = 0; i < tag.length; i++) {

    var attr = (selector+ancestor).replace(/\W+/g, '')

    tag[i].closest(ancestor).setAttribute('data-closest-' + attr, count)

    style += '\n/* ' + selector + ':closest(' + ancestor + ') */\n'
             + '[data-closest-' + attr + '="' + count + '"] {\n'
             + '  ' + rule + '\n'
             + '}\n'

    count++

  }

  return style

}
```

## Techniques Capable

- [Select the Ancestor of an Element](../techniques/ancestor-of-element.html)
- [Select the Parent of an Element](../techniques/parent-of-element.html)

## Links

- [Source Code on Github](https://github.com/tomhodgins/reprocss/blob/master/mixins/closest-selector.js)
- [Closest Selector Mixin Demo](https://tomhodgins.github.io/reprocss/test/closest-selector-mixin.html)