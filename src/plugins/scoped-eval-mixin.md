# Scoped Eval Mixin

This JavaScript function lets you define a CSS selector list, and to output CSS rules with JS interpolation from the context of each element in the document matching the selector.

## Syntax

```javascript
scoped(selector, rule)
```

- `selector` is a CSS selector
- `rule` is one or more CSS declarations separated by semicolons

## Example

Input:

```javascript
scoped('div', `
  margin: 1em;
  background: lime;
  height: eval(this.offsetWidth / (16/9))px;
`)
```

Output:

```css
/* Scope: div */
[data-scoped-unique="0"] {
  margin: 1em;
  background: lime;
  height: 144.5625px;
}
```

## Code

```javascript
function scoped(selector, rule) {

  var tag = document.querySelectorAll(selector)
  var style = ''
  var count = 0

  for (var i=0; i < tag.length; i++) {

  var attr = selector.replace(/\W+/g, '')

    tag[i].setAttribute('data-scoped-' + attr, count)

    var scopedRule = rule.replace(/eval\((.*)\)/g, function(string, match){

      var func = new Function('return ' + match)

      return (func.call(tag[i]) || '')

    })

    style += '\n/* Scope: ' + selector + ' */\n'
             + '[data-scoped-' + attr + '="' + count + '"] {\n'
             + '  ' + scopedRule + '\n'
             + '}\n'
    count++

  }

  return style

}
```

## Techniques Capable

- [Style Scoping](../techniques/style-scoping.html)
- [Using an Element’s Width](../techniques/element-width.html)
- [Using an Element’s Height](../techniques/element-height.html)
- [Using an Element’s Text Characters](../techniques/element-characters.html)
- [Using an Element’s Child Elements](../techniques/element-children.html)
- [Using an Element’s Scroll Position](../techniques/element-scroll.html)
- [Using an Element’s Aspect Ratio](../techniques/element-aspect-ratio.html)
- [Using an Element’s Orientation](../techniques/element-orientation.html)
- [Element-Based Units](../techniques/element-based-units.html)
- [Compare Attribute Values as Numbers](../techniques/number-comparisons-for-attribute-values.html)

## Links

- [Source Code on Github](https://github.com/tomhodgins/reprocss/blob/master/mixins/scoped-eval.js)
- [Scoped Eval() Mixin Demo](https://tomhodgins.github.io/reprocss/test/scoped-eval-mixin.html)