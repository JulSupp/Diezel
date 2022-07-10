#include <Diezel.h>


class Sandbox :public Diezel::Application
{
public:
	Sandbox() {}
	~Sandbox() {}

};

Diezel::Application* Diezel::CreateApplication() {
	return new Sandbox();
}
