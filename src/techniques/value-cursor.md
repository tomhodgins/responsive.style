---
title: Using the Cursor Position for Styling
keywords: cursor, mouse, pointer, position, coordinates, trailing, tracking, follow, trails
description: How can you use the mouse's position in your styles? JavaScript is aware of the mouse or pointer's position, learn how to use JavaScript and CSS together to style based on the cursor.
---

There are ways to style elements based on the cursor position at the level of a selector with CSS pseudo-classes like `:hover` and `:active`, but CSS has no knowledge of the exact cursor position so it's unable to use this for the purpose of styling as a value.

JavaScript can listen to mouse events, as well as keep track of the current cursor position. There are a number of ways that JavaScript can supply knowledge of the cursor, it's state, and its position to CSS for the purpose of styling.

## Parts Required

### JS Tests

Exposing the mouse or touchscreen cursor location as CSS variables named `cursorX` and `cursorY`:

```javascript
function updateCursor(e) {

  var x = e.clientX || e.touches[0].clientX
  var y = e.clientY || e.touches[0].clientY

  document.documentElement.style.setProperty('--cursorX', x)
  document.documentElement.style.setProperty('--cursorY', y)

}

window.addEventListener('mousemove', updateCursor)
window.addEventListener('touchmove', updateCursor)
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Cursory](../plugins/cursory.html)
- [reproCSS](../plugins/reprocss.html)