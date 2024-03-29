
# Visual Formatting

This chapter will discuss CSS's main weapon of choice, boxes. The CSS *box model* defines how rectangular boxes are to be laid on in your document. As always, I encourage you to cross-reference the details in the [box-model specification](http://www.w3.org/TR/CSS2/box.html), and the [visual formatting model specification](http://www.w3.org/TR/CSS2/visuren.html).

## Box Model Review

Let's review of the CSS box model:

<div class="figure-caption-wrapper">
![Box Model](examples/visual/box-model.png "The box model consists of margin, border, padding, and content")\

<div class="figure-caption">The box model consists of margin, border, padding, and content</div>
</div>

Taking the example diagram from the inside out we have:

- Content: The content area contains your text, images, etc.
- Padding: The content can optionally be surrounded by padding
- Border: The box optionally can have a visible border
- Margin: A transparent area that surrounds the box

### Edges

The edges of the above described sections of the box can be further broken down in to top, right, bottom, and left. We can thus describe the top outermost area of content just before the padding starts as the *top content edge*. Similarly, we might describe the bottom-most padding area just before the border as the *bottom padding edge*.

Edges can be shared as per the specification, starting with the padding edge:

  > If the padding has 0 width, the padding edge is the same as the content edge

Same for borders:

  > If the border has 0 width, the border edge is the same as the padding edge

And for margins:

  > If the margin has 0 width, the margin edge is the same as the border edge

### Backgrounds

The content and padding background are specified by the containing block's *background* property (and, additionally, any of its children's background properties). Margins are transparent.

### Widths

We'll delve deeper in to how the width of a box is calculated, but, for now, let's take the simplest case that width–in the most simplest cases–is determined by adding up the components of the box model:

*Left margin + left border + left padding + content + right padding + right border + right margin = width*

## Margins

Margins can be set for all four sides with the caveat that vertical margins will not effect non-replaced inline elements (such as images).

Margins can be set with either of: `auto` (which we'll discuss in a later section), `length`, or `percentage`.

Margins set with length are fairly straight forward as you specify a fixed value such as `margin: 5px`;

Margins set with percentage are bit trickier starting with this fact from the [spec](http://www.w3.org/TR/CSS2/box.html#margin-properties):

  >The percentage is calculated with respect to the width of the generated box's containing block. **Note that this is true for 'margin-top' and 'margin-bottom' as well.**…

The takeaway is to be careful if you use `margin-top` or `margin-bottom` with a percentage since that percentage is relative to the containing block's width (not it's height).


## Horizontal Formatting

When thinking about horizontal formatting an obvious question is "How is an element's width calculated?". Let's start there.

http://codepen.io/roblevin/pen/gmsIx

### Width

A particular block-level boxes width must add up to its containing block's &ldquo;content edge&rdquo;. Therefore, if a containing block as a width of 80 pixels and the padding on the sides adds up to 20 pixels (provided there's no margin or borders), its width is 100 pixels. Thus a child block-level element's width will be 100 pixels per the [spec](http://www.w3.org/TR/CSS2/visudet.html#blockwidth):

  >'margin-left' + 'border-left-width' + 'padding-left' + 'width' + 'padding-right' + 'border-right-width' + 'margin-right' = *width of containing block*

If the spec isn't clear enough we can refer to the following from Eric Meyer:

  >For an element in the normal, Western-style flow of text, the containing block is formed by the <em>content edge</em> of the nearest block-level, table-cell, or inline-block anscestor box.

<div class="figure-caption-wrapper">

![Containing Block Width](examples/visual/containing-block-width.png "Width is set by the element's containing block's width")\

<div class="figure-caption">A child element extends to the content edge of its containing block (in this case, up to the container's red border).</div>

</div>


#### Auto

Generally, a horizontal property having a value of `auto` will result in that property being calculated to be whatever is required to comply with the rule stated above (that block-level box widths add up to their containing block's width).

For example, let's say we have code specified as follows:

```html
…
<style>
p {
  margin-left: auto;
  margin-right: 100px;
  width: 100px;
}
div {
  width: 400px;
  height: 50px;
  …
}
</style>
</head>
<body>
  <div><p>This is a paragraph</p></div>
</body>
</html>
```

Note that our paragraph is defined with a left margin of auto, and a width & right margin to 100px, while the containing block is defined at 400 pixels wide. Since the content edge of this containing block is 400 pixels wide, the `margin-left` will need to be 200 pixels to comply with the width rule we've stated above. Thus, the *computed value* (the value that the user agent computes versus your declared CSS values), will be 200 pixels.

<div class="figure-caption-wrapper">
![Left margin with auto](examples/visual/margin-left-auto.png "A margin-left of auto results in a computed value that's required for that element's width to be equal to it's containing block's width")\

<div class="figure-caption">margin-left of auto results in a computed value required for total width to be equal to width of containing block</div>
</div>

### Overconstrained Values

If a child-block's total specified values do not &ldquo;add up&rdquo; to the expected containing block width, then the difference will be made up on the right margin which will get set to `auto` regardless of the original value declared–provided the directionality is left-to-right; if not, the rule is flipped and the margin-left will make up the difference. So, in the following example we have a containing block width of 800 pixels, but the total declared widths have been overconstrained to 600 pixels (with `margin-left: 200px; width: 200px; margin-right: 200px;`). The declared `margin-right: 200px` will get reset to `margin-right: auto` and expand to 400 pixels wide:

<div class="figure-caption-wrapper">
![Overconstrained](examples/visual/overconstrained-margin-right.png "Difference between width and total of overcontrained formatting properties filled in on right margin")\

<div class="figure-caption">Difference between width and total of overcontrained formatting properties filled in on right margin</div>
</div>


### Horizontal Centering

You might already know this, but if you set the block-level child element's margin to the same values such as: `margin-left: 200px; margin-right 200px`, and then set the width: `width: auto;`, the element will be horizontally centered.

*You can also center by setting the margin: `margin: 0 auto` where the natural content width will be used and then the left and right margins will be calculated equally to center the element.*

## Vertical Formatting

TBD

http://codepen.io/roblevin/pen/szavA?editors=110

### Margin Collapsing

http://www.w3.org/TR/CSS2/box.html#collapsing-margins

http://codepen.io/roblevin/pen/Dnxbq?editors=110







