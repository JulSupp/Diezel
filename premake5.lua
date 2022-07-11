workspace "Diezel"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Diezel/vendor/GLFW/include"

include "Diezel/vendor/GLFW"

project "Diezel"
	location "Diezel"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "dzpch.h"
	pchsource "Diezel/src/dzpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs 
	{
		"%{prj.name}/vendor/spdlog/include",
		"%{prj.name}/src",
		"%{IncludeDir.GLFW}"
	}

	links 
	{ 
		"GLFW",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"DZ_PLATFORM_WINDOWS",
			"DZ_BUILD_DLL"
		}

	
	postbuildcommands
	{
		("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
	}

	filter "configurations:Debug"
		defines "DZ_Debug"
		symbols "On"

	filter "configurations:Release"
		defines "DZ_Release"
		optimize "On"

	filter "configurations:Dist"
		defines "DZ_Dist"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Diezel/vendor/spdlog/include",
		"Diezel/src"
	}

	links
	{
		"Diezel"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"DZ_PLATFORM_WINDOWS",
		}

	filter "configurations:Debug"
		defines "DZ_Debug"
		symbols "On"

	filter "configurations:Release"
		defines "DZ_Release"
		optimize "On"

	filter "configurations:Dist"
		defines "DZ_Dist"
		optimize "On"