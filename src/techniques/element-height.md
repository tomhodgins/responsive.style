---
title: Using an Element’s Height
keywords: element queries, container queries, scoped styles, scrollHeight, offsetHeight, variables, reactive
description: How can you use knowledge of an element's height for styling? JavaScript is aware of the height of every element, learn how to use JavaScript and CSS together to style elements based on their own height
---

CSS spec authors recognize that applying styles based on the height of an element is a useful ability, at least in the context of the `<html>` element. There is a `height` range feature for Media Queries that can be used to apply styles based on the height of the browser's viewport, but there is not currently any way to apply styles to individual elements in the page based on their own rendered height as they show up in the browser.

Thankfully JavaScript has knowledge of the height of every element in the document, so we can use JavaScript to help us resolve the selectors that should apply.


## Parts Required

### JS Tests

Min-height:

```javascript
test <= element.offsetHeight
```

Max-height:

```javascript
element.offsetHeight <= test
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Cursory](../plugins/cursory.html)
- [Scrollery](../plugins/scrollery.html)
- [Selectory](../plugins/selectory.html)
- [Varsity](../plugins/varsity.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [VARIUS](../plugins/varius.html)

## Syntax Examples

## CSS (limited to `<html>` element)

```css
@media (min-height: 500px) {
  body {
    background: lime;
  }
}
```

```css
@media (max-height: 500px) {
  body {
    background: hotpink;
  }
}
```

### EQCSS

```css
@element .min-height and (min-height: 200px) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}

@element .max-height and (max-height: 200px) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}
```

### Selectory

```css
.min-height[test="this.offsetHeight > 100"] {
  background: lime;
}

.max-height[test="this.offsetHeight < 100"] {
  background: lime;
}
```

## Demos

- [Min-Height Element Query with EQCSS](https://codepen.io/tomhodgins/pen/PzZqPd)
- [Max-Height Element Query with EQCSS](https://codepen.io/tomhodgins/pen/EyPjPg)
- [Height-based Element Queries with Selectory](https://codepen.io/tomhodgins/pen/ZKmXXw)

## Further Reading

- [Height feature from CSS Element Queries spec](https://tomhodgins.github.io/element-queries-spec/element-queries.html#height)