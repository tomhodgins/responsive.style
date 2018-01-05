# Using an Element’s Child Elements

No browsers allow you to apply styles to an element based on the number of child elements if contains. The `:has()` selector would in theory, but since it has been Adopted into the CSS spec zero browsers have offered any support for it.

Thankfully even though CSS has no knowledge of the number of children an element has, both JavaScript and XPath are aware of this and are able to let you use this knowledge for resolving selectors.

## Parts Required

### JS Tests

Counting Children:

```javascript
element.children.length
```

Counting Tags:

```javascript
element.getElementsByTagName('*').length
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Selectory](../plugins/selectory.html)
- [Varsity](../plugins/varsity.html)
- [reproCSS](../plugins/reprocss.html)
- [Container Queries Mixin](../plugins/container-queries-mixin.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [VARIUS](../plugins/varius.html)

## Syntax Examples

## CSS (valid, but 0% browser support)

```
:has(:nth-of-child(5)) {
  background: lime;
}
```

### EQCSS

```css
@element .min-children and (min-children: 5) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}

@element .max-children and (max-children: 5) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}
```

### Selectory

```css
.min-children[test="this.children.length > 3"] {
  background: lime;
}

.max-children[test="this.children.length < 3"] {
  background: lime;
}
```

### XPathy

```css
/* min-children: 3 */
[xpath="//ul[*[3]]"] {
  background: violet;
}

/* max-children: 3 */
[xpath="//ul[not(*[3])]"] {
  color: lime;
}
```

## Demos

- [Min-Children Element Query with EQCSS](https://codepen.io/tomhodgins/pen/dXGoMZ)
- [Max-Children Element Query with EQCSS](https://codepen.io/tomhodgins/pen/mEVJPK)
- [Children-based Element Queries with Selectory](https://codepen.io/tomhodgins/pen/ZKmXXw)
- [Children-based Element Queries with XPathy](https://codepen.io/tomhodgins/pen/qjEdxE)

## Further Reading

- [Children feature from CSS Element Queries spec](https://tomhodgins.github.io/element-queries-spec/element-queries.html#children)