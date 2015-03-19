//
// CGPathReader.c
//
// Created by Marcus Rohrmoser on 11.03.10.
// Copyright (c) 2010-2015, Marcus Rohrmoser mobile Software
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted
// provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this list of conditions
// and the following disclaimer.
//
// 2. The software must not be used for military or intelligence or related purposes nor
// anything that's in conflict with human rights as declared in http://www.un.org/en/documents/udhr/ .
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
// IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
// IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//

#import "CGPathReader.h"
#import "PathParser.h"

CGPathRef CGPathCreateFromSVG(const char *path, NSError **errPtr)
{
	if( path == NULL )
		return NULL;
	const size_t len = strlen(path);
	// #FIXME check overflow
	PathParser *p = [[PathParser alloc] init];
	return [p newCGPathWithCString:path length:len trafo:NULL error:(NSError **)errPtr];
}


CGPathRef CGPathCreateFromSVGPath(NSString *d, const CGAffineTransform *trafo, NSError **errorPtr)
{
	PathParser *p = [[PathParser alloc] init];
	return [p newCGPathWithNSString:d trafo:trafo error:errorPtr];
}
