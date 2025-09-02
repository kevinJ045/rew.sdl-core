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
  ffi_type(ffi::i32, ffi::i32) SDL_GL_SetAttribute = -> ffi::i32
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

# GL_function_map = instantiate class {
#   ffi_type(ffi::i32,ffi::ptr) glGenBuffers = -> ffi::void
#   ffi_type(ffi::u32,ffi::u32) glBindBuffer = -> ffi::void
#   ffi_type(ffi::u32,ffi::i32,ffi::ptr,ffi::u32) glBufferData = -> ffi::void
#   ffi_type(ffi::u32,ffi::i32,ffi::i32,ffi::ptr) glBufferSubData = -> ffi::void
#   ffi_type(ffi::i32,ffi::ptr) glDeleteBuffers = -> ffi::void
#   ffi_type(ffi::u32) glEnableVertexAttribArray = -> ffi::void
#   ffi_type(ffi::u32,ffi::i32,ffi::u32,ffi::u8,ffi::i32,ffi::i32) glVertexAttribPointer = -> ffi::void
#   ffi_type(ffi::u32) glDisableVertexAttribArray = -> ffi::void
#   ffi_type(ffi::u32) glCreateShader = -> ffi::u32
#   ffi_type(ffi::u32,ffi::i32,ffi::ptr,ffi::ptr) glShaderSource = -> ffi::void
#   ffi_type(ffi::u32) glCompileShader = -> ffi::void
#   ffi_type(ffi::u32,ffi::u32,ffi::ptr) glGetShaderiv = -> ffi::void
#   ffi_type(ffi::u32,ffi::i32,ffi::ptr,ffi::ptr) glGetShaderInfoLog = -> ffi::void
#   ffi_type(ffi::u32) glDeleteShader = -> ffi::void
#   ffi_type() glCreateProgram = -> ffi::u32
#   ffi_type(ffi::u32,ffi::u32) glAttachShader = -> ffi::void
#   ffi_type(ffi::u32) glLinkProgram = -> ffi::void
#   ffi_type(ffi::u32,ffi::u32,ffi::ptr) glGetProgramiv = -> ffi::void
#   ffi_type(ffi::u32,ffi::i32,ffi::ptr,ffi::ptr) glGetProgramInfoLog = -> ffi::void
#   ffi_type(ffi::u32) glUseProgram = -> ffi::void
#   ffi_type(ffi::u32) glDeleteProgram = -> ffi::void
#   ffi_type(ffi::u32,ffi::ptr) glGetUniformLocation = -> ffi::i32
#   ffi_type(ffi::i32,ffi::f32) glUniform1f = -> ffi::void
#   ffi_type(ffi::i32,ffi::i32) glUniform1i = -> ffi::void
#   ffi_type(ffi::i32,ffi::f32,ffi::f32,ffi::f32) glUniform3f = -> ffi::void
#   ffi_type(ffi::i32,ffi::i32,ffi::u8,ffi::ptr) glUniformMatrix4fv = -> ffi::void
#   ffi_type(ffi::u32,ffi::i32,ffi::i32) glDrawArrays = -> ffi::void
#   ffi_type(ffi::u32,ffi::i32,ffi::u32,ffi::ptr) glDrawElements = -> ffi::void
#   ffi_type(ffi::u32) glEnable = -> ffi::void
#   ffi_type(ffi::u32) glDisable = -> ffi::void
#   ffi_type(ffi::u32) glDepthFunc = -> ffi::void
#   ffi_type(ffi::u32,ffi::u32) glBlendFunc = -> ffi::void
#   ffi_type(ffi::u32) glClear = -> ffi::void
#   ffi_type(ffi::f32,ffi::f32,ffi::f32,ffi::f32) glClearColor = -> ffi::void
#   ffi_type(ffi::i32,ffi::i32,ffi::i32,ffi::i32) glViewport = -> ffi::void
#   ffi_type(ffi::i32,ffi::ptr) glGenTextures = -> ffi::void
#   ffi_type(ffi::u32,ffi::u32) glBindTexture = -> ffi::void
#   ffi_type(ffi::u32,ffi::i32,ffi::i32,ffi::i32,ffi::i32,ffi::i32,ffi::u32,ffi::u32,ffi::ptr) glTexImage2D = -> ffi::void
#   ffi_type(ffi::u32,ffi::u32,ffi::i32) glTexParameteri = -> ffi::void
#   ffi_type(ffi::i32,ffi::ptr) glDeleteTextures = -> ffi::void
#   ffi_type() glEnd = -> ffi::void
#   ffi_type(ffi::u32) glBegin = -> ffi::void
#   ffi_type(ffi::f32,ffi::f32,ffi::f32) glColor3f = -> ffi::void
#   ffi_type(ffi::f32,ffi::f32,ffi::f32) glVertex3f = -> ffi::void
# }

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

# gl_libname = rew::os::clamp(
#   'GL.dll',
#   'libGL.so',
#   '.artifacts/libSDL2_ttf-2.0.0.dylib'
# )

SDL = ffi::open sdl_libname, SDL_function_map
SDL_ttf = ffi::open sdlttf_libname, SDL_ttf_function_map
# libGL = ffi::open gl_libname, GL_function_map

export { SDL, SDL_ttf };