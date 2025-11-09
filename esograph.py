import pygame
from pygame.locals import *
from pygame import Vector2
import vidmaker
import random
import sys
import time
import math
import re
import os

import ctypes

# ===== PYGAME INIT =====
FPS = 60

WHITE = (205, 214, 244)
BLACK = (0, 0, 0)
PEACH = (250, 179, 135)
MAUVE = (203, 166, 247)
RED = (243, 139, 168)
GREEN = (166, 227, 161)
BLUE = (137, 180, 250)
SKY = (137, 220, 235)
TEAL = (148, 226, 213)
GREY = (49, 50, 68)
SURFACE1 = (69, 71, 90, 128)
YELLOW = (249, 226, 175)

os.environ['SDL_VIDEO_CENTERED'] = '1'

awareness = ctypes.c_int()
errorCode = ctypes.windll.shcore.GetProcessDpiAwareness(0, ctypes.byref(awareness))
errorCode = ctypes.windll.shcore.SetProcessDpiAwareness(2)

pygame.init()
WIDTH, HEIGHT = (1920, 1200)
screen = pygame.display.set_mode((WIDTH, HEIGHT), NOFRAME)
pygame.display.set_caption("ESOGRAPH")
clock = pygame.time.Clock()

info = pygame.display.Info()
WIDTH = info.current_w
HEIGHT = info.current_h

# ===== COEFFICIENTS =====
g = 0.6
gdead = 10000
res = 0.05
edgecoeff = 0.0001
straighten = 0.0002
repel = 15

