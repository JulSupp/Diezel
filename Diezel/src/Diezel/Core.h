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

#ifdef DZ_ENABLE_ASSERTS
#define DZ_ASSERT(x, ...) { if(!(x)) { HZ_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#define DZ_CORE_ASSERT(x, ...) { if(!(x)) { HZ_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
#define DZ_ASSERT(x, ...)
#define DZ_CORE_ASSERT(x, ...)
#endif


#define BIT(x) (1 << x) 