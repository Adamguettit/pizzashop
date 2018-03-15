-----------------------------------------------------------------------------------------

--Created by: adam
-- Created on: march 15

-- this code calculates the cost of your pizza
-----------------------------------------------------------------------------------------

local pizzacost
local pizzacostTextField = native.newTextField( display.contentCenterX - 700, display.contentCenterY - 300, 450, 150 )
pizzacostTextField.id = "pizzacost textField"

local numberoftoppings
local numberoftoppingsTextField = native.newTextField( display.contentCenterX - 700, display.contentCenterY , 450, 150 )
numberoftoppingsTextField.id = "numberoftoppings textField"

local numberoftoppingstonumber

local enterButton = display.newImageRect( "./assets/sprites/enterButton.png", 600, 200 )
enterButton.x = display.contentCenterX + 550
enterButton.y = display.contentCenterY - 250
enterButton.id = "enter button"

--instructions
display.newText("Please type large or extralarge for pizza size (NO CAPS)", 960, 300, native.systemFont, 75)
display.newText("Please choose #of toppings (4 MAX)", 620, 630, native.systemFont, 75)

local function enterButtonTouch( event )
	pizzacost = pizzacostTextField.text
	numberoftoppings = numberoftoppingsTextField.text
	numberoftoppingstonumber = tonumber(numberoftoppings)
	
	if pizzacostTextField.text == "large" then
	    pizzacost = 6
		else
		pizzacost = 10
	end

	if numberoftoppingstonumber == 0 then 
		pizzacost = pizzacost + 0
		elseif numberoftoppingstonumber == 1 then
		pizzacost = pizzacost + 1
		elseif numberoftoppingstonumber == 2 then
		pizzacost = pizzacost + 1.75
		elseif numberoftoppingstonumber == 3 then
		pizzacost = pizzacost + 2.5
		elseif numberoftoppingstonumber == 4 then
		pizzacost = pizzacost +3.35 
	end

	if numberoftoppingstonumber > 4 then
		local warning = display.newText("**TOO MANY TOPPINGS**", 900, 950, native.systemFont, 100)
		warning:setFillColor( 1, 0, 0 )
	else
	display.newText("subtotal: $" ..pizzacost, 900, 950, native.systemFont, 80)
	display.newText("tax: $" ..pizzacost * 0.13, 900, 1050, native.systemFont, 80)
	display.newText("total: $" ..pizzacost * 1.13, 900, 1150, native.systemFont, 80)
	end
end
	
enterButton:addEventListener( "touch", enterButtonTouch )
