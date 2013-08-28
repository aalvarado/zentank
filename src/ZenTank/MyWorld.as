package ZenTank 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Adan Alvarado
	 */
	public class MyWorld extends World 
	{
		
		public function MyWorld() 
		{
			super();
			add(new Level1);
			add(new TankPlayer);
		}
		
	}

}