#pragma once

#ifdef DZ_PLATFORM_WINDOWS

extern Diezel::Application* Diezel::CreateApplication();

int main(int argc, char** argv)
{
	Diezel::Log::Init();

	auto app = Diezel::CreateApplication();
	app->Run();
	delete app;
}

#endif