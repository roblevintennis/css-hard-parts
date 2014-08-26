
# Cascade Rules

This chapter will discuss how the browser determines which style rule to apply to an element. It seems that are many resources that talk about individual components of this determination such as specificity, cascade, etc., in isolation. I feel this is a huge mistake and leaves developers confused as to how things actually work. In fact, the spec's chapter that speaks to the way this is worked out is [fairly short](http://www.w3.org/TR/CSS2/cascade.html) and worth a glance. Let's take a look at the way a browser determines which rule &ldquo;wins&rdquo;…

We'll take the approach of annotating parts of this spec so we're confident in how this all works. Let's start with __specified values_:

>6.1.1 Specified values
>
>User agents must first assign a specified value to each property based on the following mechanisms (in order of precedence):
>
>If the cascade results in a value, use it.
>Otherwise, if the property is inherited and the element is not the root of the document tree, use the computed value of the parent element.
>Otherwise use the property's initial value. The initial value of each property is indicated in the property's definition.

So this leads us to ask, &ldquo;What exactly are these things: _cascade_, _inheritance_, and what's a property's _initial value_?

### The cascade

> Style sheets may have three different origins: author, user, and user agent.

We'll go deeper, but for now, just think of the _cascade_ as the ordering of the various types of stylesheets that need to be evaluated. As rule 6.1.1 above states, the cascade gets the most weight in the decision of which rule to apply to an element.

### Inheritance

> When inheritance occurs, elements inherit computed values. The computed value from the parent element becomes both the specified value and the computed value on the child.

Note that some types of CSS properties are inherited, others are not. [See a table](http://www.w3.org/TR/CSS2/propidx.html), but, for example, `color` is inherited while `display` or `border` are not. As you notice from 6.1.1, this factor takes second place in terms of precedence. Also, the specificity of an inherited rule is &ldquo;nada&rdquo;. We'll look at how that gets taken in to account in a bit.

### Initial Value

[Sitepoint](http://reference.sitepoint.com/css/defaultvalues) provides a great overview of how initial values work:

>The default value for a property, when it’s not specified explicitly or inherited, is called the initial value. The initial value of each property is defined in the CSS specification.

>Browsers have user agent style sheets that define the default rendering of the various HTML element types. In some cases, the rules in those built-in style sheets define values other than the initial values from the CSS specification. For example, links are usually underlined, even though the initial value for the text-decoration property is none.

Further, as we saw in 6.1.1, initial value comes after the cascade and inheritance in terms of precedence.

## CSS Rule Sorting

Before we dive in to the details of things *specificity*, *inheritance*,  etc., let's attempt to get a broader overview of just how the browser determines which rule to apply for a given element. It's, essentially, a four-step process:

1. __Gather Qualified Declarations:__ First gather all declarations that apply to the element for the current medium (such as _screen_, _print_, etc.) Pass all matches through to the next part of the sorting algorthm
2. __Sort by Origin:__ In this level of sorting, sort by stylesheet origin in ascending order of precedence which [the spec](http://www.w3.org/TR/CSS2/cascade.html#cascading-order) as:
 - user agent declarations
 - user normal declarations
 - author normal declarations
 - author important declarations
 - user important declarations (intuitevly we can see that, in order to provide accessibility, user's with special requirements are given a final and most prioritized mechanism)

_The term **weight** is sometimes used to describe the priority provided given the above considerations_

3. __Sort by Specificity:__ If, and only if, the above sort results in rules having duplicate importance and origin, than, sort by the specificity of selector
4. __Sort by Order of Declaration:__ If, and only if, the competing declarations have the same weight and specificity, than sort by order specified (where the latter specified wins).

One reason why we describe these broader rules here, is that it's important to understand that __weight__, or, *sort by origin*, will always &ldquo;beat out&rdquo; __specificity__. Put differently, it doesn't matter how much more specific one rule is over another if they aren't deemed to have the same origin/weight. Not understanding this fact can lead to confusing results. That said, most of the time we are, in fact, &ldquo;competing with ourselves&rdquo; as author stylesheets are generally carry the most weight (`!important` rules notwithstanding).

If you'd like a visual presentation of how the cascade rules are applied you may want to check out Russ Weakley's excellent [CSS Cascade Slideshare](http://www.slideshare.net/maxdesign/css-cascade-1658158) chock full of extremely useful examples.

## Origin

TBD

## Specificity Details



# References

[CSS: The Missing Manual:](http://shop.oreilly.com/product/9780596802455.do)
[CSS: The Definitive Guide, 3rd Edition:](http://shop.oreilly.com/product/9780596527334.do)
[CSS 2.1 Spec:](http://www.w3.org/TR/CSS2/cascade.html)

http://css-tricks.com/specifics-on-css-specificity/
http://www.smashingmagazine.com/2007/07/27/css-specificity-things-you-should-know/



