---
title: Clamped Values
keywords: number clamp, clamped, min, max, minimum, maximum, css locks
---

CSS has scalable units like `%`, the viewport-percentage lengths (`vw`, `vh`, `vmin`, and `vmax`) and even more. Another type of scalable unit not part of CSS that some designers with with is the idea of the [element-based unit](element-based-units.html). With all of these, there might be the desire to ‘clamp’ the value with a certain minimum or maximum value, effectively setting a range for the scalable value that it cannot exceed.

Thankfully CSS has a `minmax()` function that acts like a number clamp in some situations, but unfortunately it’s limited to the Grid display module. There are a number of situations when styling websites where being able to clamp scalable units would be helpful, including sizing fonts, setting percentage-based margins and padding, and much more. It’s unfortunate that CSS’s `minmax()` function is too limited to work in these cases, but there are workarounds. In the future CSS is gaining `min()` and `max()` functions which will be able to be used anywhere, and even nested within each other to perform number clamping like `min(max(10px, 10vw, 100px))`.

## Parts Required

### JS Tests

In order to clamp a scalable value using JavaScript you need a small amount of logic. I’ve expressed the logic three different ways below, but the most efficient expression is:

```javascript
Math.min(Math.max(min, mid), max)
```

Number clamp utility function using `if`:

```javascript
function ifClamp(min, mid, max) {

  if (min < mid && mid < max) {

    return mid

  } else if (mid < min) {

    return min

  } else if (max < mid) {

    return max

  }

}
```

Number clamp utility function using ternary expressions:

```javascript
function ternaryClamp(min, mid, max) {

  return mid < min ? min : mid < max ? mid : max

}
```

Number clamp utility function using `Math.min()` and `Math.max()`:

```javascript
function mathClamp(min, mid, max) {

  return Math.min(Math.max(min, mid), max)

}
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Scoped Eval](../plugins/scoped-eval-mixin.html)

### Syntax Examples

### EQCSS

```
<style>
@element .demo {
  $this {
    font-size: eval("Math.min(Math.max(10, offsetWidth/10), 100)")px;
  }
}
```

### Scoped Eval Mixin

```javascript
scoped('.demo', `
  font-size: eval(Math.min(Math.max(10, this.offsetWidth/10), 100))px;
`)
```

## Demos

- [Number Clamp in EQCSS](https://codepen.io/tomhodgins/pen/ALWaVr)

## Further Reading

- [`minmax()` on MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/minmax)
- [`min()` and `max()` in the CSS Values spec](https://drafts.csswg.org/css-values/#calc-notation)
- [CSS “Locks”](https://fvsch.com/code/css-locks)
- [Number Clamps in JavaScript](https://codepen.io/tomhodgins/post/number-clamps-in-javascript)