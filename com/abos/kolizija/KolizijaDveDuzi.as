package  com.abos.kolizija {
	import flash.geom.Point;
	
	public class KolizijaDveDuzi {

		public function KolizijaDveDuzi() {
			// constructor code
		}
		
		public static function proveriKoliziju(t11:Point, t12:Point, t21:Point, t22:Point):Boolean {
			var x1,x2,x3,x4:Number;
			var y1,y2,y3,y4:Number;
			var c1,c2,c3,c4:Number;
			
			x1 = t11.x; x2 = t12.x;
			x3 = t21.x; x4 = t22.x;
			
			y1 = t11.y; y2 = t12.y;
			y3 = t21.y; y4 = t22.y;
			
			c1 = (x1 - x2); c2 = (x3 - x4);
			c3 = (y1 - y2); c4 = (y3 - y4);
			
			var D:Number = c1*c4 - c2*c3;		// determinanta
			
			if(D == 0)	 {	// ako nema jedinstvenih resenja, Determinana == 0, PRAVE SU NORMALNE
				return false;
			}
			
			// dobijanje x i y iz determinante
			var pre:Number = (x1*y2 - y1*x2), post:Number = (x3*y4 - y3*x4);
			var x:Number = ( pre * c2 - c1 * post ) / D;
			var y:Number = ( pre * c4 - c3 * post ) / D;
			
			// provera da li dobijena tacka T(x, y) pripada duzima
			if ( x < Math.min(x1, x2) || x-0.001 > Math.max(x1, x2) ||		// korekcija greske pri num racunanju
				x < Math.min(x3, x4) || x > Math.max(x3, x4) ) 
				return false;
			
			if ( y < Math.min(y1, y2) || y > Math.max(y1, y2) ||
				y < Math.min(y3, y4) || y > Math.max(y3, y4) )
				return false;
				 
			// Return the point of intersection
			//return new Point(x, y);
			return true;
			
		}
	}
	
}
