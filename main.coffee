package ui;

# STD Libraries
import "./_std.coffee";

# Main Libraries
import "./features/const.coffee";
import "./features/utils.coffee";
import { SDL, SDL_ttf, libGL } from "./features/ffi.coffee";
ui::SDL = SDL;
ui::SDL_ttf = SDL_ttf;
ui::libGL = libGL;

import "./features/loop.coffee";

function ui::init(init)
  unless SDL.SDL_Init(init) is 0
    throw new Error 'Couldn\'t initiate SDL:', rew::ptr::string SDL.SDL_GetError()
  SDL_ttf.TTF_Init()
  # unless SDL_ttf.TTF_Init() is 0
  #   throw new Error 'Couldn\'t initiate SDL_ttf for font rendering:', rew::ptr::string SDL.SDL_GetError()


import "./features/registry.coffee";
import "./features/components/init.coffee";

native ui;