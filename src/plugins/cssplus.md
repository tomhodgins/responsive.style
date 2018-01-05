# CSSplus

<img src=http://csspl.us/cssplus-logo.svg class=float-center>

CSSplus is a family of single-purpose CSS reprocessors that allow authors write CSS in new ways using dynamic values that will be updated via JavaScript.

- [Aspecty](aspecty.html) adds support for an aspect ratio property
- [Cursory](cursory.html) sets CSS variables based on the cursor
- [Scrollery](scrollery.html) sets CSS variables based on scroll position
- [Selectory](selectory.html) is a JavaScript selector resolver
- [Varsity](varsity.html) sets CSS variables based on properties of elements
- [XPathy](xpathy.html) is an XPath selector resolver

## Browser support

These plugins are written in ES6, and intended to be used in modern browsers (Chrome, Safari, Firefox, Edge) without transpilation. Many of these plugins make use of CSS Custom Properties (CSS variables) for functionality, so any browser that doesn’t support these features will have trouble with.

As far as I am aware, the only browser that supports CSS Custom Properties but not the ES6 features used (where transpiling to ES5 might improve support) is for Mobile Safari (iOS) support.

Currently all of these plugins are under active development and things are shifting around quite a bit so browser support may change with each release.

## Demos

For 20+ CSSplus demos, check out the [CSSPlus demos collection](http://codepen.io/collection/XLbNKz/) on Codepen.

## Links

- [CSSplus website](http://csspl.us)
- [CSSplus on Github](https://github.com/tomhodgins/cssplus)
- [CSSplus demos on Codepen](https://codepen.io/collection/XLbNKz/)