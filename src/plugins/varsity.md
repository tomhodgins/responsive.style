---
title: Varsity
keywords: variables, css variables, width, height, characters, children, value, element, tag, mixin, helper function, plugin
---

**Properties of Elements Exposed via CSS Variables**

Varsity is a CSS reprocessor that makes the following JS values available as CSS variables for any element you tell the plugin to watch:

- `offsetWidth`
- `offsetHeight`
- `offsetLeft`
- `offsetTop`
- `aspect-ratio`
- `characters`
- `children`
- `value`

By default, Varsity will reprocess selectors by watching the following events:

- `load`
- `resize`
- `input`
- `click`

To run Varsity whenever you want, use the `varsity()` function in JS.

To have varsity watch an element, you need to give that element a unique identifier, as well as add the `data-varsity` attribute. The plugin will use either the value of the `data-varsity` attribute, or else the value of the `id` (if defined) for an element.

```html
<div id=example data-varsity></div>

<!-- or -->

<div data-varsity=example></div>
```

Once the plugin is aware of an element to watch, and the unique name of that element, it will make the above values available in the following format: `--name-value`, for example:

- `--example-offsetWidth`
- `--example-offsetHeight`
- `--example-offsetLeft`
- `--example-offsetTop`
- `--example-aspect-ratio`
- `--example-characters`
- `--example-children`
- `--example-value`

## Techniques Capable

- [Using an Element’s Width](../techniques/element-width.html)
- [Using an Element’s Height](../techniques/element-height.html)
- [Using an Element’s Text Characters](../techniques/element-characters.html)
- [Using an Element’s Child Elements](../techniques/element-children.html)
- [Using an Element’s Scroll Position](../techniques/element-scroll.html)
- [Using an Element’s Aspect Ratio](../techniques/element-aspect-ratio.html)
- [Element-Based Units](../techniques/element-based-units.html)
- [Scaling any HTML Element](../techniques/scalable-element.html)
- [Compare Attribute Values as Numbers](../techniques/number-comparisons-for-attribute-values.html)

## Links

- [Varsity on Github](https://github.com/tomhodgins/cssplus/blob/gh-pages/varsity.js)
- [Varsity Demo](http://tomhodgins.github.io/cssplus/test/varsity.html)