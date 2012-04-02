/*
 * Copyright (C) 2011-2012 DarkCore <http://www.darkpeninsula.eu/>
 * Copyright (C) 2011-2012 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */


#include "headers.h"
#include "MPQFile.h"
#include "MPQ.h"

MPQFile::MPQFile(const char* filename, HANDLE handle_)
{
    handle = handle_;
    size = 0;
    eof = true;
    buffer = NULL;
    pointer = 0;

    buffer = ExtractFileToMemory(handle_, filename, size);
    if (buffer == NULL || size == 0)
        eof = true;
    else
        eof = false;
}

size_t MPQFile::read(void* dest, size_t bytes)
{
    size_t i = 0;
    for (; i < bytes && pointer < size; i++)
        ((char*)dest)[i] = *(buffer + (pointer++));
    return i;
}

void MPQFile::seek(int offset)
{
    pointer = offset;
    eof = pointer >= size;
}

void MPQFile::seekRelative(int offset)
{
    pointer += offset;
    eof = pointer >= size;
}

void MPQFile::close()
{
    delete[] buffer;
    handle = NULL;
    eof = true;
    buffer = NULL;
    pointer = 0;
    size = 0;
}