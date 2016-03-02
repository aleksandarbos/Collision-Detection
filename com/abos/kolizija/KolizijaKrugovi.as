package com.abos.kolizija {
	
	import com.abos.elementi.Krug;
	
	public class KolizijaKrugovi {
		
		private static var k1:Krug;
		private static var k2:Krug;
		
		public function KolizijaKrugovi() {
			// constructor code
		}
		
		public static function proveriKoliziju(ob1:Object, ob2:Object):Boolean {
			k1 = ob1 as Krug;
			k2 = ob2 as Krug;
			// 1. Na osnovu pitagorine teoreme, odredjujemo distancu izmedju centara 2 kruga
			var distancaCentara:Number = Math.sqrt(Math.pow((k1.x - k2.x),2) + Math.pow((k1.y - k2.y), 2));
			// 2. Ako je rastojanje izmedju centara manje ili jednako zbiru poluprecnika, desila se kolizija
			return (distancaCentara <= (k1.getR() + k2.getR()));
		}


	}
	
}
