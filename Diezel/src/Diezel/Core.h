#pragma once

#ifdef DZ_PLATFORM_WINDOWS
	#ifdef DZ_BUILD_DLL
		#define DIEZEL_API __declspec(dllexport)
	#else
		#define DIEZEL_API __declspec(dllimport)
	#endif
#else
	#error Diezel only supports Windows!
#endif