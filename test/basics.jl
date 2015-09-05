
ignore = false  # when re-generating

draw(File("defaults.png")) do
    axes()
end
ignore || compare("defaults.png")

draw(axes, File("portrait.png"), Paper(100, 140; background="lightgrey"))
ignore || compare("portrait.png")
draw(axes, File("landscape.png"), Paper(140, 100; background="lightgrey"))
ignore || compare("landscape.png")

draw(axes, File("scale.png"), Paper(100, 140; background="lightgrey"), Scale(0.5))
ignore || compare("scale.png")
draw(axes, File("scale2.png"), Paper(100, 140; background="lightgrey"), Scale(0.5, 1.0))
ignore || compare("scale2.png")
draw(axes, File("translate.png"), Paper(100, 140; background="lightgrey"), Translate(0.1, 0.1))
ignore || compare("translate.png")
draw(axes, File("rotate.png"), Paper(100, 140; background="lightgrey"), Rotate(pi/4))
ignore || compare("rotate.png")

draw(axes, File("centred_portrait.png"), Paper(100, 140; background="lightgrey", centred=true))
ignore || compare("centred_portrait.png")
draw(axes, File("centred_landscape.png"), Paper(140, 100; background="lightgrey", centred=true))
ignore || compare("centred_landscape.png")

function wiggle()
    move(0,0)
    line(0.005, 0)
    line(0.005, 0.005)
    line(0.01, 0.01)
end

draw(wiggle, File("a10-round-round.png"), Paper("a10"; dpi=100, orientation="landscape", border=0.2, background="lightgrey"), Scale(100), Pen(0.003, cap="round", join="round"))
ignore || compare("a10-round-round.png")

draw(wiggle, File("a10-butt-mitre.png"), Paper("a10"; dpi=100, orientation="landscape", border=0.2, background="lightgrey"), Scale(100), Pen(0.003, cap="butt", join="mitre"))
ignore || compare("a10-butt-mitre.png")

draw(wiggle, File("a10-square-bevel.png"), Paper("a10"; dpi=100, orientation="landscape", border=0.2, background="lightgrey"), Scale(100), Pen(0.003, cap="square", join="bevel"))
ignore || compare("a10-square-bevel.png")

function square()
    move(0, 0)
    line(1, 0)
    line(1, 1)
    line(0, 1)
    line(0, 0)
end

draw(square, File("a10-square.png"), Paper("a10"; dpi=100, orientation="landscape", border=0.1, background="lightgrey"))
ignore || compare("a10-square.png")

draw(square, File("a10-square-scale.png"), Paper("a10"; dpi=100, orientation="landscape", border=0.1, background="lightgrey"), Scale(0.5))
ignore || compare("a10-square-scale.png")

draw(square, File("a10-square-scale-translate.png"), Paper("a10"; dpi=100, orientation="landscape", border=0.1, background="lightgrey"), Scale(0.5), Translate(1, 1))
ignore || compare("a10-square-scale-translate.png")

with(File("orange_blue_square.png"), Paper(100, 100), Pen(0.05)) do
    draw(Ink("orange")) do
        move(0.0, 0.0)
        line(1.0, 0.0)
        line(1.0, 1.0)
    end
    draw(Ink("blue")) do
        line(0.0, 1.0)
        line(0.0, 0.0)
    end
end
ignore || compare("orange_blue_square.png")

with(File("red_blue_square.png"), Paper(100, 100), Ink("red"), Pen(0.1)) do
    draw(Ink("blue")) do
        move(0.0, 0.0)
        line(1.0, 0.0)
        line(1.0, 1.0)
    end
    draw() do
        line(0.0, 1.0)
        line(0.0, 0.0)
    end
end
ignore || compare("red_blue_square.png")

