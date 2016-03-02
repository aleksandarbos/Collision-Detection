package com.abos.main {
	
	import flash.display.MovieClip;
	import com.abos.elementi.Krug;
	import flash.events.MouseEvent;
	import com.abos.elementi.Pravougaonik;
	import com.abos.kolizija.Kolizija;
	import flash.events.Event;
	import fl.transitions.TransitionManager;
	import flash.geom.Transform;
	import fl.motion.MatrixTransformer;
	import com.abos.modeli.PravougaonikModel;
	import com.abos.elementi.Trougao;

	public class Main extends MovieClip {
		private var kolizija:Kolizija = new Kolizija();
		
		private var nizElemenata:Array = new Array();
		
		private var kursorX:Number = 0;
		private var kursorY:Number = 0;
		
		private var detekcijaKolizije:Boolean = false;
		
		public function Main() {
			// constructor code
			trace("Instanciran main");
		}
	
		public function dodajKrug(poluprecnik:Number):void {
			var krug:Krug = new Krug(poluprecnik);
			
			nizElemenata.push(krug);					// evidencija elemenata
			dodajPrevlacenje(krug);						// dodaj drag'n drop listener
										
			krug.x = 80;
			krug.y = 100;
			
			addChild(krug);
		}
		
		public function dodajPravougaonik(a:Number, b:Number, rotacija:Number):void {
			var pravougaonik:Pravougaonik = new Pravougaonik(a, b);
			
			var model:PravougaonikModel = new PravougaonikModel(pravougaonik);
			
			pravougaonik.x = 80;
			pravougaonik.y = 100;
			
			trace("U klasi main: " + model.pravougaonik.x + " " + model.pravougaonik.y);
			//exprimental
			
			//pravougaonik.rotation += 90;
			pravougaonik.setRotacija(stepenURadian(rotacija));
			
			trace("Teme B: " + (pravougaonik.getB()));
			//exprimental
			
			nizElemenata.push(pravougaonik);					// evidencija elemenata
			dodajPrevlacenje(pravougaonik);						// dodaj drag'n drop listener										// instanciranje pozicije
			
			//trace("Teme BB: " + (pravougaonik.x + pravougaonik.getA()) + " " + pravougaonik.y);

			
			addChild(pravougaonik);
		}
		
		public function dodajTrougao(a:Number, rotacija:Number) {
			var trougao:Trougao = new Trougao(a);
			
			trougao.x = 80;
			trougao.y = 100;
			
			trougao.setRotacija(rotacija);
			
			nizElemenata.push(trougao);
			dodajPrevlacenje(trougao);
			
			addChild(trougao);
			
		}
		
		public function dodajPrevlacenje(element:Object) {
			element.addEventListener(MouseEvent.MOUSE_DOWN, pocetakPrevlacenje);

			function pocetakPrevlacenje(event:MouseEvent):void {
				element.startDrag();
			}
			
			stage.addEventListener(MouseEvent.MOUSE_UP, krajPrevlacenje);
			
			function krajPrevlacenje(event:MouseEvent):void {
				element.stopDrag();
			}
		}
		
		public function ocistiScenu():void {
			for(var i:int = nizElemenata.length; i > 0; i--) {
				trace("Duzina niza: " + nizElemenata.length);		
						
				if(nizElemenata[i-1] is Krug) {									// is <=> instanceof 
					Krug.brojKrugova--;
				} else if(nizElemenata[i-1] is Pravougaonik) {
					Pravougaonik.brojPravougaonika--;
				}
				
				removeChild(nizElemenata[i-1]);									// krece indeksiranje u nizu od 0
				nizElemenata.splice(nizElemenata.indexOf(nizElemenata[i-1]),1); 	// brisem el sa steka
			}
			
		}
		
		public function proveravajKoliziju():void {					// kolizija on/off
			if(detekcijaKolizije) {
				removeEventListener(Event.ENTER_FRAME, render);
				setDetekcijaKolizije(false);
			}
			else {
				addEventListener(Event.ENTER_FRAME, render);
				setDetekcijaKolizije(true);
			}
		}

		function render(e:Event):void {
			// renderovanje detekcije kolizije
			kolizija.proveriKoliziju(nizElemenata);
		}


		public function setDetekcijaKolizije(iskaz:Boolean):void {
			detekcijaKolizije = iskaz;
		}

		public function getDetekcijaKolizije():Boolean{
			return detekcijaKolizije;
		}		
		
		public function getElementAt(poz:uint):Object {
			return nizElemenata[poz];
		}
		
		public function stepenURadian(stepen:Number):Number {
			return stepen * Math.PI / 180;
		}
		
		public function getKolizija():Kolizija {
			return kolizija;
		}
	}
}
