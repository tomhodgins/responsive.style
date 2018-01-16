---
title: Elder Selector Mixin
keywords: elder selector, elder element, mixin, helper function, plugin
---

This mixin lets CSS authors apply styles to all elder siblings of elements matching a CSS selector.

## Syntax

```javascript
elder(selector, rule)
```

- `selector` is a CSS selector
- `rule` is one or more CSS declarations separated by semicolons

## Example

Input:

```javascript
elder('.demo', 'background: lime;')
```

Output:

```css
[data-elder-unique="0"] {
  background: lime;
}
```

## Code

```javascript
function elder(selector, rule) {

  var tag = document.querySelectorAll(selector)
  var style = ''
  var count = 0

  for (var i=0; i<tag.length; i++) {

    var attr = selector.replace(/\W+/g, '')
    var sibling = tag[i].parentNode.getElementsByTagName('*')
    var tagIndex= [].indexOf.call(sibling, tag[i])

    for (var j=0; j<sibling.length; j++) {

      var siblingIndex = [].indexOf.call(sibling, sibling[j])

      if (siblingIndex < tagIndex) {

        sibling[j].setAttribute('data-elder-' + attr, count)

        style += '\n[data-elder-' + attr + '="' + count + '"] {\n'
                 + '  ' + rule + '\n'
                 + '}\n'
        count++

      } else {

        sibling[j].setAttribute('data-elder-' + attr, '')

      }

    }

  }

  return style

}
```

## Techniques Capable

- [Select Elder Siblings of an Element](../techniques/elder-siblings-of-element.html)

## Links

- [Source Code on Github](https://github.com/tomhodgins/reprocss/blob/master/mixins/elder-selector.js)
- [Elder Selector Mixin Demo](https://tomhodgins.github.io/reprocss/test/elder-selector-mixin.html)