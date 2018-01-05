# Aspecty

**An `aspect-ratio` Property for CSS**

Aspecty is a CSS reprocessor that adds support for an aspect-ratio property using JS. This plugin allows you to define a desired aspect-ratio for an element, based on its rendered width on the page.

For any element with an aspect ratio defined, event listeners will be added to reprocess the styles on the following events:

- `mouseenter`
- `mouseleave`
- `mousedown`
- `mouseup`
- `focus`
- `blur`

By default, Aspecty will reprocess aspect ratios by watching the following events:

- `load`
- `resize`
- `input`
- `click`

To run Aspecty whenever you want, use the `aspecty.load()` function in JS.

The aspect ratio property can be used in CSS with the property name `--aspect-ratio` and a ratio, expressed as width and height as unitless numbers, separated by a slash `/`:

```css
--aspect-ratio: width/height;
```

You can use it in CSS like this:

```css
div {
  background: lime;
  --aspect-ratio: 16/9;
}
```

Aspecty will look through the document for any element matching the selector (in this case `div`) and create a new rule with a `height` value calculated based on each matching element’s `offsetWidth` divided by the aspect ratio defined in CSS.

To animate the effect of the `--aspect-ratio` property, which is actually applying via `height`, it is necessary to set a `transition` on the `height` property like this:

```css
transition: height .2s ease-in-out;
```

## Techniques Capable

- [Using an Element’s Aspect Ratio](../techniques/element-aspect-ratio.html)

## Links

- [Aspecty on Github](https://github.com/tomhodgins/cssplus/blob/gh-pages/aspecty.js)
- [Aspect Demo Page](http://tomhodgins.github.io/cssplus/test/aspecty.html)