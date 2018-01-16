---
title: Using an Element’s Aspect Ratio
keywords: scalable, aspect, ratio, aspect ratio, crop, resize, embed, iframe
---

All elements in HTML are represented by boxes, which means all elements have a width and a height (even if the value of those is zero). Therefore there is always a relationship between the width and height of an element which can be described as its aspect ratio, represented by `aspect ratio = width ÷ height`.

CSS recognizes that styling based on the current state of the aspect ratio is useful at the level of the document with the [Orientation feature](https://drafts.csswg.org/mediaqueries/#orientation), but this is based on the viewport, equal to the aspect ratio of the `<html>` element and doesn't offer any way to apply styles to any other element based on its own aspect ratio.

## Parts Required

### JS Tests

Aspect ratio of element as it appears in the browser:

```javascript
element.offsetWidth / element.offsetHeight
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Aspecty](../plugins/aspecty.html)
- [Selectory](../plugins/selectory.html)
- [reproCSS](../plugins/reprocss.html)
- [Aspect Ratio Mixin](../plugins/aspect-ratio-mixin.html)
- [Auto Expand Mixin](../plugins/auto-expand-mixin.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [VARIUS](../plugins/varius.html)

## Syntax Examples

## CSS (for the `<html>` element only)

```css
@media (min-aspect-ratio: 16/9) {
  body {
    background: lime;
  }
}
```

```css
@media (max-aspect-ratio: 16/9) {
  body {
    background: hotpink;
  }
}
```

### EQCSS

```css
@element .min-aspect-ratio and (min-aspect-ratio: 16/9) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}

@element .max-aspect-ratio and (max-aspect-ratio: 16/9) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}
```

### Selectory

```css
.min-aspect-ratio[test="this.offsetWidth/this.offsetHeight > 16/9"] {
  background: lime;
}

.max-aspect-ratio[test="this.offsetWidth/this.offsetHeight < 16/9"] {
  background: lime;
}
```

## Demos

- [Min-Aspect-Ratio Element Query with EQCSS](https://codepen.io/tomhodgins/pen/EgEQZy)
- [Max-Aspect-Ratio Element Query with EQCSS](https://codepen.io/tomhodgins/pen/kkEZAY)
- [Aspect-ratio-based Element Queries with Selectory](https://codepen.io/tomhodgins/pen/ZKmXXw)

## Further Reading

- [Aspect-ratio feature from CSS Media Queries spec](https://drafts.csswg.org/mediaqueries/#aspect-ratio)
- [Aspect-ratio feature from CSS Element Queries spec](https://tomhodgins.github.io/element-queries-spec/element-queries.html#aspect-ratio)