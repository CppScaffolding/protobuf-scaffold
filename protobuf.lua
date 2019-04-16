-- scaffold geniefile for protobuf

protobuf_script = path.getabsolute(path.getdirectory(_SCRIPT))
protobuf_root = path.join(protobuf_script, "protobuf")

protobuf_includedirs = {
	path.join(protobuf_script, "config"),
	protobuf_root,
}

protobuf_libdirs = {}
protobuf_links = {}
protobuf_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { protobuf_includedirs }
	end,

	_add_defines = function()
		defines { protobuf_defines }
	end,

	_add_libdirs = function()
		libdirs { protobuf_libdirs }
	end,

	_add_external_links = function()
		links { protobuf_links }
	end,

	_add_self_links = function()
		links { "protobuf" }
	end,

	_create_projects = function()

project "protobuf"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		protobuf_includedirs,
	}

	defines {}

	files {
		path.join(protobuf_script, "config", "**.h"),
		path.join(protobuf_root, "**.h"),
		path.join(protobuf_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
