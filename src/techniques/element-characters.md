---
title: Using an Element’s Text Characters
keywords: element text, text content, characters, number of characters, chars, number of chars, text length, innerHTML
description: How can you use knowledge of an element's number of characters of text content for styling? JavaScript is aware of the number of characters inside of every element, learn how to use JavaScript and CSS together to style elements based on their own number of characters.
---

There is now way to use CSS to apply styles to an element based on the number of characters of text it contains - but this is something JavaScript can help us with.

This technique is closely related to selecting elements based on their [text content](text-content.html).

## Parts Required

### JS Tests

Counting characters in `innerHTML` for non-form elements:

```javascript
element.innerHTML.length
```

Counting characters in `value` for form elements:

```javascript
element.value.length
```

Counting characters in either `innerHTML` or `value`:

```javascript
element.textContent.length || (element.value && element.value.length) || 0
```

Selecting elements based on the text content using XPath with the `text()` function:

```

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

### EQCSS

```css
@element .min-characters and (min-characters: 35) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}

@element .max-characters and (max-characters: 35) {
  $this {
    background: greenyellow;
    border-color: limegreen;
  }
}
```

### Selectory 

```css
.min-characters[test="this.innerHTML.length > 5"] {
  background: lime;
}

.min-characters-form[test="this.value.length > 5"] {
  background: lime;
}

.max-characters[test="this.innerHTML.length < 5"] {
  background: lime;
}

.max-characters-form[test="this.value.length < 5"] {
  background: lime;
}
```

### XPathy

```css
/* Min-characters: 5 */
[xpath="//div[string-length(.) >= 5]"] {
  background: lime;
}

/* Max-characters: 5 */
[xpath="//div[string-length(.) <= 5]"] {
  background: purple;
}
```

## Demos

- [Min-Characters Element Query with EQCSS](https://codepen.io/tomhodgins/pen/OXMVMB)
- [Max-Characters Element Query with EQCSS](https://codepen.io/tomhodgins/pen/MeKwyY)
- [Character-based Element Queries with Selectory](https://codepen.io/tomhodgins/pen/ZKmXXw)
- [Min/max characters based on text content length with XPathy](https://codepen.io/tomhodgins/pen/awzOqe)

## Further Reading

- [Characters feature from CSS Element Queries spec](https://tomhodgins.github.io/element-queries-spec/element-queries.html#characters)