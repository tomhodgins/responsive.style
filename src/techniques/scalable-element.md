---
title: Scaling any HTML Element
keywords: scalable, maintain, aspect ratio, image map, fixed layout, pixel based, non-responsive, fixed
description: How can you make an element with a fixed size scalable? JavaScript can be used to help scale any HTML element, learn how to use JavaScript and CSS together to scale any HTML element you might ever need to resize.
---

Sometimes while styling a responsive website you encounter layouts where you are not able to easily make it scalable. If you ever have part of a document with a set width and height, this technique can help you make it scalable based on a simple formula for the scaling factor: `scale = desiredwidth / nativeWidth`

## Parts Required

## CSS Code

```css
.wrapper {
  width: 100%;
  height: calc(var(--wrapper) * 1px);
}
.wrapper .element {
  --originalWidth: 500;
  position: absolute;
  top: 50%;
  left: 50%;
  transform:
    translateX(-50%)
    translateY(-50%)
    scale(calc(var(--wrapper) / var(--originalWidth)))
  ;
}
```

### JS Tests

How to expose the current `wrapper.offsetWidth` as a CSS variable named `var(--wrapper)`:

```javascript
var element = document.querySelectorAll('.wrapper')

for (var i=0; i<element.length; i++) {

  element[i].style.setProperty('--wrapper', element.offsetWidth)

}
```

## Plugins Capable

- [EQCSS](../plugins/eqcss.html)
- [Varsity](../plugins/varsity.html)
- [reproCSS](../plugins/reprocss.html)
- [Scoped Eval Mixin](../plugins/scoped-eval-mixin.html)
- [VARIUS](../plugins/varius.html)

## Syntax Example

### EQCSS

```css
@element .wrapper {
  $this {
    width: 100%;
    height: eval("offsetWidth")px;
  }
  $this .element {
    position: absolute;
    top: 50%;
    left: 50%;
    transform:
      translateX(-50%)
      translateY(-50%)
      scale(eval("offsetWidth / 500"))
    ;
  }
}
```

### Varsity

```css
#wrapper {
  width: 100%;
  height: calc(var(--wrapper-offsetWidth) * 1px);
}
#wrapper aside {
  position: absolute;
  top: 50%;
  left: 50%;
  transform:
    translateX(-50%)
    translateY(-50%)
    scale(calc(var(--wrapper-offsetWidth) / 500))
  ;
}
```

### reproCSS + Scoped Eval() Mixin

```html
<style process=auto>
  ${scoped('.wrapper', `
    --offsetWidth: eval(this.offsetWidth);
    width: 100%;
    height: calc(var(--offsetWidth) * 1px);
  `)}
  ${scoped('.wrapper .element', `
    position: absolute;
    top: 50%;
    left: 50%;
    transform:
      translateX(-50%)
      translateY(-50%)
      scale(calc(var(--offsetWidth) / 500))
    ;
  `)}
</style>
```

## Demos

- [Scalable Fixed Layouts with EQCSS](https://codepen.io/tomhodgins/pen/BWjxeN)
- [Scalable Fixed Layouts with Varsity](https://codepen.io/tomhodgins/pen/eWVJVv)

## Further Reading

- [How to make any HTML element scalable!](https://codepen.io/tomhodgins/post/how-to-make-any-html-element-scalable)