# Selectory

**JavaScript Tests for CSS Selectors**

Selectory is a CSS reprocessor that resolves selectors using JS. This plugin will read CSS selectors that end with a `[test]` attribute and use JavaScript to determine whether or not to apply that style to elements matching the other part of that selector. For example, the JS test `1 == 1` will always resolve to `true`, so a selector written for `div[test="1 == 1"] {}` will always apply to each `div` element.

By default, Selectory will reprocess selectors by watching the following events:

- `load`
- `resize`
- `input`
- `click`

To run Selectory whenever you want, use the `selectory.load()` function in JS.

Other things you can do with Selectory include:

Apply a rule to a `div` when it is wider than 300px:

```css
div[test="this.offsetWidth > 300"] {
  background: orange;
}
```

Apply a rule to an `input` when its `value=""` attribute is greater than `30`:

```css
input[test="this.value > 30"] {
  background: lime;
}

```

Apply a rule to an `input` when it has a `value=""` attribute zero characters long:

```css
input[test="this.value.length == 0"] {
  background: purple;
}
```

Apply a rule to an `input` when its `value=""` attribute is more than 5 characters long:

```css
input[test="5 < this.value.length"] {
  background: turquoise;
}
```

Apply a rule to an `h3` element when it contains at least one `span` element:

```css
h3[test="(this.querySelector('span'))"] {
  color: red;
}
```

It is limited what selectors you can use with Selectory, things like `:hover` and pseudo-classes tend not to work as well. As well the parsing only allows for 1 test per selector, and complex selectors may not work as intended. Using `selector[test=""] {}` with a simple selector is best.

## Techniques Capable

- [Style Scoping](../techniques/style-scoping.html)
- [Element Queries](../techniques/element-queries.html)
- [Container Queries](../techniques/container-queries.html)
- [Using an Element’s Width](../techniques/element-width.html)
- [Using an Element’s Height](../techniques/element-height.html)
- [Using an Element’s Text Characters](../techniques/element-characters.html)
- [Using an Element’s Child Elements](../techniques/element-children.html)
- [Using an Element’s Scroll Position](../techniques/element-scroll.html)
- [Using an Element’s Aspect Ratio](../techniques/element-aspect-ratio.html)
- [Using an Element’s Orientation](../techniques/element-orientation.html)
- [Select the First Element Matching a Selector](../techniques/first-selector-in-document.html)
- [Select the Ancestor of an Element](../techniques/ancestor-of-element.html)
- [Select the Parent of an Element](../techniques/parent-of-element.html)
- [Select the Previous Sibling of an Element](../techniques/previous-sibling-of-element.html)
- [Select an Element by a Child it Contains](../techniques/child-element.html)
- [Select an Element by Text Content](../techniques/text-content.html)
- [Select Void Tags When Empty](../techniques/empty-void-tags.html)
- [Select Elements with a Partial Tag Name](../techniques/partial-tag-name-match.html)
- [Select Elements with a Partial Attribute Name](../techniques/partial-attribute-name-match.html)
- [Compare Attribute Values as Numbers](../techniques/number-comparisons-for-attribute-values.html)

## Links

- [Selectory on Github](https://github.com/tomhodgins/cssplus/blob/gh-pages/selectory.js)
- [Selectory Demo](http://tomhodgins.github.io/cssplus/test/selectory.html)