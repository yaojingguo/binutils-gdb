#!/bin/sh

# plugin_test_6.sh -- a test case for the plugin API.

# Copyright (C) 2010-2016 Free Software Foundation, Inc.
# Written by Cary Coutant <ccoutant@google.com>.

# This file is part of gold.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
# MA 02110-1301, USA.

# This file goes with plugin_test_6.c, a simple plug-in library that
# exercises the basic interfaces and prints out version numbers and
# options passed to the plugin.

check()
{
    if ! grep -q "$2" "$1"
    then
	echo "Did not find expected output in $1:"
	echo "   $2"
	echo ""
	echo "Actual output below:"
	cat "$1"
	exit 1
    fi
}

check plugin_test_6.err "API version:"
check plugin_test_6.err "gold version:"
check plugin_test_6.err "plugin_common_test_1.o.syms: claim file hook called"
check plugin_test_6.err "plugin_common_test_2.o.syms: claim file hook called"
check plugin_test_6.err "plugin_common_test_1.o.syms: c1: PREVAILING_DEF_IRONLY"
check plugin_test_6.err "plugin_common_test_1.o.syms: c2: PREVAILING_DEF_IRONLY"
check plugin_test_6.err "plugin_common_test_1.o.syms: c3: RESOLVED_IR"
check plugin_test_6.err "plugin_common_test_1.o.syms: c4: RESOLVED_IR"
check plugin_test_6.err "plugin_common_test_1.o.syms: c5: PREVAILING_DEF_IRONLY"
check plugin_test_6.err "plugin_common_test_2.o.syms: c1: RESOLVED_IR"
check plugin_test_6.err "plugin_common_test_2.o.syms: c2: RESOLVED_IR"
check plugin_test_6.err "plugin_common_test_2.o.syms: c3: PREVAILING_DEF_IRONLY"
check plugin_test_6.err "plugin_common_test_2.o.syms: c4: PREVAILING_DEF_IRONLY"
check plugin_test_6.err "plugin_common_test_2.o.syms: c5: RESOLVED_IR"
check plugin_test_6.err "cleanup hook called"

exit 0
