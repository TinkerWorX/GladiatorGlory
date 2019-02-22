#pragma once

#ifdef RELEASE
#define DEBUG_MSG(msg)
#else
#define DEBUG_MSG(msg) call BJDebugMsg(msg)
#endif
