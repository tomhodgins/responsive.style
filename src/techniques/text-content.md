---
title: Selecting an Element by Text Content
keywords: text content, value, innerHTML, it contains, element, text selector, css selector, selector resolver
---

One area where CSS is weak is in styling elements based on their text content. Although CSS attribute selectors can match things like the exact value of an HTML attribute, like `<input value="Example">` with an attribute selector like `input[value="Example"]`, it fails to detect changes to that attribute value in the DOM if the value changes after the page loads. Other than that, there is no way to apply styles based on the inner HTML content, text content, or text value of an element.

Thankfully this is something XPath and JavaScript are capable of detecting, so as long as you can use XPath or JavaScript to help you resolve selectors you can achieve this.

This technique is closely related to selecting elements based on the [number of characters they contain](element-characters.html).

## Parts Required

### JS Tests

String search of `innerHTML` for non-form elements:

```javascript
this.innerHTML.indexOf(test)
```

String search of `value` for form elements:

```javascript
this.value.indexOf(test)
```

Regex search of `innerHTML` for non-form elements:

```javascript
/test/i.test(this.innerHTML)
```

Regex search of `value` for form elements:

```javascript
/test/i.test(this.value)
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [XPathy](../plugins/xpathy.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [XPath Selector Mixin](../plugins/xpath-selector-mixin.html)

## Syntax Examples

### EQCSS

```css
/* regex search  */
@element p {
  eval('/ the /i.test(innerHTML) && "$this"') {
    color: lime;
  }
}

/* string search */
@element p {
  eval('innerHTML.indexOf(" the ") !== -1 && "$this"') {
    border: 1px solid purple;
  }
}
```

### Selectory

```css
/* regex search */
p[test='/ the /i.test(this.innerHTML)'] {
  color: lime;
}

/* string  search */
p[test='this.innerHTML.indexOf(` the `) !== -1'] {
  border: 1px solid purple;
}
```

### XPathy

```css
[xpath="//p[contains(text(), ' the ')]"] {
  background: purple;
}
```

## Demos

- [Selecting element by text content with EQCSS](https://codepen.io/tomhodgins/pen/EZYMyK)
- [Selecting elements by text content with Selectory](https://codepen.io/tomhodgins/pen/WjMrYr)
- [Selecting elements by text content with XPathy](https://codepen.io/tomhodgins/pen/EXajvz)