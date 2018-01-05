# Auto Expand Mixin

This JavaScript function lets you choose between auto-expanding an element’s width and height to match its `scrollWidth` or `scrollHeight`. Available keywords are `width`, `height`, and `both`.

## Syntax

```javascript
autoExpand(selectorList, direction)
```

- `selector` is a CSS selector
- `direction` is a string matching `width`, `height`, or `both`

## Example

Input:

```javascript
autoExpand('textarea', 'height')
```

Output:

```css
/* textarea { height: auto-expand; } */
```

## Code

```javascript
function autoExpand(selector, direction) {

  var tag = document.querySelectorAll(selector)

  for (var i=0; i < tag.length; i++) {

    if (direction == 'width' || direction == 'both') {

      tag[i].style.width = ''
      tag[i].style.width = tag[i].scrollWidth + 'px'

    }

    if (direction == 'height' || direction == 'both') {

      tag[i].style.height = ''
      tag[i].style.height = tag[i].scrollHeight + 'px'

    }

  }

  return '\n/* ' + selector + ' { ' + direction +': auto-expand; } */\n'

}
```

## Techniques Capable

- [Using an Element’s Scroll Position](../techniques/element-scroll.html)

## Links

- [Source Code on Github](https://github.com/tomhodgins/reprocss/blob/master/mixins/auto-expand.js)
- [Auto Expand Mixin Demo](https://tomhodgins.github.io/reprocss/test/auto-expand-mixin.html)