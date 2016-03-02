package com.abos.kolizija {
	import flash.geom.Point;
	import com.abos.elementi.Krug;
	import com.abos.vektor.Vector2D;
	
	public class KolizijaKrugDuz {
		
		private var A, B:Point;
		private var krug:Krug;
		private var vAB:Vector2D;
		private var levaNormalaDuzi:Vector2D;
		private var cK:Point;
		//private var vA_cK:Vector2D;
		
		public function KolizijaKrugDuz(A:Point, B:Point, krug:Krug) {
			// constructor code
			this.A = A;
			this.B = B;
			this.krug = krug;
			this.cK = new Point(krug.x, krug.y);						// centar kruga
			this.vAB = new Vector2D(B.x - A.x, B.y - A.y);			// vektor AB->
			this.levaNormalaDuzi = vAB.rotate(Math.PI * -0.5);		// AB zarotiran za -90' (u realnosti +90)
			
		}
		
		public function proveriKoliziju():Boolean {
			// 	1. projekcija vektora koji spaja teme duzi, i centar kruga, na levu normalu
			//  2. ukoliko je ta projekcija <= poluprecniku kruga, tada je doslo do kolizije
						
			var vA_cK:Vector2D = new Vector2D(cK.x - A.x, cK.y - A.y);		// vektor koji spaja teme A sa centrom kruznice
			var projekcijaNaLevuNormalu:Number = vA_cK.projectionOn(levaNormalaDuzi);	// projekcija vektora koji spaja teme A sa centrom kruznice na levu normalu
			var projekcijaNaDuz:Number = vA_cK.projectionOn(vAB);		// zbog merenja da li je na zadatoj duzi u okviru pravca
			
			if (Math.abs(projekcijaNaLevuNormalu) <= krug.getR() &&		// projekcija manja od poluprecnika kruga
				vAB.dotProduct(vA_cK) > 0 &&							// otklanjanje viska koji ne pripadaju duzi (levo desno)
				projekcijaNaDuz <= vAB.getMagnitude()) {				// ako ne pripadaju duzi (duzina duzi)
					//trace("WEEEEEEEEEEEEEE");
					return true;
				}
			return false;
		}

	}
	
}
