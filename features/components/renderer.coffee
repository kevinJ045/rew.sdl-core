
using namespace ui::SDL;
using namespace ui::SDL_ttf;
using namespace rew::ns;

loaded_fonts = new Map;

@{proto.class()}
function Renderer(
  @window,
  @flags = ui::consts::RENDERER.ACCELERATED,
  @index = -1
)
  @_ffi_values = {}
  @id = genUid()

  @current_color = [];
  @current_font = null;
  @current_fontname = null;

  @_ffi_values.renderer = SDL_CreateRenderer @window._ffi_values.win, @index, @flags

  Registry::items.set @id, @;

  @


function Renderer::render()
  SDL_RenderPresent @_ffi_values.renderer;

function Renderer::drawPoint(x, y)
  SDL_RenderDrawPoint @_ffi_values.renderer, x, y;

function Renderer::drawLine(x, y, endX, endY)
  SDL_RenderDrawLine @_ffi_values.renderer, x, y, endX, endY;

function Renderer::fillRect(x, y, w, h)
  SDL_RenderFillRect @_ffi_values.renderer, utils::i32many x, y, w, h;

function Renderer::rect(x, y, w, h)
  SDL_RenderDrawRect @_ffi_values.renderer, utils::i32many x, y, w, h;

function Renderer::setRGB(r = 0, g = 0, b = 0, a = 255)
  @current_color = [r, g, b, a]
  SDL_SetRenderDrawColor @_ffi_values.renderer, r, g, b, a;
  
function Renderer::clear()
  SDL_RenderClear @_ffi_values.renderer;

function Renderer::loadFont(fontname, size)
  font = loaded_fonts.get("#{fontname}-#{size}") ?? TTF_OpenFont(
    utils::cstr_(fontname),
    size
  );

  unless font
    throw new Error("TTF Error: #{ptr::string SDL_GetError()}")

  if font.value is 0n
    throw new Error("Font loading failed for #{fontname}");

  @current_fontname = fontname
  @current_font = font
  loaded_fonts.set "#{fontname}-#{size}", font

function Renderer::loadFontForSizes(fontname, ...sizes)
  sizes.map (size) => @loadFont(fontname, size)

function Renderer::setFontSize(size)
  @loadFont(@current_fontname, size)

function Renderer::drawText(x, y, text, _w, _h)
  color = (@current_color[0])
    | (@current_color[1] << 8)
    | (@current_color[2] << 16)
    | (@current_color[3] << 24)

  surface = if _w
    TTF_RenderText_Solid_Wrapped @current_font, utils::cstr_(text), color, _w
  else
    TTF_RenderText_Blended @current_font, utils::cstr_(text), color

  texture = SDL_CreateTextureFromSurface @_ffi_values.renderer, surface

  format = utils::alloc ffi::u32
  access = utils::alloc ffi::i32
  w = utils::alloc ffi::i32
  h = utils::alloc ffi::i32

  SDL_QueryTexture texture, format.ptr, access.ptr, w.ptr, h.ptr

  SDL_FreeSurface surface

  rect = utils::i32many x, y, w.get(), h.get()

  SDL_RenderCopy @_ffi_values.renderer, texture, null, rect;

  SDL_DestroyTexture texture;

  


export { Renderer }
