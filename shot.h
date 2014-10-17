/*
 * $Id: shot.h,v 1.1 2003/03/21 02:59:49 kenta Exp $
 *
 * Copyright 2002 Kenta Cho. All rights reserved.
 */

/**
 * Shot data.
 *
 * @version $Revision: 1.1 $
 */
#include "vector.h"

//senquack - partial conversion to fixed point
//typedef struct {
//  float x, y, mx, my;
//  float d;
//  int cnt, color;
//  float width, height;
//} Shot;
typedef struct
{
   float x, y, mx, my;
//  float d;
   GLfixed fd;
   int cnt, color;
//  float width, height;
   GLfixed fwidth, fheight;
} Shot;

#define SHOT_MAX 64

extern Shot shot[];

void initShots ();
void moveShots ();
void drawShots ();
void addShot (int x, int y, int ox, int oy, int color);
