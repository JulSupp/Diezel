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

project "Diezel"
	location "Diezel"
	kind "SharedLib"
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
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.19041.0"

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
		systemversion "10.0.19041.0"

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