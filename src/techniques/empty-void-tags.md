---
title: Selecting Void Tags When Empty
keywords: element queries, scoped styles, selector, :empty, :blank, selector resolver
---

Css has specified two pseudo-classes that should select an element when it has no contents, `:empty` and `:blank`, but both of these enjoy different browser support and aren't always right for the situation where you want to apply styles. Especially when the situation is styling `<input>` tags, being able to detect when the tag is completely empty can be very useful.

## Parts Required

### JS Tests

Value is `undefined`:

```javascript
!element.value
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Varsity](../plugins/varsity.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [VARIUS](../plugins/varius.html)

## Syntax Examples

### EQCSS

```css
@element select {
  eval('!value && "$this"') {
    border: 5px solid lime;
  }
}
```

### Selectory

```css
select[test='!this.value'] {
  border: 5px solid lime;
}
```

## Demos

- [Select an empty `<select>` with EQCSS](https://codepen.io/tomhodgins/pen/bqJdNK)
- [Select an empty `<select>` with Selectory](https://codepen.io/tomhodgins/pen/XRZXOz)