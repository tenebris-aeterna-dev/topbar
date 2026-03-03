local ReplicatedStorage = game:GetService("ReplicatedStorage")

local topbar = ReplicatedStorage:WaitForChild("topbar")
local container = require(topbar.elements.container)
local list = require(topbar.elements.list)
local spacer = require(topbar.elements.spacer)
local item = require(topbar.elements.item)

local _ContainerElement = container()
local _ListElements = list(_ContainerElement, 1)
local _SpacerElement = spacer(_ContainerElement, 2)
local _ListElement2 = list(_ContainerElement, 3)

local _ItemElement = item(_ListElements, 1, 132281051700037, 128464412017582)
local _ItemElement = item(_ListElements, 2, 125521476447079)
local _ItemElement = item(_ListElement2, 1, 84447475873375, 123780131246840)
local _ItemElement = item(_ListElement2, 2, 100758645784963, 132649102673188)