package com.abos.modeli {
	import com.abos.elementi.Pravougaonik;
	import com.abos.vektor.Vector2D;
	import flash.geom.Point;
	
	public class PravougaonikModel {
			
		public var pravougaonik:Pravougaonik;
		
		public var vAB:Vector2D;
		public var vAC:Vector2D;
		public var vCD:Vector2D;
		public var vBD:Vector2D;
		
		public var rotacija:Number;
		
		public function PravougaonikModel(p1:Pravougaonik) {
			// constructor code

			var A:Point = new Point(p1.x, p1.y);
			var B:Point = new Point(p1.x + p1.getA(), p1.y);
			var C:Point = new Point(p1.x, p1.y + p1.getB());
			var D:Point= new Point(p1.x + p1.getA(), p1.y + p1.getB());

			this.pravougaonik = p1;
			trace("U klasi prav model: " + pravougaonik.x + " " + pravougaonik.y);
			this.vAB = new Vector2D(B.x - A.x, B.y - A.y);
			this.vAC = new Vector2D(C.x - A.x, C.y - A.y);
			this.vBD = new Vector2D(D.x - B.x, D.y - B.y);
			this.vCD = new Vector2D(D.x - C.x, D.y - C.y);
			
			//rotacija vektora
			vAB.rotate(pravougaonik.getRotacija());
			vAC.rotate(pravougaonik.getRotacija());
			vBD.rotate(pravougaonik.getRotacija());
			vCD.rotate(pravougaonik.getRotacija());
		}
		

	}
	
}
