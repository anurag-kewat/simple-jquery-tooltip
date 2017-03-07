# Simple CoffeeScript Tooltip Plugin
# Quick and Easy Tooltip using CoffeeScript/Jquery

# Anurag Kewat: 2017

(($) ->
	$.fn.simpleTooltip = (options) ->

		defaults =
			tooltipPos: "top" # position for tooltip to show - "top" or "bottom"

		settings = $.extend({}, defaults, options)

		@each ->
			@elTooltip = $(this)
			@elTooltipLink = @elTooltip.find(".TooltipWrapper_link")
			@elTooltipContent = @elTooltip.find(".TooltipWrapper_content")

			@elTooltipLink.mouseover (e) =>
				e.preventDefault()
				el = $(e.target)
				
				elHeight = el.height()
				tooltipContent = el.parents(".TooltipWrapper").find(@elTooltipContent)

				posTop = "auto"
				posBottom = elHeight + 20
				posLeft = -(tooltipContent.width()/2 + 10)
				posRight = "auto"

				elOffset = el.offset()

				tooltipContent.removeClass("TooltipWrapper_content--showBelow").removeClass("LeftArrow")

				if @isSpaceAbove(elOffset, elHeight, tooltipContent) or settings.tooltipPos is "below"
					tooltipContent.addClass("TooltipWrapper_content--showBelow")
					posTop = elHeight
					posBottom = "auto"

				marginLeft = el.width()/2

				if elOffset.left < 100
					tooltipContent.addClass("LeftArrow")
					posLeft = 0
					marginLeft = 0

				else if $(window).width() - elOffset.left < 130
					tooltipContent.addClass("RightArrow")
					posLeft = "auto"
					posRight = 0
					marginLeft = 0

				tooltipContent.css
					"top": posTop
					"bottom": posBottom
					"left": posLeft
					"right": posRight
					"color": settings.fontColor
					"margin-left": marginLeft

				tooltipContent.show()

			@isSpaceAbove = (elOffset, elHeight, tooltipContent) ->
				elOffset.top - $(window).scrollTop() < elHeight + tooltipContent.height()

			@elTooltipLink.mouseout =>
				$(@elTooltipContent).hide()

			$(@elTooltipContent).mouseover ->
				$(this).show()

			$(@elTooltipContent).mouseout =>
				$(@elTooltipContent).hide()

		return
	return
) jQuery

