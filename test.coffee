import "#std.testing!";
import ui from "./main.coffee";

using namespace rew::ns;

testing::describe 'Fonts', (it) ->
  it 'should open window', ->
    ui::init(ui::consts::INIT.VIDEO)

    win = ui::window::new("SDL Window", "resizable")

    renderer = win.createRenderer()

    renderer.loadFontForSizes('assets/DejaVuSansMono.ttf', 16, 24, 36)

    ui::loop::run ->
      renderer.setRGB()
      renderer.clear()

      renderer.setRGB 255
      renderer.fillRect(100, 100, 100, 100)

      renderer.setFontSize 16
      renderer.drawText 100, 200, "hello"

      renderer.setFontSize 24
      renderer.drawText 100, 300, "hello"

      renderer.setFontSize 36
      renderer.drawText 100, 400, "hello"

      renderer.render()

testing::describe 'GL', (it) ->
  it 'should open window', ->
    ui::init(ui::consts::INIT.VIDEO)

    win = ui::window::new("SDL Window", "opengl")

    win.GL()

    GL_TRIANGLES = 0x0004
    GL_COLOR_BUFFER_BIT = 0x00004000

    ui::loop::run ->

      ui::libGL.glClearColor(1, 1, 1, 1);
      ui::libGL.glClear(GL_COLOR_BUFFER_BIT);

      ui::libGL.glBegin(GL_TRIANGLES);
      ui::libGL.glColor3f(1, 0, 0); ui::libGL.glVertex3f(-0.5, -0.5, 0);
      ui::libGL.glColor3f(0, 1, 0); ui::libGL.glVertex3f(0.5, -0.5, 0);
      ui::libGL.glColor3f(0, 0, 1); ui::libGL.glVertex3f(0, 0.5, 0);
      ui::libGL.glEnd();

      win.GLSwap()

      