package ZenTank 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	
	
	/**
	 * ...
	 * @author Adan Alvarado
	 */
	
	public class TankPlayer extends Entity 
	{
		[Embed(source = '../assets/tank1.png')] 
		private const PLAYER:Class;

		private var speed:Number = 0.3;
		private var rotateSpeed:Number = 5;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var friction:Number = 0.95;
		
		public function TankPlayer() 
		{
			graphic = new Image(PLAYER);
			Image(graphic).originX = 32;
			Image(graphic).originY = 32;
			Input.define("Up", Key.W, Key.UP);
		}
		
		override public function update():void {
			if (Input.check("Up"))
			{
				vy += Math.sin(Utils.degreesToRadians(Image(graphic).angle-90)) * speed;
				vx += Math.cos(Utils.degreesToRadians(Image(graphic).angle-90)) * speed;
			} else {
				vy *= friction;
				vx *= friction;
			}			
			
			if (Input.check(Key.DOWN))
			{
				vy -= Math.sin(Utils.degreesToRadians(Image(graphic).angle-90)) * speed;
				vx -= Math.cos(Utils.degreesToRadians(Image(graphic).angle-90)) * speed;
			} else {
				vy *= friction;
				vx *= friction;
			}
 
			if (Input.check(Key.RIGHT))
				Image(graphic).angle -= rotateSpeed;
			else if (Input.check(Key.LEFT))
				Image(graphic).angle += rotateSpeed;
 
			y += vy;
			x += vx;
		}
	}
}