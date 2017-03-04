# Simple CoffeeScript Tooltip Plugin
# Quick and Easy Tooltip using CoffeeScript/Jquery

# Anurag Kewat: 2017

(($) ->
	$.fn.simpleTooltip = ->
		@each ->
			@elTooltip = $(this)
			@elTooltipLink = @elTooltip.find(".TooltipWrapper_link")
			@elTooltipContent = @elTooltip.find(".TooltipWrapper_content")

			@elTooltipLink.mouseover (e) =>
				e.preventDefault()
				element = $(e.target)
				
				elementHeight = element.height()
				tooltipContent = element.parents(".TooltipWrapper").find(@elTooltipContent)

				top = "auto"
				bottom = elementHeight + 20
				left = -(tooltipContent.width()/2 + 10)

				elementOffset = element.offset()

				if elementOffset.top - $(window).scrollTop() < elementHeight + tooltipContent.height()
					tooltipContent.addClass("TooltipWrapper_content--showBelow")
					top = elementHeight
					bottom = "auto"
				else
					tooltipContent.removeClass("TooltipWrapper_content--showBelow")

				if elementOffset.left < 180
					left = 0

				tooltipContent.css
					"top": top
					"bottom": bottom
					"left": left
					"margin-left": element.width()/2

				tooltipContent.show()

			@elTooltipLink.mouseout =>
				$(@elTooltipContent).hide()

			$(@elTooltipContent).mouseover ->
				$(this).show()

			$(@elTooltipContent).mouseout =>
				$(@elTooltipContent).hide()
		return
	return
) jQuery

