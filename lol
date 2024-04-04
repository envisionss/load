local imgui = require("imgui")

local draggable = imgui.ImBool(false) 

function imgui.OnDraw()
  imgui.SetNextWindowSize(imgui.ImVec2(200, 200))
  imgui.Begin("Window", draggable, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)

  if imgui.IsWindowHovered() then
    imgui.SetMouseCursor(imgui.MouseCursor.ResizeAll)
    if imgui.IsMouseClicked(0) then
      draggable.v = not draggable.v
    end
  end

  if draggable.v then
    imgui.GetWindowDrawList():PushClipRectFullScreen()
    imgui.GetIO().MouseDrawCursor = true 
  end

  imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0, 0, 0, 1)) 
  imgui.PushStyleColor(imgui.Col.Border, imgui.ImVec4(1, 1, 1, 0.5))

  -- Window content here

  imgui.PopStyleColor(2) 
  imgui.End()
end
