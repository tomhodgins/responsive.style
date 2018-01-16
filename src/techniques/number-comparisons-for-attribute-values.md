---
title: Compare Attribute Values as Numbers
keywords: selector, css selector, attribute selector, compare numbers, compare value, greater than, less than, equal, element, attribute, value
---

CSS has attribute selectors that are able to select elements that contain exact matches of values or partial matches of values, but has no way to select elements by comparing the value of an attribute as a number with operators like `greater than`, `less than`, `greater or equal`, or `less or equal`.

Both JavaScript and XPath are able to evaluate the values of attributes as numbers and select elements based on comparisons like this.

## Parts Required

### JS Tests

Value less than:

```javascript
element.value < test
```

Value less or equal to:

```javascript
element.value <= test
```

Value equal to:

```javascript
element.value == test
```

Value greater or equal to:

```javascript
test <= element.value
```

Value greater than:

```javascript
test < element.value
```

Value between 5 and 10:

```javascript
(5 < element.value) && (element.value < 10)
```

## Syntax Examples

### EQCSS

```css
@element input {
  eval("value > 50 && '$this'") {
    background: lime;
  }
}
```

### Selectory

```css
input[test="this.value > 50"] {
  background: lime;
}
```

### XPathy

```css
[xpath="//*[5 < @data-num]"] {
  color: black;
  background: lime;
}

[xpath="//*[10 <= @data-num][@data-num <= 15]"] {
  color: red;
  border: 1px dotted red;
}
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [Varsity](../plugins/varsity.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [VARIUS](../plugins/varius.html)

## Demos

- [Comparing Attribute Values as Numbers with EQCSS](https://codepen.io/tomhodgins/pen/KmLRbL)
- [Comparing Attribute Values as Numbers with Selectory](https://codepen.io/tomhodgins/pen/wdpJNG)
- [Compare Attribute values as numbers with XPathy](https://codepen.io/tomhodgins/pen/zzxGWQ)