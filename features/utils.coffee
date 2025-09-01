public package utils;

import "#std.encoding!";
using namespace rew::ns;

function utils::cstr_(...str)
  toBytes str.join("") + '\0'

function utils::cstr(...str)
  ptr::of utils::cstr_ str.join("")

function utils::ptr_int()
  buf = new Uint8Array(56);
  ptr::of(buf)

function utils::ptr_u32()
  buf = new Uint8Array(1);
  ptr::of(buf)

function utils::read_ptr_int(ptrv, type = 'i32')
  ptr::view(ptrv)["get#{type.startsWith('u') ? 'Uint' : 'Int'}#{parseInt(type.split(/^u|i/)[1])}"]()

function utils::i32many(...items)
  a = new Int32Array(items.length);
  for key, value in items
    a[key] = value
  ptr::of a

function utils::alloc(type)
  size = 4;
  switch (type)
    case "i32":
      size = 4;
      break;
    case "u32":
      size = 4;
      break;
    case "i16":
      size = 2;
      break;
    case "u16":
      size = 2;
      break;
    case "i8":
    case "u8":
      size = 1;
      break;
    case "f32":
      size = 4;
      break;
    case "f64":
      size = 8;
      break;
    default:
      size = 8;
      break;

  buf = new ArrayBuffer(size);
  view = new DataView(buf);

  ptrv = ptr::of(buf);

  return {
    ptr: ptrv,
    buf,
    view,
    get()
      switch (type)
        case "i32":
          return view.getInt32(0, true);
          break;
        case "u32":
          return view.getUint32(0, true);
          break;
        case "i16":
          return view.getInt16(0, true);
          break;
        case "u16":
          return view.getUint16(0, true);
          break;
        case "i8":
          return view.getInt8(0);
          break;
        case "u8":
          return view.getUint8(0);
          break;
        case "f32":
          return view.getFloat32(0, true);
          break;
        case "f64":
          return view.getFloat64(0, true);
          break;

    set(val)
      switch (type)
        case "i32":
          return view.setInt32(0, val, true);
          break;
        case "u32":
          return view.setUint32(0, val, true);
          break;
        case "i16":
          return view.setInt16(0, val, true);
          break;
        case "u16":
          return view.setUint16(0, val, true);
          break;
        case "i8": 
          return view.setInt8(0, val);
          break;
        case "u8": 
          return view.setUint8(0, val);
          break;
        case "f32":
          return view.setFloat32(0, val, true);
          break;
        case "f64":
          return view.setFloat64(0, val, true);
          break;
  }