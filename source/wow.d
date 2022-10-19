/*
 * Copyright (c) 2022 XXIV
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
module wow;

import std.string;

enum name_t
{
    UNKNOWN = 0,
    ARC,
    ARROW,
    ARROW2,
    ARROW3,
    BALLOON,
    BALLOON2,
    BOUNCE,
    BOUNCINGBALL,
    BOUNCINGBAR,
    BOXBOUNCE,
    BOXBOUNCE2,
    CHRISTMAS,
    CIRCLE,
    CIRCLEHALVES,
    CIRCLEQUARTERS,
    CLOCK,
    DOTS,
    DOTS10,
    DOTS11,
    DOTS12,
    DOTS2,
    DOTS3,
    DOTS4,
    DOTS5,
    DOTS6,
    DOTS7,
    DOTS8,
    DOTS9,
    DQPB,
    EARTH,
    FLIP,
    GRENADE,
    GROWHORIZONTAL,
    GROWVERTICAL,
    HAMBURGER,
    HEARTS,
    LAYER,
    LINE,
    LINE2,
    MONKEY,
    MOON,
    NOISE,
    PIPE,
    POINT,
    PONG,
    RUNNER,
    SHARK,
    SIMPLEDOTS,
    SIMPLEDOTSSCROLLING,
    SMILEY,
    SQUARECORNERS,
    SQUISH,
    STAR,
    STAR2,
    TOGGLE,
    TOGGLE10,
    TOGGLE11,
    TOGGLE12,
    TOGGLE13,
    TOGGLE2,
    TOGGLE3,
    TOGGLE4,
    TOGGLE5,
    TOGGLE6,
    TOGGLE7,
    TOGGLE8,
    TOGGLE9,
    TRIANGLE,
    WEATHER,
}

struct spinner_t
{
    name_t name;
    int interval;
    int frames_length;
    char** frames;
}

struct wow_t;

extern (C) wow_t* wow_init(spinner_t* s, const char* text);
extern (C) void wow_persist(wow_t* self);
extern (C) void wow_persist_with(wow_t* self, spinner_t* s, const char* text);
extern (C) void wow_spinner(wow_t* self, spinner_t* s);
extern (C) void wow_start(wow_t* self);
extern (C) void wow_stop(wow_t* self);
extern (C) void wow_text(wow_t* self, const char* txt);
extern (C) spinner_t* spin_get(name_t name);
extern (C) void wow_clean(wow_t* self);
extern (C) void spinner_clean(spinner_t* self);

alias Spinner = spinner_t;

alias Name = name_t;

Spinner* spinnerGet(Name name)
{
    return spin_get(name);
}

void spinnerClean(Spinner* spinner)
{
    spinner_clean(spinner);
}

class Wow
{
    private wow_t* wow;
    this(Spinner* s, string text)
    {
        this.wow = wow_init(s, toStringz(text));
    }

    void persist()
    {
        wow_persist(this.wow);
    }

    void persistWith(Spinner* s, string text)
    {
        wow_persist_with(this.wow, s, toStringz(text));
    }

    void spinner(Spinner* s)
    {
        wow_spinner(this.wow, s);
    }

    void start()
    {
        wow_start(this.wow);
    }

    void stop()
    {
        wow_stop(this.wow);
    }

    void text(string text)
    {
        wow_text(this.wow, toStringz(text));
    }

    ~this()
    {
        wow_clean(this.wow);
    }
}