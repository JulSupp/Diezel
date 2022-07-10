#pragma once
#include "Core.h"
#include "spdlog\spdlog.h"
#include <memory>

namespace Diezel {
	class DIEZEL_API Log
	{
	public:
		static void Init();
		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:

		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;


	};
}


// Core log macros
#define DZ_CORE_TRACE(...)	::Diezel::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define DZ_CORE_INFO(...)	::Diezel::Log::GetCoreLogger()->info(__VA_ARGS__)
#define DZ_CORE_WARN(...)	::Diezel::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define DZ_CORE_ERROR(...)	::Diezel::Log::GetCoreLogger()->error(__VA_ARGS__)
#define DZ_CORE_FATAL(...)	::Diezel::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client log macros
#define DZ_TRACE(...)	::Diezel::Log::GetClientLogger()->trace(__VA_ARGS__)
#define DZ_INFO(...)	::Diezel::Log::GetClientLogger()->info(__VA_ARGS__)
#define DZ_WARN(...)	::Diezel::Log::GetClientLogger()->warn(__VA_ARGS__)
#define DZ_ERROR(...)	::Diezel::Log::GetClientLogger()->error(__VA_ARGS__)
#define DZ_FATAL(...)	::Diezel::Log::GetClientLogger()->fatal(__VA_ARGS__)