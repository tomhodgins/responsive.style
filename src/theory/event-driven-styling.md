# Event-Driven Styling

Writing styles in CSS is kind of like having a representation of what styling should be active in different states within your HTML document. Because events happen inside the browser which are good triggers for styling changes, CSS already responds to some mouse and keyboard events through pseudo-classes like `:hover`, `:focus`, and `:active`.

Other ways CSS responds to events by allowing authors to represent the styling of elements based on state responding to events are things like media queries, which would correspond to the resize events that happen when the browser resizes after it has loaded. In order to continue to style the site well the browser exposes limited information about the browser (the changing `innerWidth` and `innerHeight`) to CSS for the purpose of toggling styles.

## The wrong way to extend CSS

There are a number of ways that JavaScript and CSS can interact, and that means JavaScript can be used to extend the expressive styling power of CSS. Some ways are more ideal than others, so let's think briefly about some common ones and their implications:

- Using JavaScript to toggle classes (storing state in HTML = slow, unpredictable)
- Polyfilling support inside CSS (good for supporting missing features, bad for introducing new features, risky)

## The right way to extend CSS:

- Event-driven (responding to events in the browser)
- Virtual Stylesheets (stylesheets updating to reflect the current styles)

## Benefits of event-driven virtual stylesheets

- 100% the benefit and expressive capabilities of CSS
- Takes full advantage of what JS has to offer
- State may be managed in JS already, in which case you use JavaScript's state for styling


## Best practices for using virtual stylesheets

- use as many different virtual stylesheets as you need
- divide styles into virtual stylesheet by event
- limit the number of event listeners as much as possible
- limit the number of elements probed per stylesheet recalculation

## The Four Key Global Events

If you want a general-purpose CSS reprocessor, for most applications the following global events will suffice:

- `window.load`
- `window.resize`
- `window.input`
- `window.click`

However, it may make more sense to assign event listeners for other events, or to add event listeners to individual elements instead of recalculating on global events. Just keep in mind it's always ideal to limit the total number of recalculations requested, so consider performance and be very conservative when assigning event listeners.

## Element-Specific Events

- `element.scroll`
- `element.change`
- `element.blur`

> **Note:** When a web page is taller than the browser viewport and scrolled, some browsers report this as the `<html>` element being scrolled, and some browsers report this as the `<body>` element being scrolled. When listening to scroll events for individual elements it’s simple to add one event listener and use the result, but listening for the page itself to scroll requires monitoring _both_ `<html>` and `<body>` scroll position for a truly cross-browser effect.

## Alternative Events

- [Resize Observer](http://rawgit.com/WICG/ResizeObserver/master/index.html)
- [Mutation Observer](https://developer.mozilla.org/en/docs/Web/API/MutationObserver)

## Further Reading

- [The Edge of CSS [slides]](https://speakerdeck.com/tomhodgins/the-edge-of-css)
- [Understanding EQCSS Triggers](https://codepen.io/tomhodgins/post/understanding-eqcss-triggers)
- [How We Built EQCSS & Why You Should Try Building Your Own Polyfills Too](https://www.sitepoint.com/how-we-built-eqcss-why-you-should-try-building-your-own-polyfills-too)