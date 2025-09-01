package ui::loop;

using namespace rew::ns;
using namespace ui::SDL;
using namespace ui::consts::;

running = false;

Object.defineProperty(ui::loop::, 'running', {
  get: -> running
});

function event_loop(eventPtr, handle_event){
  while (SDL_PollEvent(eventPtr))
    view = ptr::view(eventPtr);
    type = view.getUint32(0);

    if type === EVENTS.QUIT
      running = false
      break
    else if handle_event
      handle_event type, eventPtr
}

# if (type === SDL_KEYDOWN)
#       keycode = view.getUint32(16+4, true);
#       print "key down:", keycode, ptr::string SDL_GetKeyName(keycode)
#     else if (type === SDL_KEYUP)
#       keycode = view.getInt32(16+4, true);
#       print "key up:", keycode

function run_loop(handle_event, delay){
  eventPtr = utils::ptr_int();

  if typeof handle_event == "function"
    handle_event EVENTS.START_LOOP

  loop {
    unless running {
      if handle_event
        handle_event EVENTS.LOOP_END 
      break
    }

    event_loop(eventPtr);

    if typeof handle_event == "function"
      handle_event EVENTS.LOOP_FRAME

    SDL_Delay(delay)
  }
}

function ui::loop::run(handle_event, delay = 16) {
  running = true;
  run_loop(handle_event, delay = 16)
}

function ui::loop::stop() {
  running = false;
}
