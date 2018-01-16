---
title: XPathy
keywords: XPath, XPath functions, XML path, XPath axes, XPath selector, selector, selector resolver, mixin, helper function, plugin
---

**Using XPath Selectors in CSS**

XPathy is a CSS reprocessor that resolves selectors using XPath. This plugin will read CSS selectors that end with a `[xpath]` attribute and use JavaScript and XPath to determine whether or not to apply that style to elements matching the other part of that selector. For example, the XPath selector `//div` will always resolve to `div`, so a selector written for `div [xpath="//div"] {}` will always apply to each `div div {}` element.

By default, XPathy will reprocess selectors by watching the following events:

- `load`
- `resize`
- `input`
- `click`

To run XPathy whenever you want, use the `xpathy.load()` function in JS.

Other things you can do with XPathy include:

Select all `span` tags with the XPath `//span`:

```css
[xpath="//span"] {
  color: violet;
}
```

Select all elements with a class name of `demo-class` with the XPath `//*[@class='demo-class']`:

```css
[xpath="//*[@class='demo-class']"] {
  color: lime;
}
```

Select an element with a text content of ‘Demo Content’ with the XPath `//*[text()='Demo Content']`:

```css
[xpath="//*[text()='Demo Content']"] {
  color: violet;
}
```

Select the parent element of another element with the XPath `/..`:

```css
[xpath="//*[@class='child']/.."] {
  border: 1px solid lime;
}
```

Compare attribute values as numbers with operators like `>` and `&lt;`:

```css
[xpath="//*[@data-price > 3]"] {
  color: violet;
}
```

Select elements based on the number of children they contain with an XPath like `//ul[li[4]]`:

```css
[xpath="//ul[li[4]]"] {
  color: lime;
}
```

## Techniques Capable

- [Select the Ancestor of an Element](../techniques/ancestor-of-element.html)
- [Select the Parent of an Element](../techniques/parent-of-element.html)
- [Select the Previous Sibling of an Element](../techniques/previous-sibling-of-element.html)
- [Select an Element by a Child it Contains](../techniques/child-element.html)
- [Select an Element by Text Content](../techniques/text-content.html)
- [Select Void Tags When Empty](../techniques/empty-void-tags.html)
- [Select Elements with a Partial Tag Name](../techniques/partial-tag-name-match.html)
- [Select Elements with a Partial Attribute Name](../techniques/partial-attribute-name-match.html)
- [Compare Attribute Values as Numbers](../techniques/number-comparisons-for-attribute-values.html)
- [Using XPath to Select Elements](../techniques/xpath-selector.html)

## Links

- [XPathy on Github](https://github.com/tomhodgins/cssplus/blob/gh-pages/xpathy.js)
- [XPathy Demo](http://tomhodgins.github.io/cssplus/test/xpathy.html)