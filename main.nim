import math, strutils, times
type PhaseSpace = tuple[width: float, height: float, VzIntDist: float, zIntDist: float, chirp: float, b: float, totalPulseEnergy: float, intensityRatio: float]
proc exp1(y: float): float =
    var x = y
    x = 1.0 + x / 256.0;
    x *= x; x *= x; x *= x; x *= x;
    x *= x; x *= x; x *= x; x *= x;
    return x

proc recombine(spaces: seq[PhaseSpace]): PhaseSpace = 
    var space: PhaseSpace
    space.VzIntDist = spaces[0].VzIntDist
    space.zIntDist = spaces[0].zIntDist
    space.chirp = spaces[0].chirp
    space.b = spaces[0].b
    for s in spaces:
        space.totalPulseEnergy += s.totalPulseEnergy
        space.intensityRatio += s.intensityRatio
    space.width = spaces[0].width * spaces.len.float
    space.height = spaces[0].height * spaces.len.float * (1/space.chirp)
    return space
proc getSplitIntensityRatio(space: PhaseSpace, accuracy: float, numSections: float, sectionNum: float, height: float, width: float): float =
        var ySearchLB: float = -5.803*height + ((5.803*height*2/numSections)*(sectionNum-1));
        var ySearchUB: float = 5.803*height - (5.803*height*2/numSections)*(numSections - sectionNum);
        var xSearchLB: float = -5.803*width;
        var xSearchUB: float = 5.803*width;
        var x: float = xSearchLB;
        var y: float = ySearchLB;
        var intensityRatio: float = 0;
        var VzIntDistsq: float = space.VzIntDist*space.VzIntDist;
        var hWidthsq: float = width*width;
        if(numSections==sectionNum):
            ySearchUB += 1;
        while(y < ySearchUB-0.0001):
            while(x < xSearchUB):
                intensityRatio += 112*accuracy*exp1((-1*x*x/(2*hWidthsq))-((y-space.chirp*x)*(y-space.chirp*x)/(2*VzIntDistsq)))/(TAU*(hWidthsq*VzIntDistsq));
                x += 112;
            y += accuracy;
            x = xSearchLB;
        return intensityRatio*5000;     
proc split(s: PhaseSpace, spaces:int): seq[PhaseSpace] =
        var phaseSpaces = newSeq[PhaseSpace](spaces)
        var spacesD: float = 1/spaces.float
        for i in 0..spaces:
            var intensityRatio = s.getSplitIntensityRatio(1005*spacesD, spaces.float, i.float, s.height, s.width);
            phaseSpaces[i] = ((s.height/s.chirp)*spacesD, s.height*spacesD, s.VzIntDist, s.zIntDist, s.chirp, s.b, s.totalPulseEnergy*intensityRatio, intensityRatio);
        return phaseSpaces
var initialPulse: PhaseSpace = (100.0,86.6,50.0,50.0,0.866,0.866, 100.0, 1.0)
#echo "How many splits?"
#var spl: int = readLine(stdin).parseInt
var time1 = epochTime()
var spaces = initialPulse.split(1000000)
echo spaces.recombine().totalPulseEnergy
echo "Took ", (epochTime()-time1)*1000, " milliseconds"
echo "Push enter to continue..."
discard readLine(stdin)