def load():
    recording = False
    SIMSCALE = 1

    # ===== GRAPH SETUP =====
    labels = ["I", "O0", "O1", "*"]
    edges = []
    bonds = []
    instructions = []
    groups = []
    grouping = False

    inp = []

    with open("graph.glf", "r") as file:
        tmp = [("SWAP *", "I", "I", ""), ("SWAP *", "O0", "O0", ""), ("SWAP *", "O1", "O1", ""), ("SWAP *", "*", "*", "")]
        for line in file.read().splitlines():
            if line == "":
                continue

            if line.startswith("NODE"):
                m = re.match(r"NODE (.*)\((.*)\) (.+?) (.+?)(?: (.*))?$", line)
                labels.append(m.group(1))
                tmp.append((m.group(2), m.group(3), m.group(4), m.group(5)))
                if grouping:
                    groups[-1].append(len(labels) - 1)

            if line.startswith("CUR"):
                n = labels.index(line.split("=")[1].strip())

            if line.startswith("INPUT"):
                inp = [int(x) for x in line.split("=")[1].strip()]

            if line == "RECORD":
                recording = True

            if line == "[":
                groups.append([])
                grouping = True

            if line == "]":
                grouping = False

            if line.startswith("SIMSCALE"):
                SIMSCALE = float(line.split("=")[1].strip())

        for i, (instr, p0, p1, others) in enumerate(tmp):
            edges.append((i, labels.index(p0), True))
            edges.append((i, labels.index(p1), False))

            if others:
                bonds += [(i, labels.index(other)) for other in others.split()]

            instruction = instr.split()

            if instruction[0] == "PUSH":
                instructions.append(("PUSH", labels.index(instruction[1]), labels.index(instruction[2])))
            else:
                instructions.append(("SWAP", labels.index(instruction[1])))

    I = 0
    O0 = 1
    O1 = 2

    output = [[]]

    count = 0

    def step(n, inp, output):
        p0 = next(edge for edge in edges if edge[0] == n and edge[2] == True)
        p1 = next(edge for edge in edges if edge[0] == n and edge[2] == False)

        if n == I:
            x = inp.pop(0) if len(inp) > 0 else 0
            n = p1[1] if x else p0[1]
            return (n, inp, output)

        elif n == O0:
            output[-1].append(0)

        elif n == O1:
            output[-1].append(1)

        else:
            current = instructions[n]

            xp0 = next(edge for edge in edges if edge[0] == current[1] and edge[2] == True)
            xp1 = next(edge for edge in edges if edge[0] == current[1] and edge[2] == False)
            edges.remove(xp0)
            edges.remove(xp1)

            if current[0] == "PUSH":
                edges.append((xp1[0], xp1[1], True))
                edges.append((xp1[0], current[2], False))
            
            else:
                edges.append((xp1[0], xp1[1], True))
                edges.append((xp0[0], xp0[1], False))

        if len(output[-1]) == 8:
            output.append(int("".join([str(i) for i in output.pop()][::-1   ]), 2))
            output.append([])

        newn = p0[1]
        p0 = next(edge for edge in edges if edge[0] == n and edge[2] == True)
        p1 = next(edge for edge in edges if edge[0] == n and edge[2] == False)

        return (newn, inp, output)

    # ===== SIMULATION SETUP =====

    SIMWIDTH = SIMSCALE * WIDTH
    SIMHEIGHT = SIMSCALE * HEIGHT
    CENTRE = Vector2(SIMWIDTH / 2, SIMHEIGHT / 2)
    vpoffset = Vector2(SIMWIDTH / 2, SIMHEIGHT / 2) - Vector2(WIDTH / 2, HEIGHT / 2)

    N = len(labels)
    nodes = [CENTRE + Vector2(500 * SIMSCALE, 0).rotate(360 / (N) * i) for i in range(N)]
    nodevel = [Vector2(0, 0) for i in nodes]

    video = vidmaker.Video(path="vidmaker.mp4", fps=60, late_export=True)

    NUMBOUND = 25

    groupboundaries = []
    groupboundvels = []
    for group in groups:
        groupboundaries.append([])
        groupboundvels.append([Vector2(0,0) for i in range(NUMBOUND)])

        spacing = 2*(WIDTH + HEIGHT) / NUMBOUND

        for i in range(NUMBOUND):
            dist = i * spacing
            if dist <= WIDTH:
                groupboundaries[-1].append(Vector2(dist, 0))
            elif WIDTH < dist <= WIDTH+HEIGHT:
                groupboundaries[-1].append(Vector2(WIDTH, dist-WIDTH))
            elif WIDTH+HEIGHT < dist <= 2*WIDTH+HEIGHT:
                groupboundaries[-1].append(Vector2(WIDTH-(dist-WIDTH-HEIGHT), HEIGHT))
            else:
                groupboundaries[-1].append(Vector2(0, HEIGHT-(dist-WIDTH-HEIGHT-WIDTH)))

    running = True
    clicking = False
    mouseHas = -1
    debug = False
    display = True
    auto = False
    autoCooldown = 0
    animTo = None
    reload = False
    accelerate = False
    framecount = 0
    while running:
        screen.fill((17, 17, 27))

        for event in pygame.event.get():
            if event.type == QUIT:
                running = False

            if event.type == KEYDOWN:
                if event.key == K_SPACE:
                    count += 1
                    (n, inp, output) = step(n, inp, output)
                    animTo = nodes[n] - Vector2(WIDTH/2, HEIGHT/2)
                
                elif event.key == K_F1:
                    debug = not debug
                
                elif event.key == K_F2:
                    display = not display
                    pygame.display.flip()
                
                elif event.key == K_F3:
                    running = False
                    reload = True
                
                elif event.key == K_F4:
                    if pygame.key.get_pressed()[K_LALT]:
                        running = False
                
                elif event.key == K_F5:
                    recording = not recording
                
                elif event.key == K_F6:
                    video.export(verbose=True)
                
                elif event.key == K_F7:
                    auto = not auto

                elif event.key == K_F8:
                    auto = True
                    recording = True
                    accelerate = not accelerate

            if event.type == MOUSEBUTTONDOWN:
                clicking = True
            if event.type == MOUSEBUTTONUP:
                clicking = False
                mouseHas = -1

        if auto:
            autoCooldown -= 1

            if autoCooldown <= 0:
                count += 1
                (n, inp, output) = step(n, inp, output)
                animTo = nodes[n] - Vector2(WIDTH/2, HEIGHT/2)
                autoCooldown = 3

        if animTo and SIMSCALE != 1:
            vpoffset += 1/2 * (animTo - vpoffset)
            if (animTo - vpoffset).magnitude() < 20:
                animTo = None

        if SIMSCALE != 1:
            pressed = pygame.key.get_pressed()
            if pressed[K_RIGHT] or pressed[K_d]:
                vpoffset += Vector2(15, 0)
            if pressed[K_LEFT] or pressed[K_a]:
                vpoffset -= Vector2(15, 0)
            if pressed[K_UP] or pressed[K_w]:
                vpoffset -= Vector2(0, 15)
            if pressed[K_DOWN] or pressed[K_s]:
                vpoffset += Vector2(0, 15)

        # ===== FORCES =====

        def filterfun(en):
            relpos = en[1]-vpoffset
            return (not display) or (relpos.x < (WIDTH + 30) and relpos.x > -30 and relpos.y < (HEIGHT + 30) and relpos.y > -30)

        try:
            onscreenindices, onscreennodes = zip(*list(filter(filterfun, enumerate(nodes))))
        except ValueError:
            onscreenindices, onscreennodes = ([], [])

        for (i, pos, vel) in zip(onscreenindices, onscreennodes, [nodevel[i] for i in onscreenindices]):
            if i == 3:
                continue

            # if labels[i][0] == "B" and labels[i][-3:-1] != "sh":
            #     continue

            accel = Vector2()
            accel += (pos - CENTRE).normalize() * (-g/math.sqrt(max((pos - CENTRE).magnitude(), gdead)) + 1/(pos - CENTRE).magnitude_squared())
            accel += -res * vel

            net = Vector2()
            dot = 0

            for edge in (edges + bonds):
                if edge[0] == 3 or edge[1] == 3:
                    continue

                if edge[0] == edge[1]:
                    continue

                if edge[0] == i:
                    net += (nodes[edge[1]] - pos)
                    accel += edgecoeff * ((nodes[edge[1]] - pos).magnitude() - 200) * (nodes[edge[1]] - pos).normalize()

                elif edge[1] == i:
                    net -= (pos - nodes[edge[0]])
                    accel += edgecoeff * ((nodes[edge[0]] - pos).magnitude() - 200) * (nodes[edge[0]] - pos).normalize()

                # pygame.draw.aaline(screen, BLUE, pos, pos+net*0.6, width=5)

            accel += net * straighten

            for j, node in enumerate(nodes):
                if j == 3:
                    continue

                if i != j and node != pos:
                    accel += -repel/(max((node - pos).magnitude_squared(), 100)) * (node - pos).normalize()
                    pass


            nvel = vel + accel * 40
            npos = pos + vel * 40 + accel/2 * (40**2)
            
            if clicking and (mouseHas == i or ((mouseHas == -1) and (Vector2(pygame.mouse.get_pos()) + vpoffset - pos).magnitude() < 60)):
                mouseHas = i
                npos = Vector2(pygame.mouse.get_pos()) + vpoffset
                nvel = Vector2()

            if npos.x <= 20:
                npos.x = 20
                nvel.x = 0
            elif npos.x >= SIMWIDTH - 20:
                npos.x = SIMWIDTH - 20
                nvel.x = 0

            if npos.y <= 20:
                npos.y = 20
                nvel.y = 0
            elif npos.y >= SIMHEIGHT - 20:
                npos.y = SIMHEIGHT - 20
                nvel.y = 0

            nodes[i] = npos
            nodevel[i] = nvel

        for j, (group, vels) in enumerate(zip(groupboundaries, groupboundvels)):
            centre = sum(group, Vector2()) / NUMBOUND
            surf = pygame.Surface((WIDTH, HEIGHT), SRCALPHA)
            pygame.draw.polygon(surf, WHITE, group)
            mask = pygame.mask.from_surface(surf)
            # screen.blit(surf)
            # pygame.draw.circle(screen, RED, centre, 1)

            include = []
            exclude = []
            for i, node in zip(onscreenindices, onscreennodes):
                if not mask.get_at(node) and i in groups[j]:
                    include.append(node)

                if mask.get_at(node) and i not in groups[j]:
                    exclude.append(node)


            for i, (mark, vel) in enumerate(zip(group, vels)):
                accel = Vector2()

                accel += 0.0005  * ((group[i-1] - mark).magnitude() - 20) * (group[i-1] - mark).normalize()
                accel += 0.0005 * ((group[(i+1) % NUMBOUND] - mark).magnitude() - 20) * (group[(i+1) % NUMBOUND] - mark).normalize()

                accel -= 0.000005  * ((mark - group[i-1]) + (mark - group[(i+1) % NUMBOUND])) # straighten

                accel += -res * vel
                accel += 0.5 / (mark - centre).magnitude() * (mark - centre).normalize() # balloon

                for node in [nodes[i] for i in groups[j]]:
                    accel += 0.2 / max((node - mark).magnitude(), 1000) * (node - mark).normalize()

                inforce = Vector2()
                for node in include:
                    inforce += 0.9 / max((node - mark).magnitude() - 80, 100) * (mark - centre).normalize()
                if len(include) == 0:
                    inforce += 0.3 / 100 * (mark - centre).normalize()
                # pygame.draw.aaline(screen, BLUE, mark, mark+inforce * 2000, width=5)
                accel += inforce

                exforce = Vector2()
                if len(exclude) >= 3:
                    for node in exclude:
                        exforce += 0.05 / max(len(exclude)**2, 4) * (centre - mark).normalize() * (100/max((node - mark).magnitude(), 100))
                else:
                    exforce = -0.3 / (mark - centre).magnitude() * (mark - centre).normalize()
                
                accel += exforce

                for k, omark in enumerate(group):
                    if i != k:
                        accel += -repel/(max((omark - mark).magnitude_squared(), 100)) * (omark - mark).normalize()

                # accel += globaccel

                nvel = vel + accel * 40
                npos = mark + vel * 40 + accel/2 * (40**2)

                if npos.x <= 15:
                    npos.x = 20
                    nvel.x = 0
                elif npos.x >= SIMWIDTH - 15:
                    npos.x = SIMWIDTH - 15
                    nvel.x = 0

                if npos.y <= 15:
                    npos.y = 15
                    nvel.y = 0
                elif npos.y >= SIMHEIGHT - 15:
                    npos.y = SIMHEIGHT - 15
                    nvel.y = 0

                groupboundvels[j][i] = nvel
                groupboundaries[j][i] = npos


        # ===== RENDERING =====

        if not display:
            continue

        for edge in edges:
            col = GREEN if edge[2] else RED
            if edge[0] == 3 or edge[1] == 3:
                continue

            if edge[0] not in onscreenindices and edge[1] not in onscreenindices:
                continue

            relpos0 = nodes[edge[0]]-vpoffset
            relpos1 = nodes[edge[1]]-vpoffset


            if edge[0] != edge[1]:
                eolvec = (nodes[edge[1]] - nodes[edge[0]]).normalize() * ((nodes[edge[1]] - nodes[edge[0]]).magnitude() - 20)
                bshift = eolvec.rotate(90).normalize()*5
                shift = bshift * (-1.5 if edge[2] else 1.5)

                pygame.draw.aaline(screen, col, relpos0+bshift, relpos1+bshift, width=5)
                pygame.draw.polygon(screen, col, [relpos0+eolvec+bshift, relpos0+(eolvec*0.9)+bshift+shift,relpos0+(eolvec*0.9)+bshift-shift])

            else:
                pygame.draw.aacircle(screen, col, relpos0+Vector2(20,20)+edge[2]*Vector2(-10,0), 20, width=5)

        for i, node in zip(onscreenindices, onscreennodes):
            if i == 3:
                continue

            relpos = node-vpoffset

            col = (PEACH if instructions[i][1] != 3 else GREY) if instructions[i][0] == "SWAP" else MAUVE
            if i <= 2:
                col = GREEN

            pygame.draw.aacircle(screen, col, relpos, 20)

            if i == n:
                pygame.draw.aacircle(screen, SKY, relpos, 18)
            elif i == instructions[n][1]:
                pygame.draw.aacircle(screen, RED, relpos, 18)
            elif instructions[n][0] == "PUSH" and i == instructions[n][2]:
                pygame.draw.aacircle(screen, YELLOW, relpos, 18)


            if debug:
                screen.blit(pygame.Font().render(labels[i], True, SURFACE1), relpos-Vector2(10, 10))

        for bound in groupboundaries:
            for mark in bound:
                relpos = mark-vpoffset

                pygame.draw.aacircle(screen, RED, relpos, 5)

        screen.blit(pygame.Font().render(f"Current Node: {labels[n]}", True, WHITE), Vector2(0,0))
        screen.blit(pygame.Font().render(f"Current Instruction: {instructions[n][0]} {" ".join([labels[i] for i in instructions[n][1:]])}", True, WHITE), Vector2(0,15))
        screen.blit(pygame.Font().render(f"Current Input: {inp}", True, WHITE), Vector2(0,30))
        screen.blit(pygame.Font().render(f"Current Output: {output}", True, WHITE), Vector2(0,45))
        screen.blit(pygame.Font().render(f"Nodes Visited: {count}", True, WHITE), Vector2(0,60))
        screen.blit(pygame.Font().render(f"Recording: {math.floor(framecount / 3600):02}:{math.floor((framecount / 60) % 60):02}", True, WHITE), Vector2(0,75))

        screen.blit(pygame.Font().render(f"F1: Debug\nF2: Toggle display\nF3: Reload\nF5: Start recording\nF6: Export recording\nF7: Toggle auto", True, WHITE), Vector2(0, HEIGHT-90))

        if debug:
            pygame.draw.circle(screen, RED, CENTRE-vpoffset, 1)

        if SIMSCALE != 1:
            pygame.draw.rect(screen, SURFACE1, pygame.Rect(0 - vpoffset.x, 0 - vpoffset.y, SIMWIDTH, SIMHEIGHT), width=1)

        if recording:
            video.update(pygame.surfarray.pixels3d(screen).swapaxes(0, 1), inverted=False) # THIS LINE
            framecount += 1

        if not accelerate:
            pygame.display.flip()

    return reload

while load():
    pass

pygame.quit()