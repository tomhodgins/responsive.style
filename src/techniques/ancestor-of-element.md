# Selecting the Ancestor of an Element

CSS is limited to selecting elements, their following (younger) siblings, and children — but is unable to select elements ‘above’ or before elements in the tree structure. CSS in browsers can’t select the parent, or ancestor of another element. There is a selector in the CSS specs called [`:has()`](https://drafts.csswg.org/selectors/#relational) which would allow you to select the ancestor of an element matching another CSS selector, but despite being in the spec for years there is currently [zero browser support for `:has()`](http://caniuse.com/#feat=css-has).

Sometimes, especially when working with HTML you don’t have the ability to alter, it would be nice to be able to select an ancestor of another element for styling. While CSS is unable to work in these situations, both JavaScript and XPath are able to achieve this.

## Parts Required

There are two ways you can search for ancestors of elements using JavaScript in the browser, `document.closest()` for matching CSS selectors, or `document.evaluate()` to evaluate an XPath selector that selects the ancestor of another element.

### JS Tests

Closest ancestor matching CSS Selector:

```javascript
element.closest(test)
```

Selecting and element that contains another CSS selector:

```javascript
element.querySelector(test)
```

## Syntax Examples

## Selectory

Find first ancestor of `id="demo"` with `class="target"`:

```css
[test="document.querySelector('#demo').closest(test) == this"] {
  background: lime;
}
```

## Xpathy

Find all ancestors of `id="demo"` that have `class="target"`:

```css
[xpath="//*[@id='demo']/ancestor::*[@class='target']"] {
  background: lime;
}
```

## XPath Selector Mixin

```javascript
xpath('//*[@id="demo"]/ancestor::*[@class="target"]', `
  background: lime;
`)
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [XPathy](../plugins/xpathy.html)
- [reproCSS](../plugins/reprocss.html)
- [Ancestor Selector Mixin](../plugins/ancestor-selector-mixin.html)
- [Closest Selector Mixin](../plugins/closest-selector-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [XPath Selector Mixin](../plugins/xpath-selector-mixin.html)

## Demos

- [Selecting the Parent and Ancestor of an element using JavaScript](https://codepen.io/tomhodgins/pen/OmEEaK)
- [Closest Selector Mixin demo with reproCSS](https://codepen.io/tomhodgins/pen/gRQqGB)

## Further Reading

- [`Element.closest()` on MDN](https://developer.mozilla.org/en-US/docs/Web/API/Element/closest)
- [CanIUse browser support for `Element.closest()`](http://caniuse.com/#feat=element-closest)
- [Overview of XPath Axes](https://www.w3schools.com/xml/xpath_axes.asp)
- [Axes in the XPath spec](https://www.w3.org/TR/xpath-30/#axes)