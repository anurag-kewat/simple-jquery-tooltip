# Simple CoffeeScript Tooltip Plugin

Quick and Easy Tooltip using CoffeeScript/Jquery

## Getting started

### Installation
Include files:
```html
<script type="text/javascript" src="js/jquery-3.0.0.min.js"></script> <!-- jQuery required -->
<script type="text/javascript" src="js/jquery.simpleTooltip.js"></script>
```

### Usage

HTML
```html
<div id="tooltipEg1" class="TooltipWrapper">
  <a href="" class="TooltipWrapper_link">what am I?</a>
  <div class="TooltipWrapper_content">
    <p>I am simple jquery tooltip. I am good.</p>
  </div>
</div>
```

JavaScript/CoffeeScript
```html
$("#tooltipEg1").simpleTooltip()
```

### Options
```html
// To show tooltip below
$("#tooltipEg2").simpleTooltip({
	tooltipPos: "below"
});
```