import flighthq.Sdk;
class Main extends ExampleHost {
  override public function flightReady():Void {final stage=createStage("Tilemap");final tilemap=Sdk.createTilemap();Sdk.resizeTilemap(tilemap,25,14);final colors=[0x79b84a,0x2878b8,0xd8c078,0x777777,0x8b5a2b,0xeeeeee,0xff5533,0x111111];for(row in 0...14)for(col in 0...25){var id=row<2?5:row<5?3:row<11?0:row<12?2:1;if(Math.sqrt((col-12)*(col-12)+(row-7)*(row-7))<2.5)id=6;Sdk.setTilemapTile(tilemap,col,row,id);addRectangle(stage,col*32,60+row*32,32,32,colors[id]);}}
}
