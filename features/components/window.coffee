import { Renderer } from "./renderer.coffee";

using namespace ui::SDL;
using namespace rew::ns;


@{proto.class()}
function Window(
  @title,
  @flags = ui::consts::WINDOW.SHOWN,
  @width = 800,
  @height = 600,
)
  unless @flags then @flags = ui::consts::WINDOW.SHOWN;
  if @flags == "resizable" {
    @flags = ui::consts::WINDOW.RESIZABLE
  } else if @flags == "opengl" {
    @flags = ui::consts::WINDOW.OPENGL | ui::consts::WINDOW.SHOWN
  }

  @_ffi_values = {}
  @id = genUid()
  
  # pointer value
  @_ffi_values.win = SDL_CreateWindow(
    utils::cstr_(@title),
    ui::consts::WINDOW.POS_UNDEFINED,
    ui::consts::WINDOW.POS_UNDEFINED,
    @width,
    @height,
    @flags
  )

  unless @_ffi_values.win
    throw new Error("Could not create a window: #{ptr::string SDL_GetError()}")

  # pointer values
  @_ffi_values.w = utils::ptr_int()  
  @_ffi_values.h = utils::ptr_int()

  Registry::items.set @id, @;

  @

function Window::getSize()
  SDL_GetWindowSize @_ffi_values.win, @_ffi_values.w, @_ffi_values.h
  @width = utils::read_ptr_int(@_ffi_values.w)
  @height = utils::read_ptr_int(@_ffi_values.h)
  { @width, @height }

function Window::setSize(w, h)
  SDL_SetWindowSize @_ffi_values.win, w, h
  @getSize()

function Window::getTitle()
  @title = ptr::string SDL_GetWindowTitle @_ffi_values.win

function Window::setTitle(title)
  SDL_SetWindowTitle @_ffi_values.win, utils::cstr_(title)
  @getTitle()

function Window::createRenderer(flags = ui::consts::RENDERER.ACCELERATED, index = -1)
  Renderer::new @, flags, index

function Window::GL(version_major = 0, version_minor = 0, profile = ui::consts::GL.PROFILE_CORE)
      
  if version_major
    SDL_GL_SetAttribute(ui::consts::GL.MAJOR_VERSION, version_major or 3);
  
  if version_minor
    SDL_GL_SetAttribute(ui::consts::GL.MINOR_VERSION, version_minor or 2);
  
  if profile
    SDL_GL_SetAttribute(ui::consts::GL.PROFILE_MASK, profile);

  unless @_ffi_values.GL
    @_ffi_values.GL = SDL_GL_CreateContext @_ffi_values.win
    unless  @_ffi_values.GL
      throw new Error("Could not create a GL context: #{ptr::string SDL_GetError()}")
  current = SDL_GL_MakeCurrent @_ffi_values.win, @_ffi_values.GL
  unless current is 0
     throw new Error("Could not switch GL context: #{ptr::string SDL_GetError()}")
  ;

function Window::GLSwap()
  SDL_GL_SwapWindow @_ffi_values.win;

export { Window, Renderer }




