using namespace rew::ns;

SDL_function_map = instantiate class {
  # Init
  ffi_type(ffi::u32) SDL_Init = -> ffi::u32
  ffi_type() SDL_Quit = -> ffi::void
  ffi_type() SDL_GetError = -> ffi::buffer

  # Timing
  ffi_type(ffi::u32) SDL_Delay = -> ffi::void
  ffi_type() SDL_GetTicks = -> ffi::u32
  ffi_type() SDL_GetPerformanceCounter = -> ffi::u64
  ffi_type() SDL_GetPerformanceFrequency = -> ffi::u64

  # Events
  ffi_type(ffi::ptr) SDL_PollEvent = -> ffi::i32
  ffi_type(ffi::ptr) SDL_WaitEvent = -> ffi::i32

  # Windows
  ffi_type(ffi::buffer, ffi::i32, ffi::i32, ffi::i32, ffi::i32, ffi::u32) SDL_CreateWindow = -> ffi::ptr
  ffi_type(ffi::ptr) SDL_DestroyWindow = -> ffi::void
  ffi_type(ffi::ptr, ffi::buffer) SDL_SetWindowTitle = -> ffi::void
  ffi_type(ffi::ptr) SDL_GetWindowTitle = -> ffi::ptr
  ffi_type(ffi::ptr, ffi::i32, ffi::i32) SDL_SetWindowSize = -> ffi::void
  ffi_type(ffi::ptr, ffi::ptr, ffi::ptr) SDL_GetWindowSize = -> ffi::void

  # Renderer
  ffi_type(ffi::ptr, ffi::i32, ffi::u32) SDL_CreateRenderer = -> ffi::ptr
  ffi_type(ffi::ptr) SDL_DestroyRenderer = -> ffi::void
  ffi_type(ffi::ptr, ffi::u8, ffi::u8, ffi::u8, ffi::u8) SDL_SetRenderDrawColor = -> ffi::i32
  ffi_type(ffi::ptr) SDL_RenderClear = -> ffi::i32
  ffi_type(ffi::ptr) SDL_RenderPresent = -> ffi::void

  ffi_type(ffi::ptr, ffi::i32, ffi::i32) SDL_RenderDrawPoint = -> ffi::i32
  ffi_type(ffi::ptr, ffi::i32, ffi::i32, ffi::i32, ffi::i32) SDL_RenderDrawLine = -> ffi::i32
  ffi_type(ffi::ptr, ffi::ptr) SDL_RenderDrawRect = -> ffi::i32
  ffi_type(ffi::ptr, ffi::ptr) SDL_RenderFillRect = -> ffi::i32

  # Keyboard/Mouse
  ffi_type(ffi::ptr) SDL_GetKeyboardState = -> ffi::ptr
  ffi_type(ffi::i32) SDL_GetKeyName = -> ffi::ptr
  ffi_type(ffi::ptr, ffi::ptr) SDL_GetMouseState = -> ffi::i32
  ffi_type(ffi::ptr, ffi::ptr) SDL_GetRelativeMouseState = -> ffi::i32

  # Surfaces
  # ffi_type(ffi::ptr) SDL_LoadBMP = -> ffi::ptr
  # ffi_type(ffi::ptr, ffi::ptr) SDL_SaveBMP = -> ffi::i32
  ffi_type(ffi::ptr) SDL_FreeSurface = -> ffi::void # free mem

  ffi_type(ffi::ptr, ffi::ptr) SDL_CreateTextureFromSurface = -> ffi::ptr
  ffi_type(ffi::ptr) SDL_DestroyTexture = -> ffi::void
  ffi_type(ffi::ptr, ffi::ptr, ffi::ptr, ffi::ptr) SDL_RenderCopy = -> ffi::i32
  ffi_type(ffi::ptr, ffi::ptr, ffi::ptr, ffi::ptr, ffi::ptr) SDL_QueryTexture = -> ffi::i32

  # Audio
  ffi_type(ffi::ptr, ffi::ptr) SDL_OpenAudio = -> ffi::i32
  ffi_type(ffi::i32) SDL_PauseAudio = -> ffi::void
  ffi_type() SDL_CloseAudio = -> ffi::void

  # Contexts
  ffi_type(ffi::ptr) SDL_GL_CreateContext = -> ffi::ptr
  ffi_type(ffi::ptr, ffi::ptr) SDL_GL_MakeCurrent = -> ffi::i32
  ffi_type(ffi::ptr) SDL_GL_SwapWindow = -> ffi::void
  ffi_type(ffi::ptr) SDL_GL_DeleteContext = -> ffi::void

  ffi_type(ffi::ptr) SDL_Vulkan_LoadLibrary = -> ffi::bool
  ffi_type(ffi::ptr, ffi::ptr, ffi::ptr) SDL_Vulkan_GetInstanceExtensions = -> ffi::bool
  ffi_type(ffi::ptr, ffi::ptr, ffi::ptr) SDL_Vulkan_CreateSurface = -> ffi::bool
}

SDL_ttf_function_map = instantiate class {
  # Main
  ffi_type() TTF_Init = -> ffi::ptr
  ffi_type() TTF_Quit = -> ffi::void

  # Font
  ffi_type(ffi::buffer, 'i32') TTF_OpenFont = -> ffi::ptr
  ffi_type(ffi::ptr, ffi::buffer, ffi::u64) TTF_RenderText_Blended = -> ffi::ptr
  ffi_type(ffi::ptr, ffi::buffer, ffi::u64, ffi::u32) TTF_RenderText_Solid_Wrapped = -> ffi::ptr
}

GL_function_map = instantiate class {
  ffi_type(ffi::f32,ffi::f32,ffi::f32,ffi::f32) glClearColor = -> ffi::void
  ffi_type(ffi::u32) glClear = -> ffi::void
  ffi_type(ffi::u32) glBegin = -> ffi::void
  ffi_type(ffi::f32,ffi::f32,ffi::f32) glColor3f = -> ffi::void
  ffi_type(ffi::f32,ffi::f32,ffi::f32) glVertex3f = -> ffi::void
  ffi_type() glEnd = -> ffi::void
}

sdl_libname = rew::os::clamp(
  'SDL2.dll',
  'libSDL2.so',
  '.artifacts/libSDL2-2.0.0.dylib'
)

sdlttf_libname = rew::os::clamp(
  'SDL2_ttf.dll',
  'libSDL2_ttf.so',
  '.artifacts/libSDL2_ttf-2.0.0.dylib'
)

gl_libname = rew::os::clamp(
  'GL.dll',
  'libGL.so',
  '.artifacts/libSDL2_ttf-2.0.0.dylib'
)

SDL = ffi::open sdl_libname, SDL_function_map
SDL_ttf = ffi::open sdlttf_libname, SDL_ttf_function_map
libGL = ffi::open gl_libname, GL_function_map

export { SDL, SDL_ttf, libGL };