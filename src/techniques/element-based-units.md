---
title: Element-Based Units
keywords: element units, EW, EH, EMIN, EMAX, element-based, percentage, viewport units, CSS units, element height
---

One thing that would be useful when writing CSS would be a set of units that behave similar to the [viewport-percentage units](https://drafts.csswg.org/css-values-4/#viewport-relative-lengths) `vw`, `vh`, `vmin`, and `vmax` (which represent 1% of the browser’s width, height, shortest edge, and longest edge), but instead of being based on the size of the browser’s viewport they would be based on the dimensions of each individual element to which they apply.

Let’s call these new units “element-percentage units”, and name them `ew`, `eh`, `emin`, and `emax`. What benefit would they be over the existing CSS units, like `%` or the viewport-percentage units? Possible benefits include:

- styling the `height` in relation to the rendered `offsetWidth`
- responsive font sizing _similar to using `vw`_ but without needing to be in a full-width container

## Parts Required

### JS Tests

Element Width units:

```javascript
element.offsetWidth / 100 + 'px'
```

Element Height units:

```javascript
element.offsetHeight / 100 + 'px'
```

Element Minimum units:

```javascript
Math.min(element.offsetWidth, element.offsetHeight) / 100 + 'px'
```

Element Maximum units:

```javascript
Math.max(element.offsetWidth, element.offsetHeight) / 100 + 'px'
```

### JS Events

You can listen on any events, including using [Resize Observer](http://rawgit.com/WICG/ResizeObserver/master/index.html) or [Mutation Observer](https://developer.mozilla.org/en/docs/Web/API/MutationObserver) to help detect when changes may have occurred.

In general you can satisfy most use cases by listening to the following four events:

- `window.load`
- `window.resize`
- `window.input`
- `window.click`

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Varsity](../plugins/varsity.html)
- [reproCSS](../plugins/reprocss.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [VARIUS](../plugins/varius.html)

## Syntax Examples

### EQCSS

#### `ew` unit

Equal to 1% of the width of the scoped element

Example of `ew` Units Inside a Scoped Style

```css
@element .widget {
  $this {
    font-size: 10ew;
  }
}
```

In this case the `font-size` of any element with a class of `.widget` is equal to 10% of the scoped element’s width.

#### `eh` unit

Equal to 1% of the height of the scoped element

Example of `eh` Units Inside a Scoped Style

```css
@element .widget {
  $this {
    font-size: 10eh;
  }
}
```

In this case the `font-size` of any element with a class of `.widget` is equal to 10% of the scoped element’s height.

#### `emin` unit

Equal to the smaller of `1ew` or `1eh`

Example of `emin` Units Inside a Scoped Style

```css
@element .widget {
  $this {
    font-size: 10emin;
  }
}
```

In this case the `font-size` of any element with a class of `.widget` is equal to 10% of the scoped element’s shortest edge.

#### `emax` unit

Equal to the larger of `1ew` or `1eh`

Example of `emax` Units Inside a Scoped Style

```css
@element .widget {
  $this {
    font-size: 10emax;
  }
}
```

In this case the `font-size` of any element with a class of `.widget` is equal to 10% of the scoped element’s longest edge.

#### Varsity

```css
#demo {
  height: calc((var(--demo-offsetWidth) / 100px) * 50);
}
```

#### reproCSS

```html
<style process=auto>
  #demo {
    height: ${demo.offsetWidth}px;
  }
</style>
```

#### Scoped Eval Mixin

```javascript
scoped('.demo', 'height: eval((this.offsetWidth / 100) * 50)px;')
```

#### VARIUS

```css
.demo {
  height: calc((var(--offsetWidth) / 100) * 50px);
}
```

## Demos

- [Responsive `border` sizing with EQCSS and `ew` units](https://codepen.io/tomhodgins/pen/YNKVMQ)
- [Using EQCSS and `ew` units for responsive scalable aspect ratio](https://codepen.io/tomhodgins/pen/wovGev)
- [Element-Based font sizing with CSSplus/Varsity](https://codepen.io/tomhodgins/pen/mmXVjg)

## Further Reading

- [Element-Percentage Units from CSS Element Queries spec](https://tomhodgins.github.io/element-queries-spec/element-queries.html#element-percentage-units)