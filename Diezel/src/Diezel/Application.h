#pragma once
#include "Core.h"

namespace Diezel {
	class DIEZEL_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	Application* CreateApplication();
}




