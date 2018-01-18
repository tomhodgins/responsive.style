---
title: Useful Tests for JS-Powered Styling
keywords: JS tests, responsive features, query conditions, container queries, element queries
description: These are the most useful JavaScript tests for writing element queries and container queries for your stylesheets, or if you are building your own element query plugin.
---

This page is filled with JavaScript-based tests that are useful for styling, whether it's trying to target selectors CSS can't normally reach, or trying to use element queries or container queries check out the list below for tests that can be used with the CSS reprocessors like [EQCSS](https://github.com/eqcss/eqcss), [JS-in-CSS](https://github.com/tomhodgins/js-in-css), [Selectory](https://github.com/tomhodgins/cssplus#selectory-a-selector-resolver), [reproCSS](https://github.com/tomhodgins/reprocss), and more!

### Width-based tests

```javascript
el => el.offsetWidth < 500  // less than 500px wide
el => el.offsetWidth <= 500 // less or equal to 500px wide
el => el.offsetWidth == 500 // 500px wide
el => el.offsetWidth >= 500 // greater or equal to 500px wide
el => el.offsetWidth > 500  // greater than 500px wide
```

### Height-based tests

```
el => el.offsetHeight < 500  // less than 500px tall
el => el.offsetHeight <= 500 // less or equal to 500px tall
el => el.offsetHeight == 500 // 500px tall
el => el.offsetHeight >= 500 // greater or equal to 500px tall
el => el.offsetHeight > 500  // greater than 500px tall
```

### Text Length tests

```javascript
el => el.value.length < 5  // less than 5 characters
el => el.value.length <= 5 // less or equal to 5 characters
el => el.value.length == 5 // 5 characters
el => el.value.length >= 5 // greater or equal to 5 characters
el => el.value.length > 5  // greater than 5 characters

el => el.textContent.length < 5  // less than 5 characters
el => el.textContent.length <= 5 // less or equal to 5 characters
el => el.textContent.length == 5 // 5 characters
el => el.textContent.length >= 5 // greater or equal to 5 characters
el => el.textContent.length > 5  // greater than 5 characters
```

### Children-based tests

```javascript
el => el.children.length < 5  // less than 5 children
el => el.children.length <= 5 // less or equal to 5 children
el => el.children.length == 5 // 5 children
el => el.children.length >= 5 // greater or equal to 5 children
el => el.children.length > 5  // greater than 5 children
```

### Scroll-based tests

```javascript
el => el.scrollLeft < 50  // less than 50px scrolled right
el => el.scrollLeft <= 50 // less or equal to 50px scrolled right
el => el.scrollLeft == 50 // 50px scrolled right
el => el.scrollLeft >= 50 // greater or equal to 50px scrolled right
el => el.scrollLeft > 50  // greater than 50px scrolled right

el => el.scrollTop < 50  // less than 50px scrolled down
el => el.scrollTop <= 50 // less or equal to 50px scrolled down
el => el.scrollTop == 50 // 50px scrolled down
el => el.scrollTop >= 50 // greater or equal to 50px scrolled down
el => el.scrollTop > 50  // greater than 50px scrolled down
```

### Aspect-ratio-based tests

```javascript
el => el.offsetWidth/el.offsetHeight < 16/9  // less than 16/9
el => el.offsetWidth/el.offsetHeight <= 16/9 // less or equal to 16/9
el => el.offsetWidth/el.offsetHeight == 16/9 // 16/9
el => el.offsetWidth/el.offsetHeight >= 16/9 // greater or equal to 16/9
el => el.offsetWidth/el.offsetHeight < 16/9  // greater than 16/9
```

### Orientation-based tests

```javascript
el => el.offsetWidth < el.offsetHeight  // portrait orientation
el => el.offsetWidth == el.offsetHeight // square orientation
el => el.offsetWidth > el.offsetHeight  // landscape orientation
```

## Selectors

### Parent of `el`

```javascript
el.parentElement
```

### Closest Matching Ancestor of `el`

```javascript
el.closest('selector')
```

### Previous Sibling of el

```javascript
el.previousElementSibling
```

### `el` Contains Selector

```javascript
el.querySelector('selector')
```

## Demos

### Using EQCSS 

<p data-height="300" data-theme-id="26478" data-slug-hash="NrxqPo" data-default-tab="html,result" data-user="tomhodgins" data-embed-version="2" data-pen-title="Element Query Demos!!!" data-editable="true" class="codepen">See the Pen <a href="https://codepen.io/tomhodgins/pen/NrxqPo/">Element Query Demos!!!</a> by Tommy Hodgins (<a href="https://codepen.io/tomhodgins">@tomhodgins</a>) on <a href="https://codepen.io">CodePen</a>.</p>

### Using Selectory

<p data-height="300" data-theme-id="26478" data-slug-hash="ZKmXXw" data-default-tab="html,result" data-user="tomhodgins" data-embed-version="2" data-pen-title="Element Queries with CSSplus/Selectory" data-editable="true" class="codepen">See the Pen <a href="https://codepen.io/tomhodgins/pen/ZKmXXw/">Element Queries with CSSplus/Selectory</a> by Tommy Hodgins (<a href="https://codepen.io/tomhodgins">@tomhodgins</a>) on <a href="https://codepen.io">CodePen</a>.</p>

### Using reproCSS

<p data-height="300" data-theme-id="26478" data-slug-hash="EXoOQQ" data-default-tab="html,result" data-user="tomhodgins" data-embed-version="2" data-pen-title="Element Queries with reproCSS" data-editable="true" class="codepen">See the Pen <a href="https://codepen.io/tomhodgins/pen/EXoOQQ/">Element Queries with reproCSS</a> by Tommy Hodgins (<a href="https://codepen.io/tomhodgins">@tomhodgins</a>) on <a href="https://codepen.io">CodePen</a>.</p>

### Using JS-in-CSS

<p data-height="300" data-theme-id="26478" data-slug-hash="bYgLmQ" data-default-tab="html,result" data-user="tomhodgins" data-embed-version="2" data-pen-title="Container Query Demo using JS-in-CSS" data-editable="true" class="codepen">See the Pen <a href="https://codepen.io/tomhodgins/pen/bYgLmQ/">Container Query Demo using JS-in-CSS</a> by Tommy Hodgins (<a href="https://codepen.io/tomhodgins">@tomhodgins</a>) on <a href="https://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>

<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>