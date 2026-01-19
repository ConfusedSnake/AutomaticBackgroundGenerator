#include <SFML/Graphics.hpp>
#include <SFML/Window.hpp>

int main() {
    sf::RenderWindow window(sf::VideoMode(900, 600), "SFML Starter (Mac + WSL)", sf::Style::Default);
    window.setVerticalSyncEnabled(true);

    // Simple shape so you know it worked.
    sf::CircleShape circle(80.f);
    circle.setPosition(900.f/2.f - 80.f, 600.f/2.f - 80.f);
    circle.setFillColor(sf::Color(80, 180, 255));

    while (window.isOpen()) {
        sf::Event event{};
        while (window.pollEvent(event)) {
            if (event.type == sf::Event::Closed) window.close();
            if (event.type == sf::Event::KeyPressed && event.key.code == sf::Keyboard::Escape) window.close();
        }

        window.clear(sf::Color(18, 18, 22));
        window.draw(circle);
        window.display();
    }

    return 0;
}
