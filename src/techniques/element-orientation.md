---
title: Using an Element’s Orientation
keywords: element queries, container queries, scoped styles, scrollHeight, scrollWidth, offsetHeight, offsetWidth, variables, reactive
---

Similar to aspect ratio, orientation is something CSS spec authors recognize as being useful for styling, but are only support on the `<html>` element itself via Media Queries, and not something that you can use to apply styles to other elements in the document.

The solution is to use JavaScript to determine an element's orientation by measuring the width and height of the element.

## Parts Required

### JS Tests

Portrait:

```javascript
this.offsetWidth < this.offsetHeight
```

Square:

```javascript
this.offsetWidth == this.offsetHeight
```

Landscape:

```javascript
this.offsetHeight < this.offsetWidth 
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)

## Syntax Examples

## CSS (for the `<html>` element only)

```css
@media (orientation: portrait) {
  body {
    background: lime;
  }
}
```

```css
@media (orientation: landscape) {
  body {
    background: hotpink;
  }
}
```

### EQCSS

```css
@element div and (orientation: square) {
  $this {
    background: orchid;
  }
}

@element div and (orientation: portrait) {
  $this {
    background: darkturquoise;
  }
}

@element div and (orientation: landscape) {
  $this {
    background: greenyellow;
  }
}
```

### Selectory

```css
/* portrait */
.orientation[test="this.offsetWidth < this.offsetHeight"] {
  background: orchid;
}

/* square */
.orientation[test="this.offsetWidth == this.offsetHeight"] {
  background: darkturquoise;
}

/* landscape */
.orientation[test="this.offsetWidth > this.offsetHeight"] {
  background: greenyellow;
}
```

## Demos

- [Portrait, Square, and Landscape Orientation Element Queries with EQCSS](https://codepen.io/tomhodgins/pen/wzmyYQ)
- [Orientation-based Element Queries with Selectory](https://codepen.io/tomhodgins/pen/ZKmXXw)

## Further Reading

- [Orientation feature from CSS Element Queries spec](https://tomhodgins.github.io/element-queries-spec/element-queries.html#orientation)