package ZenTank
{
	import net.flashpunk.Engine
	import net.flashpunk.FP;
	import net.flashpunk.World;
	

	public class Main extends Engine {
		public function Main() {
			super(800, 600, 60, false);
			FP.world = new MyWorld;
		}
		
		override public function init():void {
			trace('flashpunk');
		}
	}
		
	
}