# Parent Selector Mixin

This JavaScript function lets you define a CSS selector list and apply a CSS rule to the parent node of any matching tags in your document.

## Syntax

```javascript
parent(selector, rule)
```

- `selector` is a CSS selector
- `rule` is one or more CSS declarations separated by semicolons

## Example

Input:

```javascript
parent('li', 'border: 1px solid red;')
```

Output:

```css
/* li:parent */
[data-parent-unique="0"] {
  border: 1px solid red;
}
```

## Code

```javascript
function parent(selector, rule) {

  var tag = document.querySelectorAll(selector)
  var style = ''
  var count = 0

  for (var i = 0; i < tag.length; i++) {

    var attr = selector.replace(/\W+/g, '')

    tag[i].parentNode.setAttribute('data-parent-' + attr, count)

    style += '\n/* '+ selector + ':parent */\n'
             + '[data-parent-' + attr + '="' + count + '"] {\n'
             + '  ' + rule + '\n'
             + '}\n'

    count++

  }

  return style

}
```

## Techniques Capable

- [Select the Parent of an Element](../techniques/parent-of-element.html)

## Links

- [Source Code on Github](https://github.com/tomhodgins/reprocss/blob/master/mixins/parent-selector.js)
- [Parent Selector Mixin Demo](https://tomhodgins.github.io/reprocss/test/parent-selector-mixin.html)