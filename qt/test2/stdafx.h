/****************************   stdafx.h    **********************************
* Author:        Agner Fog
* Date created:  2006-07-15
* Last modified: 2006-07-15
* Project:       objconv
* Module:        stdafx.h
* Description:
* Header file including other header files for the project.
*
* Copyright 2006-2008 GNU General Public License http://www.gnu.org/licenses
*****************************************************************************/

#ifndef OBJCONV_STDAFX_H
#define OBJCONV_STDAFX_H

// System header files
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <inttypes.h>

// Project header files. The order of these files is not arbitrary.
#include "lib1.h"      // Constants, integer types, etc.
#include "error.h"        // Error handler
#include "containers.h"   // Classes for data buffers and dynamic memory allocation

#include "coff.h"         // COFF files structure
#include "macho.h"        // Mach-O files structure
#include "disasm.h"       // Structures and classes for disassembler
#include "parser.h"
#include "data.h"

#endif // defined OBJCONV_STDAFX_H
