# Aspect Ratio Mixin

This JavaScript function lets you to define an aspect ratio for elements.

## Syntax

```javascript
aspectRatio(seelctor, ratio)
```

- `selector` is a CSS selector
- `ratio` is a number expressed as `width/height` or a number

## Example

Input:

```javascript
aspectRatio('iframe', 16/9)
```

Output:

```css
/* iframe { aspect-ratio: 1.77; } */
[data-aspect-ratio-unique="0"] {
  height: 503px;
}
```

## Code

```javascript
function aspectRatio(selector, ratio) {

  var tag = document.querySelectorAll(selector)
  var style = ''
  var count = 0

  for (var i=0; i < tag.length; i++) {

    var attr = selector.replace(/\W+/g, '')

    tag[i].setAttribute('data-aspect-ratio-' + attr, count)

    style += '\n/* ' + selector + ' { aspect-ratio: ' + ratio + '; } */\n'
             + '[data-aspect-ratio-' + attr + '="' + count + '"] {\n'
             + '  height: ' + (tag[i].offsetWidth / ratio) + 'px;\n'
             + '}\n'

    count++

  }

  return style

}
```

## Techniques Capable

- [Using an Element’s Aspect Ratio](../techniques/element-aspect-ratio.html)

## Links

- [Source Code on Github](https://github.com/tomhodgins/reprocss/blob/master/mixins/aspect-ratio.js)
- [Aspect Ratio Mixin Demo](https://tomhodgins.github.io/reprocss/test/aspect-ratio-mixin.html)