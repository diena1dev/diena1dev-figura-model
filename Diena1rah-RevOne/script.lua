-- Script by Diena1rah - Please don't use without my permission!

-- ========== Avatar Variables ========== --

-- Avatar Part Variables
local root = models.Diena1rah.root

local head = models.Diena1rah.Head
local bodytop = models.Diena1rah.Body.Top
local bodybottom = models.Diena1rah.Body.Bottom
local larmtop = models.Diena1rah.LeftArm.Top
local larmbottom = models.Diena1rah.LeftArm.Bottom
local rarmtop = models.Diena1rah.RightArm.Top
local rarmbottom = models.Diena1rah.RightArm.Bottom
local llegtop = models.Diena1rah.LeftLeg.Top
local llegbottom = models.Diena1rah.LeftLeg.Bottom
local rlegtop = models.Diena1rah.RightLeg.Top
local rlegbottom = models.Diena1rah.RightLeg.Bottom
local whiteeyes = models.Diena1rah.Head.WhiteEyes
local reye = models.Diena1rah.Head.RightEye
local leye = models.Diena1rah.Head.LeftEye

-- Avatar Accessory Variables
local axe = models.Diena1rah.Body.Axe
local goggles = models.Diena1rah.Head.Goggles
local rope = models.Diena1rah.Head.GogglesRope

-- ========== Functions ========== --

-- Hiding Vanilla Armor and Models
vanilla_model.PLAYER:setVisible(false)
vanilla_model.ARMOR.HELMET:setVisible(false)

-- Animations!
function events.tick()
  local crouching = player:getPose() == "CROUCHING"
  -- This is the same line of code from the previous example
  local walking = player:getVelocity().xz:length() > .01
  -- walking == true when moving, and walking == false when still (or going directly up/down as we excluded the y axis)
  local sprinting = player:isSprinting()
  -- If you want to find more player functions, check out the Player Global page


  --animations.Diena1rah.idle:setPlaying(not walking and not crouching)
 -- animations.Diena1rah.Walking:setPlaying(walking and not crouching and not sprinting)
  --animations.Diena1rah.sprint:setPlaying(sprinting and not crouching)
 -- animation.Diena1rah.crouch:setPlaying(crouching)
end

-- Hide Axe on Equip~
function events.item_render(item)
  if item.id == "minecraft:wooden_axe" then
    axe:setVisible(false)
  else
    axe:setVisible(true)
  end
end

-- Toggling Goggles!
function toggleGoggles()
  if goggles:getPos() == vec(0, -3.5, 0)
      then goggles:setPos(0, 0, 0)
           rope:setPos(0, 0, 0)
      else goggles:setPos(0, -3.5, 0)
           rope:setPos(0, -3.5, 0)
  end
end

-- Needed for rendering correctly behind transparent objects: ':setPrimaryRenderType("CUTOUT")'

-- ========== Action Wheel! ========== --

-- Action Wheel Creation
local mainPage = action_wheel:newPage()
action_wheel:setPage(mainPage)

-- Action Wheel Entry: Goggles
local action = mainPage:newAction()
    :title("Goggles")
    :item("minecraft:golden_helmet")
    :hoverColor(120, 70, 70)
    :onLeftClick(toggleGoggles)


-- ========== Misc. Functions and Features ========== --

-- Nameplate/List/Chat Formatting Functions
nameplate.ALL:setText(toJson({
  {text = " ${badges} Die", color = "#009999"},
  {text = "na1", color = "#00cccc"},
  {text = "rah", color = "#00ffff"},
}))
nameplate.ENTITY:setText(toJson({
  {text = "Di", color = "#009999"},
  {text = "en", color = "#00cccc"}, 
  {text = "a1 ${badges}", color = "#00ffff"},
  {text = "\n@diena1rah", color = "#888888"}
})):setOutline(true):setOutlineColor(vectors.hexToRGB("#262626")):setShadow(true):setBackgroundColor(0, 0, 0, 0)

-- Nameplate Colors!
-- Name Gradient Fade - V1 - "#3a6a7d #5296b1 #76d7fe"
-- Name Gradient Fade - V2 - "#009999 #00cccc #00ffff"
-- Discord Tag Color - "#888888"