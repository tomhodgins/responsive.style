---
title: Style Scoping
keywords: style scoping, scoped styles, containment, modules, hash, unique identifier, element queries
description: What is 'style scoping'? Learn about how CSS rules and stylesheets can be scoped to individual elements, and the new techniques style scoping makes possible.
---

Normally all CSS is written in the global scope. This means that the point of reference for all styling begins with the `<html>` element and inherits downward through its child elements.

With scoped CSS you have the ability to pick any element as a point of reference, and by ‘scoping’ an element you create a context that can be used to select other elements, or to apply styles using values about the scoped element as it appears on the page. (Like using the scoped element’s `offsetWidth` as reported by the browser inside the CSS you are using to write your styles.)

## Parts Required

### Selector

The selector for a scoped style can be any type of selector that matches an element in the DOM. CSS selectors, JavaScript, and XPath can all be used to select elements.

###CSS Code

The CSS code for a scoped style usually contains a responsive breakpoint, or values where you want to test and use the values from the context of each element matching your selector separately.

### JS Tests

The JS test associated with a scoped style is usually either a selector resolver determining which elements to apply styles to, or a JavaScript-powered dynamic value.

### JS Events

The simplest use case for a scoped style would only be to process it once when the page loads. But often you’ll want to recalculate the CSS code after things have happened, like the browser has changed size, or the user has interacted with the page.

While you can use things like Resize Observer or Mutation Observers, or add JavaScript event listeners to specific elements on the page, in general most use cases can be accounted for by listening to the following four global events:

- `window.load`
- `window.resize`
- `window.input`
- `window.click`

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [VARIUS](../plugins/varius.html)

## Syntax Examples

In the examples below we could say that this is a ‘scoped style’ written for all `<div class=demo>` elements (indivudally). We would also call each `<div class=demo>` our ‘scoped element’, or ‘the element in our scope’.

### EQCSS

```css
@element '.demo' {
  $this {
    /* scoped to each .demo */
  }
}
```

### Selectory

```css
.demo[test="true"] {
  /* scoped to each .demo */
}
```

### Container Queries Mixin

```javascript
container('.demo', 'true', '', '/* scoped to each .demo */')
```

### Scoped Eval Mixin

```javascript
scoped('.demo', '/* scoped to each .demo */')
```

### VARIUS

```css
.demo { /* scoped to each .demo */ }
```

## Further Reading

- [How Style Scoping Works](https://codepen.io/tomhodgins/post/how-style-scoping-works-with-element-queries)
- [Scoped Styles in CSS Element Queries spec](https://tomhodgins.github.io/element-queries-spec/element-queries.html#scoped-styles)