local M = {}
 
--
function M.aabb(x1, y1, w1, h1, x2, y2, w2, h2)
    return not ((x2 > x1 + w1) or (x2 + w2 < x1) or
                (y2 > y1 + h1) or (y2 + h2 < y1))
end

 
function M.collide(x1, y1, w1, h1, x2, y2, w2, h2)
  if not M.aabb(x1, y1, w1, h1, x2, y2, w2, h2) then
    return false, 0, 0
  end
  local vx = x1 + w1 * .5 - x2 - w2 * .5
  local vy = y1 + h1 * .5 - y2 - h2 * .5
 
  vx = vx > 0 and x2 + w2 - x1 or x2 - x1 - w1
  vy = vy > 0 and y2 + h2 - y1 or y2 - y1 - h1
  local xAxis = math.abs(vx) < math.abs(vy)
 
  return true, xAxis and vx or 0, xAxis and 0 or vy
end
 
return M