package com.abos.kolizija {
	
	import com.abos.elementi.Pravougaonik;
	import flash.geom.Point;
	
	public class KolizijaPravougaonici {
			
		private static var p1:Pravougaonik;
		private static var p2:Pravougaonik;
				
		private static var bool1:Boolean = false;
		private static var bool2:Boolean = false;
		private static var bool3:Boolean = false;
		private static var bool4:Boolean = false;
		
		public function KolizijaPravougaonici() {
			// constructor code
		}
		
		
		public static function proveriKoliziju(pr1:Pravougaonik, pr2:Pravougaonik):Boolean {
			p1 = pr1;
			p2 = pr2;
			
			if (p1.getRotacija() == 0 && p2.getRotacija() == 0) {		
				return intervaliSePreklapaju(p1.x, p1.x + p1.getStranicaA(), p2.x, p2.x + p2.getStranicaA()) &&		// x presek intervala?
					   intervaliSePreklapaju(p1.y, p1.y + p1.getStranicaB(), p2.y, p2.y + p2.getStranicaB());		// y presek intervala?
				// Oba pravougaonika imaju presek i po x, i po y intervalu => moraju da se seku!
			} else {	// ako je bar 1 od pravougaonika zarotiran
				
					bool1 =  KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getB(), p2.getA(),p2.getB())	// provera sa AB
						|| KolizijaDveDuzi.proveriKoliziju(p1.getD(), p1.getB(), p2.getA(),p2.getB())
						|| KolizijaDveDuzi.proveriKoliziju(p1.getC(), p1.getD(), p2.getA(),p2.getB())
						|| KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getC(), p2.getA(), p2.getB());
				
					bool2 =  KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getB(), p2.getB(),p2.getD())	// provera sa BD
						|| KolizijaDveDuzi.proveriKoliziju(p1.getD(), p1.getB(),  p2.getB(),p2.getD())
						|| KolizijaDveDuzi.proveriKoliziju(p1.getC(), p1.getD(),  p2.getB(),p2.getD())
						|| KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getC(),  p2.getB(),p2.getD());
				
					bool3 =  KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getB(), p2.getC(),p2.getD())	// provera sa CD
						|| KolizijaDveDuzi.proveriKoliziju(p1.getD(), p1.getB(),  p2.getC(),p2.getD())
						|| KolizijaDveDuzi.proveriKoliziju(p1.getC(), p1.getD(),  p2.getC(),p2.getD())
						|| KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getC(),  p2.getC(),p2.getD());
					
					bool4 =  KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getB(), p2.getA(),p2.getC())	// provera sa AC
						|| KolizijaDveDuzi.proveriKoliziju(p1.getD(), p1.getB(),  p2.getA(),p2.getC())
						|| KolizijaDveDuzi.proveriKoliziju(p1.getC(), p1.getD(),  p2.getA(),p2.getC())
						|| KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getC(),  p2.getA(),p2.getC());
					
					return bool1 || bool2 || bool3 || bool4;		// ako ima bilo gde presek
				
				//return false;
			}
		}
		public static function intervaliSePreklapaju(v1Min:Number, v1Max:Number, v2Min:Number, v2Max:Number):Boolean {
			return !(v2Min >= v1Max || v1Min >= v2Max);		// obrunuta logika, laksa za zapis
		}

	}
	
}
