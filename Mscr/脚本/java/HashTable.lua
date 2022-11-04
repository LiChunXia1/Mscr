import('com.nx.assist.lua.LuaEngine')

local dex = LuaEngine.loadApk("mscr.plugin").loadClass("com.mscr.Main")

function new()
  return dex.luaj_new_hashtable()
end

function get(hashtable, key)
  return dex.get(hashtable, key)
end

function put(hashtable, key , value)
  dex.put(hashtable, key , value)
end

function remove(hashtable, key)
  dex.remove(hashtable, key)
end