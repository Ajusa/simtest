import htmlparser, xmltree, strtabs, strutils, times
proc get(tag: XmlNode, attr: string): float = return tag.attr(attr).parseFloat

proc handleTag(tag: XmlNode, space: PhaseSpace): PhaseSpace = 
    result = space
    case tag.tag:
        of "print":
            space.print
        of "time":
            var time1 = epochTime()
            for op in tag.items: 
                if $op.kind == "xnElement": result = handleTag(op, result)
            echo "Took ", (epochTime()-time1)*1000, " milliseconds"
        of "distance":
            result = result.freeExpansion(tag.get("dist"))
        of "split":
            var spaces = result.split(tag.attr("portions").parseInt)
            for s in spaces:
                for op in tag.items:
                    if $op.kind == "xnElement": result = handleTag(op, s)
            result = spaces.recombine

proc runScript(name:string): bool =
    let script = loadHtml(name)
    for tag in script.items:
        if $tag.kind == "xnElement" and tag.tag=="space":
            var space: PhaseSpace = (tag.get("hWidth"), tag.get("hHeight"), tag.get("VzIntDist"),
                tag.get("zIntDist"), tag.get("chirp"), tag.get("b"), tag.get("intensity"),
                tag.get("intensityRatio"), tag.get("hDepth"), tag.get("hDepthVelocity"),
                tag.get("VxIntDist"), tag.get("xIntDist"), tag.get("chirpT"), tag.get("bT"),
                tag.get("vZC"), tag.get("zC"))
            for op in tag.items: 
                if $op.kind == "xnElement": space = handleTag(op, space)
    return true
discard runScript("test.xml")
