package ui::consts;

using namespace rew::ns;

consts::INIT = const_rec {
  VIDEO: 0x00000020
};

consts::WINDOW = const_rec {
  POS_UNDEFINED: 0x1fff0000,

  SHOWN: 0x00000004,
  RESIZABLE: 0x00000020,
  OPENGL: 0x00000002
};

consts::RENDERER = const_rec {
  ACCELERATED: 0x00000002,
};

consts::EVENTS = const_rec {
  QUIT: 0x100,
  KEYDOWN: 0x300,
  KEYUP: 0x301,

  START_LOOP: 0x111111,
  LOOP_END: 0x111112,
  LOOP_FRAME: 0x111112,
};

consts::GL = {
  MAJOR_VERSION: 17
  MINOR_VERSION: 18
  PROFILE_MASK: 21

  PROFILE_CORE: 0x0001
  PROFILE_COMPATIBILITY: 0x0002
  PROFILE_ES: 0x0004

}