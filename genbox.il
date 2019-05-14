/*

Description:	This program will cover the entire layout cellview
		with a rectangle using a prBoundary DMFILL OPFILL layers
Created by :	Victor Bernal

***************************************************

Save this program as "genbox.il" in your working directory
Then key in the following in the CIW input panel :
load("genbox.il")

Press Shift-F6 to generate and re-generate a prBoundary.
Press Shift-F7 to generate and re-generate a DMFILL.
Press Shift-F8 to generate and re-generate a OPFILL.

*/

procedure( genPRboundary()
 let( (cv lpp bBox existingShapes)
    cv=geGetWindowCellView()
    lpp=list("prBoundary" "boundary")
    bBox=cv~>bBox
    command="genPRboundary"
    jvLog()

    existingShapes=setof(x cv~>shapes x~>lpp==list("prBoundary" "boundary"))
    when( existingShapes
     printf("Existing prBoundary shapes found. They will be deleted\n")
    ) ;when
    foreach( shape existingShapes
      dbDeleteObject(shape)
    ) ;foreach

    dbCreateRect(cv lpp bBox)
    printf("Created %s rectangle for cell %s\n" lpp cv~>cellName)
 ) ;let
) ; procedure

procedure( genDMboundary()
 let( (cv lpp bBox existingShapes)
    cv=geGetWindowCellView()
    lpp=list("DMFILL" "drawing")
    bBox=cv~>bBox
    command="genDMboundary"
    jvLog()

    existingShapes=setof(x cv~>shapes x~>lpp==list("DMFILL" "drawing"))
    when( existingShapes
     printf("Existing prBoundary shapes found. They will be deleted\n")
    ) ;when
    foreach( shape existingShapes
      dbDeleteObject(shape)
    ) ;foreach

    dbCreateRect(cv lpp bBox)
    printf("Created %s rectangle for cell %s\n" lpp cv~>cellName)
 ) ;let
) ; procedure

procedure( genOPboundary()
 let( (cv lpp bBox existingShapes)
    cv=geGetWindowCellView()
    lpp=list("OPFILL" "drawing")
    bBox=cv~>bBox
    command="genOPboundary"
    jvLog()

    existingShapes=setof(x cv~>shapes x~>lpp==list("OPFILL" "drawing"))
    when( existingShapes
     printf("Existing OPFILL shapes found. They will be deleted\n")
    ) ;when
    foreach( shape existingShapes
      dbDeleteObject(shape)
    ) ;foreach

    dbCreateRect(cv lpp bBox)
    printf("Created %s rectangle for cell %s\n" lpp cv~>cellName)
 ) ;let
) ; procedure

hiSetBindKey("Layout" "Shift<Key>F6" "genPRboundary()")
hiSetBindKey("Layout" "Shift<Key>F7" "genDMboundary()")
hiSetBindKey("Layout" "Shift<Key>F8" "genOPboundary()")
