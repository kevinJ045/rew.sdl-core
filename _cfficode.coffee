changeFfi = (obj) => {
  for key, value in obj
    args = value.parameters.map (i) => "ffi::#{i}"
    ret = "ffi::#{value.result}"
    rew::io::out.print "ffi_type(#{args}) #{key} = -> #{ret}"
}

changeFfi {
  // Buffers
  glGenBuffers: { parameters: ["i32", "pointer"], result: "void" },
  glBindBuffer: { parameters: ["u32", "u32"], result: "void" },
  glBufferData: { parameters: ["u32","i32","pointer","u32"], result: "void" },
  glBufferSubData: { parameters: ["u32","i32","i32","pointer"], result: "void" },
  glDeleteBuffers: { parameters: ["i32","pointer"], result: "void" },
  glEnableVertexAttribArray: { parameters: ["u32"], result: "void" },
  glVertexAttribPointer: { parameters: ["u32","i32","u32","u8","i32","i32"], result: "void" },
  glDisableVertexAttribArray: { parameters: ["u32"], result: "void" },

  // Shaders & Programs
  glCreateShader: { parameters: ["u32"], result: "u32" },
  glShaderSource: { parameters: ["u32","i32","pointer","pointer"], result: "void" },
  glCompileShader: { parameters: ["u32"], result: "void" },
  glGetShaderiv: { parameters: ["u32","u32","pointer"], result: "void" },
  glGetShaderInfoLog: { parameters: ["u32","i32","pointer","pointer"], result: "void" },
  glDeleteShader: { parameters: ["u32"], result: "void" },
  glCreateProgram: { parameters: [], result: "u32" },
  glAttachShader: { parameters: ["u32","u32"], result: "void" },
  glLinkProgram: { parameters: ["u32"], result: "void" },
  glGetProgramiv: { parameters: ["u32","u32","pointer"], result: "void" },
  glGetProgramInfoLog: { parameters: ["u32","i32","pointer","pointer"], result: "void" },
  glUseProgram: { parameters: ["u32"], result: "void" },
  glDeleteProgram: { parameters: ["u32"], result: "void" },
  glGetUniformLocation: { parameters: ["u32","pointer"], result: "i32" },
  glUniform1f: { parameters: ["i32","f32"], result: "void" },
  glUniform1i: { parameters: ["i32","i32"], result: "void" },
  glUniform3f: { parameters: ["i32","f32","f32","f32"], result: "void" },
  glUniformMatrix4fv: { parameters: ["i32","i32","u8","pointer"], result: "void" },

  // Drawing / State
  glDrawArrays: { parameters: ["u32","i32","i32"], result: "void" },
  glDrawElements: { parameters: ["u32","i32","u32","pointer"], result: "void" },
  glEnable: { parameters: ["u32"], result: "void" },
  glDisable: { parameters: ["u32"], result: "void" },
  glDepthFunc: { parameters: ["u32"], result: "void" },
  glBlendFunc: { parameters: ["u32","u32"], result: "void" },
  glClear: { parameters: ["u32"], result: "void" },
  glClearColor: { parameters: ["f32","f32","f32","f32"], result: "void" },
  glViewport: { parameters: ["i32","i32","i32","i32"], result: "void" },

  // Textures (optional)
  glGenTextures: { parameters: ["i32","pointer"], result: "void" },
  glBindTexture: { parameters: ["u32","u32"], result: "void" },
  glTexImage2D: { parameters: ["u32","i32","i32","i32","i32","i32","u32","u32","pointer"], result: "void" },
  glTexParameteri: { parameters: ["u32","u32","i32"], result: "void" },
  glDeleteTextures: { parameters: ["i32","pointer"], result: "void" },
} 