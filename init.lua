
local uv = require('uv');

local rbxvm = require('rbx-vm');

local fd = assert(uv.fs_open('test2.rbxm', 'r', tonumber(777, 8)));
local stat = assert(uv.fs_fstat(fd));
local body = assert(uv.fs_read(fd, stat.size));
assert(uv.fs_close(fd));

--[[
local SLAXML = require 'slaxml'

-- Specify as many/few of these as you like
local parser = SLAXML:parser{
  startElement = function(name,nsURI,nsPrefix)       p('startElement', name,nsURI,nsPrefix) end, -- When "<foo" or <x:foo is seen
  attribute    = function(name,value,nsURI,nsPrefix) p('attribute', name,value,nsURI,nsPrefix)end, -- attribute found on current element
  closeElement = function(name,nsURI)                p('closeElement', name,nsURI) end, -- When "</foo>" or </x:foo> or "/>" is seen
  text         = function(text,cdata)                p('text', text,cdata) end, -- text and CDATA nodes (cdata is true for cdata nodes)
  comment      = function(content)                    end, -- comments
  pi           = function(target,content)             end, -- processing instructions e.g. "<?yes mon?>"
}

-- Ignore whitespace-only text nodes and strip leading/trailing whitespace from text
-- (does not strip leading/trailing whitespace from CDATA)
p(parser:parse(body,{stripWhitespace=true}));]]

local vm = rbxvm.open(body);
--[[
local game = vm.game;

vm.game.Workspace:Destroy();]]

-- for syncing we should detect when file changes then sync accordingly, change the source file linked to the object then apply changes to roblox studio

-- for package manager we only have to grab the object, maybe edit the contents and then publish

--local data = rbxvm.save(vm, 'rbxm');
