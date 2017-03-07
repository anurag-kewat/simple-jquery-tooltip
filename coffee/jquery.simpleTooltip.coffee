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

				posTop = "auto"
				posBottom = elementHeight + 20
				posLeft = -(tooltipContent.width()/2 + 10)
				posRight = "auto"

				elementOffset = element.offset()

				tooltipContent.removeClass("TooltipWrapper_content--showBelow").removeClass("LeftArrow")

				if elementOffset.top - $(window).scrollTop() < elementHeight + tooltipContent.height()
					tooltipContent.addClass("TooltipWrapper_content--showBelow")
					posTop = elementHeight
					posBottom = "auto"

				marginLeft = element.width()/2

				if elementOffset.left < 100
					tooltipContent.addClass("LeftArrow")
					posLeft = 0
					marginLeft = 0

				else if $(window).width() - elementOffset.left < 130
					tooltipContent.addClass("RightArrow")
					posLeft = "auto"
					posRight = 0
					marginLeft = 0

				tooltipContent.css
					"top": posTop
					"bottom": posBottom
					"left": posLeft
					"right": posRight
					"margin-left": marginLeft

				tooltipContent.show()

			# @elTooltipLink.mouseout =>
			# 	$(@elTooltipContent).hide()

			# $(@elTooltipContent).mouseover ->
			# 	$(this).show()

			# $(@elTooltipContent).mouseout =>
			# 	$(@elTooltipContent).hide()
		return
	return
) jQuery

