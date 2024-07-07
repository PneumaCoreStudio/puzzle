#ifndef COMPONENT_H
#define COMPONENT_H

#include <godot_cpp/classes/node.hpp>

namespace godot {

    class Component : public Node {
        GDCLASS(Component, Node)

    protected:
        static void _bind_methods();

    public:
        Component();
        ~Component();

        //void _run() override;
    };
}

#endif