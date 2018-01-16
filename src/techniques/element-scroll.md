---
title: Using an Element’s Scroll Position
keywords: element queries, container queries, scoped styles, scrollHeight, offsetHeight, variables, reactive
---

Currently CSS Doesn't have any way to apply styles based on the document's scroll position or the scroll position of individual elements on the page. The closest CSS comes is the `position: sticky` spec, but in this case we're only able to harness the scroll event in the most basic way.

JavaScript has a much more useful knowledge of the scroll dimensions of an element - it's current scroll position as well as it's current scroll size, which when paired with knowledge of its rendered width and height provide a powerful context for applying styles that CSS is currently ignorant of.

## Parts Required

### JS Tests

Min-Scroll Y:

```javascript
test < this.scrollTop
```

Max-Scroll Y:

```javascript
this.scrollTop < test
```

Min-Scroll X:

```javascript
test < this.scrollLeft
```

Max-Scroll X:

```javascript
this.scrollLeft < test
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Scrollery](../plugins/scrollery.html)
- [Selectory](../plugins/selectory.html)
- [reproCSS](../plugins/reprocss.html)
- [Auto Expand Mixin](../plugins/auto-expand-mixin.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [VARIUS](../plugins/varius.html)

## Syntax Examples

### EQCSS

```css
@element .min-scroll-x and (min-scroll-x: 50%) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}

@element .max-scroll-x and (max-scroll-x: 50%) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}

@element .min-scroll-y and (min-scroll-y: 50%) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}

@element .max-scroll-y and (max-scroll-y: 50%) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}
```

### Selectory

```css
.min-scroll-x[test="this.scrollLeft > 100"] {
  background: lime;
}

.max-scroll-x[test="this.scrollLeft < 100"] {
  background: lime;
}

.min-scroll-y[test="this.scrollTop > 50"] {
  background: lime;
}

.max-scroll-y[test="this.scrollTop < 50"] {
  background: lime;
}
```

## Demos

- [Min-Scroll-X Element Query with EQCSS](https://codepen.io/tomhodgins/pen/ZOQGOb)
- [Max-Scroll-X Element Query with EQCSS](https://codepen.io/tomhodgins/pen/ezJNzJ)
- [Min-Scroll-Y Element Query with EQCSS](https://codepen.io/tomhodgins/pen/OXMVNa)
- [Max-Scroll-Y Element Query with EQCSS](https://codepen.io/tomhodgins/pen/beEdpZ)
- [Scroll-based Element Queries with Selectory](https://codepen.io/tomhodgins/pen/ZKmXXw)

## Further Reading

- [Scroll-Y feature from CSS Element Queries spec](https://tomhodgins.github.io/element-queries-spec/element-queries.html#scroll-y)
- [Scroll-X feature from CSS Element Queries spec](https://tomhodgins.github.io/element-queries-spec/element-queries.html#scroll-x)