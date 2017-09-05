import math, strutils, times
type 
    PhaseSpace = tuple[
      hWidth, hHeight, VzIntDist, zIntDist, chirp, b, totalPulseEnergy, intensityRatio,
      hDepth, hDepthVelocity, VxIntDist, xIntDist, chirpT, bT,
      vZC, zC: float
    ]
let expNum = 1/256.0
proc exp1(y: float): float = 
    result = 1.0 + y * expNum;
    result *= result; result *= result; result *= result; result *= result
    result *= result; result *= result; result *= result; result *= result
proc recombine(spaces: seq[PhaseSpace]): PhaseSpace = 
    result = spaces[0]
    result.totalPulseEnergy = 0; result.intensityRatio = 0
    result.vZC = 0; result.zC = 0
    for i in 0..spaces.len:
        result.totalPulseEnergy += spaces[i].totalPulseEnergy; result.intensityRatio += spaces[i].intensityRatio
        result.vZC += spaces[i].vZC; result.zC += spaces[i].zC
    result.hWidth = spaces[0].hWidth * spaces.len.float
    result.hHeight = spaces[0].hHeight * spaces.len.float * (1/result.chirp)

proc getSplitIntensityRatio(s: PhaseSpace, accuracy, numSections, sectionNum, VzIntDistsq, hWidthsq, p, t1, t2: float): float =
        let ySearchLB = -5.803*s.hHeight + ((5.803*s.hHeight*2/numSections)*(sectionNum-1))
        let ySearchUB = 5.803*s.hHeight - (5.803*s.hHeight*2/numSections)*(numSections - sectionNum)
        let xSearchLB = -5.803*s.hWidth; let xSearchUB = 5.803*s.hWidth
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
        let VzIntDistsq = s.VzIntDist*s.VzIntDist; let hWidthsq = s.hWidth*s.hWidth
        let t1 = -1/(2*hWidthsq); let t2 = 1/(2*VzIntDistsq)
        let slope = s.hHeight/s.chirp
        let p = 1/(TAU*(hWidthsq*VzIntDistsq))
        for i in 0 || result.len:
            let intensityRatio = s.getSplitIntensityRatio(1005*spacesD, spaces.float, i.float, VzIntDistsq, hWidthsq, p, t1, t2)
            result[i] = ((s.hHeight/s.chirp)*spacesD, s.hHeight*spacesD, s.VzIntDist, s.zIntDist, s.chirp, s.b, s.totalPulseEnergy*intensityRatio, intensityRatio,
                      s.hDepth, s.hDepthVelocity, s.VxIntDist, s.xIntDist, s.chirpT, s.bT, s.hHeight-(s.hHeight*2/spaces.float)*(i.float+0.5), s.hWidth-(s.hWidth*2/spaces.float)*(i.float+0.5))
proc freeExpansion(s: PhaseSpace, time: float): PhaseSpace = 
    result = s
    result.b += time
    result.bT += time
    if result.chirp>0: result.VzIntDist = sqrt(1/((1/pow(result.hHeight,2))+pow((result.b/result.zIntDist),2)))
    if result.chirpT>0: result.VxIntDist = sqrt(1/((1/pow(result.hDepthVelocity,2))+pow((result.bT/result.xIntDist),2)))
    if result.chirp<0: result.zIntDist = result.b/(sqrt((1/pow(result.VzIntDist,2))-(1/pow(result.hHeight,2))))
    if result.chirpT<0: result.xIntDist = result.bT/(sqrt((1/pow(result.VxIntDist,2))-(1/pow(result.hDepthVelocity,2))))
    result.chirp = result.b*pow(result.VzIntDist,2)/pow(result.zIntDist,2)
    result.chirpT = result.bT*pow(result.VxIntDist,2)/pow(result.xIntDist,2)
    result.hWidth = sqrt(1/((1/pow(result.zIntDist,2))-pow(result.chirp/result.VzIntDist,2)))
    result.hDepth = sqrt(1/((1/pow(result.xIntDist,2))-pow(result.chirpT/result.VxIntDist,2)))
#Main
var initialPulse: PhaseSpace = (100.float, 86.6.float, 50.float, 50.float, 0.866.float, 0.866.float, 100.float, 1.float, 100.float, 86.6.float, 50.float, 50.float, 0.866.float, 0.866.float, 0.float, 0.float)
var time1 = epochTime()
var spaces = initialPulse.split(10000000)
echo spaces.recombine().totalPulseEnergy
echo "Took ", (epochTime()-time1)*1000, " milliseconds"
echo "Push enter to continue..."
discard readLine(stdin)