---
title: Scrollery
keywords: scroll, scrolling, scroll position, mixin, helper function, plugin
---

**Element Scroll Position Exposed via CSS Variables**

Scrollery is a CSS reprocessor that makes the following JS values available as CSS variables for any element you tell the plugin to watch:

- `scrollWidth`
- `scrollHeight`
- `scrollLeft`
- `scrollTop`

To have scrollery watch an element, you need to give that element a unique identifier, as well as add the `data-scrollery` attribute. The plugin will use either the value of the `data-scrollery` attribute, or else the value of the `id` (if defined) for an element.

By default, Scrollery will watch 0 elements. If you add a `data-scrollery` attribute to either the `<html>` or `<body>` element it will attach an event listener for the `scroll` event on the `window`, otherwise if you add the `data-scrollery` attribute to other elements it will add a `scroll` listener to that element.

To run Scrollery whenever you want, use the `scrollery.load()` function in JS.

```html
<div id=example data-scrollery></div>
```

And the following example are both equivalent, and resolve to a name of `example`:

```html
<div data-scrollery=example></div>
```

Once the plugin is aware of an element to watch, and the unique name of that element, it will make the above values available in the following format: `--name-value`, for `example`:

- `--example-scrollWidth`
- `--example-scrollHeight`
- `--example-scrollTop`
- `--example-scrollLeft`

## Techniques Capable

- [Using an Element’s Width](../techniques/element-width.html)
- [Using an Element’s Height](../techniques/element-height.html)
- [Using an Element’s Scroll Position](../techniques/element-scroll.html)

## Links

- [Scrollery on Github](https://github.com/tomhodgins/cssplus/blob/gh-pages/scrollery.js)
- [Scrollery Demo](http://tomhodgins.github.io/cssplus/test/scrollery.html)