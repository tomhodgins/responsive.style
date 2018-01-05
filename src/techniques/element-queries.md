# Element Queries

An element query is a [scoped style](style-scoping.html) with the addition of one or more responsive conditions. A responsive condition could look like `(min-width: 500px)` or `(max-characters: 20)`, and would prevent the block of css rules from applying to the page until the responsive conditions are true.

Here is an example of an element query in the same syntax:

```css
@element 'input' and (max-characters: 20) {}
```

Now one thing you can notice about this right away is that max-characters is not a media feature supported by `@media` queries - as it turns out when writing responsive styles for elements instead of for the viewport, the ability to base responsive conditions on a wider variety of properties makes sense. The full list of possible responsive conditions element queries might looks something like this:

- [Container Queries](container-queries.html)
- [Using an Element’s Width](element-width.html)
- [Using an Element’s Height](element-height.html)
- [Using an Element’s Text Characters](element-characters.html)
- [Using an Element’s Child Elements](element-children.html)
- [Using an Element’s Scroll Position](element-scroll.html)
- [Using an Element’s Aspect Ratio](element-aspect-ratio.html)
- [Using an Element’s Orientation](element-orientation.html)

That’s a lot of new flexibility for creating responsive layouts!

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Aspecty](../plugins/aspecty.html)
- [Cursory](../plugins/cursory.html)
- [Scrollery](../plugins/scrollery.html)
- [Selectory](../plugins/selectory.html)
- [Varsity](../plugins/varsity.html)
- [XPathy](../plugins/xpathy.html)
- [reproCSS](../plugins/reprocss.html)
- [Aspect Ratio Mixin](../plugins/aspect-ratio-mixin.html)
- [Auto Expand Mixin](../plugins/auto-expand-mixin.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [XPath Selector Mixin](../plugins/xpath-selector-mixin.html)
- [VARIUS](../plugins/varius.html)

## Further Reading

- [CSS Element Queries spec (non-standard)](https://github.com/tomhodgins/element-queries-spec)
- [Why I Love Element Queries & You Should Too!](https://hashnode.com/post/why-i-love-element-queries-and-you-should-too-cizgq4uyy000m7m53dsyeghst)
- [Element Queries, And How You Can Use Them Today](https://www.smashingmagazine.com/2016/07/how-i-ended-up-with-element-queries-and-how-you-can-use-them-today/)
- [What the Heck are Element Queries & Container Queries?](https://codepen.io/tomhodgins/post/what-the-heck-are-element-queries-container-queries)
- [Forget Mobile-First & Desktop-First, it's Time to Think Element-First](https://codepen.io/tomhodgins/post/forget-mobile-first-desktop-first-it-s-time-to-think-element-first)