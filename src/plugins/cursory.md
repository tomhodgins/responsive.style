# Cursory

**Cursor Position Exposed via CSS Variables**

Cursory is a CSS reprocessor that makes the following JS values available as CSS variables:

- `cursorX`
- `cursorY`
- `innerWidth`
- `innerHeight`
- `clicked`

These can be used as CSS variables with the following names:

- `--cursorX`
- `--cursorY`
- `--innerWidth`
- `--innerHeight`
- `--clicked`

These variables are updated at the following events:

- `mousemove`
- `touchmove`

In addition, the `--clicked` variable is changed from `0` to `1` between the `mousedown` and `touchstart` events and the corresponding `mouseup` or `touchend` events.

To run Cursory whenever you want, use the `cursory()` function in JS.

This allows you to use the `var(--clicked)` ratio as a `1` or `0` in your CSS `calc()` functions, or as a value for `opacity:;` fairly easily.

To run Cursory whenever you want, use the `cursory.load()` function in JS.

To make an element like `div` follow the cursor position when using `cursory`, use CSS with variables like this:

```css
div {
  width: 10px;
  height: 10px;
  position: fixed;
  background: black;
  top: calc(var(--cursorY) * 1px);
  left: calc(var(--cursorX) * 1px);
}
```

## Techniques Capable

- [Use the Cursor Position as Values](../techniques/value-cursor.html)

## Links

- [Cursory on Github]()
- [Cursory Demo](http://tomhodgins.github.io/cssplus/test/cursory.html)