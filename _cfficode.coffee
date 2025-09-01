changeFfi = (obj) => {
  for key, value in obj
    args = value.parameters.map (i) => "ffi::#{i}"
    ret = "ffi::#{value.result}"
    rew::io::out.print "ffi_type(#{args}) #{key} = -> #{ret}"
}

changeFfi {
  glClearColor: { parameters: ["f32","f32","f32","f32"], result: "void" },
  glClear: { parameters: ["u32"], result: "void" },
  glBegin: { parameters: ["u32"], result: "void" },
  glColor3f: { parameters: ["f32","f32","f32"], result: "void" },
  glVertex3f: { parameters: ["f32","f32","f32"], result: "void" },
  glEnd: { parameters: [], result: "void" },
}