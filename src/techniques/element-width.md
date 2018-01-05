# Using an Element’s Width

CSS spec authors recognize the ability to style an element differently based on its own width, but currently support is limited to just the width of the `<html>` element though Media Queries.

It could be incredibly useful to style other elements based on the width they show up, currently the only language that has knowledge of the width of elements as they appear on the page is JavaScript, so in order to apply styles to elements based on their rendered width you will need to find a way to have JavaScript help resolve a CSS selector for you.

## Parts Required

### JS Tests

Min-width:

```javascript
test <= this.offsetWidth
```

Max-width:

```javascript
this.offsetWidth <= test
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Cursory](../plugins/cursory.html)
- [Scrollery](../plugins/scrollery.html)
- [Selectory](../plugins/selectory.html)
- [Varsity](../plugins/varsity.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [VARIUS](../plugins/varius.html)

## Syntax Examples

## CSS (limited to `<html>` element)

```css
@media (min-width: 500px) {
  body {
    background: lime;
  }
}
```

```css
@media (max-width: 500px) {
  body {
    background: hotpink;
  }
}
```

## EQCSS

```css
@element .min-width and (min-width: 300px) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}

@element .max-width and (max-width: 300px) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}
```

### CSSplus/Selectory

```css
.min-width[test="this.offsetWidth > 500"] {
  background: lime;
}

.max-width[test="this.offsetWidth < 500"] {
  background: lime;
}
```

## Demos

- [Min-Width Element Query with EQCSS](https://codepen.io/tomhodgins/pen/MeKwaY)
- [Max-Width Element Query with EQCSS](https://codepen.io/tomhodgins/pen/EyPjVg)
- [Width-based Element Queries with Selectory](https://codepen.io/tomhodgins/pen/ZKmXXw)

## Further Reading

- [Width feature from CSS Element Queries spec](https://tomhodgins.github.io/element-queries-spec/element-queries.html#min-width)
- [Responsive Table Techniques](https://codepen.io/tomhodgins/post/responsive-tables)