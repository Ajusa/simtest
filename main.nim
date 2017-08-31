import math, strutils, times
type 
    PhaseSpace = tuple[
        width: float, height: float, VzIntDist: float, 
        zIntDist: float, chirp: float, b: float, 
        totalPulseEnergy: float, intensityRatio: float
    ]
proc exp1(y: float): float =
    var x = y
    x = 1.0 + x / 256.0;
    x *= x; x *= x; x *= x; x *= x;
    x *= x; x *= x; x *= x; x *= x;
    return x
proc recombine(spaces: seq[PhaseSpace]): PhaseSpace = 
    result.VzIntDist = spaces[0].VzIntDist
    result.zIntDist = spaces[0].zIntDist
    result.chirp = spaces[0].chirp
    result.b = spaces[0].b
    for i in 0..spaces.len:
        result.totalPulseEnergy += spaces[i].totalPulseEnergy
        result.intensityRatio += spaces[i].intensityRatio
    result.width = spaces[0].width * spaces.len.float
    result.height = spaces[0].height * spaces.len.float * (1/result.chirp)

proc getSplitIntensityRatio(s: PhaseSpace, accuracy: float, numSections: float, sectionNum: float, VzIntDistsq: float, hWidthsq: float, p: float, t1: float, t2: float): float =
        let ySearchLB = -5.803*s.height + ((5.803*s.height*2/numSections)*(sectionNum-1))
        let ySearchUB = 5.803*s.height - (5.803*s.height*2/numSections)*(numSections - sectionNum)
        let xSearchLB = -5.803*s.width
        let xSearchUB = 5.803*s.width
        var x = xSearchLB
        var y = ySearchLB
        result = 0.0
        if(numSections==sectionNum): return 0
        while(y < ySearchUB-0.0001):
            while(x < xSearchUB):
                result += 112*accuracy*exp1((x*x*t1)-((y-s.chirp*x)*(y-s.chirp*x)*t2))*p
                x += 112
            y += accuracy
            x = xSearchLB
        result *= 5000
         
proc split(s: PhaseSpace, spaces: int): seq[PhaseSpace] =
        result = newSeq[PhaseSpace](spaces)
        let spacesD = 1/spaces.float
        let VzIntDistsq = s.VzIntDist*s.VzIntDist
        let hWidthsq = s.width*s.width
        let t1 = -1/(2*hWidthsq)
        let t2 = 1/(2*VzIntDistsq)
        let slope = s.height/s.chirp
        let p = 1/(TAU*(hWidthsq*VzIntDistsq))
        for i in 0 || result.len:
            let intensityRatio = s.getSplitIntensityRatio(1005*spacesD, spaces.float, i.float, VzIntDistsq, hWidthsq, p, t1, t2)
            result[i] = (slope*spacesD, s.height*spacesD, s.VzIntDist, s.zIntDist, s.chirp, s.b, s.totalPulseEnergy*intensityRatio, intensityRatio)
var initialPulse: PhaseSpace = (100.0,86.6,50.0,50.0,0.866,0.866, 100.0, 1.0)
#echo "How many splits?"
#var spl = readLine(stdin).parseInt
var time1 = epochTime()
var spaces = initialPulse.split(1000000)
echo spaces.recombine().totalPulseEnergy
echo "Took ", (epochTime()-time1)*1000, " milliseconds"
echo "Push enter to continue..."
var name: string = readLine(stdin)