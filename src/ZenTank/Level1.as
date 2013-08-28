package ZenTank 
{

	import flash.utils.ByteArray;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.graphics.TiledImage;
	import net.flashpunk.FP;

	import net.pixelpracht.tmx.TmxMap;
	
	/**
	 * ...
	 * @author Adan Alvarado
	 */
	public class Level1 extends Entity
	{
		private const TILE_MAP_WIDTH:int = 800;
		private const TILE_MAP_HEIGHT:int = 3200;
		private const TILE_WIDTH:int = 32;
		private const TILE_HEIGHT:int = 32;
		
		
		[Embed(source = '../assets/tilesets/ultimateexterior.png')]
		private var tileSet3:Class;
		
		[Embed(source = '../assets/maps/level1.tmx', mimeType = "application/octet-stream")] 
		private var level1:Class;

		
		public function Level1() 
		{
			//var tm:Tilemap = new Tilemap(tileClass1, TILE_MAP_WIDTH, TILE_MAP_HEIGHT, TILE_WIDTH, TILE_HEIGHT);
			loadTmx();
		}
		
		public function loadTmx():void {
			var tm:Tilemap = new Tilemap(tileSet3, TILE_MAP_WIDTH, TILE_MAP_HEIGHT, TILE_WIDTH, TILE_HEIGHT);
			var file:ByteArray = new level1;
			var csv:String = file.readUTFBytes(file.length);
			
			var xml:XML = FP.getXML(level1);
			var tmx:TmxMap = new TmxMap(xml);
			var mapCsv:String = tmx.getLayer('solid').toCsv(tmx.getTileSet('tileset1'));
			
			
			
			tm.loadFromString(mapCsv);
			graphic = tm;
		}
	}
}